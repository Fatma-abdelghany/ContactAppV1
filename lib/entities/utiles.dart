import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source)async{

  final ImagePicker myImagePicker=ImagePicker();
   XFile? myImageFile=await myImagePicker.pickImage(source: source);

   if(myImageFile != null){
     return myImageFile.readAsBytes();
   }else{
     print("No Image Selected");
   }
}