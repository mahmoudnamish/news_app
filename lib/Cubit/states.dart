abstract class CounterStates {}

class InitialeStates extends CounterStates{}
class StatechangeBottonnav extends CounterStates{}


class NewGetLoding extends CounterStates{}
class NewGetBuisnesSuccess extends CounterStates{}
class NewGetBuisnesErrorSuccess extends CounterStates{

  final  String Error ;

  NewGetBuisnesErrorSuccess(this.Error);
}


class NewGetLodingSports extends CounterStates{}
class NewGetSportsSuccess extends CounterStates{}
class NewGetSportsErrorSuccess extends CounterStates{

  final  String Error ;

  NewGetSportsErrorSuccess(this.Error);
}

class NewGetLodingScience extends CounterStates{}
class NewGetScienceSuccess extends CounterStates{}
class NewGetScienceErrorSuccess extends CounterStates{

  final  String Error ;

  NewGetScienceErrorSuccess(this.Error);
}


class NewGetLodingSearch extends CounterStates{}
class NewGetSearchSuccess extends CounterStates{}
class NewGetSearchErrorSuccess extends CounterStates{

  final  String Error ;

  NewGetSearchErrorSuccess(this.Error);
}

