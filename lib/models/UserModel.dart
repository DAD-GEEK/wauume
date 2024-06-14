//mdoelo del usurio
class UserModel {
  String? name;
  String? lastname;
  String? email;
  String? password;
  String? phone;
  String? photo;
  String? uid;
  String? typeDocument;
  String? numberDocument;
  String? address;
  String? department;
  String? city;
  DateTime? birth;

  UserModel(
      {this.name,
      this.lastname,
      this.email,
      this.password,
      this.phone,
      this.photo,
      this.uid,
      this.typeDocument,
      this.numberDocument,
      this.address,
      this.department,
      this.city,
      this.birth}
  );

Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'phoneNumber': phone,
      'photo': photo,
      'uid': uid,
      'typeDocument': typeDocument,
      'numberDocument': numberDocument,
      'address': address,
      'department': department,
      'city': city,
      'birth': birth
    };
  }

}