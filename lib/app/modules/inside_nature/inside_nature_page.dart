import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/app/modules/inside_nature/pages/home_page.dart';

class InsideNaturePage extends StatefulWidget {
  final String title;
  const InsideNaturePage({Key key, this.title = "InsideNature"})
      : super(key: key);

  @override
  _InsideNaturePageState createState() => _InsideNaturePageState();
}

class _InsideNaturePageState extends State<InsideNaturePage> {
  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEDE4E9),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                FontAwesomeIcons.leaf,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "Inside",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " Nature",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: size.width * 0.6,
                                    child: Text(
                                      "Create a place of wildlife at home and immerse yourself in peace and quiet.",
                                      softWrap: true,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Image.asset(
                                  "assets/images/inside_nature/flower1.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 80,
                          width: 80,
                          child: FlatButton(
                            onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage())),
                            color: Colors.white,
                            splashColor: Colors.pink.shade50,
                            highlightColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.pink.shade50),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(FontAwesomeIcons.arrowRight),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
