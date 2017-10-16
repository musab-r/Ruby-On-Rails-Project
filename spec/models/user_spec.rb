require 'rails_helper'


RSpec.describe User, 'association' do

	it { should have_many(:articles) }
end	

