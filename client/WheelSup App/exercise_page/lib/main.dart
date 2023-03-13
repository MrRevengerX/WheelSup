import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

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

class MyExercisePage extends StatefulWidget {
  @override
  State<MyExercisePage> createState() => _MyExercisePage();
}

class _MyExercisePage extends State<MyExercisePage> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const Text(
              'Dumbbell Shoulder',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const Text(
              'Press',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 60),
                Text('      Instructions',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: "Poppins"),
                    textAlign: TextAlign.right),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '1. Be seated steady and hold a dumbbell in each\n  hand \n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '    2.With your palms facing forward and your elbows \n    under your wrists, position the dumbbells at your\n    shoulders \n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '    3. Push the dumbells up and fully extend your arms.\n  ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '     4. Lower the dumbbells back down to your shoulders\n     and repeat the movement until the set is complete \n',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),

//
//
            const SizedBox(height: 0),
            Image.asset(
              "assets/images/Shoulderpress.jpg",
              height: 300,
              width: 300,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBar(alignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    width: 280.0,
                    height: 60.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        var uri =
                            Uri.parse('http://localhost:5000/shoulder_press');
                        var request = http.MultipartRequest('POST', uri);
                        request.files.add(await http.MultipartFile.fromPath(
                            'file', file!.path));
                        var response = await request.send();
                        if (response.statusCode == 200) {
                          print('Uploaded ...');
                        } else {
                          print('Something went wrong!');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(219, 248, 255, 1.0),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "UPLOAD VIDEO",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 8.0,
            )),
        height: 90.0,
        width: 90.0,
        margin: const EdgeInsets.only(
          bottom: 10.0,
          right: 30.0,
        ),
        child: FloatingActionButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.any,
            );
            if (result != null) {
              final path = result.files.single.path!;
              setState(() {
                file = File(path);
              });
            }
          },
          backgroundColor: const Color(0xFF0085D0),
          child: const Icon(
            Icons.navigate_next,
            size: 70,
            color: Colors.white,
          ),
        ),
      ),
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

















