module Crucible
  class Auth < ActiveResource::Base
    self.site = "#{AppConfig.crucible_base_url}"
    #self.element_name="auth-v1"
    self.collection_name="auth-v1"
    self.format = :json

    # force media type to POST
    #headers['Content-Type']='application/x-www-form-urlencoded'


    def self.login(user, password)
      Auth.get(:login, :userName => user, :password => password)
    end
  end

#  class User < ActiveResource::Base
#    self.site = "#{AppConfig.crucible_base_url}"
#    self.element_name="user-v1"
#    self.collection_name="user-v1"
##    self.include_root_in_json = true
#    self.format = :json
#
#  end
end
