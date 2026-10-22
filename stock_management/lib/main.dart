
import 'package:flutter/material.dart';

void main() {
  runApp(const StockManagementApp());
}

class StockManagementApp extends StatelessWidget {
  const StockManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  Widget buildCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 35, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Management'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: buildCard(
                    'Products',
                    '0',
                    Icons.inventory_2,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildCard(
                    'Items in Stock',
                    '0',
                    Icons.warehouse,
                    Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Stock Operations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.add_box,
                  color: Colors.blue,
                ),
                title: const Text('Add Product'),
                subtitle: const Text(
                  'Add a new product to your stock',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onTap: () {
                  showMessage(
                    context,
                    'Add Product coming next!',
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.list_alt,
                  color: Colors.green,
                ),
                title: const Text('View Products'),
                subtitle: const Text(
                  'See all your products',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onTap: () {
                  showMessage(
                    context,
                    'Product list coming next!',
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.warning_amber,
                  color: Colors.orange,
                ),
                title: const Text('Low Stock'),
                subtitle: const Text(
                  'Check products running low',
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                onTap: () {
                  showMessage(
                    context,
                    'Low stock report coming next!',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
