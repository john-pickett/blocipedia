class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user
        if user.admin?
          wikis = scope.all # if the user is an admin, show them all the wikis
        elsif user.premium?
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if wiki.public? || wiki.user == user || wiki.users.include?(user)
              wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
            end
          end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.public? || wiki.users.include?(user)
            wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
          end

        end
      end
      wikis # return the wikis array we've built up
    else # if no current_user
      all_wikis = scope.all
      wikis = []
      all_wikis.each do |wiki|
        if wiki.public? || wiki.users.include?(user)
          wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
        end #end of all_wikis loop

      end #end of if user
    end


    end
  end
end
