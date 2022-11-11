import 'package:bakery_order_system/features/file_upload/bloc/file_upload_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class FileUploadWidget extends StatelessWidget {
  const FileUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FileUploadBloc, FileUploadState>(
        builder: (context, state) {
      if (state is FileUploadInitial || state is UploadSuccess) {
        return ElevatedButton(
            onPressed: () async {
              pickFile().then((value) {
                if (value != null) {
                  print("Picked file");
                  context.read<FileUploadBloc>().add(NewUpload(value));
                }
              });
            },
            child: const Text("Upload file"));
      }
      if (state is UploadInProgress) {
        switch (state.snapshot.state) {
          case TaskState.running:
            return Text(
                "${100.0 * (state.snapshot.bytesTransferred / state.snapshot.totalBytes)}");
          case TaskState.paused:
            return const Text("Paused upload");
          case TaskState.success:
            context.read<FileUploadBloc>().add(GetUpload(state.snapshot.ref));
            return const Text("Success");
          case TaskState.canceled:
            return const Text("Canceled upload");
          case TaskState.error:
            return const Text("Error on upload");
        }
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  Future<XFile?> pickFile() async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) throw Exception("Canceled image picking");
      return image;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
