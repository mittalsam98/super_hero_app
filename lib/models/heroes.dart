class Heroes {
  String name;
  String imagePath;
  String publisher;
  Heroes({this.name, this.imagePath, this.publisher});
}

List<Heroes> heroes = [
  Heroes(
      name: 'Iron Man',
      imagePath: 'assets/images/ironman.png',
      publisher: 'Marvel Comics'),
  Heroes(
      name: 'Captain America',
      imagePath: 'assets/images/captain.png',
      publisher: 'Marvel Comics'),
  Heroes(
      name: 'Batman',
      imagePath: 'assets/images/batman.png',
      publisher: 'DC Comics'),
  Heroes(
      name: 'Spider Man',
      imagePath: 'assets/images/spider.png',
      publisher: 'Marvel Comics'),
  Heroes(
      name: 'Superman',
      imagePath: 'assets/images/superman.png',
      publisher: 'DC Comics'),
  Heroes(
      name: 'Hulk',
      imagePath: 'assets/images/hulk.png',
      publisher: 'Marvel Comics'),
];
