class ExpertProfileEntity {
  final firstName;
  final lastName;
  final email;
  final address;
  final experence;
  final image;
  final idOfExpert;

  ExpertProfileEntity(
      {required this.idOfExpert,
      required this.image,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.address,
      required this.experence});
}
