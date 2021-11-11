class Student{
  // final int? userId;
  // final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;


  Student({this.email,this.firstName,this.lastName});


  factory Student.fromJson(final json){
    return Student(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name']

      );

  }
}