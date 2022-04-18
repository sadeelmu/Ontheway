import 'package:beltareeq/core/constants/color_constants.dart';
import 'package:beltareeq/core/screens/home_page/home_page_bloc.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_text.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  HomePageBloc bloc = HomePageBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color_0xfff5f1e3,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 350,
            title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
                    text: "Good morning, ",
                    children: [
                      TextSpan(
                        text: bloc.name,
                        style: TextStyle(color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              CustomText(
                title: "Where are you going?",
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ]),
            backgroundColor: ColorConstants.color_0xfff5f1e3,
          )),
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(
                          18,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(decoration: InputDecoration(hintText: "Where to", border: InputBorder.none)),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  title: "History -7th Circle, Amman",
                                  style: TextStyle(
                                      color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                CustomText(
                                  title: "Home",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: CustomText(
                                          title: "History -To - Al-Shaymaa As-Saadeyah St., Amman",
                                          style: TextStyle(
                                              color: ColorConstants.color_0xff003B8E, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomText(
                                  title: "Psut",
                                  style: TextStyle(
                                      color: ColorConstants.color_0xff003B8E, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
