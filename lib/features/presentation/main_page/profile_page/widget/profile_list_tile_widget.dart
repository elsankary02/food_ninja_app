import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/constant/app_images.dart';
import '../../../../../core/utils/extension/extension.dart';
import '../../../../data/providers/auth/get/get_user_provider.dart';

class ProfileListTileWidget extends ConsumerStatefulWidget {
  const ProfileListTileWidget({super.key});

  @override
  ConsumerState<ProfileListTileWidget> createState() =>
      _ProfileListTileWidgetState();
}

class _ProfileListTileWidgetState extends ConsumerState<ProfileListTileWidget> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(getUserProvider.notifier).getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(getUserProvider.notifier).userModel;
    ref.watch(getUserProvider);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(context.height * 0.150),
        child: notifier?.avatarUrl != null
            ? CachedNetworkImage(
                imageUrl: notifier!.avatarUrl!,
                height: context.height * 0.060,
                width: context.height * 0.060,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Image.asset(
                  AppImages.kMintDark,
                  height: context.height * 0.060,
                  width: context.height * 0.060,
                  fit: BoxFit.cover,
                ),
              )
            : Image.asset(AppImages.kMintDark),
      ),
      title: Text(
        notifier?.name ?? "",
        style: context.kTextTheme.titleLarge!.copyWith(
          color: context.kChangeTheme.hintColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        notifier?.username ?? "",
        style: context.kTextTheme.titleMedium!.copyWith(
          color: AppColors.kGrey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
