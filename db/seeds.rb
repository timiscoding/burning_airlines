


Plane.destroy_all

p1 = Plane.create :rows => 3, :columns => 3
p2 = Plane.create :rows => 5, :columns => 5


Flight.destroy_all

f1 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/17/03', :plane_id => 1, :time => "10:45am"
f2 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/17/03', :plane_id => 1, :time => "3:00pm"
f3 = Flight.create :origin => 'SYD', :destination => 'BNE', :date => '2016/17/03', :plane_id => 1, :time => "10:45am"
f4 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/18/03', :plane_id => 1, :time => "10:45am"
f5 = Flight.create :origin => 'MEL', :destination => 'BNE', :date => '2016/18/03', :plane_id => 1, :time => "10:45am"
f6 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/19/03', :plane_id => 1, :time => "10:45am"
f7 = Flight.create :origin => 'SYD', :destination => 'BNE', :date => '2016/19/03', :plane_id => 1, :time => "1:00pm"
f8 = Flight.create :origin => 'SYD', :destination => 'BNE', :date => '2016/19/03', :plane_id => 1, :time => "6:00pm"
f9 = Flight.create :origin => 'BNE', :destination => 'MEL', :date => '2016/19/03', :plane_id => 1, :time => "10:45am"



User.destroy_all

u1 = User.create :name => 'Chicken', :password => 'chicken'
u2 = User.create :name => 'Admin', :password => 'chicken', :admin => true


# Reservation.destroy_all

# r1 = Reservation.create :row => 2, :column => 2, :user_id => 1, :flight_id => 1
# r2 = Reservation.create :row => 1, :column => 3, :user_id => 1, :flight_id => 2
# r3 = Reservation.create :row => 1, :column => 2, :user_id => 2, :flight_id => 2

# Seat.destroy_all

# s1 = Seat.create :flight_id => 1, :status => false
# s2 = Seat.create :flight_id => 1, :status => true
# s3 = Seat.create :flight_id => 1, :status => false
# s4 = Seat.create :flight_id => 1, :status => false
# s5 = Seat.create :flight_id => 1, :status => false
