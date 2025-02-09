import 'dart:io';

import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:autismx/shared/network/dio/ai_helper.dart';
import 'package:autismx/shared/network/dio/parent_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class Reports extends StatelessWidget {
  const Reports({Key key}) : super(key: key);

  Widget noData() {
    return Center(child: Text("No Reports"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustombackAppBar(context, () {
            Navigator.pop(context);
          }),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reports",
              style: TextStyle(
                  color: ColorManager.blueFont,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                final reportData = AppCubit.get(context).reportData;
                if (reportData == null || reportData.isEmpty) {
                  return noData();
                }
                print(reportData);
                final List<dynamic> scores = reportData["scores"];
                if (scores == null || scores.isEmpty) {
                  return noData();
                }
                return ListView.separated(
                    itemCount: scores.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      reportData["child_name"],
                                      style: const TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Share.share(
                                              'Name: ${reportData["child_name"]}\nDate: ${scores[index]["date"]}\nAge: ${scores[index]["age"]}\nGender: ${scores[index]["gender"] == 1 ? "Female" : "Male"}\nScore: ${scores[index]["score"]}\nCase: ${scores[index]["case"]}\nAdvice: ${scores[index]["advise"]}',
                                              subject: "AutismX Report",
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.share_outlined,
                                            color: ColorManager.blue,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            //for testing
                                            // AIDioHelper.uploadImage(
                                            //     imageFile: File(
                                            //             "./assets/image/after.png")
                                            //         .absolute);

                                            ParentDioHelper.deleteParentScore(
                                                    reportData["id"])
                                                .then((value) {
                                              AppCubit.get(context)
                                                  .getReports();
                                            }).catchError((err) {});
                                          },
                                          icon: const Icon(
                                            Icons.delete_outline,
                                            color: ColorManager.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Date:     ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["date"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Age:      ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["age"].toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Gender:",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["gender"] == 1
                                                ? "Female"
                                                : "Male",
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Score:   ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["score"].toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Case:    ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["case"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Advice: ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["advise"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            //
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 3, color: Colors.black));
              },
            ),
          ),
        ],
      ),
    );
  }
}
