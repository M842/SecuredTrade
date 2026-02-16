import 'package:flutter/material.dart';
import 'package:securedtrade/config/path_config.dart';

class SnackbarHelper {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 2),
  }) {
    final overlay = Overlay.of(context);
    if (overlay == null) return;

    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _TopSnackBarWidget(
        message: message,
        backgroundColor: backgroundColor,
        onDismissed: () => entry.remove(),
      ),
    );

    overlay.insert(entry);

    Future.delayed(duration, () {
      if (entry.mounted) entry.remove();
    });
  }
}

class _TopSnackBarWidget extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final VoidCallback onDismissed;

  const _TopSnackBarWidget({
    required this.message,
    required this.backgroundColor,
    required this.onDismissed,
  });

  @override
  State<_TopSnackBarWidget> createState() => _TopSnackBarWidgetState();
}

class _TopSnackBarWidgetState extends State<_TopSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 4,
      left: 12,
      right: 12,
      child: SlideTransition(
        position: _slide,
        child: Material(
          borderRadius: BorderRadius.circular(12),
          color: widget.backgroundColor,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.backgroundColor == Colors.red ? "Error" : "Message",
                  style: getHibibiTextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  widget.message,
                  style: getHibibiTextStyle(
                    color: Colors.white,
                    fontSize: 15.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
