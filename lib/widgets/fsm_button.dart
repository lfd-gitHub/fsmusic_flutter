import 'package:flutter/material.dart';
import 'package:fsmusic_flutter/widgets/fsm_text.dart';

class FBtnPrimary extends StatelessWidget {
  final String title;
  final bool isProgressing;
  final void Function()? onTap;
  const FBtnPrimary({
    Key? key,
    required this.onTap,
    required this.title,
    this.isProgressing = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.disabled)
                ? Theme.of(context).primaryColorLight //
                : Theme.of(context).primaryColor;
          }),
        ),
        child: isProgressing
            ? const SizedBox(
                width: 26,
                height: 26,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : FText(title, color: Colors.white),
      ),
    );
  }
}
