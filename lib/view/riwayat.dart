import 'package:flutter/material.dart';

class Riwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            MaterialButton(onPressed: null),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
