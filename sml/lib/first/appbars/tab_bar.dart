import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

void main() {
  runApp(new MaterialApp(home: TabBar()));
}

class TabBar extends StatefulWidget {
  @override
  _tabBar createState() => _tabBar();
}

class _tabBar extends State<TabBar> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar'),
        bottom: prefix0.TabBar(
          controller: _tabController,
          tabs: [
            // Tab Bar
            Tab(
              icon: Icon(Icons.access_alarm),
              text: 'Alarm Icon',
            ),
            Tab(icon: Icon(Icons.account_balance_wallet)),
            Tab(
              text: 'Account Balance',
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text('Welcome to Alarm'),
          ),
          Center(
            child: Text('Welcome to Wallet'),
          ),
          Center(
            child: Text('Welcome to Account Balance check'),
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.deepOrangeAccent,
        child: prefix0.TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.access_alarm)),
            Tab(icon: Icon(Icons.add_alert)),
            Tab(icon: Icon(Icons.account_balance_wallet))
          ],
        ),
      ),
    );
  }
}
