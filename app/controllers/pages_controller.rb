class PagesController < ApplicationController
  def start
    @flights = Flight.all
    @origin = @flights.map{|t| t.origin}.uniq
    @destination = @flights.map{|t| t.destination}.uniq
    @date = @flights.map{|t| t.date}.uniq
  end

  def select
    @flights = Flight.all

    #This is the search in our database for matching flights.
    @u = Flight.where(origin: params[:departure_id], destination: params[:arrival_id], date: params[:flight_id]) # no query at this point
    @u.class # ActiveRecord::Relation
    @u.first # query to db
    @u.class # Array

    @search = @u.select{|x| x.origin == params[:departure_id] || x.destination == params[:arrival_id] || x.date = params[:flight_id]} # no query to db
  end

  def seating
    @flights = Flight.all
    @selected_flight = Flight.find params[:flight_id]

    @planes = Plane.all
    @selected_plane = @selected_flight[:plane_id]
    @planeID = Plane.find @selected_plane
    @rows = @planeID[:rows]
    @columns = @planeID[:columns]

    js :flight_id => params[:flight_id]

  end
  def checkout
    @reservation = Reservation.new
    @selected_seat = Seat.find params[:seat_id]
    @seat_id = @selected_seat[:seat_id]
    @flight_id = @selected_seat[:flight_id]
    @user_id = session[:user_id]
    @reservation.seat_id = params[:seat_id]
    @reservation.flight_id = @flight_id
    @reservation.user_id = @user_id
    @reservation.save
  end
end

