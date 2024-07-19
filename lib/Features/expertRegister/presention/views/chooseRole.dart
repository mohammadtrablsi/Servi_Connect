import 'package:flutter/material.dart';

import 'widgets/chooseRoleBody.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChooseRoleBody(),
    );
  }
}