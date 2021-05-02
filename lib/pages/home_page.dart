import 'package:flutter/material.dart';

import 'package:button_nav_expandable/widgets/button_nav_expandable_widget.dart';
import 'package:button_nav_expandable/widgets/listview_autores_widget.dart';
import 'package:button_nav_expandable/widgets/song_box_widget.dart';

import 'package:button_nav_expandable/utils/responsive.dart';

import 'package:button_nav_expandable/models/autor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Challenge'),
      // ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: responsive.dp(1)),
                  AutoresList(responsive: responsive),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: responsive.dp(2))
                        .copyWith(left: responsive.dp(1.5)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recently Played',
                        style: TextStyle(
                            fontSize: responsive.dp(1.6),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ...autores
                      .map((autor) => SongBox(
                            responsive: responsive,
                            autor: autor,
                          ))
                      .toList()
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNav(responsive: responsive),
            ),
          ],
        ),
      ),
    );
  }
}
