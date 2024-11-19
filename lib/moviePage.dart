import 'package:flutter/material.dart';
import 'package:movieapp/HomePage.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

class Moviepage extends StatefulWidget {
  const Moviepage({super.key});

  @override
  State<Moviepage> createState() => _MoviepageState();
}

class _MoviepageState extends State<Moviepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 17, 17),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack to overlay text on image
            Stack(
              children: [
                // Background image
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/jack-reacher-star-wars-interstellar-movie-john-wick-wallpaper-preview.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Transparent shadow overlay
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 17, 17, 17).withOpacity(0.5),
                        const Color.fromARGB(255, 17, 17, 17).withOpacity(0.5),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                // Positioned text on the image
                Positioned(
                  bottom: 200,
                  left: 20,
                  right: 20,
                  child: const Text(
                    'Avengers Infinity War',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 20,
                  right: 20,
                  child: const Text(
                    '4 Nov 24 | 120 minutes',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 238, 177, 86),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: const Text(
                    'Fantasy, Adventure, Sci-Fi',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 243, 242, 240),
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ExpandableText(
                    'After a tragic event, the Avengers regroup to reverse Thanos actions and save the universe. They face incredible challenges but rely on teamwork and sacrifice to try to restore peace.',
                    trimType: TrimType.lines,
                    trim: 2,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Director: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 81, 81),
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Anthony and Joe Russo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actors: ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 82, 81, 81),
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: ExpandableText(
                      'Robert Downey Jr., Chris Evans, Scarlett Johansson, Chris Hemsworth, Mark Ruffalo, Jeremy Renner, Tom Hiddleston, Samuel L. Jackson, Sebastian Stan, Anthony Mackie, Paul Rudd, Benedict Cumberbatch, Elizabeth Olsen, Tom Holland, Brie Larson, Karen Gillan, Zoe Saldana, Chris Pratt, Dave Bautista, Vin Diesel, Bradley Cooper, Josh Brolin, Paul Bettany, Benicio del Toro, Kurt Russell, Michael B. Jordan, Cate Blanchett, Tommy Lee Jones, Jeff Bridges, Guy Pearce, Lee Pace, Hugo Weaving, Mads Mikkelsen, Evangeline Lilly, Don Cheadle, Tessa Thompson, Simu Liu, Hailee Steinfeld, Florence Pugh, Richard Madden, Angelina Jolie.',
                      trimType: TrimType.lines,
                      trim: 2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: const Color.fromARGB(255, 2, 57, 102),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(200, 40),
                ),
                child: const Text(
                  'Download',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
