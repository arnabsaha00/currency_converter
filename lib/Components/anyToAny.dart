

import 'package:flutter/material.dart';

import '../function/FetchRates.dart';
class anyToAny extends StatefulWidget{
  final rates;
  final Map currencies;
  const anyToAny({Key?key,required this.rates,required this.currencies}):super(key: key);
  @override
  State<anyToAny>createState()=>_UsdToAny();


}
class _UsdToAny extends State<anyToAny>{
  @override
 String answer='Converted Currency will be show here :)';
  TextEditingController amountController=TextEditingController();
  String dropdownvalue1='INR';
  String dropdownvalue2='AUD';
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Card(
      color: Colors.transparent,
      child: Container(padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Convert any Currency',
                textAlign:TextAlign.right,
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
            ),SizedBox(height: 20,),
            TextFormField(
              key: const ValueKey('amount',),
              controller: amountController,
              cursorColor: Colors.white,
              style:  const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter Amount',hintStyle: TextStyle(color: Colors.black,)
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10,)
            ,
            Row(
              children: [
                Expanded(
                    child: DropdownButton<String>(
                  dropdownColor: Colors.grey.shade900,
                  value: dropdownvalue1,

                  style: const TextStyle(color: Colors.white),
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconSize: 24,
                  elevation: 16,
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
                      onChanged: (String? newValue){
                  setState(() {
                    dropdownvalue1=newValue!;
                  });
                },
                  items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem<String>(value:value,
                      child: Text(value,style: TextStyle(color: Colors.white)),);
                  }).toList(),)),
                Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text('To',style: (TextStyle(color: Colors.white))),
                ),
                Expanded(child: DropdownButton<String>(
                  dropdownColor: Colors.grey.shade900,
                  value: dropdownvalue2,
                  icon: const Icon(Icons.arrow_drop_down_rounded),iconSize: 24,elevation: 16,isExpanded: true,
                  underline: Container(height: 2,color: Colors.grey.shade400),
                  onChanged: (String? newValue){
                    setState(() {
                      dropdownvalue2= newValue!;
                    });
                  },
                    items: widget.currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem<String>(
                        value:value,
                        child: Text(value,style: TextStyle(color: Colors.white)),);
                    }).toList(),
                ),
                ),
              ],
            ),
                const SizedBox(height: 10,),
                Container(
                  child: ElevatedButton(onPressed: (){
                    setState(() {
                      answer = amountController.text+dropdownvalue1+'    =     '+convertoany(widget.rates,amountController.text,dropdownvalue1,dropdownvalue2)+' '+dropdownvalue2;
                    });
                  }, child: const Text('convert') ,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue.shade400),
                    ),),
                ),


            const SizedBox(height: 15,)
            ,
            Container(child: Text(answer,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),)
          ],
        ),
      ),
    );
  }

}