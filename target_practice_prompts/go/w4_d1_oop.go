package main

import (
	"fmt"
)

type Board struct {
  // YOUR WORK HERE
}


func (board *Board) Init(numRows int, numCols int) *Board {
  // YOUR WORK HERE
  return board
}


func (board *Board) printBoard() {
    // YOUR WORK HERE
}

func (board *Board) canPlacePiece(row int, col int) bool {
    // YOUR WORK HERE
    return false
}

func (board *Board) placePiece(row int, col int, player int) {
    // YOUR WORK HERE
}

func (board *Board) checkWinCondtion(player int) bool {
    // YOUR WORK HERE
    return false
}

func (board *Board) checkDiagonals(player int) bool {
    // YOUR WORK HERE
    return false
}

func (board *Board) checkRows(player int) bool {
    // YOUR WORK HERE
    return false
}

func (board *Board) checkColumns(player int) bool {
    // YOUR WORK HERE
    return false
}


type TicTacToe struct {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) Init() *TicTacToe {
  // YOUR WORK HERE
  return ttt
}

func (ttt *TicTacToe) play() {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) playRound(row int, col int) {
  // YOUR WORK HERE
}


func (ttt *TicTacToe) printCurrentPlayersTurn() {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) decrementRounds() {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) declareWinner() {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) declareTie() {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) printInvalidMove(){
  // YOUR WORK HERE
}

func (ttt *TicTacToe) printCurrentMove(row int, col int) {
  // YOUR WORK HERE
}

func (ttt *TicTacToe) switchPlayer() {
  // YOUR WORK HERE
}


func main() {
  fmt.Println("Let's Play!")
  // YOUR WORK HERE
}
