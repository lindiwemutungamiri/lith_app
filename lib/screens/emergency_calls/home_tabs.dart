import 'package:flutter/material.dart';
import 'package:lith_app/screens/emergency_calls/Components/emergency_contacts_data.dart';
import 'package:lith_app/screens/emergency_calls/Components/personal_emergency_contacts.dart';

class HomeScreenTabs extends StatefulWidget {
  const HomeScreenTabs({Key? key}) : super(key: key);

  @override
  _HomeScreenTabsState createState() => _HomeScreenTabsState();
}

class _HomeScreenTabsState extends State<HomeScreenTabs>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 2,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        elevation: 1,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(text: "Emergency Contacts"),
            Tab(text: "Personal Contacts")
          ],
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: <Widget>[ContactsData(), PersonalEmergencyContacts()]),
    );
  }
}
