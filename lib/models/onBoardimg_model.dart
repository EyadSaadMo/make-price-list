class OnBoardingModel{
  final String image;
  final String text;
  final String body;
  OnBoardingModel({required this.image,required this.text,required this.body});
}
List<OnBoardingModel> model =
[
  OnBoardingModel(image: 'assets/images/eyad.HEIC', text: 'Make Price List', body: 'A simple and free solution to maintain list for product sales and marketing'),
  OnBoardingModel(image: 'assets/images/heart.png', text: 'Works Offlne', body: 'Make your list offline, no matter if internet is available or not'),
  OnBoardingModel(image: 'assets/images/eyad.HEIC', text: 'Built-in Scanner', body: 'Use Barcode Scanner while making list helps in search items quickly '),
];