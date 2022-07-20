import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_dog_app/models/breed_model.dart';
import 'package:my_dog_app/models/breed_vote_model.dart';
import 'package:my_dog_app/services/network_service.dart';

void main() {

  // API_LIST_BREADS
  group("Test: Breed Category in Server", () {

    String? response;
    test("test1: check network: one element", () async {
      response = await NetworkService.GET("${NetworkService.API_LIST_BREADS}/1", NetworkService.paramsEmpty());
      expect(response, isNotNull);
    });

    test("test2: check model", () {
      Breed breed = breedFromJson(response!);
      expect(breed.id, 1);
    });

    test("test3: check network: list", () async {
      response = await NetworkService.GET(NetworkService.API_LIST_BREADS, NetworkService.paramsEmpty());
      expect(response, isNotNull);
    });

    test("test4: check model list", () async {
      List<Breed> breedList = breedListFromJson(response!);
      expect(breedList, isList);
    });
  },


  );
  //API_search_for_breeds_name
  group("Test: Breed search by name", () {
    String? response;
    test("Test: Search for getting response",()async{
      response = await NetworkService.GET(NetworkService.API_BREADS_SEARCH, NetworkService.paramsBreedSearch("American"));
      expect(response, isNotNull);
    });

    test("Test: Search for getting response",()async{
      List<Breed> breedList = breedListFromJson(response!);
      expect(breedList, isList);
    });
  });
  //API_GET_YOUR_VOTES
  group("Test: for getting your votes", () {
    String? response;
    test("Test: Votes for getting response",()async{
      response = await NetworkService.GET(NetworkService.API_BREADS_GET_VOTES, NetworkService.paramsEmpty());
      expect(response, isNotNull);
    });
    test("test2: check model", () {
      BreedVote breedVote = breedVoteFromJson(response!);
      expect(breedVote.id, 103325);
    });
    test("Test: Votes for getting response",()async{
      response = await NetworkService.POST(NetworkService.API_CREATE_VOTE, NetworkService.paramsEmpty(),NetworkService.bodyVotes("asf3", 1));
      expect(response, isNotNull);
    });
  });
}