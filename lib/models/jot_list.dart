class JotList {
  String id;
  String name;
  bool isDone;
  List<String> elements;

  JotList({this.id, this.name, this.elements, this.isDone});

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'elements' : elements,
      'isDone' : isDone
    };
  }

}