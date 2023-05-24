class Gradebook

  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    students_by_course = {}

    @courses.each do |course|
      students_by_course[course] = course.students
    end

    students_by_course
  end

  def students_below(threshold)
    below_threshold_students = []
  
    @courses.each do |course|
      below_threshold_students += course.students.select { |student| student.grade < threshold }
    end
  
    below_threshold_students
  end

  def all_grades
    @courses.each_with_object({}) do |course, grades|
      grades[course] = course.students.map { |student| student.grade }
    end
  end
  
  def students_in_range(min, max)
    students = []
    @courses.each do |course|
      course.students.each do |student|
        students << student if student.grade >= min && student.grade <= max
      end
    end
    students
  end


end
