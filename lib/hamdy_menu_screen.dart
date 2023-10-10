import 'dart:async';

import 'package:flutter/material.dart';

import 'soar_quest.dart';

class HamdyMenuScreen extends MenuScreen {
  HamdyMenuScreen(super.title, {required List<CollectionScreen> super.screens});

  @override
  Widget screenBody() => ListView(
        children: [
          const Text('Measure'),
          for (final CollectionScreen screen
              in screens as List<CollectionScreen>)
            ListTile(
              onTap: () => unawaited(navigateTo(screen)),
              leading: Text(screen.title),
              // if (screen.collection.docs.isNotEmpty)
              subtitle: screen.collection.docs.isNotEmpty
                  ? Text(screen.collection.docs[0].toString())
                  : null,
            )
        ],
      );
}
