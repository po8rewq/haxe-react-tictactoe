package view;

import react.ReactComponent;
import react.ReactMacro.jsx;

import store.SquareActions;

typedef GameState = {
	var history: Array<{squares: Array<String>}>;
	var xIsNext: Bool;
	var stepNumber: Int;
}

class Game extends ReactComponentOfState<GameState>
{
	public function new(props:Dynamic):Void
	{
		super(props);

		state = {
			history: [{
				squares: [for(i in 0...9) null]
			}],
			xIsNext: true,
			stepNumber: 0
		}

		SquareActions.addItem.add(onSquareClicked);
		SquareActions.jumpTo.add(jumpTo);
	}

	function onSquareClicked(i: Int):Void
  {
		var history = state.history.slice(0, state.stepNumber+1);
	  var current = history[history.length - 1];
	  var squares = current.squares.copy();
	  if (calculateWinner(squares) != null || squares[i] != null)
	    return;

	  squares[i] = state.xIsNext ? 'X' : 'O';
	  setState({
	    history: history.concat([{
	      squares: squares
	    }]),
      stepNumber: history.length,
	    xIsNext: !state.xIsNext,
	  });
  }

	override public function render():ReactElement
	{
		var history = state.history;
		var current = history[state.stepNumber];
		var winner = calculateWinner(current.squares);
    var status = winner != null ? 'Winner: $winner' : ('Next player: ' + (state.xIsNext ? 'X' : 'O'));

		return jsx('<div className="game">
        <div className="game-board">
					<Board squares=${current.squares} />
        </div>
        <div className="game-info">
          <div className="status">${status}</div>
          <History history=${state.history} />
        </div>
      </div>');
	}

	function jumpTo(step:Int):Void
	{
		setState({
		 	stepNumber: step,
		 	xIsNext: (step % 2 != 0) ? false : true,
			history: state.history
		});
	}

	function calculateWinner(squares:Array<String>):String
  {
    var lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (i in 0...lines.length)
    {
      var a = lines[i][0];
      var b = lines[i][1];
      var c = lines[i][2];
      if (squares[a] != null && squares[a] == squares[b] && squares[a] == squares[c])
        return squares[a];
    }
    return null;
  }
}
