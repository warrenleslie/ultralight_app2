import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirebaseService {
  final StreamController<Stats> _statsController = StreamController<Stats>(); // A controller with a stream that supports only one single subscriber.

  FirebaseService() {
    Firestore.instance
    .collection('informations')
    .document('project_stats')
    .snapshots()
    .listen(_statsUpdated);
  }

Stream<Stats> get appStats => _statsController.stream; // The stream that this controller is controlling.

  void _statsUpdated(DocumentSnapshot snapshot) {
    _statsController.add(Stats.fromSnapshot(snapshot)); // Sends a data event and listeners receive this event.
  }

}

class Stats {
  final int fees;
  final int users;
  final int nrTransaction;
  final int timeLastTrans;

  Stats(this.fees, this.users, this.nrTransaction, this.timeLastTrans);
    
  Stats.fromSnapshot(DocumentSnapshot snapShot) :
    fees = snapShot['Fees'] ?? 0,
    users = snapShot['Users'] ?? 0,
    nrTransaction = snapShot['nrTransaction'] ?? 0,
    timeLastTrans = snapShot['timeLastTrans'] ?? 0.00;
}