part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {}

class NewProduct extends ProductEvent {
  final Product product;
  const NewProduct(this.product);
}

class DeleteProduct extends ProductEvent {
  final String id;
  const DeleteProduct(this.id);
}
