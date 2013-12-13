class TopicPolicy < ApplicationPolicy

  def create?
    user.present?
  end
  
  def update?
    (user.present? && record.user == user) || (user.present? && user.role?(:admin))
  end
  
  def destroy?
    (user.present? && record.user == user) || (user.present? && user.role?(:admin))
  end
end