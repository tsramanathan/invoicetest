class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :force_plugin_reload

  def force_plugin_reload
    ActiveSupport::Dependencies.load_file "xml_sec.rb" if "development" == ENV
    ActiveSupport::Dependencies.load_file "xmlcanonicalizer.rb" if "development" == ENV
  end

  def initialize

    if Rails.env.development?
      @web_svc_url  = ENV["WEBSVC_URL_DEV"]

    end
    if Rails.env.test?
      @web_svc_url  = ENV["WEBSVC_URL_DEV"]

    end

    if Rails.env.production?
      @web_svc_url = ENV["WEBSVC_URL_PROD"]

    end
    super

  end
end
