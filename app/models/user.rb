class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :contact_groups, dependent: :destroy
  has_many :contacts, through: :contact_groups, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: :password_required?
  validates :password, confirmation: true, if: :password_required?
  validates :password_confirmation, presence: true, if: :password_required?
  validates :email, uniqueness: true
  validates :name, presence: true

  def can_twilio?
    !twilio_account_sid.blank? &&
      !twilio_auth_token.blank? &&
      !twilio_phone_number.blank?
  end

  def password_required?
    new_record?
  end
end
