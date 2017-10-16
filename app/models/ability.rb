class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.admin
      can :manage, :all
    elsif !user.admin
        can :read, Article
        can :manage, Article, user_id: user.id
        cannot :destroy, Article
    end
  end
end
