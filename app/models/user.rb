class User < ApplicationRecord
  enum role: { admin: 0, instructor: 1, student: 2 }
  before_create :set_default_role

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Invalid email' }
  has_secure_password

  private

  def set_default_role
    self.role = 2 if role.nil?
  end
end
