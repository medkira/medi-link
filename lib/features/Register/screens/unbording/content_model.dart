class UnbordingContent {
  String image;
  String title;
  String discruption;

  UnbordingContent(
      {required this.image, required this.title, required this.discruption});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    image: 'assets/images/Doctor2.jpg',
    title: "Online appointment",
    discruption:
        "Select the specialist and make an  \n appointment through our app!",
  ),
  UnbordingContent(
      image: 'assets/images/Doctor1.jpg',
      title: "Huge Specialist",
      discruption: "Lots of specialist what you \n need find in one place"),
  UnbordingContent(
      image: 'assets/images/Doctor3.jpg',
      title: "Online Doctor Support",
      discruption:
          "Get online support from aywhere \n by text / audio video call")
];
