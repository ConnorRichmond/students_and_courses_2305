require 'rspec'
require './lib/course'
require './lib/student'

course = Course.new("Calculus", 2)
student1 = Student.new({name: "Morgan", age: 21})
student2 = Student.new({name: "Jordan", age: 29}) 

describe Course do 

  it 'adds students to course' do
    expect(course.name).to eq('Calculus')
    expect(course.capacity).to eq(2)
    expect(course.students).to eq([])

    course.enroll(student1)
    course.enroll(student2)

    expect(course.students).to eq([student1, student2])

    expect(course.full?).to be true
  end

end