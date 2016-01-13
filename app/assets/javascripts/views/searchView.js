var PagesController = Paloma.controller('Pages');
console.log('stuf');

PagesController.prototype.seating = function(){
  var desiredFlightID = parseInt( this.params["flight_id"] );
    
  $.ajax('/seats.json').done(function(data){
    var seats = _.where( data, { flight_id: desiredFlightID })
    console.log(seats);
    _.each(seats, function(seat) {
      console.log(seat.status);
      var $seat = $('#seatMap').append( $('<div>').addClass("seat").attr('id', seat.id).attr('status', seat.status) ); 
    });
  });

  $(document).ready(function() {
    $('#seatMap').on('click', ".seat", function(){
      var currentStatus = $(this).attr("status");

      var desiredStatus;
      if ( currentStatus === "true") {
        desiredStatus = "false";
      } else {
        desiredStatus = "true";
      }
      $(this).attr("status", desiredStatus);

      console.log($(this).attr("id"), $(this).attr("status"));
      var seat_id = $(this).attr("id");

      // var reservation = new app.Reservation({seat: '7C'});
      // reservation.save();

      $.ajax('/seats/' + seat_id + '.json', {
        method: 'PUT',
        data: { status: desiredStatus }
      }, function(){
       console.log("status changed"); 
      });
      // console.log('selected ' + $(this).attr('id'));
    })

  });

};


