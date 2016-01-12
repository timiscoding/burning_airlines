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
end
