import 'package:flutter/material.dart';

import 'package:button_nav_expandable/utils/responsive.dart';

import 'package:button_nav_expandable/models/autor.dart';

class AutoresList extends StatelessWidget {
  const AutoresList({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive.dp(14),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: autores.length,
        itemBuilder: (context, index) => Container(
          width: 100,
          margin: EdgeInsets.symmetric(
              vertical: responsive.dp(0.5), horizontal: 8.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  autores[index].autorImagePath,
                  height: responsive.dp(11),
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Text(
                  autores[index].name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: responsive.dp(1.6), color: Colors.black38),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
