SitemapGenerator::Sitemap.default_host = 'https://www.chezvaloupatisserie.fr'
SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 1

  Blogpost.find_each do |post|
    add blogpost_path(post), :priority => 0.9, :lastmod => post.updated_at, :changefreq => 'daily'
  end

end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks
