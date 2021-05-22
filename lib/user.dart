class User {
  int id;
  String firstName;
  String lastName;
  String pinCode;
  String number;

  User(this.id, this.firstName,this.lastName,this.pinCode,this.number);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'pinCode': pinCode,
      'number': number,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    pinCode = map['pinCode'];
    number = map['number'];

  }
}


