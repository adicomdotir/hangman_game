abstract class HomeRepository {
  Future<T> create<T>();

  Future<T> read<T>();

  Future<T> update<T>();

  Future<T> delete<T>();
}
