import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/sup.png', // Replace with the actual path to your image file.
            fit: BoxFit.fill, // Fill the entire screen
          ),
          // Title
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Black background
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                'Click Here ',
                style: TextStyle(color: Colors.orange), // Indigo text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50), // Espace ajouté au-dessus de l'image

            // Circular Image above the Text
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/Capture.PNG', // Remplacez cela par le chemin réel de votre image
                  height: 250, // Ajustez la hauteur selon vos besoins
                  width: 250, // Ajustez la largeur selon vos besoins
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text above Username TextField
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Member !',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            // Username TextField
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            // Password TextField
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            // Login Button
            ElevatedButton(
              onPressed: () {
                // Check if the username and password are correct
                if (usernameController.text == 'ahmed' && passwordController.text == '0000') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage(username: usernameController.text)),
                  );
                } else {
                  // Show an error message if the credentials are incorrect
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid username or password'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // White background
              ),
              child: Text('Login', style: TextStyle(color: Colors.orange)), // Indigo text
            ),
          ],
        ),
      ),
    );
  }
}
class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sup\'Com Clubs',
          style: TextStyle(color: Colors.orange, fontSize: 24.0),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: [
            _buildImageCard(context, 'assets/images/team-removebg-preview (2)-removebg-preview.jpg', 'Team sup\'com'),
            _buildImageCard(context, 'assets/images/cyber-removebg-preview.jpg', 'Cyber Security'),
            _buildImageCard(context, 'assets/images/gdsc-removebg-preview.jpg', 'GDSC'),
            _buildImageCard(context, 'assets/images/acm-removebg-preview.jpg', 'ACM'),
            _buildImageCard(context, 'assets/images/ieee-removebg-preview.jpg', 'IEEE'),
            _buildImageCard(context, 'assets/images/junior-removebg-preview.jpg', 'JUNIOR Entreprise'),
            _buildImageCard(context, 'assets/images/nateg-removebg-preview.jpg', 'NATEG'),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(BuildContext context, String imagePath, String clubName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(clubName: clubName, imagePath: imagePath),
            ),
          );
        },
        child: Card(
          child: Hero(
            tag: imagePath,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 400.0,
              width: 400.0,
            ),
          ),
        ),
      ),
    );
  }
}


class DetailsPage extends StatefulWidget {
  final String clubName;
  final String imagePath;

  DetailsPage({required this.clubName, required this.imagePath});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.clubName,
          style: TextStyle(color: Colors.orange, fontSize: 24.0),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.orange), // Set the color of the back arrow to black
      ),
      backgroundColor: Colors.black, // Set the background color to orange
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Club Image
          Container(
            height: 150.0,
            width: 150.0,
            child: Hero(
              tag: widget.imagePath,
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20.0), // Add some space between the image and text
          Expanded(
            child: Center(
              // Center widget to center its child vertically
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter password to proceed:',
                    style: TextStyle(fontSize: 25.0, color: Colors.orange),
                  ),
                  SizedBox(height: 10.0),
                  // Password TextField
                  Container(
                    width: 200.0,
                    child: TextField(
                      style: TextStyle(color: Colors.orange),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.orange),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (passwordController.text == '2023') {
                        // Correct password, navigate to the next page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextPage(),
                          ),
                        );
                      } else {
                        // Incorrect password, show an error message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Incorrect password'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: Text('Click me ', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Our Workshops',
          style: TextStyle(
            color: Colors.orange, // Couleur du texte
            fontSize: 24.0, // Taille du texte
          ),
        ),
        backgroundColor: Colors.black, // Couleur de la barre d'applications
        iconTheme: IconThemeData(color: Colors.orange), // Couleur de la flèche de retour
      ),
      backgroundColor: Colors.black, // Couleur du fond de l'écran
      body: Center(
        child: Text(
          'There are no workshops for today !',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}


