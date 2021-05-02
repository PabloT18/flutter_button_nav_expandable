class Autor {
  String name;
  String autorImagePath;
  String albumImagePath;

  Autor({this.name, this.autorImagePath, this.albumImagePath});
}

final List<Autor> autores = [
  Autor(
      name: 'A\$ap Rocky',
      autorImagePath: 'assets/person1.png',
      albumImagePath: 'assets/img1.png'),
  Autor(
      name: 'EDX',
      autorImagePath: 'assets/person2.png',
      albumImagePath: 'assets/img2.png'),
  Autor(
      name: 'Autor 3 Autor 3',
      autorImagePath: 'assets/person3.png',
      albumImagePath: 'assets/img3.png'),
  Autor(
      name: 'Autor4',
      autorImagePath: 'assets/person4.png',
      albumImagePath: 'assets/img4.png'),
];
