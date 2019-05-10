require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'instance variables' do
    it '.average_age' do
      astronaut_1 = Astronaut.create!(name: 'Will', age: 30, job: 'aswesome1')
      astronaut_2 = Astronaut.create!(name: 'Smith', age: 50, job: 'aswesome2')

      expect(Astronaut.average_age).to eq(40)
    end
  end
end
