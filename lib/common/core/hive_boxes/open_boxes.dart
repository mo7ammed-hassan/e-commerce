import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

class OpenBoxes {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  late Box userBox;

  Future<Box> openUserWishlistBox() async {
    // Open the user's main box
    userBox = await Hive.openBox(userId);

    // Ensure the userBox is opened // Can remove
    if (!Hive.isBoxOpen(userId)) {
      await Hive.openBox(userId);
    }

    // Get or create the wishlist box name
    String wishlistBoxName =
        userBox.get('WISHLIST', defaultValue: 'wishlist_$userId');
    userBox.put('WISHLIST', wishlistBoxName);

    return await Hive.openBox(wishlistBoxName);

    // Ensure the user has a wishlist
    // if (!userBox.containsKey('WISHLIST')) {
    //   userBox.put('WISHLIST', 'wishlist_$userId');
    //   await Hive.openBox('wishlist_$userId');
    // }
    // return await Hive.openBox('wishlist_$userId');
  }
}


  // Open userBox:
  // The box for the given userId is opened or created.
  // Retrieve or Create WISHLIST Key:
  // If the key 'WISHLIST' doesn’t exist in the userBox, it’s created with a default value (e.g.,'wishlist_$userId').
  // Open the Wishlist Box:
  // The wishlistBox specific to the user is opened using the name stored in the WISHLIST key.