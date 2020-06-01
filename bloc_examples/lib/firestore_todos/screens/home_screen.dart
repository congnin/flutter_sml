import 'package:bloc_examples/firestore_todos/blocs/authentication/bloc.dart';
import 'package:bloc_examples/firestore_todos/blocs/blocs.dart';
import 'package:bloc_examples/firestore_todos/models/models.dart';
import 'package:bloc_examples/firestore_todos/utils.dart';
import 'package:bloc_examples/firestore_todos/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Utils.getNameFromEmail(name)),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),
              ExtraActions(),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(),
                  );
                },
              ),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addTodo');
            },
            child: Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}
