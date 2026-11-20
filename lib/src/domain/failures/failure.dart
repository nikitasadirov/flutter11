/// Stable, user-safe failure categories shared by the domain and presentation.
sealed class Failure {
  const Failure(this.message);
  final String message;
}

final class NetworkFailure extends Failure {
  const NetworkFailure()
    : super('Нет подключения к сети. Проверьте соединение.');
}

final class ServerFailure extends Failure {
  const ServerFailure()
    : super('Сервис временно недоступен. Попробуйте позже.');
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Сессия завершена. Войдите снова.');
}

final class ValidationFailure extends Failure {
  const ValidationFailure() : super('Проверьте введённые данные.');
}

final class UnknownFailure extends Failure {
  const UnknownFailure()
    : super('Не удалось выполнить операцию. Попробуйте ещё раз.');
}

final class EmptyFailure extends Failure {
  const EmptyFailure() : super('Ничего не найдено.');
}

/// Converts infrastructure exceptions to safe application failures.
Failure mapExceptionToFailure(Object error) {
  if (error is ArgumentError) return const ValidationFailure();
  if (error is StateError) return const ValidationFailure();
  return const UnknownFailure();
}
