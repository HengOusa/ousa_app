import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ousa_app/utils/constants/colors.dart';
import 'package:ousa_app/utils/constants/size.dart';

// A widget for displaying an animatied loading indicator with optional text and action buttons.
class TAnimationLoaderWidget extends StatelessWidget {
  // Default constructor for the TAnimationLoader

  // Parameters:
  // - text : The text to be displayed below the animation.
  // -animation : The path to the Lottie animation file.
  // - showAction : Whether to show the action button below the text.
  // - actionText : The text to be displayed on the action buttons
  // - onActionPressed : Callback function to be executed when the action button is pressed.
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width *
                0.8, // Displayed Lottie animation
          ),
          const SizedBox(height: TSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: TColors.light,
                          ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
