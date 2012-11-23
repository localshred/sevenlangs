class Board(val board: List[List[Char]])
{
  val cols: Int = board.first.size
  val rows: Int = board.size

  val winningCombinations = List(
    // Rows
    List(List(0,0), List(0,1), List(0,2)),
    List(List(1,0), List(1,1), List(1,2)),
    List(List(2,0), List(2,1), List(2,2)),

    // Cols
    List(List(0,0), List(1,0), List(2,0)),
    List(List(0,1), List(1,1), List(2,1)),
    List(List(0,2), List(1,2), List(2,2)),

    // Diagonals
    List(List(0,0), List(1,1), List(2,2)),
    List(List(2,0), List(1,1), List(0,2))
  )

  def printResult() = {
    var winner: Char = '~'

    println("+-----+")
    for (row <- board) {
      print('|')
      print(row(0))
      print('|')
      print(row(1))
      print('|')
      print(row(2))
      print('|')
      println
      println("+-----+")
    }

    for(combination <- winningCombinations) {
      val x1: Int = combination(0)(0)
      val y1: Int = combination(0)(1)

      val x2: Int = combination(1)(0)
      val y2: Int = combination(1)(1)

      val x3: Int = combination(2)(0)
      val y3: Int = combination(2)(1)

      val c1: Char = board(x1)(y1)
      val c2: Char = board(x2)(y2)
      val c3: Char = board(x3)(y3)

      if (c1 == 'x' && c2 == 'x' && c3 == 'x') {
        winner = 'x'
      }
      else if (c1 == 'o' && c2 == 'o' && c3 == 'o') {
        winner = 'o'
      }
    }

    if (winner == 'x') {
      println("X WINS!!!")
    }
    else if (winner == 'o') {
      println("O WINS!!!")
    }
    else {
      println("Nobody won... shucks")
    }
  }

}

val noWinner = new Board(List(List('o', 'o', 'x'), List(' ', 'o', ' '), List('x', 'x', ' ')))
noWinner.printResult

println
println

val xWins = new Board(List(List('o', 'o', 'x'), List(' ', 'x', ' '), List('x', 'o', ' ')))
xWins.printResult

println
println

val oWins = new Board(List(List('x', 'o', 'x'), List(' ', 'o', ' '), List('x', 'o', ' ')))
oWins.printResult
