import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/chart_controller.dart';
import 'chart_list_item.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChartController controller = Get.put(ChartController());
    final ScrollController scrollController = ScrollController();

    void _loadMore() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (controller.hasMore.value) {
          controller.fetchOilData();
        }
      }
    }

    void _refresh() {
      controller.refreshOilData();
    }

    scrollController.addListener(_loadMore);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Monthly Crude Oil Processed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _refresh,
            ),
          ],
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.oilDataList.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
              ),
            ),
          );
        } else if (controller.oilDataList.isEmpty) {
          return Center(
            child: Text(
              'No data available',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          );
        } else {
          return Stack(
            children: [
              ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.all(16),
                itemCount: controller.oilDataList.length + (controller.hasMore.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < controller.oilDataList.length) {
                    final oilData = controller.oilDataList[index];
                    return ChartListItem(
                      month: oilData.month,
                      year: oilData.year.toString(),
                      oilCompany: oilData.oilCompany,
                      quantity: oilData.quantity.toString(),
                    );
                  } else {
                    return SizedBox.shrink(); // Placeholder for the loading indicator
                  }
                },
              ),
              if (controller.isLoading.value && controller.oilDataList.isNotEmpty)
                const Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    ),
                  ),
                ),
            ],
          );
        }
      }),
    );
  }
}
