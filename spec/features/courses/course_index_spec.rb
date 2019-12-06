require 'rails_helper'

RSpec.describe 'Course index' do
  it 'can show a list of courses and the number of students enrolled in each course' do
    student_1 = Student.create(name: 'Casseopia Black', age: 14, house: 'Slytherin')
    student_2 = Student.create(name: 'Harry Potter', age: 11, house: 'Hogwarts')
    student_3 = Student.create(name: 'Larry Dotter', age: 10, house: 'DeepBog')

    course_defense = Course.create(name: 'Defense against the Dark Arts')
    course_herb = Course.create(name: 'Herbology')
    course_potion = Course.create(name: 'Potions')
    course_mixes = Course.create(name: 'Mixes')
    course_spells = Course.create(name: 'Spells')

    student_1.courses << course_defense
    student_1.courses << course_herb
    student_1.courses << course_potion

    student_2.courses << course_potion
    student_2.courses << course_mixes
    student_2.courses << course_spells

    student_3.courses << course_potion
    student_3.courses << course_herb
    student_3.courses << course_spells

    visit '/courses'

    within("#course-#{course_defense.id}") do
      expect(page).to have_content('Defense against the Dark Arts')
      expect(page).to have_content(1)
    end

    within("#course-#{course_herb.id}") do
      expect(page).to have_content('Herbology')
      expect(page).to have_content(2)
    end

    within("#course-#{course_potion.id}") do
      expect(page).to have_content('Potions')
      expect(page).to have_content(3)
    end

    within("#course-#{course_mixes.id}") do
      expect(page).to have_content('Mixes')
      expect(page).to have_content(1)
    end

    within("#course-#{course_spells.id}") do
      expect(page).to have_content('Spells')
      expect(page).to have_content(2)
    end
  end
end
