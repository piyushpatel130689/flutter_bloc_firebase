/// id : 1
/// name : "Buzz"
/// tagline : "A Real Bitter Experience."
/// first_brewed : "09/2007"
/// description : "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once."
/// image_url : "https://images.punkapi.com/v2/keg.png"
/// attenuation_level : 75

class BeerModel {
  int? _id;
  String? _name;
  String? _tagline;
  String? _firstBrewed;
  String? _description;
  String? _imageUrl;

  int? get id => _id;
  String? get name => _name;
  String? get tagline => _tagline;
  String? get firstBrewed => _firstBrewed;
  String? get description => _description;
  String? get imageUrl => _imageUrl;

  BeerModel({
      int? id, 
      String? name, 
      String? tagline, 
      String? firstBrewed, 
      String? description, 
      String? imageUrl}){
    _id = id;
    _name = name;
    _tagline = tagline;
    _firstBrewed = firstBrewed;
    _description = description;
    _imageUrl = imageUrl;
}

  BeerModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _name = json["name"];
    _tagline = json["tagline"];
    _firstBrewed = json["first_brewed"];
    _description = json["description"];
    _imageUrl = json["image_url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["tagline"] = _tagline;
    map["first_brewed"] = _firstBrewed;
    map["description"] = _description;
    map["image_url"] = _imageUrl;
    return map;
  }

}