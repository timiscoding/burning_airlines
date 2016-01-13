var plane =

board: function(size){  // creates a board of size x size dimension
    var b = {
      grid: [], // 2d array representing squares on board
      size: function(){ // returns the size of the board
        return this.grid.length;
      },
      show: function(){  // prints the board to console.log
        console.log('cur board');
        var grid = "";
        for (var i=0; i < this.size(); i++){
          for (var j=0; j < this.size(); j++){
            if (this.grid[i][j]){
              grid += this.grid[i][j];
            }else{
              grid += " ";
            }
          }
          grid += "\n";
        }
        console.log(grid);
        console.log('end board');
        return grid;
      },


      board: function(size){ // create a board on the web page. returns an object allowing you to set a square
    // remove any previous board

    // create NxN grid
    for (var i=0; i < size; i++){
      $("#board").append('<div class="row" y="' + i + '">');
      for (var j=0; j < size; j++){
        $(".row").eq(i).append('<div class="col" x="' + j + '">');
      }
    }

