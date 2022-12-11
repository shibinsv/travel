class TravelMode {
  final String image;
  final String name;
   bool isSelected;

  TravelMode({required this.image, required this.name, this.isSelected = false});
}



class Place {
  final String image;
  final String name;
   bool isSaved;

  Place(this.image, this.name, this.isSaved);
}
