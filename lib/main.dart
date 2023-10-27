import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ihate/constants.dart';
import 'package:ihate/current_theme.dart';
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
      title: 'Ahmad Rifa\'i Website',
      theme: CurrentTheme.apply,
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
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    _composition = AssetLottie(people).load();
    super.initState();
  }

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
        child: FutureBuilder(
          future: _composition,
          builder: (_, snapshot) {
            final LottieComposition? composition = snapshot.data;

            if (composition != null) {
              return SingleChildScrollView(
                controller: _controller,
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      'Hi, welcome!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 30),
                    Lottie(composition: composition, frameRate: FrameRate.max),
                    const SizedBox(height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _HyperLink(
                          icon: gitHub,
                          text: 'GitHub',
                          uri: gitHubLink,
                        ),
                        SizedBox(width: 20),
                        _HyperLink(
                          icon: linkedIn,
                          text: 'LinkedIn',
                          uri: linkedInLink,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: SizedBox(
                  width: size.width / 6,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _HyperLink extends StatelessWidget {
  const _HyperLink({required this.icon, required this.text, required this.uri});

  final String icon;
  final String text;
  final String uri;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(width: 6),
        Text.rich(
          TextSpan(
            text: text,
            recognizer: TapGestureRecognizer()..onTap = _launcUrl,
          ),
        ),
      ],
    );
  }

  void _launcUrl() async {
    final Uri url = Uri.parse(uri);

    if (!await launchUrl(url)) throw 'Could not launch $url';
  }
}
