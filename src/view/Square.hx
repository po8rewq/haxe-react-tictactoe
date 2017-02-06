package view;

import react.React;
import react.ReactComponent;
import react.ReactMacro.jsx;

import store.SquareActions;

typedef SquareProps = {
  var ident: Int;
  var value: String;
  // var onClick: Int->Void;
}

class Square extends ReactComponentOfProps<SquareProps>
{
  public function new(props:SquareProps)
  {
    super(props);
  }

  public override function render()
  {
    return jsx('
      <button className="square" onClick="$onClicked">
        ${props.value}
      </button>
    ');
  }

  function onClicked(evt:js.html.Event)
  {
    // props.onClick(props.ident);
    SquareActions.addItem.dispatch(props.ident);
  }

}
