import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soundvibe/themes/theme_provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
// darker shadow on botton
            BoxShadow(
              color: isDarkMode ? Colors.black : Colors.grey.shade500,
              blurRadius: 15.r,
              offset: const Offset(4, 4),
            ),

// ligher shadow
            BoxShadow(
              color: isDarkMode ? Colors.grey.shade100 : Colors.white,
              blurRadius: 15.r,
              offset: const Offset(-4, -4),
            )
          ]),
      padding: EdgeInsets.all(12.r),
      child: child,
    );
  }
}
