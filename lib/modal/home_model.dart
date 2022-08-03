class HomeModel {
  String? id;
  String? author;
  int? width;
  int? hight;
  String? url;
  String? download_url;

  HomeModel(
      {this.id,
      this.author,
      this.width,
      this.hight,
      this.url,
      this.download_url});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        id: json['id'] as String,
        author: json['author'] as String,
        width: json['width'] as int,
        hight: json['height'] as int,
        url: json['url'] as String,
        download_url: json['download_url'] as String);
  }
}
