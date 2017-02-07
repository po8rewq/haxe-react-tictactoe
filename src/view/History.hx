package view;

import react.ReactComponent;
import react.ReactMacro.jsx;

import store.SquareActions;

typedef HistoryProps = {
  var history: Array<{squares: Array<String>}>;
}

class History extends ReactComponentOfProps<HistoryProps>
{
	public function new(props:HistoryProps):Void
	{
		super(props);
  }

  public override function render():ReactElement
  {
    return jsx('<ol>
      ${createChildren()}
    </ol>');
  }

  function createChildren():Array<Dynamic>
  {
    return [for (i in 0...props.history.length) jsx('<HistoryItem key=$i index=$i />')];
  }

}

/**
 * A component representing an item of the history list
 **/

typedef HistoryItemProps = {
  var index: Int;
}

class HistoryItem extends ReactComponentOfProps<HistoryItemProps>
{
	public function new(props:HistoryItemProps):Void
	{
		super(props);
  }

  public override function render():ReactElement
  {
    var desc = props.index == 0 ? 'Game starts' : 'Move #${props.index}';
    return jsx('<li>
      <a href="#" onClick=$jumpTo>$desc</a>
    </li>');
  }

  /**
   * Click event listener: dispatch a signal
   **/
  function jumpTo(_):Void
  {
    SquareActions.jumpTo.dispatch(props.index);
  }
}
