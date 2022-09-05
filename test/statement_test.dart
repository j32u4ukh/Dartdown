import 'package:dartdown/statement.dart';
import 'package:test/test.dart';

void main() {
  test('unorderList', () {
    Statement statement = Statement();
    List<String> ls = List.empty(growable: true);
    ls.add("value1");
    ls.add("value2");
    ls.add("value3");
    String s = statement.unorderList(ls);
    expect(s, "* value1\n* value2\n* value3\n");
  });

  test('orderList', () {
    Statement statement = Statement();
    List<String> ls = List.empty(growable: true);
    ls.add("value1");
    ls.add("value2");
    ls.add("value3");
    String s = statement.orderList(ls);
    expect(s, "1. value1\n2. value2\n3. value3\n");
  });

  test("LinkableStatement1", () {
    LinkableStatement ls = LinkableStatement(url: "http://localhost");
    ls.des = "localhost";
    expect(ls.toMarkdown(), "[localhost](http://localhost)");
  });

  test("LinkableStatement2", () {
    LinkableStatement ls = LinkableStatement(url: "http://localhost");
    expect(ls.toMarkdown(), "[http://localhost](http://localhost)");
  });

  test("LayerStatement", () {
    LayerStatement ls = LayerStatement();
    ls.addContent("Layer 1 - 1");
    ls.next();
    ls.addContent("Layer 2 - 1");
    ls.next();
    ls.addContent("Layer 3 - 1");
    String s = ls.toMarkdown();
    expect(s, "> Layer 1 - 1  \n>> Layer 2 - 1  \n>>> Layer 3 - 1  \n");
  });
}
