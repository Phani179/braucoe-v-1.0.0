
class ResultInfo
{
  String _papName = "NA";
  String _papGR = "NA";
  int _papGRP = 0;

  String get getPapName => _papName;
  String get getPapGR => _papGR;
  int get getPapGRP => _papGRP;


  set setPapName(String papName)
  {
    _papName = papName;
  }
  set setPapGR(String papGR)
  {
    _papGR = papGR;
  }
  set setPapGRP(int papGRP)
  {
    _papGRP = papGRP;
  }
}