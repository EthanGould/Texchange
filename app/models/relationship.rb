class Relationship < ActiveRecord::Base
	belongs_to :student, class_name: "User"
	belongs_to :teacher, class_name: "User"
	validates :student_id, presence: true
	validates :teacher_id, presence: true
end
