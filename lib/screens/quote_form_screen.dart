import 'package:flutter/material.dart';
import '../models/quote_item.dart';
import '../widgets/quote_item_row.dart';

class QuoteFormScreen extends StatefulWidget {
  @override
  State<QuoteFormScreen> createState() => _QuoteFormScreenState();
}

enum TaxMode {
  inclusive,
  exclusive,
}

class _QuoteFormScreenState extends State<QuoteFormScreen> {
  
  final clientNameController = TextEditingController();
  final clientAddressController = TextEditingController();
  final referenceController = TextEditingController();
  List<QuoteItem> items = [];
  TaxMode _selectedTaxMode = TaxMode.exclusive;

  @override
  void dispose() {
    clientNameController.dispose();
    clientAddressController.dispose();
    referenceController.dispose();
    super.dispose();
  }

  double get subtotal {
    return items.fold(0.0, (sum, item) => sum + item.total);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Quote")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Client Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: clientNameController,
                        decoration: InputDecoration(
                          labelText: "Client Name",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),

                      TextFormField(
                        controller: clientAddressController,
                        decoration: InputDecoration(
                          labelText: "Client Address",
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 16),

                      TextFormField(
                        controller: referenceController,
                        decoration: InputDecoration(
                          labelText: "Reference / Quote ID",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Line Items",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Display dynamic list
              Column(
                children: items.map((item) {
                  return QuoteItemRow(
                    item: item,
                    onUpdate: () => setState(() {}),
                    onRemove: () {
                      setState(() {
                        items.remove(item);
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 10),

              // Add item button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      items.add(QuoteItem()); // add empty item
                    });
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add Item"),
                ),
              ),

              //
              //--- MORE CONTENT WILL BE ADDED BELOW IN NEXT STEP ---
              SizedBox(height: 20),
              Divider(thickness: 1),

              // Total Section
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Subtotal: ₹ ${subtotal.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Grand Total: ₹ ${subtotal.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/preview',
                            arguments: {
                              "clientName": clientNameController.text,
                              "clientAddress": clientAddressController.text,
                              "reference": referenceController.text,
                              "items": items,
                              "total": subtotal,
                            },
                          );
                        },
                        child: Text("Preview Quote"),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
