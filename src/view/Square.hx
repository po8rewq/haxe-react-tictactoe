package view;

import react.ReactComponent;
import react.ReactMacro.jsx;

import store.SquareActions;

typedef SquareProps = {
  var ident: Int;
  var value: String;
}

class Square extends ReactComponentOfProps<SquareProps>
{
  public function new(props:SquareProps):Void
  {
    super(props);
  }

  public override function render():ReactElement
  {
    return jsx('
      <button className="square" onClick="$onClicked">
        ${props.value}
      </button>
    ');
  }

  /**
   * Click event listener: dispatch a signal
   **/
  function onClicked(evt:js.html.Event):Void
  {
    SquareActions.addItem.dispatch(props.ident);
  }

}
