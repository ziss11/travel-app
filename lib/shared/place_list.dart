class Place {
  String img;
  String name;
  String location;
  double rating;
  List photos;

  Place({
    required this.img,
    required this.name,
    required this.location,
    required this.rating,
    required this.photos,
  });
}

var listPlace = [
  Place(
    img: 'images/place1.png',
    name: "Lake Ciliwung",
    location: "Tangerang",
    rating: 4.8,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place2.png',
    name: "White Houses",
    location: "Spain",
    rating: 4.7,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place3.png',
    name: "Hill Heyo",
    location: "Monaco",
    rating: 4.8,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place4.png',
    name: "Menarra",
    location: "Japan",
    rating: 5.0,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place5.png',
    name: "Payung Teduh",
    location: "Singapore",
    rating: 4.8,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
];

var newPlaceList = [
  Place(
    img: 'images/place6.png',
    name: "Danau Beratan",
    location: "Singajara",
    rating: 4.5,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place7.png',
    name: "Sydney Opera",
    location: "Australia",
    rating: 4.7,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
  Place(
    img: 'images/place8.png',
    name: "Roma",
    location: "Italy",
    rating: 4.8,
    photos: [
      'images/photos1.png',
      'images/photos2.png',
      'images/photos3.png',
    ],
  ),
];
