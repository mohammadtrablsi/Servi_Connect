import 'package:go_router/go_router.dart';
import 'package:servi_connect/Features/Auth/presentation/views/login.dart';
import 'package:servi_connect/Features/chat/presention/views/chat.dart';
import 'package:servi_connect/Features/chat/presention/views/usersChatsForExpert.dart';
import 'package:servi_connect/Features/expertProfile/presention/views/expertProfile.dart';
import 'package:servi_connect/Features/search/presention/views/search.dart';

import '../../Features/Auth/presentation/views/register.dart';
import '../../Features/expertRegister/presention/views/chooseRole.dart';
import '../../Features/expertRegister/presention/views/enterDataOfExpert.dart';
import '../../Features/home/presention/views/widgets/BottomNav.dart';
import '../../Features/tasks/presention/views/tasks.dart';
import '../../Features/tasks/presention/views/updateTask.dart';

abstract class AppRouter {
  static const kTasksView = '/tasks';
  static const kUpdateTaskView = '/updateTask';
  static const kRegisterRoute = '/register';
  static const kLoginRoute = '/login';
  static const kChooseRoleRoute = '/chooseRole';
  static const kBottomNavRoute = '/bottomNav';
  static const kEnterDataOfExpertRoute = '/enterDataOfExpert';
  static const kExpertProfileRoute = '/expertProfile';
  static const kChatRoute = '/chat';
  static const kSearchRoute = '/search';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const UsersChatsForExpert(),
      ),
      GoRoute(
        path: kRegisterRoute,
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kChooseRoleRoute,
        builder: (context, state) => const ChooseRole(),
      ),
      GoRoute(
        path: kBottomNavRoute,
        builder: (context, state) => BottomNav(),
      ),
      GoRoute(
        path: kEnterDataOfExpertRoute,
        builder: (context, state) {
          final String firstName = state.queryParams['firstName']!;
          final String lastName = state.queryParams['lastName']!;
          final String email = state.queryParams['email']!;
          final String password = state.queryParams['password']!;
          final String repeatPassword = state.queryParams['repeatPassword']!;
          final String phone = state.queryParams['phone']!;
          final image = state.queryParams['image'];
          return EnterDataOfExpert(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            repeatPassword: repeatPassword,
            phone: phone,
            image: image,
          );
        },
      ),
      GoRoute(
          path: kExpertProfileRoute,
          builder: (context, state) {
            final name = state.queryParams['name'];
            final exprience = state.queryParams['exprience'];
            final address = state.queryParams['address'];
            final email = state.queryParams['email'];
            final phone = state.queryParams['phone'];
            return ExpertProfile(
                name: name!,
                exprience: exprience!,
                address: address!,
                email: email!,
                phone: phone!);
          }),
      GoRoute(
        path: kChatRoute,
        builder: (context, state) => const Chat(),
      ),
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => const Search(),
      ),
      
      // GoRoute(
      //   path: kTasksView,
      //   builder: (context, state) => const Tasks(),
      // ),
      // GoRoute(
      //   path: kUpdateTaskView,
      //   builder: (context, state) {
      //     final title = state.queryParams['title'];
      //     final description = state.queryParams['description'];
      //     final initDate = state.queryParams['initDate'];
      //     final initTime = state.queryParams['initTime'];
      //     final index = state.queryParams['index'];
      //     final categoryId = state.queryParams['categoryId'];
      //     final id = state.queryParams['id'];

      //     return UpdateTask(
      //       title: title!,
      //       description: description!,
      //       initDate: initDate!,
      //       initTime: initTime!,
      //       index: int.parse(index!),
      //       categoryId: int.parse(categoryId!),
      //       id: int.parse(id!),
      //     );
      // },
      // ),
    ],
  );
}
