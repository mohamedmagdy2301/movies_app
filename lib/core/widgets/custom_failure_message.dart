import 'package:flutter/cupertino.dart';

class CustomFailureMessage extends StatelessWidget {
  const CustomFailureMessage(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.xmark_circle,
            size: 100,
            color: Color.fromARGB(169, 76, 76, 76),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            errorMessage,
            // style: StyleManager.textStyleMedium18.copyWith(
            //   color: const Color.fromARGB(186, 141, 141, 141),
            // ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
