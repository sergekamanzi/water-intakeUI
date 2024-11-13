import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  double waterGoal = 1.7; // Initial water goal value

  void resetWaterGoal() {
    setState(() {
      waterGoal = 1.7; // Reset to default or any desired value
    });
  }

  void saveWaterGoal() {
    // Save functionality here (e.g., save to local storage or database)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Water goal saved: $waterGoal liters")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Tailored Hydration Guide"),
        centerTitle: true,
       leading: IconButton(
        icon: Image.asset('assets/back.png'), // Replace with your image path
           onPressed: () => Navigator.pop(context), // Go back to the previous screen
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Water Image
            Image.network(
              'assets/predict.png', // Replace with your image URL or asset path
              height: 200,
               width: double.infinity, // Make the image take full width
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            
            // Daily Goal Text
            Text(
              "Your daily water goal:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            // Daily Water Goal Value
            Text(
              "$waterGoal liters",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            
           Container(
                margin: EdgeInsets.only(bottom:466), // Add bottom margin here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: resetWaterGoal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      ),
                      child: Text(
                        "Reset",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: saveWaterGoal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                      ),
                      child: Text("Save",
                      style: TextStyle(color: const Color.fromARGB(255, 249, 247, 247)),
                      ),
                    ),
                  ],
                ),
              ),
           ],
        ),
      ),
    );
  }
}
