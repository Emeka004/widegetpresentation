import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});90

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Badge Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BadgeDemoPage(),
    );
  }
}

class BadgeDemoPage extends StatefulWidget {
  const BadgeDemoPage({super.key});

  @override
  State<BadgeDemoPage> createState() => _BadgeDemoPageState();
}

class _BadgeDemoPageState extends State<BadgeDemoPage> {
  int _notificationCount = 3;
  int _cartCount = 0;
  final int _messageCount = 99;

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  void _clearNotifications() {
    setState(() {
      _notificationCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Badge Widget Demo'),
        actions: [
          // Badge on a notification icon in the AppBar
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Badge(
              label: Text('$_notificationCount'),
              isLabelVisible: _notificationCount > 0,
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _clearNotifications,
                tooltip: 'Clear notifications',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Badge Widget Examples',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Example 1: Badge with a count
            _SectionLabel(label: '1. Badge with count'),
            const SizedBox(height: 12),
            Badge(
              label: Text(_messageCount > 99 ? '99+' : '$_messageCount'),
              child: const Icon(Icons.mail, size: 48),
            ),
            const SizedBox(height: 8),
            const Text('99+ messages (tap bell above to clear)'),
            const SizedBox(height: 32),

            // Example 2: Badge with no label (dot badge)
            _SectionLabel(label: '2. Dot badge (no label)'),
            const SizedBox(height: 12),
            const Badge(child: Icon(Icons.chat_bubble, size: 48)),
            const SizedBox(height: 8),
            const Text('Unread indicator'),
            const SizedBox(height: 32),

            // Example 3: Badge on a cart icon that increments
            _SectionLabel(label: '3. Interactive badge (tap button)'),
            const SizedBox(height: 12),
            Badge(
              label: Text('$_cartCount'),
              isLabelVisible: _cartCount > 0,
              child: const Icon(Icons.shopping_cart, size: 48),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _addToCart,
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
            ),
            const SizedBox(height: 32),

            // Example 4: Badge with custom colors
            _SectionLabel(label: '4. Custom badge color'),
            const SizedBox(height: 12),
            Badge(
              backgroundColor: Colors.green,
              textColor: Colors.white,
              label: const Text('7'),
              child: const Icon(Icons.star, size: 48, color: Colors.amber),
            ),
            const SizedBox(height: 8),
            const Text('Custom green badge'),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
