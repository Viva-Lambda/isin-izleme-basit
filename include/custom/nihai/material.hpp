#ifndef MATERIAL_HPP
#define MATERIAL_HPP
//
#include <custom/nihai/commons.hpp>
//
#include <custom/nihai/pdf.hpp>
//
#include <custom/nihai/texture.hpp>
//

double schlick(double cosine, double ref_idx) {
  double r0 = (1 - ref_idx) / (1 + ref_idx);
  r0 = r0 * r0;
  return r0 + (1 - r0) * pow((1 - cosine), 5);
}

struct scatter_record {
  ray specular_ray;
  bool is_specular;
  color attenuation;
  shared_ptr<pdf> pdf_ptr;
};

class material {
public:
  virtual color emitted(const ray &r_in, const hit_record &rec, double u,
                        double v, const point3 &p) const {
    return color(0, 0, 0);
  }

  virtual bool scatter(const ray &r_in, const hit_record &rec,
                       scatter_record &srec) const {
    return false;
  }

  virtual double scattering_pdf(const ray &r_in, const hit_record &rec,
                                const ray &scattered) const {
    return 0;
  }
};

class dielectric : public material {
public:
  dielectric(double ri) : ref_idx(ri) {}

  virtual bool scatter(const ray &r_in, const hit_record &rec,
                       scatter_record &srec) const {
    srec.is_specular = true;
    srec.pdf_ptr = nullptr;
    srec.attenuation = color(1.0, 1.0, 1.0);
    double etai_over_etat = (rec.front_face) ? (1.0 / ref_idx) : (ref_idx);

    vec3 unit_direction = unit_vector(r_in.direction());
    double cos_theta = fmin(dot(-unit_direction, rec.normal), 1.0);
    double sin_theta = sqrt(1.0 - cos_theta * cos_theta);
    if (etai_over_etat * sin_theta > 1.0) {
      vec3 reflected = reflect(unit_direction, rec.normal);
      srec.specular_ray = ray(rec.p, reflected, r_in.time());
      return true;
    }

    double reflect_prob = schlick(cos_theta, etai_over_etat);
    if (random_double() < reflect_prob) {
      vec3 reflected = reflect(unit_direction, rec.normal);
      srec.specular_ray = ray(rec.p, reflected, r_in.time());
      return true;
    }

    vec3 refracted = refract(unit_direction, rec.normal, etai_over_etat);
    srec.specular_ray = ray(rec.p, refracted, r_in.time());
    return true;
  }

public:
  double ref_idx;
};

class diffuse_light : public material {
public:
  diffuse_light(shared_ptr<texture> a) : emit(a) {}

  virtual color emitted(const ray &r_in, const hit_record &rec, double u,
                        double v, const point3 &p) const {
    if (!rec.front_face)
      return color(0, 0, 0);
    return emit->value(u, v, p);
  }

public:
  shared_ptr<texture> emit;
};

class isotropic : public material {
public:
  isotropic(shared_ptr<texture> a) : albedo(a) {}

  virtual bool scatter(const ray &r_in, const hit_record &rec,
                       color &attenuation, ray &scattered) const {
    scattered = ray(rec.p, random_in_unit_sphere(), r_in.time());
    attenuation = albedo->value(rec.u, rec.v, rec.p);
    return true;
  }

public:
  shared_ptr<texture> albedo;
};

class lambertian : public material {
public:
  lambertian(shared_ptr<texture> a) : albedo(a) {}

  virtual bool scatter(const ray &r_in, const hit_record &rec,
                       scatter_record &srec) const {
    srec.is_specular = false;
    srec.attenuation = albedo->value(rec.u, rec.v, rec.p);
    srec.pdf_ptr = make_shared<cosine_pdf>(rec.normal);
    return true;
  }

  double scattering_pdf(const ray &r_in, const hit_record &rec,
                        const ray &scattered) const {
    auto cosine = dot(rec.normal, unit_vector(scattered.direction()));
    return cosine < 0 ? 0 : cosine / pi;
  }

public:
  shared_ptr<texture> albedo;
};

class metal : public material {
public:
  metal(const color &a, double f) : albedo(a), fuzz(f < 1 ? f : 1) {}

  virtual bool scatter(const ray &r_in, const hit_record &rec,
                       scatter_record &srec) const {
    vec3 reflected = reflect(unit_vector(r_in.direction()), rec.normal);
    srec.specular_ray =
        ray(rec.p, reflected + fuzz * random_in_unit_sphere(), r_in.time());
    srec.attenuation = albedo;
    srec.is_specular = true;
    srec.pdf_ptr = nullptr;
    return true;
  }

public:
  color albedo;
  double fuzz;
};

#endif
