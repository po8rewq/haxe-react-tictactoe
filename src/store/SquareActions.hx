package store;

import msignal.Signal.Signal1;

class SquareActions
{
  public static var addItem:Signal1<Int> = new Signal1();
  public static var jumpTo:Signal1<Int> = new Signal1();
}
