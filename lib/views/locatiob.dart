class Location {
  Location({required this.country, required this.town, required this.image});
  String country, town, image;
}

List<Location> locations = [
  Location(
    town: 'Port Blair',
    country: 'Andaman & Nicobar',
    image:
        'https://dynamic.tourtravelworld.com/package-images/photo-big/dir_17/486726/202664.jpg',
  ),
  Location(
      town: 'Punjab',
      country: 'Chandigarh',
      image:
          'https://iptb.b-cdn.net/wp-content/uploads/2018/07/Golden-Temple-Punjab-1.jpg'),
  Location(
    town: 'Jaipur',
    country: 'Rajasthan',
    image: 'https://upload.wikimedia.org/wikipedia/commons/0/09/Thar_Khuri.jpg',
  ),
  Location(
    town: 'Thiruvananthapuram',
    country: 'Kerala',
    image:
        'https://dmgupcwbwy0wl.cloudfront.net/system/images/000/246/174/b6e6fbfe0a70425bfa209af67b1a1ac6/x1000gt/shutterstock_1154918653.jpg?1552906145',
  ),
  Location(
    town: 'Dehradun',
    country: 'Uttarakhand',
    image:
        'https://images.thrillophilia.com/image/upload/s--RZhmz_7S--/c_fill,f_auto,fl_strip_profile,h_775,q_auto,w_1600/v1/images/photos/000/082/491/original/1464188297_I2GZl5w7lL-1920x1080.jpg.jpg?1464188297',
  ),
  Location(
    town: 'Shimla',
    country: 'Himachal Pradesh',
    image: 'https://www.holidify.com/images/bgImages/MANALI.jpg',
  ),
  Location(
    town: 'Gandhinagar',
    country: 'Gujarat',
    image:
        'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/11/12/753361-statueofunity-reuters-110118.jpg',
  ),
];
