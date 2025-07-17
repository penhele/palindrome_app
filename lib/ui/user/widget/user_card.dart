import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/dark_mode_helper.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
    required this.isSelected,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String avatar;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = SDarkModeHelper.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.only(left: SSizes.paddingCard),
      decoration: BoxDecoration(
        color: isDark ? SColors.darkContainer : SColors.lightContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: SColors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              avatar,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: SSizes.spaceBtwSection),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$firstName $lastName',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: SSizes.spaceBtwMenu),
              Text(email, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),

          const Spacer(),

          Container(
            width: 20,
            height: 100,
            decoration: BoxDecoration(
              color: isSelected
                  ? isDark
                        ? SColors.softRedDark
                        : SColors.softRed
                  : isDark
                  ? SColors.softBlueDark
                  : SColors.softBlue,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
