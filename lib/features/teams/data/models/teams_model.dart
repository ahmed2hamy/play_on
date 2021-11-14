// To parse this JSON data, do
//
//     final teamsModel = teamsModelFromJson(jsonString);

import 'dart:convert';

import 'package:play_on_task/features/players/data/models/players_model.dart';

TeamsModel teamsModelFromJson(String str) =>
    TeamsModel.fromJson(json.decode(str));

String teamsModelToJson(TeamsModel data) => json.encode(data.toJson());

class TeamsModel {
  TeamsModel({
    this.teams,
  });

  List<TeamModel>? teams;

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
        teams: List<TeamModel>.from(
            json["teams"].map((x) => TeamModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams?.map((x) => x.toJson()) ?? []),
      };
}

class TeamModel {
  TeamModel({
    this.id,
    this.name,
    this.shortName,
    this.slug,
    this.founded,
    this.manager,
    this.assistantManager,
    this.abbreviation,
    this.jerseyImage,
    this.teamLogoImage,
    this.teamBadgeImage,
    this.sportId,
    this.showMarketingModal,
    this.marketingModalText,
  });

  int? id;
  String? name;
  String? shortName;
  String? slug;
  dynamic founded;
  String? manager;
  dynamic assistantManager;
  String? abbreviation;
  PlayOnImage? jerseyImage;
  PlayOnImage? teamLogoImage;
  PlayOnImage? teamBadgeImage;
  int? sportId;
  bool? showMarketingModal;
  String? marketingModalText;

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"],
        name: json["name"],
        shortName: json["short_name"],
        slug: json["slug"],
        founded: json["founded"],
        manager: json["manager"],
        assistantManager: json["assistant_manager"],
        abbreviation: json["abbreviation"],
        jerseyImage: PlayOnImage.fromJson(json["jersey_image"]),
        teamLogoImage: PlayOnImage.fromJson(json["team_logo_image"]),
        teamBadgeImage: PlayOnImage.fromJson(json["team_badge_image"]),
        sportId: json["sport_id"],
        showMarketingModal: json["show_marketing_modal"],
        marketingModalText: json["marketing_modal_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
        "slug": slug,
        "founded": founded,
        "manager": manager,
        "assistant_manager": assistantManager,
        "abbreviation": abbreviation,
        "jersey_image": jerseyImage?.toJson(),
        "team_logo_image": teamLogoImage?.toJson(),
        "team_badge_image": teamBadgeImage?.toJson(),
        "sport_id": sportId,
        "show_marketing_modal": showMarketingModal,
        "marketing_modal_text": marketingModalText,
      };
}
