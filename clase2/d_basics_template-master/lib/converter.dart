abstract class Converter {
  static String bin2dec(String binary) {
    // TODO: convierte [binary] en un [int] de base 2 y luego conviertelo a base 10

    return int.parse(binary, radix: 2).toRadixString(10);
  }

  static String dec2bin(String decimal) {
    // TODO: convierte [decimal] en un [int] de base 10 y luego conviertelo a base 2

    return int.parse(decimal, radix: 10).toRadixString(2);
  }
}
