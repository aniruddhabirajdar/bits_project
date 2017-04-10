class Ability
  include CanCan::Ability


    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.role? :admin
        can :manage, :all
      elsif user.role? :investor
        can :read, :all
      elsif user.role? :analyst
        can :read, Company
        can :read, Report
        can :update, Report do |report|
          report.user == user
        end
        can :destroy, Report do |report|
          report.user == user
        end
        #can :manage, :all
      end
    end

end
