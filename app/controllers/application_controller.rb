class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "Farm Mall"
    title       = ""
    description = "Sell and Buy Food and Agri-Products at Farm Mall"
    image       = options[:image] || "logo.png"
    current_url = request.url

    defaults = {
      site:          site_name,
      title:         title,
      image:         image,
      description:   description,
      keywords:      %w[farm mall sell buy fresh food]
    }

    options.reverse_merge! (defaults)
  
    set_meta_tags options
  end
    
end
