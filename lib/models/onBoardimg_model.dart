class OnBoardingModel{
  final String image;
  final String text;
  final String body;
  OnBoardingModel({required this.image,required this.text,required this.body});
}
List<OnBoardingModel> model =
[
  OnBoardingModel(image: 'assets/images/checkListWomen3.jpg', text: 'Make Price List', body: 'A simple and free solution to maintain list for product sales and marketing'),
  OnBoardingModel(image: 'assets/images/checkListWomen1.jpg', text: 'Works Offline', body: 'Make your list offline, no matter if internet is available or not'),
  OnBoardingModel(image: 'assets/images/checkListWomen2.jpg', text: 'Built-in Scanner', body: 'Use Barcode Scanner while making list helps in search items quickly '),
];