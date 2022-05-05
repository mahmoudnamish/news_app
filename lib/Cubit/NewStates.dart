abstract class NewStates {}


class initialeStates extends NewStates{}

class ChangetheModeApp extends NewStates{

  final bool isDark;

  ChangetheModeApp(this.isDark);
}
