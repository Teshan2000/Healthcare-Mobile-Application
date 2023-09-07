import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // Reference to messages collection
  CollectionReference getMessagesCollection(String userId) {
    return userCollection
        .doc(uid)
        .collection("chats")
        .doc(userId)
        .collection("messages");
  }

  // Define the getUserChats method
  Stream<List<Map<String, dynamic>>> getUserChats(
      String chatUserId, String userName) {
    // Query the Firestore collection to get user chats
    return userCollection
        .doc(uid)
        .collection("chats")
        .snapshots()
        .map((snapshot) {
      List<Map<String, dynamic>> chatList = [];

      // Iterate through the documents and convert them to a list of maps
      snapshot.docs.forEach((doc) {
        chatList.add(doc.data() as Map<String, dynamic>);
      });

      return chatList;
    });
  }

  // Method to send a message
  Future sendMessage(
      String toUserId, Map<String, dynamic> chatMessageData) async {
    // Send the message to the recipient
    await getMessagesCollection(toUserId).add(chatMessageData);
    await getMessagesCollection(toUserId).doc('info').set({
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Also save the message in the sender's chat
    await getMessagesCollection(uid!).add(chatMessageData);
    await getMessagesCollection(uid!).doc('info').set({
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Method to save user data
  // Future savingUserData(String fullName, String email) async {
  //   await userCollection.doc(uid).set({
  //     'fullName': fullName,
  //     'email': email,
  //   });
  // }

  // Stream to get chat messages
  Stream<List<Map<String, dynamic>>> getChatMessages(String otherUserId) {
    return getMessagesCollection(otherUserId)
        .orderBy("time")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    });
  }

  // ... (other methods) ...

  // Define a method to get user data
  // Future<Map<String, dynamic>?> getUserData() async {
  //   DocumentSnapshot userSnapshot = await userCollection.doc(uid).get();
  //   if (userSnapshot.exists) {
  //     return userSnapshot.data() as Map<String, dynamic>;
  //   } else {
  //     return null;
  //   }
  // }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // saving the userdata
  Future savingUserData(String fullName, String email) async {
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "profilePic": "",
      "uid": uid,
    });
  }
}









// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService {
//   final String? uid;
//   DatabaseService({this.uid});

//   // reference for our collections
//   final CollectionReference userCollection =
//       FirebaseFirestore.instance.collection("users");
//   final CollectionReference groupCollection =
//       FirebaseFirestore.instance.collection("groups");

//   // saving the userdata
//   Future savingUserData(String fullName, String email) async {
//     return await userCollection.doc(uid).set({
//       "fullName": fullName,
//       "email": email,
//       "groups": [],
//       "profilePic": "",
//       "uid": uid,
//     });
//   }

//   // getting user data
//   Future gettingUserData(String email) async {
//     QuerySnapshot snapshot =
//         await userCollection.where("email", isEqualTo: email).get();
//     return snapshot;
//   }

//   // get user groups
//   getUserGroups() async {
//     return userCollection.doc(uid).snapshots();
//   }

//   // creating a group
//   Future createGroup(String userName, String id, String groupName) async {
//     DocumentReference groupDocumentReference = await groupCollection.add({
//       "groupName": groupName,
//       "groupIcon": "",
//       "admin": "${id}_$userName",
//       "members": [],
//       "groupId": "",
//       "recentMessage": "",
//       "recentMessageSender": "",
//     });
//     // update the members
//     await groupDocumentReference.update({
//       "members": FieldValue.arrayUnion(["${uid}_$userName"]),
//       "groupId": groupDocumentReference.id,
//     });

//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     return await userDocumentReference.update({
//       "groups":
//           FieldValue.arrayUnion(["${groupDocumentReference.id}_$groupName"])
//     });
//   }

//   // getting the chats
//   getChats(String groupId) async {
//     return groupCollection
//         .doc(groupId)
//         .collection("messages")
//         .orderBy("time")
//         .snapshots();
//   }

//   Future getGroupAdmin(String groupId) async {
//     DocumentReference d = groupCollection.doc(groupId);
//     DocumentSnapshot documentSnapshot = await d.get();
//     return documentSnapshot['admin'];
//   }

//   // get group members
//   getGroupMembers(groupId) async {
//     return groupCollection.doc(groupId).snapshots();
//   }

//   // search
//   searchByName(String groupName) {
//     return groupCollection.where("groupName", isEqualTo: groupName).get();
//   }

//   // function -> bool
//   Future<bool> isUserJoined(
//       String groupName, String groupId, String userName) async {
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentSnapshot documentSnapshot = await userDocumentReference.get();

//     List<dynamic> groups = await documentSnapshot['groups'];
//     if (groups.contains("${groupId}_$groupName")) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   // toggling the group join/exit
//   Future toggleGroupJoin(
//       String groupId, String userName, String groupName) async {
//     // doc reference
//     DocumentReference userDocumentReference = userCollection.doc(uid);
//     DocumentReference groupDocumentReference = groupCollection.doc(groupId);

//     DocumentSnapshot documentSnapshot = await userDocumentReference.get();
//     List<dynamic> groups = await documentSnapshot['groups'];

//     // if user has our groups -> then remove then or also in other part re join
//     if (groups.contains("${groupId}_$groupName")) {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayRemove(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "members": FieldValue.arrayRemove(["${uid}_$userName"])
//       });
//     } else {
//       await userDocumentReference.update({
//         "groups": FieldValue.arrayUnion(["${groupId}_$groupName"])
//       });
//       await groupDocumentReference.update({
//         "members": FieldValue.arrayUnion(["${uid}_$userName"])
//       });
//     }
//   }

//   // send message
//   sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
//     groupCollection.doc(groupId).collection("messages").add(chatMessageData);
//     groupCollection.doc(groupId).update({
//       "recentMessage": chatMessageData['message'],
//       "recentMessageSender": chatMessageData['sender'],
//       "recentMessageTime": chatMessageData['time'].toString(),
//     });
//   }
// }
