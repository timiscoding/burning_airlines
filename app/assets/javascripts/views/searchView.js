var PagesController = Paloma.controller('Pages');


PagesController.prototype.seating = function(){
  var desiredFlightID = parseInt( this.params["flight_id"] );
    
  $.ajax('/seats.json').done(function(data){
    var seats = _.where( data, { flight_id: desiredFlightID })
    seats = _.sortBy(seats, 'id');
    console.log("sorting" + seats);
    _.each(seats, function(seat) {
      console.log(seat.status);
      var $seat = $('#seatMap').append( $('<div>').addClass('seatCSS').addClass("seatSelectable").addClass("seat").attr('id', seat.id).attr('status', seat.status) ); 
    });

    $.ajax('/reservations.json').done(function(data){
      var bookedSeats = _.pluck(data, 'seat_id');
      // console.log(bookedSeats)

      console.log("Seat_Ids from Reservations")
      // Reservation Seat ID's
      _.each(bookedSeats, function(bookedSeat){
        // console.log(id);

        var bookedSeat = bookedSeat;

        // Div Seat ID's
        console.log("Seat_Ids from Divs")
        $(".seat").each(function(index, seat){

           var seatID = parseInt($(seat).attr('id'));
            
            if (bookedSeat === seatID){
                console.log("YAY");
                $(seat).removeClass('seat').removeClass('seatSelectable').addClass('reserved');

            };
           
            // console.log( $(seat).attr('id') );
            
        });


     
      });
      
    });

    // Run a loop(probably) that loops through the array that we just created, it searches the page for the div with the matching id, and then removes the status attribute of that div

   
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
      var $input = $("<input>").attr("name", "seat_id").css("display", "none");
      $input.val( seat_id );
      $("form").prepend($input)

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


