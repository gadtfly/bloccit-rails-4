class TopicPolicy < ApplicationPolicy

  def create?
    user.present? || user.role?(:admin)
  end
  
  def update?
    user.present? || record.user == user || user.role?(:admin)
  end
  
  def destroy?
    user.present? || record.user == user || user.role?(:admin)
  end
end