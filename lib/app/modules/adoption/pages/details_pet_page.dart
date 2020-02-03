import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsPetPage extends StatefulWidget {
  final int index;
  final String name;
  final bool gender;
  final String breed;
  final int age;
  final double distance;

  const DetailsPetPage(
      {Key key,
      this.index,
      this.name,
      this.gender,
      this.breed,
      this.age,
      this.distance})
      : super(key: key);

  @override
  _DetailsPetPageState createState() => _DetailsPetPageState();
}

class _DetailsPetPageState extends State<DetailsPetPage> {
  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: size.height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Color(0xffc9d2d7),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Hero(
                            tag: "hero_${widget.index}",
                            child: Image.asset(
                              "assets/images/adoption/panda.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: ListTile(
                            leading: IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                onPressed: () => Navigator.pop(context)),
                            trailing: Icon(
                              Icons.file_download,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text(
                                "Maya Berkovskaya",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "Owner",
                                style: TextStyle(
                                  color: Color(0xffa6a6a6),
                                  fontSize: 13,
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    "May 25, 2019",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xffa6a6a6),
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Text(
                                "My job requires moving to another country. I don't have the oportunity to take the cat with me."
                                " I am looking for good people who will shelter my ${widget.name}.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xfff6f6f6),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Material(
                                elevation: 3,
                                borderRadius: BorderRadius.circular(20),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Container(
                                    height: 55,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Color(0xff2f6162),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Material(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          color: Color(0xff2f6162),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Adoption",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  elevation: 3,
                  child: Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              widget.gender
                                  ? FontAwesomeIcons.venus
                                  : FontAwesomeIcons.marsStroke,
                              color: Color(0xffa6a6a6),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${widget.breed}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff101010),
                              ),
                            ),
                            Text(
                              "${widget.age} years old",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff101010),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapPin,
                              color: Color(0xff2f6162),
                            ),
                            Text(
                              "Distance: ${widget.distance} km",
                              style: TextStyle(
                                color: Color(0xffa6a6a6),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
