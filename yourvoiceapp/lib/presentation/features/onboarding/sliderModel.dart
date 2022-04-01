import 'dart:ui';

class SliderModel{
  String title;
  String desc;
  String imageAssetPath;
  Color color;

  SliderModel({required this.title, required this.desc, required this.color, required this.imageAssetPath});


}

 List<SliderModel> slides =
[
  SliderModel(title: 'YourVoice', desc: 'Your Voice deserves to be heard.',
      color: const Color(0xFF6ED47C), imageAssetPath: 'assets/images/man.png'),
  SliderModel(title: 'YourVoice', desc: 'Let your vote represent your voice.',
    color: const Color(0xFFFF743C), imageAssetPath: 'assets/images/mother.png'),
  SliderModel(title: 'YourVoice', desc: 'Secure your future by choosing right.',
      color: const Color(0xFFFFC700), imageAssetPath: 'assets/images/freedom.png')
];

