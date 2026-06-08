# frozen_string_literal: true

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.aikku.eu"
SitemapGenerator::Sitemap.compress = false
SitemapGenerator::Sitemap.create do
  add root_path(locale: :fr)
  add root_path(locale: :en)

  add aikku_plann_path(locale: :fr)
  add aikku_plann_path(locale: :en)

  add aikku_coopcomm_path(locale: :fr)
  add aikku_coopcomm_path(locale: :en)

  add aikku_access_path(locale: :fr)
  add aikku_access_path(locale: :en)

  add services_path(locale: :fr)
  add services_path(locale: :en)

  add qui_sommes_nous_path(locale: :fr)
  add qui_sommes_nous_path(locale: :en)

  add contact_path(locale: :fr)
  add contact_path(locale: :en)

  add mentions_legales_path(locale: :fr)
  add mentions_legales_path(locale: :en)
end
