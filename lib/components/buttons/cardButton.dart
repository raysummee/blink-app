import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({ required this.label, required this.icon, required this.func, Key? key }): super(key: key);

  final String label;
  final IconData icon;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: func,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            height: 60,
            child: Row(
              children: [
                Icon(icon),
                SizedBox(width: 8,),
                Text(
                  func==null?label+" (non-accessible)":label
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}