class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  mount_uploader :avatar, PictureUploader
  enum role: %I[admin trainer trainee]
  has_many :user_courses
  has_many :user_tasks
  has_many :reports
  has_many :user_subjects
  has_many :courses, through: :user_courses
  has_many :tasks, through: :users_tasks
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  def self.digest string
    cost =
      if ActiveModel::SecurePassword.min_cost
        BCrypt::Engine::MIN_COST
      else
        BCrypt::Engine.cost
      end
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token #  create a token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest
    BCrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  # Activates an account.
  def activate
    update_attributes activated: true, activated_at: Time.zone.now
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def self.select_user_activated
    User.where activated: true
  end

  # Sets the reset_token and update reset_digest attributes into DB
  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes(reset_digest: User.digest(reset_token),
      reset_send_at: Time.zone.now)
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_send_at < 2.hours.ago
  end

  validate :picture_size

  private

  def picture_size
    return if avatar.size < 5.megabytes
    errors.add(:avatar, "should be less than 5MB")
  end
  # Converts email to all lower-case - standard for email in DB

  def downcase_email
    email.downcase!
  end

  def create_activation_digest # called by before_create so auto save into DB
    self.activation_token  = User.new_token # vitrual abttribute
    self.activation_digest = User.digest activation_token # abttribute in DB
  end
end
