import 'dart:math';

String generateId(int length) {
  if (length <= 0) {
    throw ArgumentError("Length should be greater than 0");
  }

  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();

  // Generate random characters from the charset
  Iterable<String> randomChars =
      Iterable.generate(length, (_) => charset[random.nextInt(charset.length)]);

  // Convert the iterable to a String
  return randomChars.join();
}
