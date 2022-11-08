import 'package:bakery_order_system/features/products/data/product_repo.dart';
import 'package:bakery_order_system/features/products/domain/product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepo;
  ProductBloc(this._productRepo) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<FetchProducts>(
      (event, emit) async {
        _fetchData;
      },
    );

    on<NewProduct>(
      (event, emit) async {
        await _productRepo.addProductData(event.product);
        _fetchData;
      },
    );
  }

  _fetchData(Emitter<ProductState> emit) async {
    List<Product> listofProducts = await _productRepo.getAllProductData();
    emit(ProductsLoaded(products: listofProducts));
  }
}
