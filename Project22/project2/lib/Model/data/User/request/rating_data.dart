import 'package:project2/Base/class/database.dart';
import 'package:project2/Base/constant/applink.dart';

class RatingWorkerData {
  Database database = Database();
  RatingWorkerData(this.database);
  ratingWorker(String workerUsername, String comment, String rate,
      String customerUsername) async {
    var data = await database.postData(Applink.ratingworker, {
      "worker_username": workerUsername,
      "comment": comment,
      "rate": rate,
      "customer_username": customerUsername
    });
    return data.fold((l) => l, (r) => r);
  }

  viewRating(String workerusername) async {
    var data = await database.postData(Applink.viewworkerrating, {
      "worker_username": workerusername,
    });
    return data.fold((l) => l, (r) => r);
  }
}
