import 'package:dartdown/interface.dart';

class Statement {
  // String statement;

  // Statement({String? statement}) {
  //   if statement  null{
  //     this.statement = "";
  //   }else{
  //     this.statement = (String)statement;
  //   }
  // }

  void newline() {}

  // 斜體
  String italic(String s) {
    return "*$s*";
  }

  // 粗體
  String bold(String s) {
    return "**$s**";
  }

  // 等寬字型
  String monospace(String s) {
    return "`$s`";
  }

  // 無序列表
  String unorderList(List<String> list) {
    String result = "";
    int i, len = list.length;

    for (i = 0; i < len; i++) {
      result += "* ${list[i]}\n";
    }

    return result;
  }

  // 有序列表
  String orderList(List<String> list) {
    String result = "";
    int i, len = list.length;

    for (i = 0; i < len; i++) {
      result += "${i + 1}. ${list[i]}\n";
    }

    return result;
  }
}

class LinkableStatement implements IStatement {
  String? description;
  final String url;

  LinkableStatement({required this.url, this.description});

  set des(String value) => description = value;

  @override
  String toMarkdown() {
    if (description == null) {
      return "[$url]($url)";
    } else {
      return "[${description!}]($url)";
    }
  }
}

// ![Pandao editor.md](https://www.mdeditor.tw/images/editormd-logo-180x180.png "Padoru editor.md")
class PictureStatement implements IStatement {
  final String path;
  String? description;
  String? info;

  PictureStatement({required this.path, this.description, this.info});

  set des(String value) => description = value;
  set inf(String value) => info = value;

  @override
  String toMarkdown() {
    description ??= "image";

    if (info == null) {
      return "![$description]($path)";
    } else {
      return "![$description]($path \"$info\")";
    }
  }
}

class LayerStatement implements IStatement {
  Map<int, List<String>> layers = {};
  int layer = 0;

  LayerStatement() {
    layers = {0: <String>[]};
  }

  void addContent(String value) {
    layers[layer]?.add(value);
  }

  void next() {
    layers[++layer] = <String>[];
  }

  @override
  String toMarkdown() {
    String layerMarkdown(int l, String value) {
      String mark = ">" * l;
      return "$mark $value  \n";
    }

    String result = "";
    final int nLayer = layers.length;
    int i, j, nSublayer;
    List<String> layer;

    for (i = 0; i < nLayer; i++) {
      layer = layers[i]!;
      nSublayer = layer.length;

      for (j = 0; j < nSublayer; j++) {
        result += layerMarkdown(i + 1, layer[j]);
      }
    }

    return result;
  }
}
