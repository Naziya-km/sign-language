import 'package:flutter/material.dart';
import 'package:model/TutorialPage.dart';
import 'package:model/alphabet.dart';
import 'package:model/quiz.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int awardsWin = 0;
  int streak = 0;

  void incrementPoints() {
    setState(() {
      awardsWin += 10;
      streak += 5;
    });
  }

  void navigateToPage(BuildContext context, Widget page) {
    incrementPoints(); // Increase points when navigating
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top statistics section (Awards & Streak)
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              color: const Color.fromARGB(255, 7, 32, 52),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildStatCard(
                    awardsWin.toString(),
                    "Awards Win",
                    Icons.emoji_events,
                  ),
                  _buildStatCard(
                    streak.toString(),
                    "Streak",
                    Icons.fireplace_rounded,
                  ),
                ],
              ),
            ),

            // Containers for Tutorial, Alphabet, and Quiz
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              color: const Color.fromARGB(255, 7, 32, 52),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildNavigationContainer(
                    context,
                    "Tutorial",
                    Icons.grading_outlined,
                    Tutorial(),
                  ),
                  _buildNavigationContainer(
                    context,
                    "Alphabet",
                    Icons.book_rounded,
                    Alphabet(),
                  ),
                  _buildNavigationContainer(
                    context,
                    "Quiz",
                    Icons.quiz,
                    QuizApp(),
                  ),
                ],
              ),
            ),

            // Bottom section
            Container(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "We've Completed",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomStat(streak.toString(), "Completed Projects"),
                      _buildBottomStat(awardsWin.toString(), "Award Winners"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for statistics (Awards & Streak)
  Widget _buildStatCard(String count, String label, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color.fromARGB(255, 7, 32, 52)),
            SizedBox(height: 10),
            Text(
              count,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Tutorial, Alphabet, and Quiz (Styled like stat cards)
  Widget _buildNavigationContainer(
    BuildContext context,
    String label,
    IconData icon,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () => navigateToPage(context, page),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        color: Colors.blueAccent, // Different color for visibility
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for bottom statistics (Projects, Winners)
  Widget _buildBottomStat(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
