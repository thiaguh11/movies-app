import 'package:flutter/material.dart';

class LoadingMoreButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isLoading;

  const LoadingMoreButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        textColor: Colors.white,
        child: !isLoading
            ? const Text("Load More")
            : const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}