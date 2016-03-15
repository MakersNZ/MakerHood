require 'rails_helper'

RSpec.describe Person, type: :model do

  let(:person){ FactoryGirl.create(:person) }
  let(:friend){ FactoryGirl.create(:person) }
  let(:tag){ FactoryGirl.create(:tag, name: "WOODWORKING") }

  
end
