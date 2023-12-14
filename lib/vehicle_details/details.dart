import 'package:book_a_ride/twilio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String id;

  const Details({super.key, required this.id});
  fetchCarData() async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('vehicles').doc(id).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return data;
      } else {
        return Future.error('Document not found');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchCarData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Text('Document not found');
          }
          var carDetails = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  carDetails['image'][0],
                  height: 250.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        carDetails['name'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        carDetails["availability"]
                            ? 'Available'
                            : 'Unavailable',
                        style: TextStyle(
                          color: carDetails["availability"]
                              ? Colors.green
                              : Colors.red,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),

                // Description
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    carDetails['description'],
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (carDetails["availability"]) {
                        Twilio twilio = Twilio();
                        twilio.sendSms(carDetails['name']);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Booking Confirmed!'),
                              content: Text(
                                  'You have successfully booked ${carDetails['name']}.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Car Unavailable!!!!'),
                              content: Text(
                                  '${carDetails['name']} is unavailable for now.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Book Now',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
