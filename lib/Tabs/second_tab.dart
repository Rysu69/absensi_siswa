import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        // backgroundColor: Color.fromARGB(255, 244, 232, 193),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                 const SizedBox(
                  height: 100,
                ),
                Container(
                  child:      Icon(Icons.account_circle_outlined,color: Colors.white,size: 90,),
                      ),
                   const SizedBox(
                  height: 100,
                ),
                Container(
                  child: 
                  Text("Username"),
                ),
                      ]
                      ),
                      
                    ),
                  );
}}