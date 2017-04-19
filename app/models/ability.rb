class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.is_admin?

      can :manage, :all
    end

    can [:edit, :destroy], Idea do |idea|
      idea.user == user
    end

  end
end
