
import 'package:fruits_app/core/repos/images_repo/images_repo.dart';
import 'package:fruits_app/core/repos/product_repo/products_repo.dart';
import 'package:fruits_app/core/repos/product_repo/products_repo_impl.dart';
import 'package:fruits_app/core/services/data_service.dart';
import 'package:fruits_app/core/services/firestore_service.dart';
import 'package:fruits_app/core/services/stoarage_service.dart';
import 'package:fruits_app/core/services/supabase_stoarge.dart';
import 'package:fruits_app/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruits_app/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';
import '../repos/images_repo/images_repo_impl.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<StoarageService>(SupabaseStoargeService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StoarageService>()));
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<OrdersRepo>(
      OrdersRepoImpl(getIt.get<DatabaseService>()));
}




