import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _selectedImages = [];

  // دالة لتحميل الصور من مكتبة الجهاز
  Future<void> _pickImages() async {
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      _selectedImages.addAll(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختيار الصور'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // إرجاع الصور المختارة إلى الشاشة السابقة
              Navigator.pop(context, _selectedImages);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // يمكنك هنا إضافة خيارات إضافية مثل حذف الصورة
                  },
                  child: Image.file(
                    File(_selectedImages[index].path),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickImages,
            child: Text('اختيار صور جديدة'),
          ),
        ],
      ),
    );
  }
}
