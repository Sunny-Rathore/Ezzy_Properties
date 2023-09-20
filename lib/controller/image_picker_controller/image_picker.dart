import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImagePaths = <String>[].obs;
  Rx<XFile?> myimageFile = Rx<XFile?>(null);
  // List<Asset> selectedImages = [];

  Future<String> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      myimageFile.value = pickedFile;
    }
    return selectedImagePath.value;
  }

  Future pickImages() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage();
      selectedImagePaths
          .assignAll(pickedFiles.map((pickedFile) => pickedFile.path));
    }
  }
}
//   Future<void> pickImages1() async {
//     var status = await Permission.storage.request();
//     if (status.isGranted) {
//       try {
//         selectedImages = await MultiImagePicker.pickImages(
//           maxImages: 10, // Maximum number of images to pick
//           enableCamera: true,
//           selectedAssets: selectedImages,
//           cupertinoOptions: const CupertinoOptions(
//             takePhotoIcon:
//                 "chat", // Set a custom icon for taking photos (iOS only)
//           ),
//           materialOptions: const MaterialOptions(
//             actionBarColor:
//                 "#abcdef", // Set custom colors for the action bar (Android only)
//             statusBarColor:
//                 "#abcdef", // Set custom colors for the status bar (Android only)
//             actionBarTitle: "Select Images",
//             allViewTitle: "All Photos",
//             useDetailsView: false, // Display details about the picked images
//             selectCircleStrokeColor: "#FFFFFF",
//           ),
//         );
//       } on Exception catch (e) {
//         debugPrint("Error while picking images: $e");
//       }
//     }

//     // if (!mounted) return;

//     // // Handle the selected images
//     // for (var image in selectedImages) {
//     //   // Do something with the selected images (e.g., display them)
//     // }
//   }
//}
