import 'package:flutter/material.dart';
import '../models/quote_item.dart';

class QuoteItemRow extends StatelessWidget {
  final QuoteItem item;
  final Function() onRemove;
  final Function() onUpdate;

  const QuoteItemRow({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
           
            TextFormField(
              decoration: InputDecoration(labelText: "Product / Service Name"),
              initialValue: item.name,
              onChanged: (value) {
                item.name = value;
                onUpdate();
              },
            ),
            SizedBox(height: 10),

            Row(
              children: [
                
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Qty"),
                    keyboardType: TextInputType.number,
                    initialValue: item.quantity.toString(),
                    onChanged: (value) {
                      item.quantity = int.tryParse(value) ?? 1;
                      onUpdate();
                    },
                  ),
                ),
                SizedBox(width: 10),

                
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Rate"),
                    keyboardType: TextInputType.number,
                    initialValue: item.rate.toString(),
                    onChanged: (value) {
                      item.rate = double.tryParse(value) ?? 0.0;
                      onUpdate();
                    },
                  ),
                ),
                SizedBox(width: 10),

                
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Discount"),
                    keyboardType: TextInputType.number,
                    initialValue: item.discount.toString(),
                    onChanged: (value) {
                      item.discount = double.tryParse(value) ?? 0.0;
                      onUpdate();
                    },
                  ),
                ),
                SizedBox(width: 10),

                
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Tax %"),
                    keyboardType: TextInputType.number,
                    initialValue: item.taxPercent.toString(),
                    onChanged: (value) {
                      item.taxPercent = double.tryParse(value) ?? 0.0;
                      onUpdate();
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ₹ ${item.total.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
