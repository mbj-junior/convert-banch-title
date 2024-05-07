void main(List<String> arguments) {
  List<String> title = [...arguments];
  String numbertitle = title[0];
  title.removeAt(0);

  print('$numbertitle-${removeAccents(title.join('-'))}');
}

String removeAccents(String text) {
  final Map<String, String> mapAccents = {
    'á': 'a',
    'à': 'a',
    'ã': 'a',
    'â': 'a',
    'é': 'e',
    'ê': 'e',
    'í': 'i',
    'î': 'i',
    'ó': 'o',
    'õ': 'o',
    'ô': 'o',
    'ú': 'u',
    'ç': 'c',
  };

  String formatText = text.toLowerCase().replaceAllMapped(
    RegExp(r'[^\x00-\x7F]'),
    (match) {
      String letra = match.group(0)!;
      return mapAccents[letra] ?? letra;
    },
  ).replaceAll(".", "-");

  return formatText;
}
