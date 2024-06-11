import 'dart:developer';
import 'package:body_boost/view/start/start_pages/select_choise_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_boost/firebase/models/cloud_gender_model.dart';
import 'package:body_boost/firebase/firestore/service/cloud_firesore_service.dart';
import 'package:body_boost/view/start/start_cubit/start_click.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeStart extends StatefulWidget {
  const HomeStart({super.key});

  @override
  State<HomeStart> createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff434343),
      body: FutureBuilder<List<CloudGenderModel>>(
        future: _firestoreService.getCollectionWithSubcollections(
            'start', 'select_choise'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.5,
              ),
            );
          } else if (snapshot.hasError) {
            log('Ошибка Firestore: ${snapshot.error}');
            return Center(
              child: Text('Ошибка: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Нет данных'),
            );
          }

          var data = snapshot.data!;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.6,
                width: w,
                child: BlocBuilder<StartClickCubit, int>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var collectionItem = data[index];
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              context.read<StartClickCubit>().tapIndex(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 260),
                              height: state == index ? h * 0.6 : h * 0.56,
                              width: state == index ? w * 0.44 : w * 0.46,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(collectionItem.image),
                                  fit: BoxFit.cover,
                                  onError: (exception, stackTrace) {
                                    log('Ошибка загрузки изображения: $exception');
                                  },
                                ),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      collectionItem.type,
                                      style: GoogleFonts.robotoSlab(
                                        textStyle: TextStyle(
                                          color: state == index
                                              ? Colors.black87
                                              : Colors.transparent,
                                          fontSize: state == index
                                              ? h * 0.04
                                              : h * 0.02,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectChoiceView(data: data),
                    ),
                  );
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.robotoSlab(
                    textStyle:
                        TextStyle(color: Colors.black, fontSize: h * 0.04),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
