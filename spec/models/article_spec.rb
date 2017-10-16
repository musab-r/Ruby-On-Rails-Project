require 'rails_helper'

#RSpec.describe Article, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

#end
RSpec.describe Article, 'validation' do
  	  it { should validate_length_of(:title).is_at_least(5) }
  	  it { should validate_presence_of(:title) }
end 

RSpec.describe Article, 'association' do

	it { should have_many(:comments) }
	it { should belong_to(:user) }
end
