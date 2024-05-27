class ProfileModel {
  final int id; // You may assign an id if needed
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String? imagePath; // Store the path to the profile image

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'imagePath': imagePath,
    };
  }

  // Add a constructor to convert map to ProfileModel
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      address: map['address'],
      imagePath: map['imagePath'],
    );
  }
}
