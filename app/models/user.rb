class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articulos, dependent: :destroy
  validates :nombredeusuario, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 6, maximum: 100 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_one_attached :avatar_elements
  before_create { generate_token(:auth_token) }

    def send_password_reset
      generate_token(:reset_password_token)
      self.reset_password_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end


end
