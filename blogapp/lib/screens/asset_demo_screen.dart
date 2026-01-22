import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AssetDemoScreen extends StatelessWidget {
  const AssetDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assets Demo'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner Section
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.svg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Flutter Asset Management',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Logo Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Flutter Logo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/images/logo.svg',
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            ),

            const Divider(thickness: 2),

            // Material Icons Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Material Design Icons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.flutter_dash,
                            color: Colors.blue,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const Text('Flutter'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.android, color: Colors.green, size: 48),
                          const SizedBox(height: 8),
                          const Text('Android'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.apple, color: Colors.grey, size: 48),
                          const SizedBox(height: 8),
                          const Text('Apple'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(thickness: 2),

            // Cupertino Icons Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Cupertino (iOS) Icons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.heart,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const Text('Heart'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.star,
                            color: Colors.amber,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const Text('Star'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            CupertinoIcons.person,
                            color: Colors.purple,
                            size: 48,
                          ),
                          const SizedBox(height: 8),
                          const Text('Profile'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(thickness: 2),

            // Local Icon Assets Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Local Asset Icons',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/star.svg',
                            width: 64,
                            height: 64,
                          ),
                          const SizedBox(height: 8),
                          const Text('Star Icon'),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            'assets/icons/profile.svg',
                            width: 64,
                            height: 64,
                          ),
                          const SizedBox(height: 8),
                          const Text('Profile Icon'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(thickness: 2),

            // Combined Assets Example
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text(
                    'Combined Assets',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.svg',
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Powered by Flutter',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite, color: Colors.red, size: 24),
                              const SizedBox(width: 8),
                              Icon(Icons.star, color: Colors.amber, size: 24),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.lightbulb,
                                color: Colors.yellow.shade700,
                                size: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
