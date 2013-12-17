class TopicPolicy < ApplicationPolicy

  def create?
    user.present? && user.role?(:admin)
  end
  
  def update?
    create?
  end

  def destroy?
    create?
  end
end