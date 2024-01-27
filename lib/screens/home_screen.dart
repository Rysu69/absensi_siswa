
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
    Map<DateTime, List<dynamic>> events = {};

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

     _showEventDescription(day, events[day] ?? []);
  }

   void _addEventToCalendar() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Event'),
        content: TextField(
          onChanged: (event) {
            setState(() {
              events[today] = [event];
            });
          },
          decoration: InputDecoration(labelText: 'Event Description'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showEventDescription(DateTime date, List<dynamic> eventsList) {
    if (eventsList.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Events on ${date.toString().split(" ")[0]}'),
          content: Container(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: eventsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('- ${eventsList[index]}'),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
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
              onDaySelected:
                _onDaySelected,
                eventLoader: (day) => events[day] ?? [],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addEventToCalendar,
            child: Text('Add Event'),
          ),
        ],
      ),
    );
  }
  }
