import 'package:flutter/material.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 15),
                color: Colors.black.withOpacity(.1),
                blurRadius: 15,
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset('assets/img/underConstruction.png',
              fit: BoxFit.cover),
        ));
  }
}
