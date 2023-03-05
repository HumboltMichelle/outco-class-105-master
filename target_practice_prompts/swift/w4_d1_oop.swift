
class TicTacToe {

  init() {
    // YOUR WORK HERE
    }

  func play() {
    // YOUR WORK HERE
  }

  func playRound() {
      // YOUR WORK HERE
  }

  func printCurrentPlayersTurn() {
      // YOUR WORK HERE
  }

  func decrementRounds() {
      // YOUR WORK HERE
  }

  func declareWinner(_ play: Character) {
    // YOUR WORK HERE
  }

  func declareTie() {
    // YOUR WORK HERE
  }

  func printInvalidMove() {
    // YOUR WORK HERE
  }

  func printCurrentMove() {
    // YOUR WORK HERE
  }

  func switchPlayer() {
    // YOUR WORK HERE
  }
}

class Board {

  init() {
    // YOUR WORK HERE
  }

  func printBoard() {
    // YOUR WORK HERE
  }

  func canPlacePiece(_ x: Int, _ y: Int) -> Bool {
    // YOUR WORK HERE
    return false 
  }

  func placePiece(_ x: Int, _ y: Int) {
    // YOUR WORK HERE
  }

  func checkWinCondition(for play: Character) -> Bool {
    // YOUR WORK HERE
    return false
  }

  func checkDiagnols(for play: Character) -> Bool {
    // YOUR WORK HERE
    return false
  }

  func checkRows(for play: Character) -> Bool {
    // YOUR WORK HERE
    return false
  }

  func checkColumns(for play: Character) -> Bool {
    // YOUR WORK HERE
    return false
  }
}

let ttt = TicTacToe()
ttt.play()
