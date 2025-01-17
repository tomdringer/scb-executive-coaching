SitemapGenerator::Sitemap.default_host = "https://scbexecutivecoaching.com"
  
SitemapGenerator::Sitemap.create do
    # Add your URLs here
    add "https://scbexecutivecoaching.com/", :changefreq => 'daily', :priority => 1.0

    # Add other paths
    add contact_us_path, :changefreq => 'monthly'

    # Add all blogs
    Blog.find_each do |blog|
       add blog_path(blog), :lastmod => blog.updated_at
    end
     
    # Add all resources
    Resource.find_each do |resource|
       add resource_path(resource), :lastmod => resource.updated_at
    end
end



