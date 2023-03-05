#include <iostream>
#include <string>
#include <cstring>
#include <cstdio>

using namespace std;

const int rows = 3;
const int cols = 3;

class Board {

    private:
       char matrix[rows][cols];

    public:
      char symbol[2] = {'O', 'X'};

      Board() {
        for(int i=0; i<rows; i++) {
          for(int j=0; j<cols; j++) {
            matrix[i][j] = '-';
          }
        }
      }

      void printBoard() {
          string output = "";
          for (int i=0; i<rows; i++) {
              output += ("|");
              for (int j=0; j<cols; j++) {
                  output += (" ");
                  output += (matrix[i][j]);
                  output += (" ");
                  output += ("|");
              }
              output += ("\n");
          }
          cout << output << endl;
      }

      bool canPlacePiece(int row, int col) {
          return (row < 3 && row >= 0)
                  && (col < 3 && col >= 0)
                  && matrix[row][col]== '-';
      }

      void placePiece(int row, int col, int player) {
          if (canPlacePiece(row, col)) {
              matrix[row][col] = symbol[player];
          }
      }

      bool checkWinCondtion(int player) {
          return checkRows(player) || checkColumns(player) || checkDiagonals(player);
      }

      bool checkDiagonals(int player) {
          bool hasWin = true;
          for (int i=0; i<rows; i++) {
              if (matrix[i][i]== '-' || matrix[i][i] != symbol[player]) {
                  hasWin = false;
                  break;
              }
          }
          if (hasWin) return true;
          hasWin = true;
          for (int i=0; i<rows; i++) {
              if (matrix[i][rows-1 - i]== '-' || matrix[i][rows-1 - i] != symbol[player]) {
                  hasWin = false;
                  break;
              }
          }
          return hasWin;
      }

      bool checkRows(int player) {
          bool hasWin;
          for (int row=0; row<rows; row++) {
              hasWin = true;
              for (int col=0; col<cols; col++) {
                  if (matrix[row][col]== '-' || matrix[row][col] != symbol[player]) {
                      hasWin = false;
                      break;
                  }
              }
              if (hasWin) return true;
          }
          return false;
      }

      bool checkColumns(int player) {
          bool hasWin;
          for (int col=0; col<cols; col++) {
              hasWin = true;
              for (int row=0; row<rows; row++) {
                  if (matrix[row][col]== '-' || matrix[row][col] != symbol[player]) {
                      hasWin = false;
                      break;
                  }
              }
              if (hasWin) return true;
          }
          return false;
      }
};

class TicTacToe {

    private:
       Board *board;
       int currentPlayer;
       bool ongoing;
       int remainingRounds;
       const int MAX_ROUND = 9;

    public:
      TicTacToe() {
          // Current Player starts at X
          // Number of Rounds
          // Create 3x3 board
          board = new Board();
          currentPlayer = 0;
          remainingRounds = MAX_ROUND;
          ongoing = true;
      }

      void play() {
          int row, col;
          while (remainingRounds > 0 && ongoing) {
              printCurrentPlayersTurn();
              board->printBoard();
              bool valid_move = false;
              string userIn;
              while(!valid_move) {
                try {
                  cin >> userIn;
                  row = stoi(userIn);
                  cin >> userIn;
                  col = stoi(userIn);
                  valid_move = board->canPlacePiece(row, col);
                  if(!valid_move) printInvalidMove();
                  else playRound(row, col);
                }
                catch (const std::invalid_argument& ia) {
                  printInvalidMove();
                }
              }
          }
          if (remainingRounds == 0) declareTie();
          board->printBoard();
      }

      void playRound(int row, int col) {
          board->placePiece(row, col, currentPlayer);
          printCurrentMove(row, col);
          if (board->checkWinCondtion(currentPlayer)) {
              declareWinner();
              ongoing = false;
          } else {
              switchPlayer();
              decrementRounds();
          }
      }

      string getCurrPlayer(){
          return string(1, board->symbol[currentPlayer]);
      }

      void printCurrentPlayersTurn() {
          cout << ("This is Player " + getCurrPlayer() + "'s turn.") << endl;
      }

      void decrementRounds() {
          remainingRounds--;
      }

      void declareWinner() {
          cout << ("Player " + getCurrPlayer() + " won!") << endl;
      }

      void declareTie() {
          cout << ("The game is tied") << endl;
      }

      void printInvalidMove(){
          cout << ("Please enter valid unmarked row (0 <= row <"+to_string(rows)+" and column (0 <= column <"+to_string(cols)+") (e.g. 1 0)\n") << endl;
      }

      void printCurrentMove(int row, int col) {
          cout << "Player " + getCurrPlayer() + " made a move at row " + to_string(row) + " and column " + to_string(col) + "!\n" << endl;
      }

      void switchPlayer() {
          currentPlayer = 1 - currentPlayer;
      }

};


int main() {
  TicTacToe ttt;
  ttt.play();
  return 0;
}
