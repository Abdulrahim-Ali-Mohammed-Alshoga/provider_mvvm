class MovieModel {
  String? image;
  num? id;
  String? title;
  num? rating;
  String? productionData;
  String? description;

  MovieModel({
    required this.image,
    required this.id,
    required this.title,
    required this.rating,
    required this.productionData,
    this.description,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    image = json['poster_path'];
    id = json['id'];
    title = json['title'];
    rating = json['vote_average'];
    productionData = json['release_date'];
    description = json['overview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poster_path'] = image;
    data['id'] = id;
    data['title'] = title;
    data['vote_average'] = rating;
    data['release_date'] = productionData;
    data['overview'] = description;
    return data;
  }
}
