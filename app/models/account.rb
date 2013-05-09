require 'onelogin/ruby-saml/settings'

class Account < ActiveRecord::Base
  def Account.get_saml_settings
    # this is just for testing purposes.

    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = Onelogin::Saml::Settings.new

    settings.assertion_consumer_service_url   = "http://localhost:3000/saml/consume"
    settings.issuer                           = "http://localhost:3000" # the name of your application
    settings.idp_sso_target_url               = "https://app.onelogin.com/saml/signon/25123"
    settings.idp_cert_fingerprint             = "49:44:12:90:95:14:3B:7A:C3:D2:7C:F2:7C:19:FB:FF:49:DA:8C:72"
    settings.name_identifier_format           = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    settings
  end
end
