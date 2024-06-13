import 'package:carousel_slider/carousel_slider.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h * 0.6,
            width: w,
            child: CarouselSlider.builder(
              itemCount: data.length,
              itemBuilder: (context, index, realIndex) {
                var collectionItem = data[index];
                var subItems = collectionItem.subItems;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: subItems.map((subItem) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: h * 0.5,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(subItem.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: FittedBox(
                                child: Text(
                                  subItem.choice,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              options: CarouselOptions(
                height: h * 0.6,
                viewportFraction: 0.85,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
