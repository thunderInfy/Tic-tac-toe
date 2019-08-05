UI ui;
State state;
Player player1;
Player player2;
int turn;
boolean play = true;
int[][] result;
int who_won = -1;
boolean end = false;
boolean dont_loop = false;

void settings(){
  size(3*(UI.block_size), 7*(UI.block_size)/2);
}

void setup(){
  result = new int[2][3];
  for(int i=0;i<2;i++)
    for(int j=0;j<3;j++)
      result[i][j] = -1;
    
  ui = new UI();
  state = new State();
  int init_symbol = int(random(2));
  
  if(init_symbol == 1){
    player1 = new Player('x');
    player2 = new Player('o');
  }
  else{
    player1 = new Player('o');
    player2 = new Player('x');
  }
  turn = 1;
}

void draw(){
  if(!dont_loop){
    if(play){
      play = false;
      ui.display(state);
      state.print_me();
      if(end){
        dont_loop = true;
      }
    }
  }
}

void mousePressed(){
  
  int i,j;
  i = mouseX/UI.block_size;
  j = mouseY/UI.block_size;
  
  if(state.board[i][j] != 'b'){
  }
  else{  
    if(turn==1){
      player1.move(i,j);
      turn = 2;
    }
    else{
      player2.move(i,j);
      turn = 1;
    }
    
    if(state.analyse()){
      
      if(who_won==-1){
        char ch = state.board[result[1][0]][result[0][0]];
        if(ch == player1.c){
          who_won = 1;
        }
        else{
          who_won = 2;
        }
      }
      end = true;
    }
    
    play = true;
  }
}
