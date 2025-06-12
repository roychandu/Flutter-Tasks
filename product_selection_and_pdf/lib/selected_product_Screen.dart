import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'package:share_plus/share_plus.dart';

class SelectedProductScreen extends StatefulWidget {
  final List<int> selectedProducts;
  final String name;
  final String email;

  const SelectedProductScreen({
    Key? key,
    required this.selectedProducts,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  State<SelectedProductScreen> createState() => _SelectedProductScreenState();
}

class _SelectedProductScreenState extends State<SelectedProductScreen> {
  final pdf = pw.Document();

  Future<void> _generatePdf() async {
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Customer Details',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.Text('Name: ${widget.name}'),
              pw.Text('Email: ${widget.email}'),
              pw.SizedBox(height: 20),
              pw.Text('Selected Products:',
                  style: pw.TextStyle(
                      fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.ListView.builder(
                itemCount: widget.selectedProducts.length,
                itemBuilder: (context, index) {
                  int productIndex = widget.selectedProducts[index];
                  return pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                          'Product ${String.fromCharCode(65 + productIndex)}'),
                      pw.Text('₹${(productIndex + 1) * 100}'),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Future<String> _savePdf() async {
    final output = await getTemporaryDirectory();
    final filePath = '${output.path}/selected_products.pdf';

    await _generatePdf();
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());
    return filePath;
  }

  Future<void> _downloadPdf() async {
    final filePath = await _savePdf();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to $filePath')),
    );
    // You can also implement saving to gallery or external storage here if needed
  }

  // Future<void> _sharePdf() async {
  //   final filePath = await _savePdf();
  //   await Share.shareFiles([filePath], text: 'Selected Products PDF');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Products'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedProducts.length,
              itemBuilder: (context, index) {
                int productIndex = widget.selectedProducts[index];
                return ListTile(
                  title: Text(
                    'Product ${String.fromCharCode(65 + productIndex)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text('₹${(productIndex + 1) * 100}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _downloadPdf,
                    icon: const Icon(Icons.download),
                    label: const Text('Download PDF'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.share),
                    label: const Text('Share PDF'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
