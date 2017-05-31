class User < ActiveRecord::Base
  before_create :generate_authentication_token!

  validates :email, presence: true, uniqueness: true
  validates :auth_token, uniqueness: true
  validates :role, presence: true
  has_secure_password

  has_many :group_students, foreign_key: 'student_id'
  has_many :groups, through: :group_students

  has_many :classes_teaching, class_name: 'DanceClass', foreign_key: 'teacher_id'
  has_many :classes_taking, -> { distinct }, through: :groups, source: :dance_classes

  has_many :emergency_contacts

  enum role: [:student, :teacher, :work_study, :admin]
  after_initialize :set_default_role, :if => :new_record?

  enum gender: [:not_specified, :female, :male]

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_default_role
    self.role ||= :student
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def classes
    (classes_teaching + classes_taking).uniq
  end
end
