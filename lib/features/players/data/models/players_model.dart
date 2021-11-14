// To parse this JSON data, do
//
//     final playersModel = playersModelFromJson(jsonString);

import 'dart:convert';

PlayersModel playersModelFromJson(String str) =>
    PlayersModel.fromJson(json.decode(str));

String playersModelToJson(PlayersModel data) => json.encode(data.toJson());

class PlayersModel {
  PlayersModel({
    this.players,
    this.meta,
  });

  List<Player?>? players;
  Meta? meta;

  factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "players": List<Player>.from(players?.map((x) => x?.toJson()) ?? []),
        "meta": meta?.toJson(),
      };
}

class Meta {
  Meta({
    this.total,
  });

  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}

class Player {
  Player({
    this.id,
    this.firstName,
    this.lastName,
    this.teamName,
    this.position,
    this.positionId,
    this.positionAbbreviation,
    this.price,
    this.currentPriceChangeInfo,
    this.status,
    this.injured,
    this.injuryType,
    this.banned,
    this.banType,
    this.streakEventsProgress,
    this.chanceOfPlaying,
    this.teamAbbreviation,
    this.weeklyPriceChange,
    this.weeklyPriceChangePercentage,
    this.teamId,
    this.headshot,
    this.knownName,
    this.jerseyImage,
    this.score,
    this.humanizeStatus,
    this.shirtNumber,
    this.country,
    this.isConstructor,
    this.seasonScore,
    this.driverData,
    this.constructorData,
    this.bornAt,
    this.seasonPrices,
    this.numFixturesInGameweek,
    this.deletedInFeed,
    this.hasFixture,
    this.displayName,
    this.externalId,
    this.profileImage,
    this.miscImage,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? teamName;
  String? position;
  int? positionId;
  String? positionAbbreviation;
  double? price;
  CurrentPriceChangeInfo? currentPriceChangeInfo;
  dynamic status;
  bool? injured;
  dynamic injuryType;
  bool? banned;
  dynamic banType;
  dynamic streakEventsProgress;
  double? chanceOfPlaying;
  String? teamAbbreviation;
  double? weeklyPriceChange;
  int? weeklyPriceChangePercentage;
  int? teamId;
  Headshot? headshot;
  String? knownName;
  PlayOnImage? jerseyImage;
  int? score;
  dynamic humanizeStatus;
  int? shirtNumber;
  String? country;
  bool? isConstructor;
  double? seasonScore;
  DriverData? driverData;
  ConstructorData? constructorData;
  DateTime? bornAt;
  List<SeasonPrice>? seasonPrices;
  int? numFixturesInGameweek;
  bool? deletedInFeed;
  bool? hasFixture;
  String? displayName;
  String? externalId;
  PlayOnImage? profileImage;
  PlayOnImage? miscImage;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        teamName: json["team_name"],
        position: json["position"],
        positionId: json["position_id"],
        positionAbbreviation: json["position_abbreviation"],
        price: json["price"].toDouble(),
        currentPriceChangeInfo:
            CurrentPriceChangeInfo.fromJson(json["current_price_change_info"]),
        status: json["status"],
        injured: json["injured"],
        injuryType: json["injury_type"],
        banned: json["banned"],
        banType: json["ban_type"],
        streakEventsProgress: json["streak_events_progress"],
        chanceOfPlaying: json["chance_of_playing"],
        teamAbbreviation: json["team_abbreviation"],
        weeklyPriceChange: json["weekly_price_change"].toDouble(),
        weeklyPriceChangePercentage: json["weekly_price_change_percentage"],
        teamId: json["team_id"],
        headshot: Headshot.fromJson(json["headshot"]),
        knownName: json["known_name"] ?? "",
        jerseyImage: PlayOnImage.fromJson(json["jersey_image"]),
        score: json["score"],
        humanizeStatus: json["humanize_status"],
        shirtNumber: json["shirt_number"] ?? 0,
        country: json["country"] ?? "",
        isConstructor: json["is_constructor"],
        seasonScore: json["season_score"],
        driverData: json["driver_data"] == null
            ? null
            : DriverData.fromJson(json["driver_data"]),
        constructorData: json["constructor_data"] == null
            ? null
            : ConstructorData.fromJson(json["constructor_data"]),
        bornAt:
            json["born_at"] == null ? null : DateTime.parse(json["born_at"]),
        seasonPrices: List<SeasonPrice>.from(
            json["season_prices"].map((x) => SeasonPrice.fromJson(x))),
        numFixturesInGameweek: json["num_fixtures_in_gameweek"],
        deletedInFeed: json["deleted_in_feed"],
        hasFixture: json["has_fixture"],
        displayName: json["display_name"],
        externalId: json["external_id"],
        profileImage: PlayOnImage.fromJson(json["profile_image"]),
        miscImage: PlayOnImage.fromJson(json["misc_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "team_name": teamName,
        "position": position,
        "position_id": positionId,
        "position_abbreviation": positionAbbreviation,
        "price": price,
        "current_price_change_info": currentPriceChangeInfo?.toJson(),
        "status": status,
        "injured": injured,
        "injury_type": injuryType,
        "banned": banned,
        "ban_type": banType,
        "streak_events_progress": streakEventsProgress?.toJson(),
        "chance_of_playing": chanceOfPlaying,
        "team_abbreviation": teamAbbreviation,
        "weekly_price_change": weeklyPriceChange,
        "weekly_price_change_percentage": weeklyPriceChangePercentage,
        "team_id": teamId,
        "headshot": headshot?.toJson(),
        "known_name": knownName,
        "jersey_image": jerseyImage?.toJson(),
        "score": score,
        "humanize_status": humanizeStatus,
        "shirt_number": shirtNumber,
        "country": country,
        "is_constructor": isConstructor,
        "season_score": seasonScore,
        "driver_data": driverData?.toJson(),
        "constructor_data": constructorData?.toJson(),
        "born_at": bornAt == null
            ? null
            : "${bornAt?.year.toString().padLeft(4, '0')}-${bornAt?.month.toString().padLeft(2, '0')}-${bornAt?.day.toString().padLeft(2, '0')}",
        "season_prices":
            List<dynamic>.from(seasonPrices?.map((x) => x.toJson()) ?? []),
        "num_fixtures_in_gameweek": numFixturesInGameweek,
        "deleted_in_feed": deletedInFeed,
        "has_fixture": hasFixture,
        "display_name": displayName,
        "external_id": externalId,
        "profile_image": profileImage?.toJson(),
        "misc_image": miscImage?.toJson(),
      };
}

class ConstructorData {
  ConstructorData({
    this.bestFinish,
    this.bestFinishCount,
    this.bestGrid,
    this.bestGridCount,
    this.titles,
    this.championshipPoints,
    this.firstSeason,
    this.poles,
    this.fastestLaps,
    this.country,
    this.highestRaceFinished,
  });

  int? bestFinish;
  int? bestFinishCount;
  int? bestGrid;
  int? bestGridCount;
  int? titles;
  double? championshipPoints;
  String? firstSeason;
  int? poles;
  int? fastestLaps;
  String? country;
  String? highestRaceFinished;

  factory ConstructorData.fromJson(Map<String, dynamic> json) =>
      ConstructorData(
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        titles: json["titles"],
        championshipPoints: json["championship_points"].toDouble(),
        firstSeason: json["first_season"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        country: json["country"],
        highestRaceFinished: json["highest_race_finished"],
      );

  Map<String, dynamic> toJson() => {
        "best_finish": bestFinish,
        "best_finish_count": bestFinishCount,
        "best_grid": bestGrid,
        "best_grid_count": bestGridCount,
        "titles": titles,
        "championship_points": championshipPoints,
        "first_season": firstSeason,
        "poles": poles,
        "fastest_laps": fastestLaps,
        "country": country,
        "highest_race_finished": highestRaceFinished,
      };
}

class CurrentPriceChangeInfo {
  CurrentPriceChangeInfo({
    this.currentSelectionPercentage,
    this.probabilityPriceUpPercentage,
    this.probabilityPriceDownPercentage,
  });

  int? currentSelectionPercentage;
  int? probabilityPriceUpPercentage;
  int? probabilityPriceDownPercentage;

  factory CurrentPriceChangeInfo.fromJson(Map<String, dynamic> json) =>
      CurrentPriceChangeInfo(
        currentSelectionPercentage: json["current_selection_percentage"],
        probabilityPriceUpPercentage: json["probability_price_up_percentage"],
        probabilityPriceDownPercentage:
            json["probability_price_down_percentage"],
      );

  Map<String, dynamic> toJson() => {
        "current_selection_percentage": currentSelectionPercentage,
        "probability_price_up_percentage": probabilityPriceUpPercentage,
        "probability_price_down_percentage": probabilityPriceDownPercentage,
      };
}

class DriverData {
  DriverData({
    this.wins,
    this.podiums,
    this.poles,
    this.fastestLaps,
    this.grandsPrixEntered,
    this.titles,
    this.championshipPoints,
    this.bestFinish,
    this.bestFinishCount,
    this.bestGrid,
    this.bestGridCount,
    this.highestRaceFinished,
    this.placeOfBirth,
  });

  int? wins;
  int? podiums;
  int? poles;
  int? fastestLaps;
  int? grandsPrixEntered;
  int? titles;
  int? championshipPoints;
  int? bestFinish;
  int? bestFinishCount;
  int? bestGrid;
  int? bestGridCount;
  String? highestRaceFinished;
  String? placeOfBirth;

  factory DriverData.fromJson(Map<String, dynamic> json) => DriverData(
        wins: json["wins"],
        podiums: json["podiums"],
        poles: json["poles"],
        fastestLaps: json["fastest_laps"],
        grandsPrixEntered: json["grands_prix_entered"],
        titles: json["titles"],
        championshipPoints: json["championship_points"],
        bestFinish: json["best_finish"],
        bestFinishCount: json["best_finish_count"],
        bestGrid: json["best_grid"],
        bestGridCount: json["best_grid_count"],
        highestRaceFinished: json["highest_race_finished"],
        placeOfBirth: json["place_of_birth"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "podiums": podiums,
        "poles": poles,
        "fastest_laps": fastestLaps,
        "grands_prix_entered": grandsPrixEntered,
        "titles": titles,
        "championship_points": championshipPoints,
        "best_finish": bestFinish,
        "best_finish_count": bestFinishCount,
        "best_grid": bestGrid,
        "best_grid_count": bestGridCount,
        "highest_race_finished": highestRaceFinished,
        "place_of_birth": placeOfBirth,
      };
}

class Headshot {
  Headshot({
    this.profile,
    this.pitchView,
    this.playerList,
  });

  String? profile;
  String? pitchView;
  String? playerList;

  factory Headshot.fromJson(Map<String, dynamic> json) => Headshot(
        profile: json["profile"],
        pitchView: json["pitch_view"],
        playerList: json["player_list"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "pitch_view": pitchView,
        "player_list": playerList,
      };
}

class PlayOnImage {
  PlayOnImage({
    this.url,
  });

  String? url;

  factory PlayOnImage.fromJson(Map<String, dynamic> json) => PlayOnImage(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class SeasonPrice {
  SeasonPrice({
    this.gamePeriodId,
    this.price,
  });

  int? gamePeriodId;
  double? price;

  factory SeasonPrice.fromJson(Map<String, dynamic> json) => SeasonPrice(
        gamePeriodId: json["game_period_id"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "game_period_id": gamePeriodId,
        "price": price,
      };
}
