import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oru_phones/models/list_model.dart';
import 'package:oru_phones/repositories/list_api.dart';
import 'package:oru_phones/utills.dart/colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final _data = ref.watch(userDataProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: deviceWidth,
              height: 150,
              color: const Color.fromARGB(255, 3, 29, 49),
              child: Column(
                children: [
                  Container(
                      height: 100,
                      child: Row(
                        children: [
                          //  Drawer(),
                          Text('Oru phones'),
                          Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'India',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: kSecondaryColor,
                                size: 40,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications_none_rounded,
                                    color: kSecondaryColor,
                                    size: 40,
                                  ))
                            ],
                          )
                        ],
                      )),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: TextField(
                        textAlign: TextAlign.justify,
                        cursorHeight: 25,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            focusColor: kSecondaryColor,
                            fillColor: kSecondaryColor,
                            filled: true,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search with make and model..',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: kSecondaryColor),
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              color: kSecondaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Buy Top Brands',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  )
                ]),
              ),
            ),
            _data.when(
              data: (_data) {
                return Column(
                  children: [
                    ..._data.map((e) => ListView.builder(
                        shrinkWrap: true,
                        itemCount: _data.length,
                        itemBuilder: (BuildContext context, int index) {
                          //// print(_data[index]);
                          print(_data.length);

                          return Container(
                            height: 75,
                            color: Colors.white,
                            child: Center(
                                //child: Text(),
                                ),
                          );
                        })),
                  ],
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
