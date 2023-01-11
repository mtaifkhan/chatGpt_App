import 'package:flutter/material.dart';

import '../../../global/common/common.dart';

class HomeButtonWidget extends StatelessWidget {
  final String textData;
  final IconData iconData;
  final VoidCallback? onTap;
  const HomeButtonWidget(
      {super.key, required this.textData, required this.iconData, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 95.0,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: dartColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: glowBoxShadow,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 40,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              textData,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
