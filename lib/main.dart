import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:servi_connect/Features/tasks/domain/entites/taskEntity.dart';
import 'package:servi_connect/constants.dart';
import 'package:servi_connect/core/utils/app_router.dart';
import 'package:servi_connect/core/utils/functions/getRole.dart';
import 'package:servi_connect/core/utils/simple_bloc_observer.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/functions/setup_service_locator.dart';

String? role;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskEntityAdapter());

  setupServiceLocator();
  await Hive.openBox<TaskEntity>(kTasksBox);

  Bloc.observer = SimpleBlocObserver();
  role = await getRole();

  runApp(const PowerOfTask());
}

class PowerOfTask extends StatelessWidget {
  const PowerOfTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
