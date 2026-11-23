import '../../../../core/errors/result.dart';
import '../entity/logout_entity.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase {
  LogoutUseCase({required this.repository});
  final AuthRepository repository;

  Future<Result<LogoutEntity>> call() => repository.logout();
}
