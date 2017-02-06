package;

import react.ReactDOM;
import react.ReactMacro.jsx;
import js.Browser;
import view.Game;

class Main
{
	public static function main()
	{
		ReactDOM.render(jsx('<$Game/>'), Browser.document.getElementById('app'));
	}
}
