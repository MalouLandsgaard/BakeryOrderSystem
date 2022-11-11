part of 'file_upload_bloc.dart';

abstract class FileUploadEvent extends Equatable {
  const FileUploadEvent();

  @override
  List<Object> get props => [];
}

class NewUpload extends FileUploadEvent {
  final XFile file;
  const NewUpload(this.file);
}

class GetUpload extends FileUploadEvent {
  final Reference ref;
  const GetUpload(this.ref);
}
