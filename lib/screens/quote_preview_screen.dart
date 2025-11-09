import 'package:flutter/material.dart';
import '../models/quote_item.dart';

class QuotePreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final clientName = data["clientName"];
    final clientAddress = data["clientAddress"];
    final reference = data["reference"];
    final List<QuoteItem> items = data["items"];
    final double totalAmount = data["total"];

    return Scaffold(
      appBar: AppBar(title: Text("Quote Preview"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PRODUCT QUOTATION",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),

                Text("Client: $clientName", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("Address: $clientAddress", style: TextStyle(fontSize: 16)),
                SizedBox(height: 5),
                Text("Reference: $reference", style: TextStyle(fontSize: 16)),
                SizedBox(height: 15),

                Divider(),

                Row(
                  children: [
                    _headerCell("Product / Service", flex: 4),
                    _headerCell("Qty", alignCenter: true),
                    _headerCell("Rate", alignRight: true),
                    _headerCell("Total", alignRight: true),
                  ],
                ),

                SizedBox(height: 6),

                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            _tableCell(item.name, flex: 4),
                            _tableCell(
                              item.quantity.toString(),
                              alignCenter: true,
                            ),
                            _tableCell(
                              "₹ ${item.rate.toStringAsFixed(2)}",
                              alignRight: true,
                            ),
                            _tableCell(
                              "₹ ${item.total.toStringAsFixed(2)}",
                              alignRight: true,
                              bold: true,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                Divider(thickness: 1.5),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Grand Total: ₹ ${totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Thank you for your business!",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerCell(
    String text, {
    int flex = 1,
    bool alignRight = false,
    bool alignCenter = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: alignRight
            ? TextAlign.right
            : alignCenter
            ? TextAlign.center
            : TextAlign.left,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _tableCell(
    String text, {
    int flex = 1,
    bool bold = false,
    bool alignRight = false,
    bool alignCenter = false,
  }) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: alignRight
            ? TextAlign.right
            : alignCenter
            ? TextAlign.center
            : TextAlign.left,
        style: TextStyle(
          fontSize: 15,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
