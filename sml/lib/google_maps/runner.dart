import 'package:flutter/material.dart';

import 'animate_camera.dart';
import 'map_click.dart';
import 'map_coordinates.dart';
import 'map_ui.dart';
import 'marker_icons.dart';
import 'move_camera.dart';
import 'padding.dart';
import 'page.dart';
import 'place_circle.dart';
import 'place_marker.dart';
import 'place_polygon.dart';
import 'place_polyline.dart';
import 'scrolling_map.dart';
import 'snapshot.dart';

final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
  MapUiPage(),
  MapCoordinatesPage(),
  MapClickPage(),
  AnimateCameraPage(),
  MoveCameraPage(),
  PlaceMarkerPage(),
  MarkerIconsPage(),
  ScrollingMapPage(),
  PlacePolylinePage(),
  PlacePolygonPage(),
  PlaceCirclePage(),
  PaddingPage(),
  SnapshotPage(),
];

class MapsDemo extends StatelessWidget {
  void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(page.title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoogleMaps examples')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: MapsDemo()));
}
