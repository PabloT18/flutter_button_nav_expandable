import 'package:flutter/material.dart';

import 'package:button_nav_expandable/models/autor.dart';

import 'package:button_nav_expandable/utils/responsive.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key key,
    @required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  __BottomNavState createState() => __BottomNavState();
}

class __BottomNavState extends State<BottomNav> {
  double _height, _width;
  bool colapsed = true;
  Duration _duration;

  @override
  void initState() {
    super.initState();
    _height = this.widget.responsive.dp(7);
    _width = this.widget.responsive.dp(25);
    _duration = Duration(milliseconds: 500);
  }

  _handleVerticalUpdate(DragUpdateDetails onVerticalUpdate) {
    _duration = Duration(milliseconds: 100);
    setState(() {
      _height = _height - onVerticalUpdate.primaryDelta;
      colapsed = false;
    });
  }

  _handleVerticalEnd(DragEndDetails onVerticalEnd) {
    _duration = Duration(milliseconds: 500);

    setState(() {
      if (_height <= widget.responsive.dp(35)) {
        _height = widget.responsive.dp(7);
        _width = widget.responsive.dp(25);
      } else {
        _height = widget.responsive.dp(50);
        _width = widget.responsive.width;
      }
    });
  }

  _onColapse() {
    _duration = Duration(milliseconds: 500);
    setState(() {
      _height = widget.responsive.dp(50);
      _width = widget.responsive.width;
      colapsed = false;
    });
  }

  _onEndAnimation() {
    setState(() {
      if (_height == widget.responsive.dp(7))
        colapsed = true;
      else
        colapsed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isColapsing = (_height <= widget.responsive.dp(25) &&
            _height != widget.responsive.dp(50))
        ? false
        : true;
    return GestureDetector(
      onVerticalDragUpdate: _handleVerticalUpdate,
      onVerticalDragEnd: _handleVerticalEnd,
      child: AnimatedContainer(
        onEnd: _onEndAnimation,
        duration: _duration,
        height: _height,
        width: _width,
        margin: EdgeInsets.only(bottom: widget.responsive.dp(3)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xffAE52FF),
                  Color(0xff4C65F6),
                  Color(0xff4C65F6),
                  Color(0xff3981E9),
                  Color(0xffAE52FF),
                ])),
        child: colapsed
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (colapsed) Icon(Icons.transform),
                  InkWell(
                      onTap: _onColapse,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(autores[0].albumImagePath),
                        radius: widget.responsive.dp(2.8),
                      )),
                  if (colapsed)
                    CircleAvatar(
                      backgroundImage: AssetImage(autores[0].autorImagePath),
                      radius: widget.responsive.dp(1.8),
                    )
                ],
              )
            : LayoutBuilder(
                builder: (_, constriants) => SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: constriants.maxHeight * 0.03),
                        width: widget.responsive.dp(5),
                        height: 2,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom: constriants.maxHeight * 0.05),
                        height: constriants.maxHeight * 0.3 <
                                widget.responsive.dp(5.6)
                            ? widget.responsive.dp(5.6)
                            : constriants.maxHeight * 0.3,
                        width: constriants.maxHeight * 0.3 <
                                widget.responsive.dp(5.6)
                            ? widget.responsive.dp(5.6)
                            : constriants.maxHeight * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(autores[0].albumImagePath),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: -5,
                              offset: Offset(0, constriants.maxHeight * 0.035),
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        autores[0].name,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: constriants.maxHeight * 0.03,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Song name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: constriants.maxHeight * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      if (isColapsing)
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: constriants.maxHeight * 0.1),
                          height: constriants.maxHeight * 0.1,
                          width: 3,
                          color: Colors.white,
                        ),
                      if (isColapsing)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.autorenew,
                              color: Colors.white,
                              size: constriants.maxHeight * 0.08,
                            ),
                            Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: constriants.maxHeight * 0.08,
                            ),
                            Icon(
                              Icons.adjust,
                              color: Colors.white,
                              size: constriants.maxHeight * 0.08,
                            ),
                          ],
                        ),
                      SizedBox(height: constriants.maxWidth * 0.1),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
