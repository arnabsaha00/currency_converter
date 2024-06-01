import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../models/allCurrencies.dart';
import '../models/ratesmodel.dart';
Future<RatesModel>FetchRates() async{
  final responce=await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=0a2d6ed0cca64aa8a216fa7e7d508ece'));
  print(responce.body);
  final result=ratesModelFromJson(responce.body);
  return result;
}
Future<Map>fetchcurrencies() async{
  final response=await http.get(
      Uri.parse('https://openexchangerates.org/api/currencies.json?app_id=0a2d6ed0cca64aa8a216fa7e7d508ece'));
  final allCurrencies=allCurrenciesFromJson(response.body);
  return allCurrencies;

}


String convertousd(Map exchangeRates,String usd,String currency){
  String input=((exchangeRates[currency]*double.parse(usd).toStringAsFixed(2))).toString();
  return input;
}
String convertoany(Map exchangeRates,String amount,String currencybase,String currencyfinal){
  String output=((double.parse(amount)/exchangeRates[currencybase])*exchangeRates[currencyfinal]).toStringAsFixed(2).toString();
  return output;
}