var PagesController = Paloma.controller('Pages');


PagesController.prototype.seating = function(){
  var desiredFlightID = parseInt( this.params["flight_id"] );

  var setUpSeats = function () {
    $.ajax('/seats.json').done(function(data){
      var seats = _.where( data, { flight_id: desiredFlightID })
      seats = _.sortBy(seats, 'id');
      // console.log("sorting" + seats);
      _.each(seats, function(seat) {
        // console.log(seat.status);

        var $seat = $('#seatMap').append( $('<div>').addClass('seatCSS').addClass("seatSelectable").addClass("seat").attr('id', seat.id).attr('status', seat.status) );
      });
    });
  }

  setUpSeats();

  setInterval(function(){

    $.ajax('/seats.json').done(function(data){


      _.each(data, function (seat) {
        var $el = $("div[id=" + seat.id + "]");
        $el.attr("status", seat.status);
      });


    });

  $.ajax('/reservations.json').done(function(data){
      var bookedSeats = _.pluck(data, 'seat_id');
      // var bookedSeats = _.pick(data, 'seat_id');
      var jsonData = data;
      // console.log("Seat_Ids from Reservations")
      // Reservation Seat ID's
      _.each(bookedSeats, function(bookedSeat){
        var bookedSeat = bookedSeat;

        // Div Seat ID's
        // console.log("Seat_Ids from Divs")
        $(".seat").each(function(index, seat){
           var seatID = parseInt($(seat).attr('id'));
            // console.log( seat );
            if (bookedSeat === seatID){

                var reservation = _.findWhere(jsonData, { seat_id: seatID });
                $(seat).removeClass('seat').removeClass('seatSelectable').addClass('reserved').text(reservation.name);
            };
        });
      });
    });


}, 200);

  $(document).ready(function() {
    $('#seatMap').on('click', ".seat", function(){
      var currentStatus = $(this).attr("status");

      var desiredStatus;
      if ( currentStatus === "true") {
        desiredStatus = "false";
      } else {
        desiredStatus = "true";
      }
      // $(this).attr("status", desiredStatus);

      // console.log($(this).attr("id"), $(this).attr("status"));
      var seat_id = $(this).attr("id");

      // var reservation = new app.Reservation({seat: '7C'});
      // reservation.save();
      var $input = $("<input>").attr("name", "seat_id").css("display", "none");
      $input.val( seat_id );

      $("form input").remove();
      $("form").prepend($input);

          $.ajax('/seats/' + seat_id + '.json', {
        method: 'PUT',
          data: { status: desiredStatus }
        }, function(){
         // console.log("status changed");
    });
      // console.log('selected ' + $(this).attr('id'));


    });

  });
};

