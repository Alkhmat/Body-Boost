import 'package:flutter/material.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';

class SelectChoiceView extends StatelessWidget {
  final List<CloudGenderModel> data;

  const SelectChoiceView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var item = data[index];
          return Column(
            children: item.subItems.map((subItem) {
              return Container(
                child: Column(
                  children: [
                    Text(subItem.choise),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.network(
                        subItem.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
