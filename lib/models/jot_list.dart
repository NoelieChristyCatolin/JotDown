class JotList {
  String name;
  List<String> elements;

  JotList({this.name, this.elements});

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'elements' : elements
    };
  }

}