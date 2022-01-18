#frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin_role?)
      can :manage, :all
    elsif user.try(:moderator_role?)
      can [:read, :create], :all
      can :manage, Patient
      can :manage, Physician
    else
      can [:read, :create], Patient
      can :read, Physician
      can :read, DiagnosisItem
    end
  end
end




