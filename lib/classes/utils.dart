double parseTime(String s) {
  final tkns = s.split(':');
  var hh = 0, mm = 0, ss = 0.0;

  if(tkns.length < 2) {
    return 0.0;
  }
  if(tkns.length < 3) {
    mm = int.tryParse(tkns[0]) ?? 00;
    ss = double.tryParse(tkns[1]) ?? 00;
  } else {
    hh = int.tryParse(tkns[1]) ?? 00;
    mm = int.tryParse(tkns[1]) ?? 00;
    ss = double.tryParse(tkns[2]) ?? 00;
  }
  return hh * 60 * 60 + mm * 60 + ss ;

}