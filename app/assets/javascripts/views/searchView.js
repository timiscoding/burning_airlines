var PagesController = Paloma.controller('Pages');
console.log('stuf');

PagesController.prototype.seating = function(){
  var desiredFlightID = parseInt( this.params["flight_id"] );

  $.ajax('/seats.json').done(function(data){
    var seats = _.where( data, { flight_id: desiredFlightID })
    seats = _.sortBy(seats, 'id');
    console.log("sorting" + seats);
    _.each(seats, function(seat) {
      console.log(seat.status);
      var $seat = $('#seatMap').append( $('<div>').addClass("seat").attr('id', seat.id).attr('status', seat.status) );
    });

  $.ajax('/reservations.json').done(function(data){
    var bookedSeats = _.pluck(data, 'seat_id');
    console.log(bookedSeats)
    // _.each(bookedSeats, function(id) {
    //   if $('<div>').attr('id') === id {
    //     $('<div>').removeAttr('status')
    //   }else {return};
    // })
  });

// [
     // $('#seat').sort(function(a, b){
     //    return parseInt(a.id) > parseInt(b.id);

     //  }).each(function(){
     //    var elem = $(this);
     //    elem.remove();
     //    $(elem).appendTo('#seat');
     //  })

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


