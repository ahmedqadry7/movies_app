import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/models/bookmarked_movies_model.dart';

class FirebaseFunctions {
  //Move to collection of Bookmarked Movies
  static CollectionReference<BookMarkedMoviesModel>
      getBookmarkedMoviesCollection() {
    return FirebaseFirestore.instance
        .collection("Movies")
        .withConverter<BookMarkedMoviesModel>(
      fromFirestore: (snapshot, _) {
        return BookMarkedMoviesModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static Future<void> addMovie(BookMarkedMoviesModel model) {
    var collection = getBookmarkedMoviesCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    return docRef.set(model);
  }

  static Stream<QuerySnapshot<BookMarkedMoviesModel>> getBookmarkedMovies() {
    return getBookmarkedMoviesCollection().snapshots();
  }

  static Future<void> deleteMovie(String id){
    return getBookmarkedMoviesCollection().doc(id).delete();
  }
}
