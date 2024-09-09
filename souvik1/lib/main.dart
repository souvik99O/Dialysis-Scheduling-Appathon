import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Dialysis ',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: Colors.teal),
      ),
      home: home_screen(),
    );
  }
}

class home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Doctor Dialysis '),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Dashboard'),
              Tab(text: 'Schedule'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dashboard_screen(),
            schedule_screen(),
          ],
        ),
      ),
    );
  }
}

class dashboard_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Machine Availability',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          machine_card(
            available_machines_count: 8,
            total_machines_count: 10,
            available_machines: [
              {'name': 'Machine 1', 'location': 'Room 101'},
              {'name': 'Machine 2', 'location': 'Room 102'},
              {'name': 'Machine 3', 'location': 'Room 103'},
              {'name': 'Machine 4', 'location': 'Room 104'},
              {'name': 'Machine 5', 'location': 'Room 105'},
              {'name': 'Machine 6', 'location': 'Room 106'},
              {'name': 'Machine 7', 'location': 'Room 107'},
              {'name': 'Machine 8', 'location': 'Room 108'},
            ],
          ),
        ],
      ),
    );
  }
}

class machine_card extends StatelessWidget {
  final int available_machines_count;
  final int total_machines_count;
  final List<Map<String, String>> available_machines;

  machine_card({
    required this.available_machines_count,
    required this.total_machines_count,
    required this.available_machines,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Total Machines: $total_machines_count',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Free Machines: $available_machines_count',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            ...available_machines.map((machine) => Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Icon(Icons.local_hospital, color: Colors.teal),
                  SizedBox(width: 8),
                  Text('${machine['name']} - ${machine['location']}'),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class schedule_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Schedule or Cancel a Machine',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: <Widget>[
                schedule_card(
                  machine_name: 'Machine 1',
                  location: 'Room 101',
                ),
                schedule_card(
                  machine_name: 'Machine 2',
                  location: 'Room 102',
                ),
                schedule_card(
                  machine_name: 'Machine 3',
                  location: 'Room 103',
                ),
                schedule_card(
                  machine_name: 'Machine 4',
                  location: 'Room 104',
                ),
                schedule_card(
                  machine_name: 'Machine 5',
                  location: 'Room 105',
                ),
                schedule_card(
                  machine_name: 'Machine 6',
                  location: 'Room 106',
                ),
                schedule_card(
                  machine_name: 'Machine 7',
                  location: 'Room 107',
                ),
                schedule_card(
                  machine_name: 'Machine 8',
                  location: 'Room 108',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class schedule_card extends StatelessWidget {
  final String machine_name;
  final String location;

  schedule_card({
    required this.machine_name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              machine_name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 10),
            Text('Location: $location'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.schedule),
                  label: Text('Schedule'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cancel),
                  label: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
