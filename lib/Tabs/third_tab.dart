import 'package:absensi_siswa/screens/signin_screen.dart';
import 'package:absensi_siswa/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:absensi_siswa/util/box.dart';
import 'package:absensi_siswa/util/button.dart';
import 'package:provider/provider.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
              Text( ' tap to change theme',
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(width: 100, height: 50,
                  child: MyBox(
                    color: Theme.of(context).colorScheme.primary,
                    child: MyButton1(
                      color: Theme.of(context).colorScheme.secondary,
                      onTap: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Column(children: <Widget>[
                      ElevatedButton(
                          child: Text("Logout"),
                          onPressed: () {
                            {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            };
                          }),
                    ])),
              ],
            )));
  }
}
