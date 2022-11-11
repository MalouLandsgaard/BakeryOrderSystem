part of 'file_upload_bloc.dart';

abstract class FileUploadState extends Equatable {
  const FileUploadState();

  @override
  List<Object> get props => [];
}

class FileUploadInitial extends FileUploadState {}

class UploadInProgress extends FileUploadState {
  final TaskSnapshot snapshot;
  const UploadInProgress(this.snapshot);

  @override
  List<Object> get props => [snapshot];
}

class UploadSuccess extends FileUploadState {
  final String fileUrl;
  const UploadSuccess(this.fileUrl);
}

class PickingFile extends FileUploadState {}
