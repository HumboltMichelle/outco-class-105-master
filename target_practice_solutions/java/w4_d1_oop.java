import java.util.*;
import java.io.*;

class TTTRunner {
    public static void main(String[] args) {
        TicTacToe ttt = new TicTacToe();
        ttt.play();
    }
}

class TicTacToe {

    private Board board;
    private int currentPlayer;
    private boolean ongoing;
    private int remainingRounds;

    public TicTacToe() {
        // Current Player starts at X
        // Number of Rounds
        // Create 3x3 board
        board = new Board();
        currentPlayer = 0;
        remainingRounds = 9;
        ongoing = true;
    }

    public void play() {
        Scanner in = new Scanner(new BufferedReader(new InputStreamReader(System.in)));
        int row, col;
        while (remainingRounds > 0 && ongoing) {
            printCurrentPlayersTurn();
            board.printBoard();
            try {
                row = in.nextInt();
                col = in.nextInt();
                if (!board.canPlacePiece(row, col)) throw new InputMismatchException();
                playRound(row, col);
            } catch (InputMismatchException e){
                printInvalidMove();
            }
            in.nextLine();
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
        System.out.println("This is Player " + getCurrPlayer() + "'s turn.");
    }

    public void decrementRounds() {
        remainingRounds--;
    }

    public void declareWinner() {
        System.out.println("Player " + getCurrPlayer() + " won!");
    }

    public void declareTie() {
        System.out.println("The game is tied");
    }

    public void printInvalidMove(){
        System.out.println("Please enter valid unmarked row (0 <= row <3) and column (0 <= column <3) (e.g. 1 0)\n");
    }

    public void printCurrentMove(int row, int col) {
        System.out.println("Player " + getCurrPlayer() + " made a move at row " + row + " and column " + col + "!\n");
    }

    public void switchPlayer() {
        currentPlayer = 1 - currentPlayer;
    }

}

class Board {

    private Character[][] matrix;
    char[] symbol;

    public Board() {
        matrix = new Character[3][3];
        symbol = new char[]{'O', 'X'};
    }

    public void printBoard() {
        StringBuilder output = new StringBuilder();
        for (Character[] characters : matrix) {
            output.append("|");
            for (Character character : characters) {
                output.append(" ");
                output.append(character == null ? '-' : character);
                output.append(" ");
                output.append("|");
            }
            output.append("\n");
        }
        System.out.println(output.toString());
    }

    public boolean canPlacePiece(int row, int col) {
        return (row < 3 && row >= 0)
                && (col < 3 && col >= 0)
                && matrix[row][col] == null;
    }

    public void placePiece(int row, int col, int player) {
        if (canPlacePiece(row, col)) {
            matrix[row][col] = symbol[player];
        }
    }

    public boolean checkWinCondtion(int player) {
        return checkRows(player) || checkColumns(player) || checkDiagonals(player);
    }

    public boolean checkDiagonals(int player) {
        boolean hasWin = true;
        for (int i=0; i<matrix.length; i++) {
            if (matrix[i][i] == null || matrix[i][i] != symbol[player]) {
                hasWin = false;
                break;
            }
        }
        if (hasWin) return true;
        hasWin = true;
        for (int i=0; i<matrix.length; i++) {
            if (matrix[i][matrix.length-1 - i] == null || matrix[i][matrix.length-1 - i] != symbol[player]) {
                hasWin = false;
                break;
            }
        }
        return hasWin;
    }

    public boolean checkRows(int player) {
        boolean hasWin;
        for (int row=0; row<matrix.length; row++) {
            hasWin = true;
            for (int col=0; col<matrix[row].length; col++) {
                if (matrix[row][col] == null || matrix[row][col] != symbol[player]) {
                    hasWin = false;
                    break;
                }
            }
            if (hasWin) return true;
        }
        return false;
    }

    public boolean checkColumns(int player) {
        boolean hasWin;
        for (int col=0; col<matrix[0].length; col++) {
            hasWin = true;
            for (int row=0; row<matrix.length; row++) {
                if (matrix[row][col] == null || matrix[row][col] != symbol[player]) {
                    hasWin = false;
                    break;
                }
            }
            if (hasWin) return true;
        }
        return false;
    }
}
