import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student ID',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const IdFormCard(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String name;
  final String id;
  final String nationality;
  final String department;
  final String title;
  final Uint8List? profileImage;

  const MyHomePage({
    super.key,
    required this.name,
    required this.id,
    required this.nationality,
    required this.department,
    required this.title,
    required this.profileImage,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color containerColor = Colors.white;
  Color containerColor2 = const Color.fromARGB(255, 26, 76, 53);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void changeColor() {
    setState(() {
      containerColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  void changeColorHalf() {
    setState(() {
      containerColor2 = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  late TextStyle currentFont;

  static final List<TextStyle Function()> fontList = [
    () => GoogleFonts.lato(),
    () => GoogleFonts.roboto(),
    () => GoogleFonts.poppins(),
    () => GoogleFonts.montserrat(),
    () => GoogleFonts.oswald(),
    () => GoogleFonts.raleway(),
    () => GoogleFonts.openSans(),
    () => GoogleFonts.merriweather(),
    () => GoogleFonts.sourceSans3(),
    () => GoogleFonts.nunito(),
  ];

  @override
  void initState() {
    super.initState();
    currentFont = GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.normal,
    );
  }

  void changeFont() {
    final random = Random();
    setState(() {
      currentFont = fontList[random.nextInt(fontList.length)]().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 226, 64),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 450,
              decoration: BoxDecoration(
                color: containerColor,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Green Header
                      Container(
                        width: double.infinity,
                        height: 150,
                        color: containerColor2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/iutlogo.png',
                                width: 75,
                                height: 75,
                                fit: BoxFit.contain,
                              ),
                              const Text(
                                'ISLAMIC UNIVERSITY OF TECHNOLOGY',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Profile Image (half in green, half in white)
                      Positioned(
                        top: 102,
                        left: 100,
                        child: Container(
                          width: 100,
                          height: 130,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 20, 57, 40),
                            border: Border.all(
                              color: const Color.fromARGB(255, 25, 78, 40),
                              width: 4,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: widget.profileImage != null
                                ? Image.memory(
                                    widget.profileImage!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/human_picture.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 83),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.key,
                            size: 20,
                            color: Color.fromARGB(255, 55, 109, 39),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Student ID',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 20, 60, 45),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: const BoxDecoration(
                                color: Color(0xFF00BCD4),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              widget.id,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            size: 20,
                            color: Color.fromARGB(255, 55, 109, 39),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 6, 50, 13),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.school,
                            size: 20,
                            color: Color.fromARGB(255, 55, 109, 39),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Program - B.Sc. in ${widget.department}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.people,
                            size: 20,
                            color: Color.fromARGB(255, 55, 109, 39),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Department - ${widget.department}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: Color.fromARGB(255, 55, 109, 39),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.nationality,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: containerColor2,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'A subsidiary organ of OIC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              changeColor();
              changeColorHalf();
            },
            child: const Text("Change Color"),
          ),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: changeFont, child: const Text("Change Font")),
        ],
      ),
    );
  }
}

class IdFormCard extends StatefulWidget {
  const IdFormCard({super.key});

  @override
  State<IdFormCard> createState() => _IdFormCardState();
}

class _IdFormCardState extends State<IdFormCard> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _departmentController = TextEditingController();

  Uint8List? _selectedImageBytes;
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ID Form Card')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      _selectedImageBytes != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(_selectedImageBytes!),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/human_picture.png'),
                            ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: const Text("Select Image"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Enter your ID' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nationalityController,
                  decoration: const InputDecoration(
                    labelText: 'Nationality',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter your nationality'
                      : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _departmentController,
                  decoration: const InputDecoration(
                    labelText: 'Department',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Enter your department'
                      : null,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(
                              name: _nameController.text,
                              id: _idController.text,
                              nationality: _nationalityController.text,
                              department: _departmentController.text,
                              title: "Generated Student ID",
                              profileImage: _selectedImageBytes,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Generate ID Card"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      endDrawer: Drawer(),
    );
  }
}
