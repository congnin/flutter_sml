import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../models.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool isActive;

  FilterButton({this.onSelected, this.activeFilter, this.isActive, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.bodyText1;
    final activeStyle = theme.textTheme.bodyText1.copyWith(
      color: theme.accentColor,
    );
    final button = _Button(
      onSelected: onSelected,
      activeFilter: activeFilter,
      activeStyle: activeStyle,
      defaultStyle: defaultStyle,
    );
    return AnimatedOpacity(
      opacity: isActive ? 1.0 : 0.0,
      duration: Duration(milliseconds: 150),
      child: isActive ? button : IgnorePointer(child: button),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
    @required this.onSelected,
    @required this.activeFilter,
    @required this.activeStyle,
    @required this.defaultStyle,
  }) : super(key: key);

  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final TextStyle activeStyle;
  final TextStyle defaultStyle;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<VisibilityFilter>(
      key: ArchSampleKeys.filterButton,
      tooltip: ArchSampleLocalizations.of(context).filterTodos,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<VisibilityFilter>>[
          PopupMenuItem<VisibilityFilter>(
            key: ArchSampleKeys.allFilter,
            value: VisibilityFilter.all,
            child: Text(
              ArchSampleLocalizations.of(context).showAll,
              style: activeFilter == VisibilityFilter.all
                  ? activeStyle
                  : defaultStyle,
            ),
          ),
          PopupMenuItem<VisibilityFilter>(
            key: ArchSampleKeys.activeFilter,
            value: VisibilityFilter.active,
            child: Text(
              ArchSampleLocalizations.of(context).showActive,
              style: activeFilter == VisibilityFilter.active
                  ? activeStyle
                  : defaultStyle,
            ),
          ),
          PopupMenuItem<VisibilityFilter>(
            key: ArchSampleKeys.completedFilter,
            value: VisibilityFilter.completed,
            child: Text(
              ArchSampleLocalizations.of(context).showCompleted,
              style: activeFilter == VisibilityFilter.completed
                  ? activeStyle
                  : defaultStyle,
            ),
          ),
        ];
      },
      icon: Icon(Icons.filter_list),
    );
  }
}
