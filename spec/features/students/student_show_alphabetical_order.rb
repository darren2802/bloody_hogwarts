require 'rails_helper'

RSpec.describe 'Student index page' do
  it 'can show students in alphabetical order' do
    student_3 = Student.create(name: 'Larry Dotter', age: 10, house: 'DeepBog')
    student_2 = Student.create(name: 'Harry Potter', age: 11, house: 'Hogwarts')
    student_1 = Student.create(name: 'Casseopia Black', age: 14, house: 'Slytherin')

    expect(page).to have_content[student_3.name, student_2.name, student_1.name]
  end
end
