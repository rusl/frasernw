class UserObserver < ActiveRecord::Observer
  def after_save(user)
    UserMailer.welcome_admin(user).deliver
    # Notifications.comment("admin@do.com", "New comment was posted", comment).deliver
  end
end