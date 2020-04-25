import 'package:flutter/material.dart';
import 'package:flutter_app/flutter_planets_tutorial/model/planets.dart';
import 'package:flutter_app/flutter_planets_tutorial/ui/common/plannet_summary.dart';
import 'package:flutter_app/flutter_planets_tutorial/ui/common/separator.dart';

import '../text_style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  const DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return Container(
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
            margin: new EdgeInsets.only(top: 190.0),
            height: 110.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: <Color>[
                  new Color(0x00736AB7),
                  new Color(0xFF736AB7)
                ],
                stops: [0.0, 0.9],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
              ),
            ),
          );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return Container(
            child: ListView(
              padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
              children: <Widget>[
                PlanetSummary(planet,
                  horizontal: false,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_overviewTitle,
                        style: Style.headerTextStyle,),
                      Separator(),
                      Text(
                          planet.description, style: Style.commonTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(
                top: MediaQuery
                    .of(context)
                    .padding
                    .top),
            child: BackButton(color: Colors.white),
          );
  }
}
