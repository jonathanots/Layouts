import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/app/modules/adoption/adoption_controller.dart';
import 'package:layouts/app/modules/adoption/pages/details_pet_page.dart';

import 'models/animal_model.dart';

class AdoptionPage extends StatefulWidget {
  final String title;
  const AdoptionPage({Key key, this.title = "Adoption"}) : super(key: key);

  @override
  _AdoptionPageState createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  final controller = Modular.get<AdoptionController>();

  int _selected = 0;

  _onSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  _textField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: TextField(
          cursorColor: Color(0xff2f6162),
          decoration: InputDecoration(
            labelText: "Search pet to adopt",
            labelStyle: TextStyle(
              color: Color(0xffa6a6a6),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xffdcdcdc),
            ),
            suffixIcon: Icon(
              Icons.compare_arrows,
              color: Color(0xffdcdcdc),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
    );
  }

  _listCategory() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 2, right: 2),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (_, index) => SizedBox(
            width: 30,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                _onSelected(index);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: _selected != null && _selected == index
                            ? Color(0xff2f6162)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        FontAwesomeIcons.cat,
                        color: _selected != null && _selected == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    "Cats",
                    style: TextStyle(
                      color: Color(0xff101010),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _listAnimals() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Observer(
          builder: (_) => ListView.builder(
            padding: EdgeInsets.only(left: 2, right: 2),
            scrollDirection: Axis.vertical,
            itemCount: controller.listAnimals.length,
            itemBuilder: (_, index) {
              List<AnimalModel> models = controller.listAnimals;
              return GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed(
                  //    '/details/$index/${models[index].name}/${models[index].breed}/${models[index].gender}/${models[index].age}/${models[index].distance}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DetailsPetPage(
                                index: index,
                                name: models[index].name,
                                breed: models[index].breed,
                                gender: models[index].gender,
                                age: models[index].age,
                                distance: models[index].distance,
                              )));
                },
                child: Container(
                  height: 270,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 140,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${models[index].name}",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    models[index].gender
                                        ? FontAwesomeIcons.venus
                                        : FontAwesomeIcons.marsStroke,
                                    color: Color(0xffa6a6a6),
                                  ),
                                ],
                              ),
                              Text(
                                "${models[index].breed}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff101010),
                                ),
                              ),
                              Text(
                                "${models[index].age} years old",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffdcdcdc),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.map,
                                    color: Color(0xff2f6162),
                                  ),
                                  Text(
                                    "Distance: ${models[index].distance} km",
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey[100],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 48,
                        left: 10,
                        child: Container(
                          height: 210,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: Hero(
                            tag: "hero_$index",
                            child: Image.asset(
                              "assets/images/adoption/panda.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xff101010),
                    ),
                  ),
                  title: Text(
                    "Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffdcdcdc),
                    ),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mapPin,
                        color: Color(0xff2f6162),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "Kyiv, ",
                          style: TextStyle(
                            color: Color(0xff101010),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Ukraine",
                          style: TextStyle(
                            color: Color(0xff101010),
                          ),
                        ),
                      ]))
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xff101010),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                      color: Color(0xfff6f6f6),
                    ),
                    child: Column(
                      children: <Widget>[
                        _textField(),
                        _listCategory(),
                        _listAnimals(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
