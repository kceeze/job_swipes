class Ability
  include CanCan::Ability

  def initialize(user)
    user || User.new(role: "guest")
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #

    if user.worker? 
         worker_id = user.assocation_id("worker")
         can :manage, Worker, user_id: user.id
    elsif user.hr_rep?
        company_id = user.assocation_id("hr_rep")
        can :manage, Company, id: user.assocation_id("hr_rep") 
    else
        can :create, Worker
        can :create, Company
    end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
