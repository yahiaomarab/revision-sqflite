import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../data/models/dp-model.dart';

navigateBack(context, widget) {
  Navigator.pop(
    context,
    PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      duration: const Duration(seconds: 2),
    ),
  );
}

navTo(context, widget) {
  Navigator.push(
    context,
    PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      duration: const Duration(seconds: 1),
    ),
  );
}

Widget dividedLine(context) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.25),
    height: 1,
    width: double.infinity,
    color: Colors.white.withOpacity(0.5),
  );
}

textField({
  double? formWidth,
  required String text,
  required String hintText,
  IconData? prefixIcon,
  Widget? suffixIcon,
  Function(String)? onSubmit,
  bool isShown = false,
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? onTap,
  VoidCallback? onSuffixPressed,
  Function(String)? onChanged,
  required String? Function(String?)? validate,
}) {
  return SizedBox(
    width: formWidth,
    height: 90,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'lightFont', color: Colors.white),
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 2, color: Colors.white),
            ),
            label: Text(hintText, maxLines: 1, overflow: TextOverflow.ellipsis),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon,
            hintText: hintText,
          ),
          obscureText: isShown,
          keyboardType: type,
          validator: validate,
          controller: controller,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmit,
        ),
      ],
    ),
  );
}

PreferredSizeWidget appbar({
  VoidCallback? onPressed,
  required Widget iconLead,
  VoidCallback? onButtonPress,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: onPressed,
      icon: iconLead,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: onButtonPress,
        ),
      ),
    ],
  );
}

Widget buildSearchItem(context, model) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.pink,
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.title}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(Icons.timelapse),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${model.startTime}',
                      style: Theme.of(context).textTheme.titleSmall),
                  const Text(' - '),
                  Text('${model.endTime}',
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${model.note}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Container(
          width: 0.5,
          height: 60,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'new',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ],
    ),
  );
}
Widget button({
  required String label,
  required GestureTapCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 45,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ),
  );
}
Widget itemContact(FriendContact model)
{
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange,
    ),
    height: 130,
    width: double.infinity,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            Text(
                '${model.name}'
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            Text('${model.phoneNumber}'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 20,
            ),
            Text('${model.address}'),
          ],
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}