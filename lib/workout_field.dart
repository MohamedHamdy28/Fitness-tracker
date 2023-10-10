// ignore_for_file: prefer_const_literals_to_create_immutables,, must_call_super
// ignore_for_file: prefer_const_constructors, prefer_expression_function_bodies

import 'dart:convert';

import 'package:flutter/material.dart';

import 'soar_quest.dart';

final workoutList = Workout([]);

class Workout {
  Workout(this.exercises);
  factory Workout.fromJson(Map<String, dynamic> json) {
    final exerciseList = json['exercises'] as List<Map<String, dynamic>>;
    final exercises = exerciseList.map(Exercise.fromJson).toList();
    
    return Workout(exercises);
  }
  List<Exercise> exercises;

  Map<String, dynamic> toJson() {
    return {
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

class Exercise {
  Exercise(this.name, this.sets);
  factory Exercise.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final setList = json['sets'] as List<Map<String, dynamic>>;
    final sets = setList.map(ExerciseSet.fromJson).toList();

    return Exercise(name, sets);
  }
  String name;
  // SQRef exerciseRef;
  List<ExerciseSet> sets;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'sets': sets.map((set) => set.toJson()).toList(),
    };
  }
}

class ExerciseSet {
  ExerciseSet(this.weight, this.reps);
  factory ExerciseSet.fromJson(Map<String, dynamic> json) {
    final weight = json['weight'] as double;
    final reps = json['reps'] as double;

    return ExerciseSet(weight, reps);
  }
  double weight, reps;

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'reps': reps,
    };
  }
}

class WorkoutField extends SQField<Workout> {
  WorkoutField(super.name);

  @override
  Workout? parse(source) {
    if (source == null || source is! Map<String, dynamic>) return null;
    return Workout.fromJson(source);
  }

  @override
  serialize(Workout? value) {
    return jsonEncode(value);
  }

  @override
  formField(DocScreen docScreen) => WorkoutFormField(this, docScreen);
}

class WorkoutFormField extends SQFormField<Workout, WorkoutField> {
  const WorkoutFormField(super.field, super.docScreen);

  @override
  Widget fieldBuilder(BuildContext context) {
    final workout = getDocValue() ?? workoutList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final exercise in workout.exercises)
          exerciseColumn(exercise, workout),
        addExerciseButton(workout),
      ],
    );
  }

  Column exerciseColumn(Exercise exercise, Workout workout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exercise.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SET'),
            Text('KG'),
            Text('REPS'),
            Container(),
          ],
        ),
        for (int i = 0; i < exercise.sets.length; i += 1)
          setRowWidget(i, exercise, workout),
        addSetButton(exercise, workout),
        // Text(workout.toJson().toString()),
      ],
    );
  }

  Row setRowWidget(int i, Exercise exercise, Workout workout) {
    final exerciseSet = exercise.sets[i];
    final weightInput =
        TextEditingController(text: exercise.sets[i].weight.toString());
    final repsInput =
        TextEditingController(text: exercise.sets[i].reps.toString());
    bool isChecked = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text((i + 1).toString()),
        SizedBox(
          width: 30,
          child: TextField(
              controller: weightInput,
              onChanged: (value) {
                exerciseSet.weight = double.parse(value);
                setDocValue(workout);
              }),
        ),
        SizedBox(
          width: 30,
          child: TextField(
              controller: repsInput,
              onChanged: (value) {
                exerciseSet.reps = double.parse(value);
                setDocValue(workout);
              }),
        ),
        Checkbox(value: isChecked, onChanged: (newValue) {}),
      ],
    );
  }

  ElevatedButton addExerciseButton(Workout workout) {
    final TextEditingController nameInput = TextEditingController();
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: docScreen.context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add an Exercise'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Add a text field for exercise name input
                  TextField(
                    controller: nameInput, // Use the nameInput controller
                    decoration: InputDecoration(labelText: 'Exercise Name'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final exerciseName = nameInput.text;
                      if (exerciseName.isNotEmpty) {
                        final newExercise = Exercise(exerciseName, []);
                        workout.exercises.add(newExercise);
                        setDocValue(workout);
                      }
                      // Close the dialog
                      Navigator.of(context).pop();
                    },
                    child: Text('ADD'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text('ADD EXERCISE'),
    );
  }

  ElevatedButton addSetButton(Exercise exercise, Workout workout) {
    return ElevatedButton(
        onPressed: () {
          exercise.sets.add(ExerciseSet(0, 0));
          setDocValue(workout);
        },
        child: Text('ADD SET'));
  }
}
