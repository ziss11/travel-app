import 'package:airplane/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationService {
  CollectionReference destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fetchDestination() async {
    try {
      QuerySnapshot result = await destinationReference.get();

      List<DestinationModel> destination = result.docs.map((destination) {
        return DestinationModel.fromJson(
            destination.id, destination.data() as Map<String, dynamic>);
      }).toList();

      return destination;
    } catch (e) {
      throw e;
    }
  }
}
