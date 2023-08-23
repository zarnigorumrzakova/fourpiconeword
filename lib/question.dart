class Question{
  final List<String> images;
  final String word;
  final List<String> letters;

  Question({required this.images,required this.word,required this.letters});
}

List<Question> questions = [
  Question(images:[
    'assets/images/sleep1.png',
    'assets/images/sleep2.png',
    'assets/images/sleep3.png',
    'assets/images/sleep4.png',
    ],
word: 'sleep',
letters: ['w','s','a','t','l','e','d','p','k','f','b','e'],
),
  Question(images: [
    'assets/images/photo1.png',
    'assets/images/photo2.png',
    'assets/images/photo3.png',
    'assets/images/photo4.png',
  ],
  word: 'photo',
  letters: ['p','w','k','o','t','n','g','h','l','d','j','o'],
  ),
  Question(images: [
    'assets/images/studio1.png',
    'assets/images/studio2.png',
    'assets/images/studio3.png',
    'assets/images/studio4.png',
  ],
    word: 'studio',
    letters: ['i','o','l','p','d','y','u','f','t','h','k','s'],
  ),
  Question(images:[
    'assets/images/window1.png',
    'assets/images/window2.png',
    'assets/images/window3.png',
    'assets/images/window4.png',
  ],
    word: 'window',
    letters: ['k','f','t','w','l','o','w','c','i','d','g','n'],
  ),
  Question(images: [
    'assets/images/phone1.png',
    'assets/images/phone2.png',
    'assets/images/phone3.png',
    'assets/images/phone4.png',
  ],
  word: 'phone',
    letters: ['l','n','j','p','n','f','k','h','e','s','o','a'],
  ),
  Question(images:[
    'assets/images/world1.png',
    'assets/images/world2.png',
    'assets/images/world3.png',
    'assets/images/world4.png',
  ],
    word: 'world',
    letters: ['m','a','o','t','k','w','d','g','l','x','h','r'],
  ),
  Question(images:[
    'assets/images/mouse1.png',
    'assets/images/mouse2.png',
    'assets/images/mouse3.png',
    'assets/images/mouse4.png',
  ],
  word: 'mouse',
    letters: ['l','m','o','p','n','j','s','u','g','r','a','e'],
  ),
  Question(images: [
    'assets/images/zebra1.png',
    'assets/images/zebra2.png',
    'assets/images/zebra3.png',
    'assets/images/zebra4.png',
  ],
  word: 'zebra',
    letters: ['e','h','l','b','a','t','m','z','h','e','r','y'],
  ),
];

