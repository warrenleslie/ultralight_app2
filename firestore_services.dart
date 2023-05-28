class Names{         
  final String name; 
  final int length;
  
  Names(this.name, this.length);    // assign values to these properties 

  Names.fromMap(Map<String, dynamic> map)     // from.Map() to check to all the elements of the ListView builder
      : assert(map['name'] != null),
        assert(map['length'] != null),
            name = map['length'],
            length = map['name'];
  
  @override
  String toString()  => "Record<$name:$length>";  // IF values are retrieved print from backend
}