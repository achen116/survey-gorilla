class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :surveys
  has_many :survey_takers

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
