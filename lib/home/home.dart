import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/vehicle_details/details.dart';
import '/login_with_email/login_with_email.dart';
import '../authentication/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars'),
        actions: [
          IconButton(
            onPressed: () async {
              Auth a = Auth();
              a.signOut();
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.clear();
              Get.offAll(
                LoginWithEmail(),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('vehicles').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          List<Widget> children =
              snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return GestureDetector(
              onTap: () {
                Get.to(Details(id: document.id));
              },
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(data["image"][0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 200.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(data["name"]),
                          const Spacer(),
                          Text(
                            data["availability"] ? 'Available' : 'Unavailable',
                            style: TextStyle(
                              color: data["availability"]
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList();
          return ListView(
            children: children,
          );
        },
      ),
    );
  }
}
