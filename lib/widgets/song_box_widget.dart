import 'package:flutter/material.dart';

import 'package:button_nav_expandable/models/autor.dart';

import 'package:button_nav_expandable/utils/responsive.dart';

class SongBox extends StatelessWidget {
  const SongBox({
    Key key,
    @required this.responsive,
    @required this.autor,
  }) : super(key: key);

  final Responsive responsive;
  final Autor autor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.dp(35),
      width: responsive.dp(35),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage(autor.albumImagePath)),
          borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(horizontal: responsive.dp(3))
          .copyWith(bottom: responsive.dp(1)),
      child: Column(
        children: <Widget>[
          SizedBox(height: responsive.dp(5)),
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
              height: responsive.dp(10),
              width: responsive.dp(10),
              child: ClipOval(
                child: Image.asset(
                  autor.autorImagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: responsive.dp(1)),
          Text(
            autor.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: responsive.dp(2),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: responsive.dp(3)),
          Text(
            "Song name",
            style: TextStyle(
                color: Colors.white,
                fontSize: responsive.dp(3),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
