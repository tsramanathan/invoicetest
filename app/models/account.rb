require 'onelogin/ruby-saml/settings'

class Account < ActiveRecord::Base
  def Account.get_saml_settings
    # this is just for testing purposes.

    # should retrieve SAML-settings based on subdomain, IP-address, NameID or similar
    settings = Onelogin::Saml::Settings.new

    settings.assertion_consumer_service_url   = "http://ec2-54-225-110-64.compute-1.amazonaws.com/saml/consume"
    settings.issuer                           = "http://ec2-54-225-110-64.compute-1.amazonaws.com/" # the name of your application
    settings.idp_sso_target_url               = "https://cbtest.okta.com/app/template_saml_2_0/k4aberjrODWHGWIYFSXI/sso/saml"
    #settings.idp_slo_target_url = "https://cbtest.okta.com/home/template_saml_2_0/0oa4aberjsHPFYSRBJOX/3079"
    settings.idp_cert_fingerprint             = "02:05:79:D8:96:CC:CA:54:2F:16:E2:6E:7D:32:F3:54:95:61:89:71"

    #settings.idp_cert_fingerprint = "5B 74 4D EE 8B 8A 85 21 7A F0 A8 26 76 B4 83 73"

    settings.name_identifier_format           = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"


    settings
  end
end
