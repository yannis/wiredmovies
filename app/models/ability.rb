# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, Movie
    can :read, Review
    return unless user.persisted?

    if user.admin?
      can :manage, :all
    else
      can :manage, Review, {user_id: user.id}
      can :create, Review
    end
  end
end
