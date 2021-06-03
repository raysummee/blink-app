import 'package:flutter/material.dart';

class GuideTexts extends StatelessWidget {
  const GuideTexts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(33, 16, 33, 16),
      child: Row(
        children: [
          Icon(Icons.qr_code_2, size: 40,),
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "To setup blink system"
                  ),
                  TextSpan(
                    text: "\n1. Download and run blink service on the host"
                  ),
                  TextSpan(
                    text: "\n2. A browser window should open automatically. If not navigate to 'localhost:5000'"
                  ),
                  TextSpan(
                    text: "\n3. Scan the qr code displayed on the browser window with this app"
                  ),
                ]
              )
            ),
          )
        ],
        
      ),
    );
  }
}