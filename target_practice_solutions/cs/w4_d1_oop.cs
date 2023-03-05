using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

class Test {
    public static void Main() {
        TicTacToe ttt = new TicTacToe();
        ttt.play();
    }
}

class TicTacToe {

    private Board board;
    private int currentPlayer;
    private bool ongoing;
    private int remainingRounds;
    private int MAX_ROUND = 9;

    public TicTacToe() {
        // Current Player starts at X
        // Number of Rounds
        // Create 3x3 board
        board = new Board();
        currentPlayer = 0;
        remainingRounds = MAX_ROUND;
        ongoing = true;
    }

    public void play() {
        int row, col;
        while (remainingRounds > 0 && ongoing) {
            printCurrentPlayersTurn();
            board.printBoard();
            string rowVal, colVal;
            rowVal = Console.ReadLine();
            colVal = Console.ReadLine();
            if (!int.TryParse(rowVal, out row) || !int.TryParse(colVal, out col) || !board.canPlacePiece(row, col)) {
              printInvalidMove();
            } else {
              playRound(row, col);
            }
        }
        if (remainingRounds == 0) declareTie();
        board.printBoard();
    }

    public void playRound(int row, int col) {
        board.placePiece(row, col, currentPlayer);
        printCurrentMove(row, col);
        if (board.checkWinCondtion(currentPlayer)) {
            declareWinner();
            ongoing = false;
        } else {
            switchPlayer();
            decrementRounds();
        }
    }

    public char getCurrPlayer(){
        return board.symbol[currentPlayer];
    }

    public void printCurrentPlayersTurn() {
        Console.WriteLine("This is Player " + getCurrPlayer() + "'s turn.");
    }

    public void decrementRounds() {
        remainingRounds--;
    }

    public void declareWinner() {
        Console.WriteLine("Player " + getCurrPlayer() + " won!");
    }

    public void declareTie() {
        Console.WriteLine("The game is tied");
    }

    public void printInvalidMove(){
        Console.WriteLine("Please enter valid unmarked row (0 <= row <3) and column (0 <= column <3) (e.g. 1 0)\n");
    }

    public void printCurrentMove(int row, int col) {
        Console.WriteLine("Player " + getCurrPlayer() + " made a move at row " + row + " and column " + col + "!\n");
    }

    public void switchPlayer() {
        currentPlayer = 1 - currentPlayer;
    }

}

class Board {

    private char[,] matrix;
    public char[] symbol;
    private int numRows = 3;
    private int numCols = 3;

    public Board() {
        matrix = new char[numRows,numCols];
        symbol = new char[]{'O', 'X'};
        for(int i=0; i<numRows; i++) {
          for(int j=0; j<numCols; j++) {
            matrix[i,j] = '-';
          }
        }

    }

    public void printBoard() {
        string output = "";
        for (int i=0; i<matrix.GetLength(0); i++) {
            output += ("|");
            for (int j=0; j<matrix.GetLength(1); j++) {
                output += (" ");
                output += (matrix[i,j]);
                output += (" ");
                output += ("|");
            }
            output += ("\n");
        }
        Console.WriteLine(output);
    }

    public bool canPlacePiece(int row, int col) {
        return (row < 3 && row >= 0)
                && (col < 3 && col >= 0)
                && matrix[row,col] == '-';
    }

    public void placePiece(int row, int col, int player) {
        if (canPlacePiece(row, col)) {
            matrix[row,col] = symbol[player];
        }
    }

    public bool checkWinCondtion(int player) {
        return checkRows(player) || checkColumns(player) || checkDiagonals(player);
    }

    public bool checkDiagonals(int player) {
        bool hasWin = true;
        for (int i=0; i<matrix.GetLength(0); i++) {
            if (matrix[i,i] == '-' || matrix[i,i] != symbol[player]) {
                hasWin = false;
                break;
            }
        }
        if (hasWin) return true;
        hasWin = true;
        for (int i=0; i<matrix.GetLength(0); i++) {
            if (matrix[i,matrix.GetLength(0)-1 - i] == '-' || matrix[i,matrix.GetLength(0)-1 - i] != symbol[player]) {
                hasWin = false;
                break;
            }
        }
        return hasWin;
    }

    public bool checkRows(int player) {
        bool hasWin;
        for (int row=0; row<matrix.GetLength(0); row++) {
            hasWin = true;
            for (int col=0; col<matrix.GetLength(1); col++) {
                if (matrix[row,col] == '-' || matrix[row,col] != symbol[player]) {
                    hasWin = false;
                    break;
                }
            }
            if (hasWin) return true;
        }
        return false;
    }

    public bool checkColumns(int player) {
        bool hasWin;
        for (int col=0; col<matrix.GetLength(1); col++) {
            hasWin = true;
            for (int row=0; row<matrix.GetLength(0); row++) {
                if (matrix[row,col] == '-' || matrix[row,col] != symbol[player]) {
                    hasWin = false;
                    break;
                }
            }
            if (hasWin) return true;
        }
        return false;
    }
}
