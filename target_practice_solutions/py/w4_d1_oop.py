
class TicTacToe:
    def __init__(self):
        self._board = Board(3)
        self._game_id = 0
        self._game_over = False
        self._player = 'X'
        self._rounds_left = 9     # board.dim * board.dim
        #self._game_state

    def play(self):
        # begins a new game.

        # assign new game id
        self._game_id = random.random()
        print("Welcome to the TicTacToe game. \nGame id {}".format(self._game_id))


        # let's pretend the input is received
        # row_col = input('Player make your move [row, col]: ')
        # row, col = self._get_row_col(row_col)
        # row, col = 0, 1
        # row, col = 0, 1
        row, col = 2, 4
        #row, col = 0, 1
        while not self._game_over:
          self.play_round(row,col)

    def play_round(self, row, col):
        # executes a single round of the game by
        # placing a piece at the position of row, col.

        self.print_current_players_turn()
        self._board.print_board()

        if self._board.can_place_piece(row, col):

          self._board.place_piece(row, col, 'X')
          self.decrement_rounds()
        else:
          #using helper method to print invalid move
          self.print_invalid_move()

        self._board.print_board()

    def print_current_players_turn(self):
        print("Current turn is: ", self._player)

    def decrement_rounds(self):
        # reduces the number of rounds remaining.
        self._rounds_left -= 1

    def declare_winner(self, player):
        # declares the given player as the winner
        self._game_over = True
        print('Player {} is the winner!'.format(self._player))

    def declare_tie(self):
        # declares a tie
        # yess we have to put it all together-- VAIBHAV
        self._game_over = True
        print('Game {} is a tie!'.format(self._game_id))

    def print_current_move(self, row, col):
        # prints the move just made
        print('{} was placed at {} {}'.format(self._player, row, col))

    def print_invalid_move(self, row, col):
        # declares a move invalid
        print('Invalid move placing {} at {} {}'.format(self._player, row, col))

    def switch_player(self):
        # changes current player.
        if self._player.lower() == 'x':
          self._player = 'O'
        else:
          self._player = 'X'



class Board:
    def __init__(self, dim):
        self._dim = dim
        self._empty_char = '.'
        self._matrix = [[self._empty_char for i in range(self._dim)] for j in range(self._dim)]

    def print_board(self):
        # prints out the current state of the board
        for i in range(self._dim):
          row = ' | '.join([x for x in self._matrix[i]] )
          print(row)

    def can_place_piece(self, row, col):
        # determines whether a given move is valid
        if 0 < row < self._dim  and 0 < col < self._dim:
          return self._matrix[row][col] == self._empty_char
        return False

        ## !!! One condition is missing here: fix it later, for now the func works
        # if row < 0 or row >= self._dim or col < 0 or col >= self._dim:
        #   if self._matrix[row][col].lower() == 'x' or self._matrix[row][col].lower() == 'o':
        #     return False
        # return True

    def place_piece(self, row, col, player):
        # We know it's a valid location, so no checks here!
        # player = 'x' or player = 'o'
        self._matrix[row][col] = player

    def check_win_condition(self, player):
        # checks if the given player has won
        return (self._check_diagonals(player) or self._check_rows(player)
            or self._check_columns(player))

    def check_diagonals(self, player):
        # checks if the given player has 3 pieces on either diagonal
        for i in range(self._dim):
          if self._matrix[i][i] != player:
            return False
        return True

    def check_rows(self, player):
        # checks if the given player has 3 pieces on any of the rows
        for i in range(self._dim):
          row_win = True
          for j in range(self._dim):
            if self._matrix[i][j] != player:
              row_win = False
              break
          if row_win:
            return row_win
        return row_win

    def check_columns(self, player):
        # checks if the given player has 3 pieces on any of the columns
        i = 0
        j = 0
        while i < self._dim:
          row_columns = True

          while j < self._dim:
            if self._matrix[j][i] != player:
              row_columns = False
              break
            j+=1
          i+=1

          if row_columns:
            return row_columns
        return row_columns


# Uncomment to test
# ttt = TicTacToe()
# ttt.play()
