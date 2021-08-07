require 'rails_helper'

RSpec.describe Room, type: :model do
    context 'validations' do
        before do 
            @room = Room.create!(name: "Room1", room_no: 123)
            #@room1 = Room.create!(name: nil)
        end
            it "should be validate with a name " do
            expect(@room).to be_valid(:name)
            end

             # it "should NOT be valid with a username error" do
             # expect(@room).not_to be_valid
             # expect(@room.errors).to have_key(:name)
             # end
    end
end

#let(:room) { create :room, name: "Room1" }
#expect(user).not_to be_valid
# it "should not be valid with a name " do
#  expect(@room1).not_to be_valid(:name)
# end
