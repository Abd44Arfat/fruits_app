import 'package:flutter/widgets.dart';
import 'package:fruits_app/features/orders/domain/entities/data/models/order_entity.dart';
import 'package:fruits_app/features/orders/presentation/views/widgets/order_item.dart';


class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderModels});

  final List<OrderEntity> orderModels;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModels.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(orderModel: orderModels[index]);
      },
    );
  }
}
