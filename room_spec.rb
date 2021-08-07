 require 'rails_helper'
RSpec.describe Room, type: :model do
  context 'validations' do
    before do
      @room = Room.create!(name: 'AC-RM1', room_no: 123)
    end
            it 'should be validate with a Room_name' do
              expect(@room).to be_valid(:name)
            end

            it 'Is not valid without a Room_name' do
              @room.name = nil
              expect(@room).to_not be_valid
            end

            it 'should be validate with a Room_num' do
              expect(@room).to be_valid(:room_no)
            end

            it 'Is not valid without a Room_num' do
              @room.room_no = nil
              expect(@room).to_not be_valid
            end

            describe Room do
              it 'From avialble state to checkout state ' do
                expect(@room).to transition_from(:available).to(:checkout).on_event(:ava_che)
              end

              it 'From checkout state to available state ' do
                expect(@room).to transition_from(:checkout).to(:available).on_event(:ava_che_rev)
              end

              it 'From available state to booked state ' do
                expect(@room).to transition_from(:available).to(:booked).on_event(:ava_book)
              end

              it 'From  booked state to available state ' do
                expect(@room).to transition_from(:booked).to(:available).on_event(:ava_book_rev)
              end

              it 'From booked state to checkout state ' do
                expect(@room).to transition_from(:booked).to(:checkout).on_event(:book_che)
              end

              it 'From  checkout state to booked state ' do
                expect(@room).to transition_from(:checkout).to(:booked).on_event(:book_che_rev)
              end


            end
  end
end
