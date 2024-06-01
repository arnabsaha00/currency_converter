import 'package:flutter/material.dart';

import '../function/FetchRates.dart';
class usdtoAny extends StatefulWidget{
  final rates;
  final Map currencies;
  const usdtoAny({Key?key,required this.rates,required this.currencies}):super(key: key);
  @override
  State<usdtoAny>createState()=>_UsdToAny();


}
class _UsdToAny extends State<usdtoAny>{
  @override
  String dropdownvalue='INR';
  String answer='Converted Currency';
  TextEditingController usdController=TextEditingController();
  Widget build(BuildContext context) {
var w=MediaQuery.of(context).size.width;
return Card(color: Colors.transparent,
child: Container(padding: const EdgeInsets.all(20),
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      alignment: Alignment.center,
      child: const Text('USD to Any Currency',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
    ),SizedBox(height: 20,),
    TextFormField(
     key: const Key('usd'),
      controller: usdController,
      cursorColor: Colors.white,
      style:  const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        hintText: 'Enter USD',hintStyle: TextStyle(color: Colors.white,)  ,
      ),
      keyboardType: TextInputType.number,
    ),
   const SizedBox(height: 10,)
    ,
    Row(
      children: [
        Expanded(child: DropdownButton<String>(
          dropdownColor: Colors.grey.shade900,
          value: dropdownvalue,

          style: const TextStyle(color: Colors.white),
          icon: const Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
        iconSize: 24,
            elevation: 16,
            isExpanded: true,
        underline: Container(
          height: 2,
          color: Colors.grey.shade400,
        ),onChanged: (String? newValue){
            setState(() {
              dropdownvalue=newValue!;
            });
        },
        items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
          return DropdownMenuItem<String>(
            value:value,
            child: Text(value),);
        }).toList(),)),SizedBox(width: 10,),
        Container(
          child: ElevatedButton(onPressed: (){
            setState(() {
              answer = usdController.text+
                  'USD     =     '+convertousd(widget.rates,usdController.text,dropdownvalue)+' '+dropdownvalue;
            });
          }, child: const Text('convert') ,
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states)=>Colors.blue.shade400),
          ),),
        ),

      ],
    ),
    const SizedBox(height: 15,)
    ,
    Container(child: Text(answer,style: TextStyle(color: Colors.white),),)
  ],
),
),
);
  }

}