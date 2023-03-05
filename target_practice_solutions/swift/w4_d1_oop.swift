
class TicTacToe {

  init() {
    board = Board(game: self)
    }

  func play() {
    print("Game started! 🎉\n")
    board.printBoard()
    print("Player X has the first move.\n")
    print("Coordinates are specified in the format: x y, where x and y are values between 0 and 2.")
    print("For example, 0 0 is the top-left corner. 2 1 is the middle right square.")
    while gameActive {
      guard let move = readLine(strippingNewline: true) else {
          print("Input your move.")
          continue
      }
    print("\n")
    let coordinates = move
        .components(separatedBy: " ")
        .compactMap { Int($0) }

    guard coordinates.count == 2 else {
        print("Specify the x and y position of your play.")
        continue
    }

    let x = coordinates[0]
    let y = coordinates[1]

    guard board.canPlacePiece(x, y) else {
        print("Invalid move.")
        continue
    }

    board.placePiece(x, y)
    }
  }

  func playRound() {
  }

  func printCurrentPlayersTurn() {
  }

  func decrementRounds() {
  }

  func declareWinner(_ play: Character) {
    print("Player \(play.rawValue) won! 🏆")
    exit(0)
  }

  func declareTie() {
    print("It's a tie! 😸")
    exit(0)
  }

  func printInvalidMove() {
  }

  func printCurrentMove() {
  }

  func switchPlayer() {
  }
}

class Board {

  init() {
  }

  func printBoard() {
    print(board)
  }

  func canPlacePiece(_ x: Int, _ y: Int) -> Bool {
    guard   x >= 0 &&
            x <= 2 &&
            y >= 0 &&
            y <= 2 else {
                return false
    }
    return positions[y][x] == nil
  }

  func placePiece(_ x: Int, _ y: Int) {
    positions[y][x] = activePlayer

    print("Placed \(activePlayer.rawValue) at \(x), \(y).\n")
    printBoard()

    let activePlayerWon = checkWinCondition(for: activePlayer)

    if activePlayerWon {
        game.declareWinner(activePlayer)
    } else {
        changePlayer()
    }
    game.playCount += 1
  }

  func checkWinCondition(for play: Character) -> Bool {
    if checkColumns(for: play) {
        return true
    }

    if checkRows(for: play) {
        return true
    }

    if checkDiagnols(for: play) {
        return true
    }

    return false
  }

  func checkDiagnols(for play: Character) -> Bool {
  }

  func checkRows(for play: Character) -> Bool {
  }

  func checkColumns(for play: Character) -> Bool {
  }
}

let ttt = TicTacToe()
ttt.play()
