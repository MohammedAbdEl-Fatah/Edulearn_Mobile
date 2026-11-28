import 'package:edulearn_mobile/core/errors/result.dart';

abstract class CourseRepository {
  //teacher
  Future<Result<void>> createCoures();
  Future<Result<void>> editCourse();
  //TODO:in new version add discount
  //student
}
