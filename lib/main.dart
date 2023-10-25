import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const IHateWeb());
}

class IHateWeb extends StatelessWidget {
  const IHateWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Cool Website',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Caveat',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF499BF8)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          controller: _controller,
          child: Column(
            children: [
              Text(
                'Hi, welcome!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 30),
              Lottie.asset(
                'assets/lottiefiles/robot.json',
                height: size.height / 2,
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _HyperLink(text: 'GitHub', uri: 'https://github.com/arifai'),
                  SizedBox(width: 20),
                  _HyperLink(
                    text: 'LinkedIn',
                    uri: 'https://www.linkedin.com/in/ahmad-rifai/',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HyperLink extends StatelessWidget {
  const _HyperLink({required this.text, required this.uri});

  final String text;
  final String uri;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: const TextStyle(
          fontFamily: 'Jetbrains-Mono',
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()..onTap = _launcUrl,
      ),
    );
  }

  void _launcUrl() async {
    final Uri url = Uri.parse(uri);

    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
