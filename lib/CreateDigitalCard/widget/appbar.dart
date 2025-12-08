import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  final bool centerTitle;
  final IconData icon;
  final Color textColor;
  final Color appBarBackgroundColor;

  const Appbar({
    super.key,
    required this.title,
    required this.onPressed,
    this.centerTitle = false,
    this.icon = Icons.arrow_back_ios_new,
    this.textColor = Colors.black,
    this.appBarBackgroundColor = Colors.transparent,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          children: [
            // Back Button
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: Icon(
                  icon,
                  size: 18,
                  color: Colors.black,
                ),
                onPressed: onPressed,
              ),
            ),
            // Title
            if (centerTitle)
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
            // Placeholder to balance the row (only when centered)
            if (centerTitle) const SizedBox(width: 48),
          ],
        ),
      ),
    );
  }
}