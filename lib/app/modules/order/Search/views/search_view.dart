import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

import '../views/card_widget.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCardWidget(
              Nama_mobil: 'Title1',
              transmisi: 'Subtitle',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
            CustomCardWidget(
              Nama_mobil: 'Title2',
              transmisi: 'Subtitle',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
            CustomCardWidget(
              Nama_mobil: 'Title3',
              transmisi: 'Manual',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
            CustomCardWidget(
              Nama_mobil: 'Title3',
              transmisi: 'Manual',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
            CustomCardWidget(
              Nama_mobil: 'Title3',
              transmisi: 'Manual',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
            CustomCardWidget(
              Nama_mobil: 'Title3',
              transmisi: 'Manual',
              seat: 4,
              imageUrl:
                  'https://www.pngplay.com/wp-content/uploads/13/Cars-Lightning-Mcqueen-Transparent-File.png',
            ),
          ],
        ),
      ),
    );
  }
}
