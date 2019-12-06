require 'rails_helper'

RSpec.describe 'Student average age' do
  it 'can show the average age of all students on the student index page' do
    student_1 = Student.create(name: 'Casseopia Black', age: 14, house: 'Slytherin')
    student_2 = Student.create(name: 'Harry Potter', age: 11, house: 'Hogwarts')
    student_3 = Student.create(name: 'Larry Dotter', age: 10, house: 'DeepBog')

    visit '/students'

    expect(page).to have_content(11.67)
  end
end
