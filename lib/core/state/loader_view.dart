import 'package:flutter/material.dart';

class LoaderView extends StatefulWidget {
  final bool loading;
  final Widget child;
  final bool overlay;
  final Color? backgroundColor;

  const LoaderView({
    super.key,
    required this.loading,
    required this.child,
    this.overlay = true,
    this.backgroundColor,
  });

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: AbsorbPointer(
        absorbing: widget.loading,
        child: getView(context),
      ),
    );
  }

  Widget getView(BuildContext context) {
    if (widget.overlay) {
      return Stack(
        children: [
          widget.child,
          if (widget.loading)
            SafeArea(child: _buildAnimatedLinearProgressIndicator())
        ],
      );
    } else {
      return widget.loading
          ? SafeArea(child: _buildAnimatedLinearProgressIndicator())
          : widget.child;
    }
  }

  Widget _buildAnimatedLinearProgressIndicator() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _controller.value,
          minHeight: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          ),
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
