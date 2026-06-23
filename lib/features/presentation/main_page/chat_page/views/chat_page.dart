import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../widgets/message_tile_widget.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.kPatternBackground, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: context.height * 0.020,
              end: context.height * 0.020,
              top: context.height * 0.060,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryButton(
                  title: context.kAppLocalizations.chatmessage,
                  padding: EdgeInsetsDirectional.only(
                    bottom: context.height * 0.025,
                  ),
                  style: context.kTextTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.kChangeTheme.hintColor,
                  ),
                ),
                MessageTileWidget(
                  title: 'Mohamed Ibrahim',
                  subTitle: 'Your Order Just Arrived',
                  time: '22:00',
                  onTap: () => context.router.push(ChatDetailsRoute()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
