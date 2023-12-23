
import '../model/schedule/booking_infor.dart';
import '../responses/list_booking_response.dart';
import '../services/api_service.dart';
import 'base_repository.dart';

class BookingRepository extends BaseRepository {
  static const String prefix = "booking/";

  BookingRepository() : super(prefix);

  Future<void> getIncomingLessons({
    required String accessToken,
    required String now,
    required int page,
    required int perPage,
    required Function(List<BookingInfo>, int) onSuccess,
    required Function(String) onFail,
  }) async {
    final response = await service.get(
        url:
            "list/student?page=$page&perPage=$perPage&dateTimeGte=$now&orderBy=meeting&sortBy=desc",
        headers: {"Authorization": "Bearer $accessToken"}) as BoundResource;

    switch (response.statusCode) {
      case 200:
      case 201:
        var result = ResponseGetListBooking.fromJson(response.response).data;
        onSuccess(result?.rows ?? [], result?.count ?? 0);
        break;
      default:
        onFail(response.errorMsg.toString());
        break;
    }
  }
}
