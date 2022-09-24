import 'package:dart_basics/converter.dart';

class MainConverter {
  // TODO: Define dos varibles privadas String nulables: [binary] y [decimal]{
    String? _binary, _decimal;

  }

  MainConverter() {
    // TODO: Inicializa [binary] y [decimal] en ['0'] solo cuando sean nulos
    // TODO-HINT: Null-sound assignment

    _binary ??= '0';
    _decimal ??= '0';
  }


  set binary(String? value) => _binary = value;

  set decimal(String? value) => _decimal = value;

  // TODO: Crea un [setter] para [binary] con el parametro nulable.

  // TODO: Crea un [setter] para [decimal] con el parametro nulable.

  String convertBinary() {

    assert(_binary != null);
    return Converter.bin2dec(_binary!);
    // TODO: Asegurate que [binary] no es nulo antes de intentar la conversion.
    // TODO: Usa [Converter] para convertir el numero binario a un numero decimal.
  }

  String convertDecimal() {

    assert(_decimal != null);
    return Converter.dec2bin(_decimal!);
    // TODO: Asegurate que [decimal] no es nulo antes de intentar la conversion.
    // TODO: Usa [Converter] para convertir el numero decimal a un numero binario.
  }

