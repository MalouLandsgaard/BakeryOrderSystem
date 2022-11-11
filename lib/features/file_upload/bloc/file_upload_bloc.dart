import 'package:bakery_order_system/features/file_upload/data/upload_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

part 'file_upload_event.dart';
part 'file_upload_state.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  final UploadRepository _uploadRepo;
  FileUploadBloc(this._uploadRepo) : super(FileUploadInitial()) {
    on<FileUploadEvent>((event, emit) {});

    on<NewUpload>(
      (event, emit) async {
        emit(PickingFile());
        var file = await event.file.readAsBytes();
        await emit.forEach(
            _uploadRepo.uploadFile(file, event.file.name, "productImages/uid1"),
            onData: (TaskSnapshot snapshot) {
          print(snapshot.state.name + "hello");

          return UploadInProgress(snapshot);
        });
      },
      //transformer: restartable(),
    );

    on<GetUpload>((event, emit) async {
      await event.ref.getDownloadURL().then((fileURL) {
        print("fileurl: $fileURL");
        emit(UploadSuccess(fileURL));
      });
    });
  }

  // getUrl(Reference ref, Emitter<FileUploadState> emit) async {
  //   await ref.getDownloadURL().then((fileURL) {
  //     print("fileurl: $fileURL");
  //     emit(UploadSuccess(fileURL));
  //   });
  // }
}
