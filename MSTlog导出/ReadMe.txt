MSTlog2MGT.m

修改
MGTfilename
LOGfilename

NumStart 为导入MST的MGT文件后截面BEAM编号里未定义的最小编号。
前提：Section的数据均为integer。'%d' int16
string"" char''
strcmp, split, string, char, str2char, str2double, 
sprintf, sscanf, 

1.Load file to string-Array
2.rewrite selfweight part
3.add the missing box-section data from LOG to MGT.
4.write new string-Array to a new mgt file