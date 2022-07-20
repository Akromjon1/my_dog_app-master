import 'dart:convert';
BreedVote breedVoteFromJson(String str) => BreedVote.fromJson(json.decode(str));
String breedVoteToJson(BreedVote data) => json.encode(data.toJson());
class BreedVote {
  BreedVote({
      this.id, 
      this.imageId, 
      this.subId, 
      this.createdAt, 
      this.value, 
      this.countryCode,});

  BreedVote.fromJson(dynamic json) {
    id = json['id'];
    imageId = json['image_id'];
    subId = json['sub_id'];
    createdAt = json['created_at'];
    value = json['value'];
    countryCode = json['country_code'];
  }
  int? id;
  String? imageId;
  String? subId;
  String? createdAt;
  int? value;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image_id'] = imageId;
    map['sub_id'] = subId;
    map['created_at'] = createdAt;
    map['value'] = value;
    map['country_code'] = countryCode;
    return map;
  }

}