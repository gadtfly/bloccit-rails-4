class PostPolicy < ApplicationPolicy

  def create?
    user.role?(:admin) || record.user == user
  end

  def update?
    user.role?(:admin) || record.user == user
  end

  def destroy?
    user.role?(:admin) || user.role?(:moderator) || record.user == user
  end
end