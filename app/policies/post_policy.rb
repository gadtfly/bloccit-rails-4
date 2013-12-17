class PostPolicy < ApplicationPolicy

  def destroy?
    (user.present? && record.user == user) || (user.present? && user.role?(:admin)) || (user.present? && user.role?(:moderator))
  end
end