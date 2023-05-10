class Location {
  Location({required this.country, required this.town, required this.image});
  String country, town, image;
}

List<Location> locations = [
  Location(
    town: 'Agra',
    country: 'India',
    image: 'assets/images/destination1.jpg',
  ),
  Location(
    town: 'Rio de Janerio',
    country: 'Brazil',
    image: 'assets/images/destination2.jpg',
  ),
  Location(
      town: 'Sydney',
      country: 'Australia',
      image: 'assets/images/destination3.jpg'),
  Location(
    town: 'New York',
    country: 'United States',
    image: 'assets/images/destination4.jpg',
  ),
  Location(
    town: 'Toronto',
    country: 'Canada',
    image: 'assets/images/destination5.jpg',
  ),
  Location(
    town: 'Giza ',
    country: 'Egypt',
    image: 'assets/images/destination6.jpg',
  ),
  Location(
    town: 'Fujiyoshida',
    country: 'Japan',
    image: 'assets/images/destination7.jpg',
  ),
  Location(
      town: 'Mexico City',
      country: 'Mexico',
      image: 'assets/images/destination8.jpg'),
  Location(
    town: 'Shanghai',
    country: 'China',
    image: 'assets/images/destination9.jpg',
  ),
  Location(
    town: 'Paris',
    country: 'France',
    image: 'assets/images/destination10.jpg',
  )
];
