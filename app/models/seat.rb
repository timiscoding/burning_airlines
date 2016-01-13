# == Schema Information
#
# Table name: seats
#
#  id         :integer          not null, primary key
#  flight_id  :integer
#  status     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Seat < ActiveRecord::Base
  belongs_to :flight
  belongs_to :reservation
end
