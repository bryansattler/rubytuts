class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    # if a member, they can manage their own wikis 
    # (or create new ones)
    if user.role? :member
      can :manage, Wiki, :user_id => user.id
      can :manage, Comment, :user_id => user.id
    end

    # Moderators can delete any wiki
    if user.role? :moderator
      can :destroy, Wiki
      can :destroy, Comment
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end