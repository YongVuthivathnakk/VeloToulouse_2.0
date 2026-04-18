import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:velotoulouse/data/repository/user/user_repository.dart';
import 'package:velotoulouse/service/subscription/subscription_service.dart';
import 'package:velotoulouse/ui/screens/pass/view_model/pass_view_model.dart';
import 'package:velotoulouse/ui/screens/pass/widgets/pass_content.dart';
import 'package:velotoulouse/ui/states/user_state.dart';

class PassScreen extends StatelessWidget {
  const PassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PassViewModel(
        userRepository: context.read<UserRepository>(),
        userState: context.read<UserState>(), passServcie: context.read<SubscriptionService>(),
      ),
      child: PassContent(),
    );
  }
}
