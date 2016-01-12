Plane.destroy_all

p1 = Plane.create :rows => 3, :columns => 3
p2 = Plane.create :rows => 1, :columns => 3


Flight.destroy_all

f1 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/01/03', :plane_id => 1
f2 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/01/04', :plane_id => 1
f3 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/01/05', :plane_id => 1
f4 = Flight.create :origin => 'SYD', :destination => 'MEL', :date => '2016/01/06', :plane_id => 1


User.destroy_all

u1 = User.create :name => 'Chicken', :password => 'chicken'
u2 = User.create :name => 'Admin', :password => 'chicken'


Reservation.destroy_all

r1 = Reservation.create :row => 2, :column => 2, :user_id => 1, :flight_id => 1
r2 = Reservation.create :row => 1, :column => 3, :user_id => 1, :flight_id => 2
r3 = Reservation.create :row => 1, :column => 2, :user_id => 2, :flight_id => 2
