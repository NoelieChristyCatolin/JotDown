class JotList {
  String id;
  String name;
  List<String> elements;

  JotList({this.id, this.name, this.elements});

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'elements' : elements
    };
  }

}