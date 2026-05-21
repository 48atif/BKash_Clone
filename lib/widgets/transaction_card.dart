import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
              Colors.pink.shade50,

          child: const Icon(
            Icons.swap_horiz,
            color: Colors.pink,
          ),
        ),

        title: Text(
          transaction.title,
        ),

        subtitle: Text(
          transaction.date,
        ),

        trailing: Text(
          '৳ ${transaction.amount}',

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}