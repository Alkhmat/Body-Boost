import 'package:flutter/material.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';

class SelectChoiceView extends StatelessWidget {
  final List<CloudGenderModel> data;

  const SelectChoiceView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SizedBox(
          height: h * 0.3,
          width: w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              var collectionItem = data[index];
              var subItems = collectionItem.subItems;

              return Row(
                children: subItems.map((subItem) {
                  return Container(
                    width: w * 0.3,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(subItem.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        subItem.choise,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
