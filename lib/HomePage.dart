import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/moviePage.dart';
import 'package:movieapp/movies.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Welcome> WelcomeList = [];

  @override
  void initState() {
    super.initState();
    getPostApi();
  }

  Future<void> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://dummyapi.online/api/movies'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      setState(() {
        WelcomeList = data.map((json) => Welcome.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 15, 15),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.menu, color: Colors.white)),
        title: const Text(
          'Movies',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 17, 17, 17),
        child: WelcomeList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ))
            : GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Adjust height and width of each card
                ),
                itemCount: WelcomeList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Moviepage(),
                          ));
                    },
                    child: Card(
                      color: const Color.fromARGB(255, 34, 33, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Fixed-size image container
                          Container(
                            height: 140, // Fixed height for image
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: Image.asset(
                                WelcomeList[index].image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  'assets/jack-reacher-star-wars-interstellar-movie-john-wick-wallpaper-preview.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Displaying the movie title
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              WelcomeList[index].movie,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Displaying the rating
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              'Rating: ${WelcomeList[index].rating.toStringAsFixed(1)}', // Format rating to 1 decimal place
                              style: const TextStyle(
                                color: Colors.yellow,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
