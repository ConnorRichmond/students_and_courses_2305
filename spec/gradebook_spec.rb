require './lib/course'
require './lib/student'
require './lib/gradebook'

gradebook = Gradebook.new('Albert Einstein')
course1 = Course.new('Calculus', 5)
course2 = Course.new('Physics', 3)
course3 = Course.new('English', 2)
student1 = Student.new({name: 'Morgan', age: 21})
student2 = Student.new({name: 'Jordan', age: 29})
student3 = Student.new({name: 'Max', age: 19})

describe Gradebook do

  it 'returns the name of the instructor' do
    expect(gradebook.instructor).to eq('Albert Einstein')
  end

  it 'adds a course to the gradebook' do
    expect(gradebook.courses).to eq([])
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    gradebook.add_course(course3)
    expect(gradebook.courses).to eq([course1, course2, course3])
  end

  it 'returns a hash of courses and their students' do
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    gradebook.add_course(course3)
    course1.enroll(student1)
    course2.enroll(student2)
    course2.enroll(student3)

    expect(gradebook.list_all_students).to eq({ course1 => [student1], course2 =>[student2, student3], course3 => [] })
  end

  it 'returns a list of students below the given threshold' do
    gradebook.add_course(course1)
    gradebook.add_course(course2)
    course1.enroll(student1)
    course2.enroll(student2)

    student1.log_score(70)
    student2.log_score(90)
    student3.log_score(45)

    expect(gradebook.students_below(50)).to eq([student3])

  end

end