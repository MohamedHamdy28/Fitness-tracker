import 'soar_quest.dart';

final neck = MiniAppCollection(
    id: 'neck', fields: [SQDoubleField('Neck'), SQTimestampField('Time')]);
final shoulders = MiniAppCollection(
    id: 'shoulders',
    fields: [SQDoubleField('Shoulders'), SQTimestampField('Time')]);
final chest = MiniAppCollection(
    id: 'chest', fields: [SQDoubleField('Chest'), SQTimestampField('Time')]);
final biceps = MiniAppCollection(
    id: 'biceps', fields: [SQDoubleField('Biceps'), SQTimestampField('Time')]);
final forearms = MiniAppCollection(
    id: 'forearms',
    fields: [SQDoubleField('Forearms'), SQTimestampField('Time')]);
final abs = MiniAppCollection(
    id: 'abs', fields: [SQDoubleField('Abs'), SQTimestampField('Time')]);
final waist = MiniAppCollection(
    id: 'waist', fields: [SQDoubleField('Waist'), SQTimestampField('Time')]);
final hips = MiniAppCollection(
    id: 'hips', fields: [SQDoubleField('Hips'), SQTimestampField('Time')]);
final thighs = MiniAppCollection(
    id: 'thighs', fields: [SQDoubleField('Thighs'), SQTimestampField('Time')]);
final calfs = MiniAppCollection(
    id: 'calfs', fields: [SQDoubleField('calfs'), SQTimestampField('Time')]);

Future<void> wasInMain() async {
  await neck.loadCollection();
  await shoulders.loadCollection();
  await chest.loadCollection();
  await biceps.loadCollection();
  await forearms.loadCollection();
  await abs.loadCollection();
  await waist.loadCollection();
  await hips.loadCollection();
  await thighs.loadCollection();
  await calfs.loadCollection();
}
