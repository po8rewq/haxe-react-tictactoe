package view;

import react.ReactComponent;
import react.ReactMacro.jsx;

typedef BoardProps = {
  var squares: Array<String>;
}

class Board extends ReactComponentOfProps<BoardProps>
{
  public function new(props:BoardProps):Void
  {
    super(props);
  }

  public override function render():ReactElement
  {
    return jsx('
      <div>
        <div className="board-row">
          {this.renderSquare(0)}
          {this.renderSquare(1)}
          {this.renderSquare(2)}
        </div>
        <div className="board-row">
          {this.renderSquare(3)}
          {this.renderSquare(4)}
          {this.renderSquare(5)}
        </div>
        <div className="board-row">
          {this.renderSquare(6)}
          {this.renderSquare(7)}
          {this.renderSquare(8)}
        </div>
      </div>
    ');
  }

  function renderSquare(i:Int):ReactElement
  {
    return jsx('<Square value=${props.squares[i]} ident=$i />');
  }

}
