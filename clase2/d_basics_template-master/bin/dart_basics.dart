import 'dart:io';

import '../lib/main.dart';

void main(List<String> arguments) {
  // TODO: Instancia [MainConverter]
  final converter = MainConverter();

  print("Convertir:");
  print("1. Binario a Decimal");
  print("2. Decimal a Binario");
  // TODO: Lee la entrada del usuario y conviertela en entero
  int opcion = int.parse(stdin.readLineSync()!);

  if (opcion == 1) {
    print("Escribe el numero binario:");
    // TODO: Lee la entrada del usuario y usa el setter correcto
    converter.binary = stdin.readLineSync()!;
    print('Decimal: ${converter.converterBinary()!}');
  } else if (opcion == 2) {
    print("Escribe el numero decimal:");
    // TODO: Lee la entrada del usuario y usa el setter correcto
    converter.dacimal = stdin.readLineSync()!;
    print('Binario: ${converter.converterDecimal()!}');
  }
}
