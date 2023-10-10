// ignore_for_file: lines_longer_than_80_chars

import 'main.dart';

Future<void> initStaticExercises() async {
  for (final menuItem in exercisesStaticArray) {
    final newDoc = exercises.newDoc(source: menuItem, id: menuItem['Name']);
    await exercises.saveDoc(newDoc);
  }
}

final exercisesStaticArray = [
  {
    'Image': 'https://i.ibb.co/VTqSvfD/photo-2023-10-05-23-01-15.jpg',
    'Name': 'Triceps Extension',
    'Instructions':
        '1- Attach handle, supinate grip on cable machine.\n2- Stand upright with core engaged.\n3- Pull handle down to thighs, elbows close.\n4- Release handle, control movement, repeat.'
  },
  {
    'Image': 'https://i.ibb.co/kGJkfgF/photo-2023-10-06-00-43-35.jpg',
    'Name': 'Lat Pulldown',
    'Instructions':
        '1- Sit with thighs secured under pads.\n2- Grasp bar wider than shoulder-width.\n3- Pull bar down to chest, elbows bent.\n4- Slowly return bar to starting position.'
  },
  {
    'Image': 'https://i.ibb.co/mSf171f/photo-2023-10-06-00-44-31.jpg',
    'Name': 'Cable Crossover',
    'Instructions':
        '1- Adjust cable machine to chest height.\n2- Attach handles to both sides.\n3- Stand between cables, arms extended.\n4- Cross cables in front of body.\n5- Squeeze chest, maintain control.\n6- Return to starting position, repeat.'
  },
  {
    'Image': 'https://i.ibb.co/Qf1fj2Y/photo-2023-10-06-00-45-58.jpg',
    'Name': 'Seated Calf Raise',
    'Instructions':
        '1- Sit at calf raise machine, adjust weight.\n2- Place toes on platform, heels off.\n3- Lift heels, flex calf muscles.\n4- Lower heels below platform, stretch.\n5- Repeat controlled movements for reps.'
  },
  {
    'Image': 'https://i.ibb.co/GMw1Y9m/photo-2023-10-06-00-46-37.jpg',
    'Name': 'Crunch',
    'Instructions':
        '1- Adjust machine settings for comfort.\n2- Sit or lie down with knees secured.\n3- Place hands behind head or on chest.\n4- Contract abs, curl torso toward knees.\n5- Lower back down, control movement.\n6- Repeat for desired reps.'
  }
];
