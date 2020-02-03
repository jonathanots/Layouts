class AnimalModel {
  final String name;
  final bool gender;
  final String breed;
  final int age;
  final double distance;

  AnimalModel({this.name, this.gender, this.breed, this.age, this.distance});

  factory AnimalModel.fromJson(Map<String, dynamic> json) {
    return AnimalModel(
        //field: json[''],
        );
  }

  Map<String, dynamic> toJson(AnimalModel model) {
    Map<String, dynamic> json = Map<String, dynamic>();

    return json;
  }
}
