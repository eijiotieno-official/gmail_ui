import 'dart:math';

String generateId(int length) {
  const String charset =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();

  // Generate random characters from the charset
  Iterable<String> randomChars =
      Iterable.generate(length, (_) => charset[random.nextInt(charset.length)]);

  // Convert the iterable to a String
  return randomChars.join();
}
