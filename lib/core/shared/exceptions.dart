// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomException implements Exception {
  final String? msg;

  CustomException({
    this.msg = "Something went wrong!",
  });

  @override
  String toString() => 'CustomException(msg: $msg)';
}
