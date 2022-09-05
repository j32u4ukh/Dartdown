import 'package:dartdown/statement.dart';

class Login {
  @Deprecated("no longer needed")
  void login(String username, String password) {}

  // void login(String info) {}
}

void main(List<String> arguments) {
  LayerStatement ls = LayerStatement();
  ls.addContent("Layer 1 - 1");
  ls.next();
  ls.addContent("Layer 2 - 1");
  ls.next();
  ls.addContent("Layer 3 - 1");
  String s = ls.toMarkdown();
  print(s == "> Layer 1 - 1  \n>> Layer 2 - 1  \n>>> Layer 3 - 1  \n");
}
