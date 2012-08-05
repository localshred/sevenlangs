eight_queens(List) :- length(List, 8).
valid_queen((Row, Col)) :-
  Range = [1,2,3,4,5,6,7,8],
  member(Row, Range), member(Col, Range).

valid_board([]).
valid_board([Head|Tail]) :-
  valid_quen(Head),
  valid_board(Tail).

rows([], []).
rows([(Row, _)|QueensTail], [Row|RowsTail]) :-
  rows(QueensTail, RowsTail).

cols([], []).
cols([(_, Col)|QueensTail], [Col|ColsTail]) :-
  cols(QueensTail, ColsTail).

diags1([], []).
diags1([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col - Row,
  diags1(QueensTail, DiagonalsTail).

diags2([], []).
diags2([(Row, Col)|QueensTail], [Diagonal|DiagonalsTail]) :-
  Diagonal is Col + Row,
  diags1(QueensTail, DiagonalsTail).

eight_queens(Board) :-
  length(Board, 8),
  valid_board(Board),

  rows(Board, Rows),
  cols(Board, Cols),
  diags1(Board, Diags1),
  diags2(Board, Diags2),

  fd_all_different(Rows),
  fd_all_different(Cols),
  fd_all_different(Diags1),
  fd_all_different(Diags2).


/*
Row1 = [C11, C21, C31, C41, C51, C61, C71, C81],
Row2 = [C12, C22, C32, C42, C52, C62, C72, C81],
Row3 = [C13, C23, C33, C43, C53, C63, C73, C81],
Row4 = [C14, C24, C34, C44, C54, C64, C74, C81],
Row5 = [C15, C25, C35, C45, C55, C65, C75, C81],
Row6 = [C16, C26, C36, C46, C56, C66, C76, C81],
Row7 = [C17, C27, C37, C47, C57, C67, C77, C81],
Row8 = [C18, C28, C38, C48, C58, C68, C78, C81],

Col1 = [C11, C12, C13, C14, C15, C16, C17, C18],
Col2 = [C21, C22, C23, C24, C25, C26, C27, C28],
Col3 = [C31, C32, C33, C34, C35, C36, C37, C38],
Col4 = [C41, C42, C43, C44, C45, C46, C47, C48],
Col5 = [C51, C52, C53, C54, C55, C56, C57, C58],
Col6 = [C61, C62, C63, C64, C65, C66, C67, C68],
Col7 = [C71, C72, C73, C74, C75, C76, C77, C78],
Col8 = [C81, C82, C83, C84, C85, C86, C87, C88],

FsdA = [C17, C28],
FsdB = [C16, C27, C38],
FsdC = [C15, C26, C37, C48],
FsdD = [C14, C25, C36, C47, C58],
FsdE = [C13, C24, C35, C46, C57, C68],
FsdF = [C12, C23, C34, C45, C56, C67, C78],
FsdG = [C11, C22, C33, C44, C55, C66, C77, C88],
FsdH = [C21, C32, C43, C54, C65, C76, C87],
FsdI = [C31, C42, C53, C64, C75, C86],
FsdJ = [C41, C52, C63, C74, C85],
FsdK = [C51, C62, C73, C84],
FsdL = [C61, C72, C83],
FsdM = [C71, C82],

BsdA = [C12, C21],
BsdB = [C13, C22, C31],
BsdC = [C14, C23, C32, C41],
BsdD = [C15, C24, C33, C42, C51],
BsdE = [C16, C25, C34, C43, C52, C61],
BsdF = [C17, C26, C35, C44, C53, C62, C71],
BsdG = [C18, C27, C36, C45, C54, C63, C72, C81],
BsdH = [C28, C37, C46, C55, C64, C73, C82],
BsdI = [C38, C47, C56, C65, C74, C83],
BsdJ = [C48, C57, C66 C75, C84],
BsdK = [C58, C67, C76, C85],
BsdL = [C68, C77, C86],
BsdM = [C78, C87],
*/
