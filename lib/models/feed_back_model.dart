import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBack {
  String name;
  String email;
  String desc;

  FeedBack({required this.name, required this.email, required this.desc});

  FeedBack.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name']! as String,
          email: json['email']! as String,
          desc: json['desc']! as String,
        );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "desc": desc,
      };

  static FeedBack fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FeedBack(
      name: snapshot['name'],
      email: snapshot['email'],
      desc: snapshot['desc'],
    );
  }
}
