import 'package:flutter/material.dart';


class CustomWidget{
  void hidProgress({required BuildContext context}){
    return Navigator.pop(context);

  }

  Future showProgress(
      {
        required BuildContext context,


      }){
    return showDialog(context: context,
        barrierDismissible: false,


        builder: (BuildContext context){
          return WillPopScope(
            onWillPop: () async => false,

            child: SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                radius: 100,

                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
          );

        });


  }


}
