
import 'package:absensi_siswa/screens/profile_page.dart';
import 'package:absensi_siswa/screens/signin_screen.dart';
import 'package:absensi_siswa/util/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late DateTime today;

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
  }


  void goToProfilePage() {
    Navigator.pop(context);

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
        ),
      );
  }

  void signOut() {
    Navigator.pop(context);

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
        ),
      );
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("absensi"),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
    body: _buildContent(),
    );
  }

   Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Memilih hari " + today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: (day, focusedDay) {
                _onDaySelected(day, focusedDay);
              },
            ),
          ),
        ],
      ),
    );
  }
}
