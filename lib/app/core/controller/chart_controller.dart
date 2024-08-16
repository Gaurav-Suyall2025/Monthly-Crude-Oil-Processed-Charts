import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../responseModel/OilDataResponse.dart';
import '../utils/api_constants.dart';
import '../utils/app_constants.dart';

class ChartController extends GetxController {
  var oilDataList = <OilData>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var offset = 0;
  final int limit = 20; // Define limit here
  final Dio _dio = Dio(); // Initialize Dio for API requests

  @override
  void onInit() {
    fetchOilData();
    super.onInit();
  }

  Future<void> fetchOilData() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading.value = true;
    try {
      final response = await _dio.get(
        ApiConstants.BASE_URL,
        queryParameters: {
          AppConstants.API_KEY_CONST: ApiConstants.API_KEY,
          AppConstants.FORMAT_CONST: AppConstants.JSON,
          AppConstants.OFFSET: offset,
          AppConstants.LIMIT: limit,
        },
        options: Options(
          headers: {'accept': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data[ApiConstants.RECORDS] as List;
        if (data.isEmpty) {
          hasMore.value = false;
        } else {
          offset += limit;
          oilDataList.addAll(data.map((e) => OilData.fromJson(e)).toList());
        }
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      print('Error fetching data: $e');
      hasMore.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshOilData() async {
    oilDataList.clear();
    offset = 0;
    hasMore.value = true;
    fetchOilData();
  }
}
