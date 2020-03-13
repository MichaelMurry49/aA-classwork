class Course < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :enrollment_id,
  class_name: :Enrollment

  has_many :enrolled_students,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :User

  belongs_to :prerequisite,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: :Course,
  optional: true  # pre_req_id can be nil

  has_many :post_classes,
  primary_key: :id,
  foreign_key: :prereq_id,
  class_name: :Course

  belongs_to :instructor,
  primary_key: :id,
  foreign_key: :instructor_id,
  class_name: :Course

  has_many :classes,
  primary_key: :id,
  foreign_key: :course_id,
  class_name: :Course
end
