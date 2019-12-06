require 'rails_helper'

RSpec.describe do
  describe 'Student Index' do
    it 'can see a list of students with detailed information when visiting /students' do
      student_1 = Student.create(name: 'Casseopia Black', age: 14, house: 'Slytherin')
      student_2 = Student.create(name: 'Harry Potter', age: 11, house: 'Hogwarts')

      visit '/students'

      expect(page).to have_content(student_1.name)
      expect(page).to have_content(student_1.age)
      expect(page).to have_content(student_1.house)

      expect(page).to have_content(student_2.name)
      expect(page).to have_content(student_2.age)
      expect(page).to have_content(student_2.house)
    end
  end
end
