# == Schema Information
#
# Table name: flights
#
#  id          :integer          not null, primary key
#  origin      :text
#  destination :text
#  date        :text
#  time        :text
#  plane_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Flight < ActiveRecord::Base
  belongs_to :plane
  has_many :reservations
  has_many :users, through: :reservations
  has_many :seats
  after_create :create_seat


  private

   def create_seat
      seat_total = self.plane[:rows]*self.plane[:columns]
      seat_total.times do
        new_seat = Seat.new
        new_seat.flight_id = self.id
        new_seat.save
      end
    end
end
