class Crucible::Review < ActiveResource::Base
  self.site = "#{AppConfig.crucible_api_url}"
  self.format = :json
  self.user = "#{AppConfig.crucible_user}"
  self.password = "#{AppConfig.crucible_password}"

  self.element_name="reviews-v1"
  self.collection_name="reviews-v1"

  # Review JSON example
  #{
  #   "reviews-v1":{
  #      "allowReviewersToJoin":true,
  #      "author":{
  #         "author":{
  #            "avatarUrl":"http://gravatar.com/avatar/6312d7a1e2935c671e8d91fd07188994?s=48&redirect=false&d=https%3A%2F%2Fcrucible.payments.zynga.com%2Fcrucible%2Favatar%2F30129a014ecf9a275dd65ddde5338cbf%3Fs%3D48",
  #            "displayName":"Alejandro Rivera",
  #            "url":"/crucible/user/alrivera",
  #            "userName":"alrivera"
  #         }
  #      },
  #      "closeDate":"2012-03-13T00:57:02.896+0000",
  #      "createDate":"2011-12-07T01:45:54.465+0000",
  #      "creator":{
  #         "creator":{
  #            "avatarUrl":"http://gravatar.com/avatar/6312d7a1e2935c671e8d91fd07188994?s=48&redirect=false&d=https%3A%2F%2Fcrucible.payments.zynga.com%2Fcrucible%2Favatar%2F30129a014ecf9a275dd65ddde5338cbf%3Fs%3D48",
  #            "displayName":"Alejandro Rivera",
  #            "url":"/crucible/user/alrivera",
  #            "userName":"alrivera"
  #         }
  #      },
  #      "description":"PAY-10950: Refactored ImportTool to be able to be executed from another Java process by passing the content as a String\r\n",
  #      "dueDate":"2012-04-14T21:59:42.733+0000",
  #      "jiraIssueKey":"PAY-10950",
  #      "metricsVersion":1,
  #      "moderator":{
  #         "moderator":{
  #            "avatarUrl":"http://gravatar.com/avatar/6312d7a1e2935c671e8d91fd07188994?s=48&redirect=false&d=https%3A%2F%2Fcrucible.payments.zynga.com%2Fcrucible%2Favatar%2F30129a014ecf9a275dd65ddde5338cbf%3Fs%3D48",
  #            "displayName":"Alejandro Rivera",
  #            "url":"/crucible/user/alrivera",
  #            "userName":"alrivera"
  #         }
  #      },
  #      "name":"PAY-10950: Refactored ImportTool to be able to be executed from another Java process by passing the content as a String",
  #      "permaId":{
  #         "perma_id":{
  #            "id":"CR-1"
  #         }
  #      },
  #      "projectKey":"CR",
  #      "state":"Closed",
  #      "summary":"Code has been in production without major issues. I think it's safe to close this review.",
  #      "type":"REVIEW"
  #   }
  #}
  #schema do
  #  attribute 'author', 'string'
  #  attribute
  #end

  ##
  #


  #

      #parameter	value	description
      #title		  string	a string that will be searched for in review titles.
      #author		string	reviews authored by this user.
      #moderator	string	reviews moderated by this user.
      #creator		string	reviews created by this user.
      #states		string	comma-separated list of amy of the following strings: (Draft, Approval, Review, Summarize, Closed, Dead, Rejected, Unknown).
      #reviewer	string	reviews reviewed by this user.
      #orRoles		boolean	whether the value of author, creator, moderator and reviewer should be OR'd (orRoles=true) or AND'd (orRoles=false) together.
      #complete	boolean	reviews that the specified reviewer has completed.
      #allReviewersComplete	boolean	Reviews that all reviewers have completed.
      #project		string	reviews for the specified project.
  def self.filter(criteria)
    if criteria.is_a? String
      Crucible::Review.get("filter/#{filter_type}")
    else
      Crucible::Review.get(:filter, critera)
    end

  end

  def id
    self.permaId.id
  end

  def reviewers
    review = Crucible::Review.find(id).get(:details)
    review.reviewers
  end

end