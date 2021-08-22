import 'package:airplane/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference transactionReference =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      transactionReference.add({
        'destination': transaction.destination.toJson(),
        'countTraveler': transaction.traveleraCount,
        'seatSelected': transaction.seatSelected,
        'insurance': transaction.insurance,
        'refundable': transaction.refund,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransaction() async {
    try {
      QuerySnapshot result = await transactionReference.get();
      List<TransactionModel> transaction = result.docs.map((transaction) {
        return TransactionModel.fromJson(
            transaction.id, transaction.data() as Map<String, dynamic>);
      }).toList();

      return transaction;
    } catch (e) {
      throw e;
    }
  }
}
