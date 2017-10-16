require 'rails_helper'

RSpec.describe Comment, 'association' do

	it { should belong_to(:article) }
end
