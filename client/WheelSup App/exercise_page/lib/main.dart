import 'package:flutter/material.dart';


import 'ExercisePage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyExercisePage(),
    );
  }
}



/*Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if(result==null) return;
    final path = result.files.single.path!;

    setState(()=> file = File(path));
  }
  Future uploadFile() async{


  }

  basename(path) {}


}*/


/*FilePickerResult? result;
 String? _fileName;
 List<PlatformFile>? _pickedfile;
 bool isLoading = false;
 File?fileToDisplay;
void _pickFile() async{
  try{
    setState(() {
      isLoading = true;
    });
    result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if(result!=null){
      _fileName = result!.files.first.name;
      _pickedfile = result!.files.first as List<PlatformFile>?;

      print('File name $_fileName');

    }
    setState(() {
      isLoading = false;
    });

  }catch(e){
    print(e);
  }
}*/

















