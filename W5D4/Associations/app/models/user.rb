class User < ApplicationRecord
   validates :name, presence: true, uniqueness: true
  
  has_many :enrollments,
  primary_key: :id,
  foreign_key: :enrollment_id,
  class_name: :Enrollment

  has_many :enrolled_courses,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Course
end
