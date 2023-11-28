// ignore_for_file: public_member_api_docs, sort_constructors_first
class BtcModel {
  String priceUsd;

  BtcModel({required this.priceUsd});

  factory BtcModel.fromJson(Map<String, dynamic> json) {
    return BtcModel(priceUsd: json['data']['priceUsd']);
  }
}
