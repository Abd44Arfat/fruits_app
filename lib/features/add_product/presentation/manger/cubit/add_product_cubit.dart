import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;
import 'package:fruits_app/core/repos/images_repo/images_repo.dart';
import 'package:fruits_app/core/repos/product_repo/products_repo.dart';
import '../../../domain/entities/product_entity.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imagesRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(addProductInputEntity.image);
    result.fold(
      (f) {
        emit(
          AddProductFailure(errMessage: f.message), // Named parameter
        );
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(
              AddProductFailure(errMessage: f.message), // Named parameter
            );
          },
          (r) {
            emit(AddProductSucceess());
          },
        );
      },
    );
  }
}