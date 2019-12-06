require 'rails_helper'

RSpec.describe 'Student Show Page' do
  it 'can see a list of the student courses when visiting a student show page' do
    student_1 = Student.create(name: 'Casseopia Black', age: 14, house: 'Slytherin')
    student_1.courses.create!(name: 'Defense against the Dark Arts')
    student_1.courses.create!(name: 'Herbology')
    student_1.courses.create!(name: 'Potions')

    visit "/students/#{student_1.id}"

    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end
end
