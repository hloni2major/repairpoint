import 'address.dart';
import 'job.dart';

class Client {
  String name;
  String email;
  String cell;
  late String avatar;
  late Address address;
  late final List<Job> jobs;

  // Constructor with optional named params
  Client(
      {required this.email,
      required this.name,
      required this.cell,
      avatar,
      jobs,
      address});
}
