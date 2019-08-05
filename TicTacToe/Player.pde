class Player{
  char c;
  Player(char c){
    this.c = c;
  }
  void move(int i, int j){
    state.board[i][j] = c;
  }
}
