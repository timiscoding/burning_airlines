# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  seat_id    :integer
#  user_id    :integer
#  flight_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight
  has_one :seat
end
