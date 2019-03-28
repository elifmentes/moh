class BusinessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    show?
  end

  def edit?
    record.owner == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
