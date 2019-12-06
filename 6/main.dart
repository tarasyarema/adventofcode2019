import "dart:io";

Map readLines(String file_name) {
  var g = new Map<String,List<String>>();

  File(file_name).readAsLinesSync().forEach((l) {
    List<String> tmp = l.split(")");
    if (g[tmp[0]] == null) g[tmp[0]] = new List<String>();
    if (g[tmp[1]] == null) g[tmp[1]] = new List<String>();
    if (!g[tmp[0]].contains(tmp[1])) g[tmp[0]].add(tmp[1]);
  });

  return g;
}

// Phase 1
int dfs1(Map g) {
  int o = 0;
  var c = new Map<String,int>();
  var s = new List<String>();
  var v = new Map<String,bool>();

  s.add("COM");
  c["COM"] = 0;
  g.entries.forEach((e) => v[e.key] = false);

  while (!s.isEmpty) {
    String tmp = s.removeLast();

    if (!v[tmp]) {
      v[tmp] = true;

      g[tmp].forEach((e) {
        c[e] = c[tmp] + 1;
        s.add(e);      
      });
    }

  }

  c.entries.forEach((e) => o += e.value);
  return o;
}

// Phase 2
int dfs2(Map g) {
  bool f1 = false, f2 = false;
  var s = new List<String>();
  var v = new Map<String,bool>();
  var p = new Map<String,String>();

  s.add("COM");
  g.entries.forEach((e) => v[e.key] = false);

  while (!s.isEmpty) {
    String tmp = s.removeLast();

    if (!v[tmp] && (!f1 || !f2)) {
      v[tmp] = true;

      g[tmp].forEach((e) {
        p[e] = tmp;
        s.add(e);

        if (e == "YOU") f1 = true;
        if (e == "SAN") f2 = true;     
      });
    }
  }

  String tt = p["YOU"];
  var tmp = new Set<String>();
  var tmp2 = new Set<String>();

  while (tt != "COM") {
    tmp.add(tt);    
    tt = p[tt];
  }

  tt = p["SAN"];

  while (tt != "COM") {
    tmp2.add(tt);    
    tt = p[tt];
  }
  
  return tmp.difference(tmp2).union(tmp2.difference(tmp)).length;
}

void main() => print(dfs2(readLines("in")));
