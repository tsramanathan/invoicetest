require 'onelogin/ruby-saml/settings'

class Account < ActiveRecord::Base

  def Account.get_saml_settings
    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = Onelogin::Saml::Settings.new

    if Rails.env.production?
      @assertion_consumer_service_url            =  ENV["assertion_consumer_service_url"].to_s
      @issuer                                    =  ENV["issuer"].to_s
      @idp_sso_target_url                        =  ENV["idp_sso_target_url"].to_s
      @idp_cert_fingerprint                      = ENV["idp_cert_fingerprint"].to_s

    end

    if Rails.env.development? || Rails.env.testing?
      @assertion_consumer_service_url = ENV["assertion_consumer_service_url_dev"]
      @issuer                         = ENV["issuer_dev"]
      @idp_sso_target_url             = ENV["idp_sso_target_url_dev"]
      @idp_cert_fingerprint           = ENV["idp_cert_fingerprint_dev"]
    end

    settings.assertion_consumer_service_url   = @assertion_consumer_service_url
    settings.issuer                           = @issuer
    settings.idp_sso_target_url               = @idp_sso_target_url
    settings.idp_cert_fingerprint             = @idp_cert_fingerprint
    settings.name_identifier_format           = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    settings
  end


end
