import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/app/modules/inside_nature/inside_nature_controller.dart';
import 'package:layouts/app/modules/inside_nature/models/category_model.dart';
import 'package:layouts/app/modules/inside_nature/models/nature_model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<InsideNatureController>();
  _filter(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: <Widget>[
              SizedBox(
                height: 50,
                width: size.width * 0.7,
                child: TextField(
                  onSubmitted: (value) {
                    controller.addFilter(value);
                  },
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    hintStyle: TextStyle(
                      color: Color(0xffa6a6a6),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Icon(
                  FontAwesomeIcons.filter,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Observer(builder: (_) {
            if (controller.listFilters.isNotEmpty)
              return SizedBox(
                height: 30,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listFilters.length,
                  separatorBuilder: (_, index) => SizedBox(
                    width: 5,
                  ),
                  itemBuilder: (_, index) {
                    var category = controller.listFilters[index];
                    return _itenCategory(category, () {
                      controller.removeFromFilter(category);
                    });
                  },
                ),
              );
            else
              return Container();
          })
        ],
      ),
    );
  }

  _itenCategory(CategoryModel category, Function remove) {
    return GestureDetector(
      onTap: remove,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Text(
                "${category.name}",
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(
                Icons.close,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _listMostPopular(Size size) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(
        left: 30,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Most Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Observer(builder: (_) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => SizedBox(
                  width: 15,
                ),
                itemCount: controller.listNature.length,
                itemBuilder: (_, index) {
                  List<NatureModel> models = controller.listNature;
                  if (models.isNotEmpty) {
                    return Observer(
                      builder: (_) {
                        return Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade200,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/inside_nature/flower2.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          icon: Icon(
                                            models[index].like
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          onPressed: () => controller
                                              .changeLike(index: index),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${models[index].name}",
                                style: TextStyle(
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$${models[index].price}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              );
            }),
          )
        ],
      ),
    );
  }

  _listBestPrice(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Best Price",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "View All",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Observer(builder: (_) {
            var tam = 100 * controller.listNature.length;
            return Container(
              height: double.parse(tam.toString()),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (_, index) => SizedBox(
                  height: 15,
                ),
                itemCount: controller.listNature.length,
                itemBuilder: (_, index) {
                  List<NatureModel> models = controller.listNature;
                  if (models.isNotEmpty) {
                    return Observer(
                      builder: (_) {
                        return Container(
                          height: 100,
                          width: size.width,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/inside_nature/flower2.png",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "${models[index].name}",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "\$${models[index].price}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 0,
                                child: Container(
                                  height: 30,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200],
                                  ),
                                  child: Text(
                                    "-${models[index].discount}\%",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            );
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF8F6F7),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.white10,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: BackButton(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  _filter(size),
                  _listMostPopular(size),
                  SizedBox(
                    height: 25,
                  ),
                  _listBestPrice(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
