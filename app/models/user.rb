class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards
  has_many :relationships, foreign_key: "student_id", dependent: :destroy
  has_many :teachers, through: :relationships, source: :teachers
  has_many :students, through: :relationships, source: :students
  
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
