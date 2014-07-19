class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards
  has_many :relationships, foreign_key: "student_id", dependent: :destroy
  has_many :teachers, through: :relationships, source: :teachers
  has_many :students, through: :relationships, source: :students
<<<<<<< HEAD
  validates :username, :uniqueness => {:case_sensitive => false}

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

=======
  
>>>>>>> development
  def following?(other_user)
    relationships.find_by(teacher_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(teacher_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(teacher_id: other_user.id).destroy
  end
end
