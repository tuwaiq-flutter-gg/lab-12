import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  const buttons({super.key, required this.buttonCaption, this.pageOff});
  final String buttonCaption;final  pageOff;//pageTo;

  @override
  Widget build(BuildContext context) {
    var backcolorMain;
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(350, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
          backgroundColor: backcolorMain,
        ),
        onPressed: () {
          // if (buttonCaption =="sing in"|| buttonCaption=="sign Up"){
         // Get.to(()=>("pageOff"));
          // Get.off(()=>  homeMenue());
          //productDetails(product: items[0],),);}
          //  else if (buttonCaption=="sign Up"){

          // Get.off(()=> const homeMenue());
          // };
          // };
        },
       // child: InkWell(
          child: Text(buttonCaption),)
          // // onTap: () {
          // //   Navigator.pop(context, true);
          // },
        // ),
    );
  }
}
