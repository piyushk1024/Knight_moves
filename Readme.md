Knight Moves - Theodinproject.com ruby project
Ruby program to find Knight's route between 2 specified squares on the
chessboard.

The chess board is represented with co-ordinates ranging from

  0,0 -> Top left
  7,7 -> Bottom right

The program combines building up of tree and breadth first search functions.
If the current node is not the destination, all possible, valid moves of the Knight
are calculated and added as the positions children. The destination is searched
for among the children nodes, and if it is not found, the next depth of move/positions is calculated.

The sequence of steps needed are displayed. In addition,
a chessboard grid is printed in the terminal, with move numbers of relevant
squares marked up.
