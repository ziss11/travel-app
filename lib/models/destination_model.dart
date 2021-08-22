import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String location;
  final String imageUrl;
  final double rate;
  final int price;
  final double pajak;

  DestinationModel({
    required this.id,
    this.name = '',
    this.location = '',
    this.imageUrl = '',
    this.rate = 0,
    this.price = 0,
    this.pajak = 0,
  });

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      name: json['name'].toString(),
      location: json['location'].toString(),
      imageUrl: json['imageUrl'].toString(),
      rate: json['rate'].toDouble(),
      price: json['price'],
      pajak: json['pajak'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'imageUrl': imageUrl,
      'rate': rate,
      'price': price,
      'pajak': pajak,
    };
  }

  @override
  List<Object?> get props => [id, name, location, imageUrl, rate, price, pajak];
}
