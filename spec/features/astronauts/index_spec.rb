require 'rails_helper'

RSpec.describe "astronauts index page", type: :feature do
  it "shows all astronauts" do
    astronaut_1 = Astronaut.create!(name: 'Will', age: 29, job: 'aswesome')

    visit '/astronauts'

    expect(page).to have_content("Name: #{astronaut_1.name}")
  end

  it "shows average age of all astronaugths do" do
    astronaut_1 = Astronaut.create!(name: 'Will', age: 30, job: 'aswesome')
    astronaut_2 = Astronaut.create!(name: 'Will', age: 50, job: 'aswesome')

    visit '/astronauts'

    expect(page).to have_content("Average Age: 40")
  end

  it "shows all space missions" do
    astronaut_1 = Astronaut.create!(name: 'Will', age: 30, job: 'aswesome')
    astronaut_2 = Astronaut.create!(name: 'Will', age: 50, job: 'aswesome')
    mission_1 = astronaut_1.missions.create!(title: 'test1', time_in_space: 30)
    mission_2 = astronaut_1.missions.create!(title: 'test2', time_in_space: 45)


    visit '/astronauts'

    expect(page).to have_content("Title: test1")
  end
end

# User Story 4 of 4

# As a visitor,
# When I visit '/astronauts'
# I see the total time in space for each astronaut.
# (e.g. "Name: Neil Armstrong, Age: 37, Job: Commander, Total Time in Space: 760 days")
