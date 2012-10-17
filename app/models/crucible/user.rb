class Crucible::User < ActiveResource::Base
  #attr_accessor :avatarUrl, :displayName, :userName

  self.site = "#{AppConfig.crucible_api_url}"
  self.format = :json
  self.user = "#{AppConfig.crucible_user}"
  self.password = "#{AppConfig.crucible_password}"

  self.element_name="users-v1"
  self.collection_name="users-v1"

  schema do
    attribute 'userName', 'string'
    attribute 'displayName', 'string'
    attribute 'avatarUrl', 'string'

  end

      #<users>
      #    <userData>
      #        <avatarUrl>http://foo.com/avatarfred</avatarUrl>
      #        <displayName>Fred Nurk</displayName>
      #        <userName>fred</userName>
      #    </userData>
      #    <userData>
      #        <avatarUrl>http://foo.com/avatarjoe</avatarUrl>
      #        <displayName>Joe Bloggs</displayName>
      #        <userName>joe</userName>
      #    </userData>
      #</users>

  def url
    "#{AppConfig.crucible_base_url}#{self.attributes[:url]}"
  end
end


