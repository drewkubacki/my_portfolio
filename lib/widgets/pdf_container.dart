import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

//Fix this widget to be responsive, currently the height is static on line 13
class pdfContainer extends StatelessWidget {
  const pdfContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 25.0),
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
           boxShadow: [
            BoxShadow(
              offset: const Offset(5, 15),
              color: Colors.black.withOpacity(.1),
              blurRadius: 15,
            )
          ],
        ),
        child: AspectRatio(
          //borderRadius: BorderRadius.circular(25.0),
            aspectRatio: 9/11,
            child: Image.asset(
              "assets/img/Andrew_Kubacki_Resume-1.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              //fit: BoxFit.fill,
              ),
          ),
          ),
    );
  }
}
