package main

import (
	"fmt"
)

type Board struct {
  matrix [][]rune
  symbol []rune
  numRows, numCols int
}


func (board *Board) Init(numRows int, numCols int) *Board {
  board.matrix = make([][]rune, numRows)
  for rowInd := range board.matrix {
    board.matrix[rowInd] = make([]rune, numCols)
    for colInd := range board.matrix[rowInd] {
      board.matrix[rowInd][colInd] = '-'
    }
  }
  board.symbol = []rune{'O', 'X'}
  board.numRows = numRows
  board.numCols = numCols
  return board
}


func (board *Board) printBoard() {
    output := ""
    for rowInd := 0; rowInd < board.numRows; rowInd++ {
        output += "|"
        for colInd := 0; colInd < board.numCols; colInd++ {
            output += " "
            output += string(board.matrix[rowInd][colInd])
            output += " "
            output += "|"
        }
        output += "\n"
    }
    fmt.Println(output)
}

func (board *Board) canPlacePiece(row int, col int) bool {
    return (row < board.numRows && row >= 0) &&
           (col < board.numCols && col >= 0) &&
           board.matrix[row][col]== '-'
}

func (board *Board) placePiece(row int, col int, player int) {
    if (board.canPlacePiece(row, col)) {
        board.matrix[row][col] = board.symbol[player]
    }
}

func (board *Board) checkWinCondtion(player int) bool {
    return board.checkRows(player) || board.checkColumns(player) || board.checkDiagonals(player)
}

func (board *Board) checkDiagonals(player int) bool {
    hasWin := true
    for i := 0; i < board.numRows; i++ {
        if board.matrix[i][i]== '-' || board.matrix[i][i] != board.symbol[player] {
            hasWin = false
            break
        }
    }
    if hasWin { return true }

    hasWin = true
    // Check other diagonal
    for i := 0; i < board.numRows; i++ {
        if board.matrix[i][board.numRows-1 - i]== '-' || board.matrix[i][board.numRows-1 - i] != board.symbol[player] {
            hasWin = false
            break
        }
    }
    return hasWin
}

func (board *Board) checkRows(player int) bool {
    var hasWin bool
    for row :=0; row < board.numRows; row++ {
        hasWin = true
        for  col :=0; col < board.numCols; col++ {
            if board.matrix[row][col]== '-' || board.matrix[row][col] != board.symbol[player] {
                hasWin = false
                break
            }
        }
        if hasWin { return true }
    }
    return false
}

func (board *Board) checkColumns(player int) bool {
    var hasWin bool
    for  col :=0; col < board.numCols; col++ {
        hasWin = true
        for row :=0; row < board.numRows; row++ {
            if board.matrix[row][col]== '-' || board.matrix[row][col] != board.symbol[player] {
                hasWin = false
                break
            }
        }
        if hasWin { return true }
    }
    return false
}


type TicTacToe struct {
  board *Board
  currentPlayer int
  ongoingGame bool
  remainingRounds int
}

func (ttt *TicTacToe) Init() *TicTacToe {
  // Create 3x3 board
  // currentPlayer starts at 'X' (0 index in board.symbol)
  ttt.board = new(Board).Init(3,3)
  ttt.currentPlayer = 0
  ttt.ongoingGame = true
  ttt.remainingRounds = 9
  return ttt
}

func (ttt *TicTacToe) play() {
    var row, col int
    for ttt.remainingRounds > 0 && ttt.ongoingGame {
      ttt.printCurrentPlayersTurn()
      ttt.board.printBoard()
      valid_move := false
      for !valid_move {
        if _, err := fmt.Scan(&row, &col); err != nil {
            ttt.printInvalidMove()
            continue
        } else {
            if !ttt.board.canPlacePiece(row, col) {
              ttt.printInvalidMove()
              continue
            }
            valid_move = true
            ttt.playRound(row, col)
        }
      }
    }
    if ttt.remainingRounds == 0 { ttt.declareTie() }
    ttt.board.printBoard()
}

func (ttt *TicTacToe) playRound(row int, col int) {
  ttt.board.placePiece(row, col, ttt.currentPlayer)
  ttt.printCurrentMove(row, col)
  if ttt.board.checkWinCondtion(ttt.currentPlayer) {
      ttt.declareWinner()
      ttt.ongoingGame = false
  } else {
      ttt.switchPlayer()
      ttt.decrementRounds()
  }
}

func (ttt *TicTacToe) getCurrPlayer() string{
    return string(ttt.board.symbol[ttt.currentPlayer])
}

func (ttt *TicTacToe) printCurrentPlayersTurn() {
  fmt.Println("This is Player " + ttt.getCurrPlayer() + "'s turn.")
}

func (ttt *TicTacToe) decrementRounds() {
  ttt.remainingRounds--
}

func (ttt *TicTacToe) declareWinner() {
  fmt.Println("Player " + ttt.getCurrPlayer() + " won!")
}

func (ttt *TicTacToe) declareTie() {
  fmt.Println("The game is tied")
}

func (ttt *TicTacToe) printInvalidMove(){
  fmt.Println("Please enter valid unmarked row (0 <= row <"+string(ttt.board.numRows)+" and column (0 <= column <"+string(ttt.board.numCols)+") (e.g. 1 0)\n")
}

func (ttt *TicTacToe) printCurrentMove(row int, col int) {
  fmt.Println("Player " + ttt.getCurrPlayer() + " made a move at row " + string(row) + " and column " + string(col) + "!\n")
}

func (ttt *TicTacToe) switchPlayer() {
  ttt.currentPlayer = 1 - ttt.currentPlayer
}


func main() {
  ttt := new(TicTacToe).Init()
  ttt.play()
}
