class Borrower < ActiveRecord::Base
  belongs_to :lender
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false}
end
