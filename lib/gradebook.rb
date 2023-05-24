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

  #getting issue with repeating students. |= seems to have fixed that
  # |= keeps input unique to append
  def students_below(threshold)
    below_threshold_students = []
  
    @courses.each do |course|
      below_threshold_students |= course.students.select { |student| student.grade < threshold }
    end
  
    below_threshold_students
  end


end
