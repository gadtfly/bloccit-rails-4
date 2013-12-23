class CommentPolicy < ApplicationPolicy

  def index?
    true
  end

  def update?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
end