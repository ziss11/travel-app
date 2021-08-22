import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int traveleraCount;
  final String seatSelected;
  final bool insurance;
  final bool refund;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    this.id = '',
    this.traveleraCount = 0,
    this.seatSelected = '',
    this.insurance = false,
    this.refund = false,
    this.vat = 0.0,
    this.price = 0,
    this.grandTotal = 0,
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    return TransactionModel(
      id: id,
      destination: DestinationModel.fromJson(
          json['destination']['id'], json['destination']),
      traveleraCount: json['countTraveler'],
      seatSelected: json['seatSelected'],
      insurance: json['insurance'],
      refund: json['refundable'],
      vat: json['vat'],
      price: json['price'],
      grandTotal: json['grandTotal'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        destination,
        traveleraCount,
        seatSelected,
        insurance,
        refund,
        vat,
        price,
        grandTotal
      ];
}
