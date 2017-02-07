package;

import react.ReactDOM;
import react.ReactMacro.jsx;
import view.Game;

class Main
{
	public static function main()
	{
		ReactDOM.render(jsx('<$Game/>'), js.Browser.document.getElementById('app'));
	}
}
