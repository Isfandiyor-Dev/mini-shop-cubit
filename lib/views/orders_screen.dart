import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_shop_cubit/cubit/order_controller.dart';
import 'package:mini_shop_cubit/cubit/states/orders_state.dart';
import 'package:mini_shop_cubit/views/widgets/order_bottom_sheet.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrderController, OrdersState>(
        builder: (context, state) {
          if (state is LoadingOrderState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedOrderState) {
            if (state.products.isEmpty) {
              return const Center(child: Text('No orders found.'));
            }
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final order = state.products[index];
                return ListTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) => OrderBottomSheet(
                         order: order,
                         numberOrder: index,
                      ),
                    );
                  },
                  title: Text('Order #${index + 1}'),
                  subtitle: Text(
                    'Total Price: \$${order.totalPrice.toStringAsFixed(2)}\nDate: ${order.date}',
                  ),
                  isThreeLine: true,
                );
              },
            );
          } else if (state is ErrorOrderState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state.'));
          }
        },
      ),
    );
  }
}
