class ProfileEntity {
  final message;
  final firstName;
  final lastName;
  final email;
  final address;
  final experence;
  final image;
  final phone;

  ProfileEntity(
      {required this.phone,this.image,
      required this.message,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.experence});
}
