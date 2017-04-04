class Ability
  include CanCan::Ability


    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.role? :admin
        can :manage, :all
      elsif user.role? :investor
        can :read, :all
      elsif user.role? :analyst
        can :read, :all
      end
    end

end
