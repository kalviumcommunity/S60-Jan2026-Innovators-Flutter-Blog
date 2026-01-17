import 'package:flutter/material.dart';

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});

  @override
  Widget build(BuildContext context) {
    // STEP 1: Get screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // STEP 2: Decide device type
    bool isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Layout"), centerTitle: true),

      body: Padding(
        padding: EdgeInsets.all(isTablet ? 24 : 16),
        child: Column(
          children: [
            // HEADER SECTION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Welcome to Responsive UI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isTablet ? 26 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // MAIN CONTENT
            Expanded(
              child: isTablet
                  ? GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: const [
                        ContentCard(title: "Card 1"),
                        ContentCard(title: "Card 2"),
                        ContentCard(title: "Card 3"),
                        ContentCard(title: "Card 4"),
                      ],
                    )
                  : ListView(
                      children: const [
                        ContentCard(title: "Card 1"),
                        ContentCard(title: "Card 2"),
                        ContentCard(title: "Card 3"),
                        ContentCard(title: "Card 4"),
                      ],
                    ),
            ),

            const SizedBox(height: 16),

            // FOOTER / BUTTON SECTION
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: isTablet ? 18 : 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// REUSABLE CARD WIDGET
class ContentCard extends StatelessWidget {
  final String title;

  const ContentCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
