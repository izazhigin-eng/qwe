import 'dart:io';
import 'dart:math';

int getInputDouble(Function(int) condition,{String text="Input: " }) {
  print(text);
  while (true) {
    try{
      int num = int.parse(stdin.readLineSync()!);
      print(condition(num));
      if (condition(num).contains(true)) {
        print("God is gay");
        return num;
      }
    }
    catch (e) {
      print(e);
    }
  }
}

List<double Function(int,int)> funcs = [
  (int num1, int num2)=>double.parse("${num1+num2}"),
  (int num1, int num2)=>double.parse("${num1-num2}"),
  (int num1, int num2)=>double.parse("${num1*num2}"),
  (int num1, int num2)=>(num2!=0?double.parse("${num1/num2}"):0.0),
  (int num1, int num2)=>num2!=0?double.parse("${num1~/num2}"):0.0,
  (int num1, int num2)=>double.parse("${num1%num2}"),
  (int num1, int num2)=>double.parse("${pow(num1,num2)}"),
  (int num1, int num2)=>double.parse("${num1==num2}"),
  (int num1, int num2)=>double.parse("${num1!=num2}"),
  (int num1, int num2)=>double.parse("${num1>num2}"),
  (int num1, int num2)=>double.parse("${num1<num2}"),
  (int num1, int num2)=>double.parse("${num1<=num2}"),
  (int num1, int num2)=>double.parse("${num1>=num2}"),
  (int num1, int num2)=>double.parse("${num1==1&&num2==2}"),
  (int num1, int num2)=>double.parse("${num1==1||num2==2}"),
  (int num1, int num2)=>double.parse("${!(num1==1)}")
];

void main() {
  while(true) {
    int num1 = getInputDouble((int num)=>{num>-900000000},text:"Input num 1: ");
    int num2 = getInputDouble((int num)=>{true},text:"Input num 2: ");

    print("Arithmetic");
    print("1.+\n2.-\n3.*\n4./5.%\n6.~/\n7.pow");
    print("Bool");
    print("8.==\n9.!=\n10.>\n11.<\n12.>=\n13.<=\n14.&&\n15.||\n16.!");
    var res = funcs[getInputDouble((int num)=>{num>=0 && num <16 })-1];
    print("${res(num1,num2)}\n");
  }
}