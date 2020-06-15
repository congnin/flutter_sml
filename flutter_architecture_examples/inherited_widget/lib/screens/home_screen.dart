import 'package:flutter/material.dart';
import 'package:inherited_widget/localization.dart';
import 'package:inherited_widget/state_container.dart';
import 'package:inherited_widget/widgets/extra_actions_button.dart';
import 'package:inherited_widget/widgets/filter_button.dart';
import 'package:inherited_widget/widgets/stats_counter.dart';
import 'package:inherited_widget/widgets/todo_list.dart';

import 'package:todos_app_core/todos_app_core.dart';

import '../models.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super(key: ArchSampleKeys.homeScreen);

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  AppTab activeTab = AppTab.todos;

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    final state = container.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(InheritedWidgetLocalizations.of(context).appTitle),
        actions: [
          FilterButton(
            isActive: activeTab == AppTab.todos,
            activeFilter: state.activeFilter,
            onSelected: container.updateFilter,
          ),
          ExtraActionsButton(
            allComplete: state.allComplete,
            hasCompletedTodos: state.hasCompletedTodos,
            onSelected: (action) {
              if (action == ExtraAction.toggleAllComplete) {
                container.toggleAll();
              } else if (action == ExtraAction.clearCompleted) {
                container.clearCompleted();
              }
            },
          )
        ],
      ),
      body: activeTab == AppTab.todos ? TodoList() : StatsCounter(),
      floatingActionButton: FloatingActionButton(
        key: ArchSampleKeys.addTodoFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
        },
        child: Icon(Icons.add),
        tooltip: ArchSampleLocalizations.of(context).addTodo,
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: ArchSampleKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) {
          _updateTab(AppTab.values[index]);
        },
        items: AppTab.values.map((tab) {
          return BottomNavigationBarItem(
            icon: Icon(
              tab == AppTab.todos ? Icons.list : Icons.show_chart,
              key: tab == AppTab.stats
                  ? ArchSampleKeys.statsTab
                  : ArchSampleKeys.todoTab,
            ),
            title: Text(
              tab == AppTab.stats
                  ? ArchSampleLocalizations.of(context).stats
                  : ArchSampleLocalizations.of(context).todos,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _updateTab(AppTab tab) {
    setState(() {
      activeTab = tab;
    });
  }
}
