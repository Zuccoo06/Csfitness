import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseScreen extends StatelessWidget {
  final Map<String, List<String>> exerciseGroups = {
    'Chest': [
      'Bench Press',
      'Push-Ups',
      'Dumbbell Flyes',
    ],
    'Legs': [
      'Squats',
      'Lunges',
      'Deadlifts',
    ],
    'Back': [
      'Pull-Ups',
      'Lat Pulldowns',
      'Rows',
    ],
    'Shoulders': [
      'Overhead Press',
      'Lateral Raises',
      'Front Raises',
    ],
    'Biceps': [
      'Bicep Curls',
      'Hammer Curls',
      'Chin-Ups',
    ],
    'Triceps': [
      'Tricep Dips',
      'Skull Crushers',
      'Tricep Pushdowns',
    ],
  };

  final Map<String, String> exerciseVideos = {
    'Bench Press': 'https://www.youtube.com/shorts/0cXAp6WhSj4',
    'Push-Ups': 'https://www.youtube.com/shorts/ba8tr1NzwXU',
    'Dumbbell Flyes': 'https://www.youtube.com/shorts/vld1VNiQ6xo',
    'Squats': 'https://www.youtube.com/shorts/iZTxa8NJH2g',
    'Lunges': 'https://www.youtube.com/shorts/LCWWq3Lx2Sk',
    'Deadlifts': 'https://www.youtube.com/shorts/vfKwjT5-86k',
    'Pull-Ups': 'https://www.youtube.com/shorts/IZMKe61144w',
    'Lat Pulldowns': 'https://www.youtube.com/shorts/77bPLrsMwiQ',
    'Rows': 'https://www.youtube.com/shorts/Nqh7q3zDCoQ',
    'Overhead Press': 'https://www.youtube.com/shorts/jA0KaIkw8c8',
    'Lateral Raises': 'https://www.youtube.com/shorts/G-piLwLu0d4',
    'Front Raises': 'https://www.youtube.com/shorts/_6oXH8ZbB5M',
    'Bicep Curls': 'https://www.youtube.com/shorts/ckhfQgBfj6w',
    'Hammer Curls': 'https://www.youtube.com/shorts/0EWBnWyJV5U',
    'Chin-Ups': 'https://www.youtube.com/shorts/Oi3bW9nQmGI',
    'Tricep Dips': 'https://www.youtube.com/shorts/Rp0Qfp4GPho',
    'Skull Crushers': 'https://www.youtube.com/shorts/zR9gty7LUxE',
    'Tricep Pushdowns': 'https://www.youtube.com/shorts/Rc7-euA8FDI',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      body: ListView(
        children: exerciseGroups.entries.map((entry) {
          return _buildExerciseGroup(entry.key, entry.value);
        }).toList(),
      ),
    );
  }

  Widget _buildExerciseGroup(String muscleGroup, List<String> exercises) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            muscleGroup,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: exercises.map((exercise) {
            return ListTile(
              title: Text(exercise),
              onTap: () => _launchURL(exercise),
            );
          }).toList(),
        ),
      ],
    );
  }

  _launchURL(String exerciseName) async {
    String? url = exerciseVideos[exerciseName];
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
