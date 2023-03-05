class TicTacToe

  def initialize()
  end

  def play()
    @board = Board.new()
    @player = 'X'
    @rounds = 9

    puts "Lets play Tic Tac Toe"
    puts "player input is row col"
    @board.print_board()

    while true do
      self.print_current_players_turn()
      move = gets
      row = move[0].to_i
      col = move[2].to_i
      break if self.playRound(row,col)
    end
  end

  def play_round(row,col)
    self.printCurrentMove(row, col)
    if @board.canPlacePiece(row, col)
      @board.placePiece(row, col, @player)
      @board.printBoard()
      self.decrementRounds()
      if @board.checkWinCondition(@player)
        self.delcareWinner(@player)
        return true
      end
      if @rounds == 0
        self.declareTie()
        return true
      end
      self.switchPlayer()
    else
      self.printInvalidMove()
    end
    false
  end

  def print_current_players_turn()
    puts "Player " + @player +" enter your move"
  end

  def decrement_rounds()
    @rounds -= 1
  end

  def delcare_winner(player)
    puts "Player "+ player + " Wins"
  end

  def declare_tie()
    puts "Game Tie"
  end

  def print_invalid_move()
    puts "Invalid move"
  end

  def print_current_move(row, col)
    puts "Player "+ @player + ": " + row.to_s+" "+col.to_s
  end

  def switch_player()
    if @player == 'X'
      @player = 'O'
    else
      @player = 'X'
    end
  end
end


class Board

  def initialize()
    @board = []
    3.times do |i|
      @board.push []
      3.times do |j|
        @board[i].push " "
      end
    end
  end

  def print_board()
    @board.each_with_index do |row,i|
      puts row[0]+"|"+ row[1]+"|"+row[2]
      puts "-+-+-" if i < 2
    end
  end

  def can_place_piece(row, col)
    @board[row][col] == " "
  end

  def place_piece(row, col, player)
    if self.canPlacePiece(row, col)
      @board[row][col] = player
    end
  end

  def check_win_condition(player)
    self.checkDiagonals(player) || self.checkRows(player) || self.checkColumns(player)
  end

  def check_diagnols(player)
    return true if player == @board[0][0] && @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
    return true if player == @board[0][2] && @board[0][0] == @board[1][1] && @board[1][1] == @board[2][0]
    false
  end

  def check_rows(player)
    @board.each do |row|
      return true if player == row[0] && row[0] == row[1] && row[1] == row[2]
    end
    false
  end

  def check_columns(player)
    3.times do |i|
      return true if player == @board[0][i] && @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
    end
    false
  end
end

ttt = TicTacToe.new()
ttt.play()
