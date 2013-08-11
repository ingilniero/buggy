class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :create, Project
    end
  end
end
