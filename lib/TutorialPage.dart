import 'package:flutter/material.dart';
import 'package:model/wordspage.dart' show SentencesPage, WordsPage;

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top statistics counters as buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              color: const Color.fromARGB(255, 7, 32, 52),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStatCard(
                    context,
                    "Signs",
                    "Words",
                    Icons.abc_outlined,
                    WordsPage(),
                  ),
                  _buildStatCard(
                    context,
                    "Signs",
                    "Sentences",
                    Icons.text_fields,
                    SentencesPage(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadowColor: Colors.black,
                elevation: 5,
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String count,
    String label,
    IconData icon,
    Widget nextPage,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color.fromARGB(255, 7, 32, 52)),
              const SizedBox(height: 10),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder Pages
// class WordsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Words Page")),
//       body: const Center(child: Text("Words Learning Content Here")),
//     );
//   }
// }

// class SentencesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Sentences Page")),
//       body: const Center(child: Text("Sentences Learning Content Here")),
//     );
