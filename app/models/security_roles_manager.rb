require 'httparty'
class SecurityRolesManager
  # attr_accessible :title, :body
  attr_accessor :web_svc_url
  include HTTParty
  format :json

  def get_security_roles(username)
    options = {}
    options.merge!(:headers => {"Authorization" => "Partner Axiom:b27C3g4Vy9"})
    res = self.class.get(@web_svc_url+'/api/security/GetSecurityRolesForUser?&sHHRepID='+username, options)
  end
end
