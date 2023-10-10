import 'package:flutter/material.dart';

import 'soar_quest.dart';

class ExerciseSubFields extends SQCompositeField {
  ExerciseSubFields(super.name, {required super.subfields});

  @override
  formField(docScreen) => ExerciseSubfieldsFormField(this, docScreen);
}

class ExerciseSubfieldsFormField extends SQCompositeFormField {
  ExerciseSubfieldsFormField(super.field, super.docScreen);

  @override
  Widget fieldBuilder(BuildContext context) {
    saveSerializedSubfields();
    return Row(
      children: [
        ...subFormFields
            .map((subfield) => Expanded(child: subfield.fieldBuilder(context)))
      ],
    );
  }

  @override
  Widget readOnlyBuilder(BuildContext context) => Row(
        children: subFormFields
            .map((subfield) => Row(
                  children: [
                    Text(subfield.field.name),
                    subfield.readOnlyBuilder(context),
                  ],
                ))
            .toList(),
      );
}

class ExerciseListField extends SQCompositeField {
  ExerciseListField(super.name, {required super.subfields});

  @override
  formField(docScreen) => ExercisListFormField(this, docScreen);
}

class ExercisListFormField extends SQCompositeFormField {
  ExercisListFormField(super.field, super.docScreen);

  @override
  Widget readOnlyBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          field.subfields[0].formField(docScreen).readOnlyBuilder(context),
          // Text('el sets we keda here'),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: field.subfields[1]
                .formField(docScreen)
                .readOnlyBuilder(context),
          ),
        ],
      );
}
