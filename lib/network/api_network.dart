import 'package:dio/dio.dart';
import 'package:exercisemates/module/home_page/model/exercises.dart';
import 'package:retrofit/http.dart';

part 'api_network.g.dart';
const String productionUrl = "https://exercisedb.p.rapidapi.com/";

@RestApi(baseUrl: productionUrl)
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;
  
  @GET('/exercises')
  Future<List<Exercises>> getAllExercises();

  @GET('exercises/exercise/{id}')
  Future<Exercises> getExerciseById(@Path('id') String id);


}