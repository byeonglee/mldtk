import MLib;

void main(list<string> args) {
}

Code<sql,stmt> exist(boolean isIndexType, Code<sql,expr> elementName)
{
   Code<sql,expr> elemType;
   if (isIndexType) {
     elemType = `sql(expr)["index"];
   } else {
     elemType = `sql(expr)[table];
   }
   return `sql(stmt)[
     select name from sqlite_master
       where type = $elemType and name = $elementName
   ];
}
