import 'package:flutter/material.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';

class LevelStartView extends StatelessWidget {
  final List<CloudGenderModel> data;

  const LevelStartView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff434343),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * 0.6,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (
                context,
                index,
              ) {
                var collectionItem = data[index];
                var subItems = collectionItem.subItems;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subItems
                      .expand((subItem) =>
                          subItem.subSubItems.map((subSubItem) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                width: h * 0.5,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(subSubItem.levelImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      subSubItem.level,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Pushs: ${subSubItem.pushs}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }))
                      .toList(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
