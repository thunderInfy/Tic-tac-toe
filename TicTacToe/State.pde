class State{
  char[][] board;
  State(){
    board = new char[3][3];
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        board[i][j] = 'b';
      }
    }
  }
  
  void print_me(){
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        print(this.board[j][i] + " ");
      }
      println();
    }
  }
  boolean analyse(){
    
    boolean flag = false;
    
    for(int i=0;i<3;i++){
      char ch = board[i][0];
      int count  = 1;
      if(ch!='b'){
        for(int j=1;j<3;j++){
          if(board[i][j] == ch){
            count++;
          }
        }
        if(count==3){
          flag = true;
          result[0][0]=result[0][1]=result[0][2]=i;
          result[1][0]=0;
          result[1][1]=1;
          result[1][2]=2;
        }
      }
    }
    
    if(!flag){
      for(int j=0;j<3;j++){
        char ch = board[0][j];
        int count  = 1;
        
        if(ch!='b'){
          for(int i=1;i<3;i++){
            if(board[i][j] == ch){
              count++;
            }
          }
          if(count==3){
            flag = true;
            result[1][0]=result[1][1]=result[1][2]=j;
            result[0][0]=0;
            result[0][1]=1;
            result[0][2]=2;
          }
        }
      }
    }
    
    if(!flag){
      if(board[0][0]==board[1][1] && board[1][1]==board[2][2] && board[0][0]!='b'){
         flag = true;
         result[0][0] = result[1][0] = 0;
         result[0][1] = result[1][1] = 1;
         result[0][2] = result[1][2] = 2;
      }
    }
    
    if(!flag){
      if(board[0][2]==board[1][1] && board[1][1]==board[2][0] && board[0][2]!='b'){
         flag = true;
         result[0][0] = 0;
         result[0][1] = 1;
         result[0][2] = 2;
         result[1][0] = 2;
         result[1][1] = 1;
         result[1][2] = 0;
      }
    }
    
    if(!flag){
      int count = 0;
      for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
          if(board[i][j]!='b'){
            count++;
          }
        }
      }
      if(count == 9){
        flag = true;
        who_won = 0;
      }
    }
    
    return flag;
  }
}
