-- 2D array example
-- Read tic-tac-toe board and determine whether X or O has won

-- Import necessary Ada package for input and output
with Ada.Text_IO;
use Ada.Text_IO;

-- Define the main procedure named ttt_win
procedure ttt_win is
   -- Define a 2D array type to represent the tic-tac-toe board
   type BoardArray is array(1..3, 1..3) of Character;
   -- Declare a variable of the defined array type to hold the board
   Board: BoardArray;
   -- Declare a delimiter variable to read the input
   Delimiter: Character;

   -- Define a function to check if a player has won
   function Win(Board: BoardArray; Player: Character) return Boolean is
   begin
      -- Check row wins
      for Row in 1..3 loop
         if Board(Row, 1) = Player and
            Board(Row, 2) = Player and
            Board(Row, 3) = Player then
            return True;
         end if;
      end loop;

      -- Check column wins
      for Col in 1..3 loop
         if Board(1, Col) = Player and
            Board(2, Col) = Player and
            Board(3, Col) = Player then
            return True;
         end if;
      end loop;

      -- Check diagonal wins
      if Board(1, 1) = Player and
         Board(2, 2) = Player and
         Board(3, 3) = Player then
         return True;
      end if;

      if Board(1, 3) = Player and
         Board(2, 2) = Player and
         Board(3, 1) = Player then
         return True;
      end if;

      -- If no win is found, return false
      return False;
   end Win;

begin
   -- Display instructions for entering the tic-tac-toe board
   Put_Line("Enter tic-tac-toe board, one row at a time");
   Put_Line("Use characters X O and b (for blank), separated by single spaces");
   Put_Line("Example:");
   Put_Line("X b O");
   Put_Line("b b X");
   Put_Line("b b b");
   New_Line;

   -- Read the tic-tac-toe board from the user
   for Row in 1..3 loop
      Get(Board(Row, 1));
      Get(Delimiter);
      Get(Board(Row, 2));
      Get(Delimiter);
      Get(Board(Row, 3));
      Skip_Line;  -- Skip remaining characters on the input line
   end loop;

   -- Display the entered board
   Put_Line("Board is:");
   for Row in 1..3 loop
      for Col in 1..3 loop
         Put(Board(Row, Col));
      end loop;
      New_Line;
   end loop;

   -- Check if X or O has won
   if Win(Board, 'X') then
      Put_Line("X has won");
   elsif Win(Board, 'O') then
      Put_Line("O has won");
   else
      Put_Line("Nobody has won");
   end if;

end ttt_win;

