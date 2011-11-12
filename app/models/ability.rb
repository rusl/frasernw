class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :manage, :all

    # Cannot update items that need review.
    cannot :update, Specialist do |specialist|
      specialist.versions.last.to_review? == true
    end
  end
end
