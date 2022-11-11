import 'package:bakery_order_system/features/file_upload/bloc/file_upload_bloc.dart';
import 'package:bakery_order_system/features/file_upload/presentation/file_upload_widget.dart';
import 'package:bakery_order_system/features/products/bloc/product_bloc.dart';
import 'package:bakery_order_system/features/products/domain/category.dart';
import 'package:bakery_order_system/features/products/domain/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductWidget extends StatelessWidget {
  CreateProductWidget({super.key});

  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FileUploadWidget(),
        BlocListener<FileUploadBloc, FileUploadState>(
            listener: (context, state) {
              print(state.toString());
              if (state is UploadSuccess) {
                _imagePath = state.fileUrl;
              }
            },
            child: Text(_imagePath ?? "No image path")),
        ElevatedButton(
            onPressed: () =>
                context.read<ProductBloc>().add(NewProduct(_testProduct())),
            child: const Text("Add product")),
      ],
    );
  }

  _testProduct() {
    return Product(
        name: "Cake",
        description: "",
        price: 350,
        category: Category.desserts,
        active: true,
        path: _imagePath);
  }
}
