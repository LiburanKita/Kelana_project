import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference openTripContents = firestore.collection("openTripContent");
int pageSize = 15; // Jumlah data yang akan diambil dalam setiap halaman
DocumentSnapshot? lastDocument;
Future<List<Map<String, dynamic>>> getDataFromFirestore(int page) async {
  QuerySnapshot querySnapshot;
  if (lastDocument == null) {
    querySnapshot = await openTripContents
        .orderBy("createdAt", descending: true)
        .limit(pageSize)
        .get();
  } else {
    querySnapshot = await openTripContents
        .orderBy("createdAt", descending: true)
        .startAfterDocument(lastDocument!)
        .limit(pageSize)
        .get();
  }

  List<Map<String, dynamic>> dataList = [];

  for (var document in querySnapshot.docs) {
    String documentId = document.id; // Mendapatkan dokumen ID
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    data['id'] = documentId; // Menambahkan dokumen ID ke dalam data
    dataList.add(data);
  }
  lastDocument = querySnapshot.docs.last;
  return dataList;
}
