import 'package:dartz/dartz.dart';

import 'package:fruits_app/core/errors/failures.dart';
import 'package:fruits_app/features/orders/domain/entities/data/models/order_entity.dart';

import '../../../../core/enums/order_enum.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();

  Future<Either<Failure, void>> updateOrder(
      {required OrderStatusEnum status, required String orderID});
}
