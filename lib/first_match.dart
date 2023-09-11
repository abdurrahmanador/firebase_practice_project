

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirstMatch extends StatelessWidget {
  const FirstMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Argentina vs Africa"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.only(bottom: 430, top: 50),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Football')
                  .doc("arg_vs_afr").snapshots(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Object>>snapshot) {
                if (snapshot.hasData) {
                  final score = snapshot.data!;
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          score.get('match_name'),
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  score.get('team1_score').toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                                const SizedBox(width: 5,),
                                const Text(':', style: TextStyle(
                                    fontWeight: FontWeight.bold),),
                                const SizedBox(width: 5,),
                                Text(
                                  score.get('team2_score').toString(),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleLarge,
                                ),
                              ],
                            ),
                            Text(
                              score.get('time'),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              score.get('total_time'),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              }),
        ),),
    floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('Football')
              .doc('arg_vs_afr')
              .update({
            'match_name': "Argentina Vs Africa",
            'team1_score': 4,
            'team2_score': 7,
            'team_a':"Argentina",
            'team_b':"Africa"
          });
        }),
    );

  }

}