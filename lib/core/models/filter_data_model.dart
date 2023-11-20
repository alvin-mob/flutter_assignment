class FilterDataModel {
  String? name;
  String? slug;
  List<Taxonomies>? taxonomies;

  FilterDataModel({this.name, this.slug, this.taxonomies});

  FilterDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(new Taxonomies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.taxonomies != null) {
      data['taxonomies'] = this.taxonomies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Taxonomies {
  int? id;
  String? guid;
  String? slug;
  String? name;
  String? city;
  List<Locations>? locations;

  Taxonomies(
      {this.id, this.guid, this.slug, this.name, this.city, this.locations});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['Guid'];
    slug = json['slug'];
    name = json['name'];
    city = json['city'];
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(new Locations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Guid'] = this.guid;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['city'] = this.city;
    if (this.locations != null) {
      data['locations'] = this.locations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Locations {
  int? id;
  String? guid;
  String? slug;
  String? name;

  Locations({this.id, this.guid, this.slug, this.name});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['Guid'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Guid'] = this.guid;
    data['slug'] = this.slug;
    data['name'] = this.name;
    return data;
  }
}