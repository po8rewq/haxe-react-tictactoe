package view;

import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;

import store.SquareActions;

typedef HistoryProps = {
  var history: Array<{squares: Array<String>}>;
}

class History extends ReactComponentOfProps<HistoryProps>
{
	public function new(props:HistoryProps)
	{
		super(props);
  }

  public override function render()
  {
    return jsx('<ol>
      ${createChildren()}
    </ol>');
  }

  function createChildren()
  {
    return [for (i in 0...props.history.length) jsx('<HistoryItem key=$i index=$i />')];
  }

}

typedef HistoryItemProps = {
  var index: Int;
}

class HistoryItem extends ReactComponentOfProps<HistoryItemProps>
{
	public function new(props:HistoryItemProps)
	{
		super(props);
  }

  public override function render()
  {
    var desc = props.index == 0 ? 'Game starts' : 'Move #${props.index}';
    return jsx('<li>
      <a href="#" onClick=$jumpTo>$desc</a>
    </li>');
  }

  function jumpTo(_)
  {
    SquareActions.jumpTo.dispatch(props.index);
  }
}
