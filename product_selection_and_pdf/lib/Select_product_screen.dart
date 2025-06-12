import 'package:flutter/material.dart';
import 'selected_product_screen.dart';

class SelectProductScreen extends StatefulWidget {
  const SelectProductScreen({super.key});

  @override
  State<SelectProductScreen> createState() => _SelectProductScreenState();
}

class _SelectProductScreenState extends State<SelectProductScreen> {
  List<int> selectedItems = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Favourite App')),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final isSelected = selectedItems.contains(index);
                return ListTile(
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedItems.remove(index)
                          : selectedItems.add(index);
                    });
                  },
                  title: Row(
                    children: [
                      Icon(isSelected
                          ? Icons.check
                          : Icons.check_box_outline_blank_outlined),
                      const SizedBox(width: 10),
                      Text(
                        'Product ${String.fromCharCode(65 + index)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: Text('₹${(index + 1) * 100}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedProductScreen(
                    selectedProducts: selectedItems,
                    name: nameController.text,
                    email: emailController.text,
                  ),
                ),
              );
            },
            child: const Text('Generate PDF'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
