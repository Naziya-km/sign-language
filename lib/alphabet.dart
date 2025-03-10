import 'package:flutter/material.dart';

class Alphabet extends StatelessWidget {
  const Alphabet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Alphabet Page',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Alphabet Image
            Image.asset(
              'Images/letters.jpg',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),

            // Title/Description for Alphabet
            const Text(
              'Learn the Alphabet!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              'Explore sign language for each letter. Tap below to start learning!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Explore Alphabet Button (Navigates to Sign Language Page)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlphabetSignLanguagePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
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
                'Explore Alphabet',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Back Button
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
}

// New Page for Sign Language Alphabet
class AlphabetSignLanguagePage extends StatelessWidget {
  const AlphabetSignLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of sign language alphabet images
    final List<Map<String, String>> signLanguageAlphabets = [
      {'letter': 'A', 'image': 'Images/lettera.jpg'},
      {'letter': 'B', 'image': 'Images/letterb.jpg'},
      {'letter': 'C', 'image': 'Images/letterc.jpg'},
      {'letter': 'D', 'image': 'Images/letterd.jpg'},
      //  {'letter': 'E', 'image': 'Images/lettere.jpg'},
      //  {'letter': 'F', 'image': 'Images/letterf.jpg'},
      //  {'letter': 'G', 'image': 'Images/letterg.jpg'},
      //  {'letter': 'H', 'image': 'Images/letterh.jpg'},
      //  {'letter': 'I', 'image': 'Images/letteri.jpg'},
      //  {'letter': 'J', 'image': 'Images/letterj.jpg'},
      // {'letter': 'K', 'image': 'Images/letterk.jpg'},
      //  {'letter': 'L', 'image': 'Images/letterl.jpg'},
      // {'letter': 'M', 'image': 'Images/letterm.jpg'},
      //  {'letter': 'N', 'image': 'Images/lettern.jpg'},
      //  {'letter': 'O', 'image': 'Images/lettero.jpg'},
      //  {'letter': 'P', 'image': 'Images/letterp.jpg'},
      //  {'letter': 'Q', 'image': 'Images/letterq.jpg'},
      //  {'letter': 'R', 'image': 'Images/letterr.jpg'},
      {'letter': 'S', 'image': 'Images/letters.jpg'},
      {'letter': 'T', 'image': 'Images/lettert.jpg'},
      {'letter': 'U', 'image': 'Images/letteru.jpg'},
      {'letter': 'V', 'image': 'Images/letterv.jpg'},
      {'letter': 'W', 'image': 'Images/letterw.jpg'},
      {'letter': 'X', 'image': 'Images/letterx.jpg'},
      {'letter': 'Y', 'image': 'Images/lettery.jpg'},
      {'letter': 'Z', 'image': 'Images/letterz.jpg'},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 32, 52),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Sign Language Alphabet',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: signLanguageAlphabets.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // Display 3 images per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  signLanguageAlphabets[index]['image']!,
                  width: 300,
                  height: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 5),
                Text(
                  signLanguageAlphabets[index]['letter']!,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 246, 245, 245),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
