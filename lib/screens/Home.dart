

import 'package:currency_conver/Components/anyToAny.dart';
import 'package:currency_conver/models/ratesmodel.dart';
import 'package:flutter/material.dart';
import '../Components/UsdtoAny.dart';
import '../function/FetchRates.dart';
class Home extends StatefulWidget{
  const Home ({Key?key}):super(key:key);
  @override
  State<Home> createState() =>_HomeState();

}
class _HomeState extends State<Home>{
  late Future<RatesModel>result;
  late Future<Map>result2;
  late Future<Map>allCurrencies;
  final formkey=GlobalKey<FormState>();
  @override
  void initState(){
    super.initState();
    result=FetchRates() ;
    allCurrencies=fetchcurrencies();
  }
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;

   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.indigo.shade400,
       title: const Text('Currency Converter',style: TextStyle(color: Colors.white),),centerTitle: true,
     ),
     body: Container(
       height: h,width: w,
       padding: EdgeInsets.only(top: 65,left: 15,right: 15),
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('Assets/Image/download.png'),fit: BoxFit.cover,
         )
        ),child: SingleChildScrollView(
        child: Form(key: formkey, child: FutureBuilder<RatesModel>(
          future: result ,builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(child:
              FutureBuilder<Map>(
                future: allCurrencies,
                builder:  (context,currSnapshot){
                  if(currSnapshot.connectionState==ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Column(
                    children: [
                        usdtoAny(rates: snapshot.data!.rates, currencies: currSnapshot.data!),
                      SizedBox(height: 75,),
                      anyToAny(rates: snapshot.data!.rates, currencies: currSnapshot.data!),
                    ],
                  );
                },
              ),);
        },),),
       ),),
     );



  }


}