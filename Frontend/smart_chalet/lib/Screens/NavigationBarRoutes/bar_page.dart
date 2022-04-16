import 'package:flutter/material.dart';

import '../../Widget/title_row.dart';

class BarPage extends StatelessWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 214, 225, 255),
          title: const TitleStack(),
        ),
        body: const Center(
          child: Text('BAR'),
        ));
  }
}
