class UI{
  static final int block_size = 100;
  
  UI(){
  }
  
  void display(State state){
    background(255);
    for(int i=0; i<3; i++){
      for(int j=0; j<3; j++){
        
        //draw rectangle
        stroke(101, 67, 33);
        fill(255,239,213);
        rect(i*UI.block_size, j*UI.block_size,UI.block_size,UI.block_size);
        
        if(state.board[i][j]=='b'){
        }
        else if(state.board[i][j]=='x'){
          textAlign(CENTER, CENTER);
          textSize(62);
          fill(0);
          text("X",(i+0.5)*UI.block_size, (j+0.5)*UI.block_size);
        }
        else{
          textAlign(CENTER, CENTER);
          textSize(62);
          fill(0);
          text("O",(i+0.5)*UI.block_size, (j+0.5)*UI.block_size);
        }
      }
    }
    fill(0);
    rect(0, 3*UI.block_size,3*UI.block_size,UI.block_size/2);
    textSize(16);
    textAlign(LEFT, TOP);
    fill(255);
    if(!end){
      if(turn == 1){
        if(player1.c == 'o'){
          text("Player 1\'s turn : Nought [ o ]",0, 3*UI.block_size);
        }
        else{
          text("Player 1\'s turn : Cross  [ x ]",0, 3*UI.block_size);
        }
      }
      else{
        if(player2.c == 'o'){
          text("Player 2\'s turn : Nought [ o ]",0, 3*UI.block_size);
        }
        else{
          text("Player 2\'s turn : Cross  [ x ]",0, 3*UI.block_size);
        }
      }
    }
    else{
      if(who_won==0)
        text("Game Over!, It's a draw!",0, 3*UI.block_size);
      else
        text("Player "+str(who_won)+" wins!",0, 3*UI.block_size);
    }
  }
}
