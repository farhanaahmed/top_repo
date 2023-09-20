class TopRepositories {
  List<Items>? items;

  TopRepositories({this.items});

  TopRepositories.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? name;
  String? fullName;
  bool? private;
  Owner? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? createdAt;
  int? stargazersCount;
  int? watchersCount;
  List<String>? topics;
  String? visibility;
  String? defaultBranch;

  Items(
      {this.id,
        this.name,
        this.fullName,
        this.private,
        this.owner,
        this.htmlUrl,
        this.description,
        this.fork,
        this.createdAt,
        this.stargazersCount,
        this.watchersCount,
        this.topics,
        this.visibility,
        this.defaultBranch});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url'];
    description = json['description'];
    fork = json['fork'];
    createdAt = json['created_at'];
    stargazersCount = json['stargazers_count'];
    watchersCount = json['watchers_count'];
    topics = json['topics'].cast<String>();
    visibility = json['visibility'];
    defaultBranch = json['default_branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['html_url'] = htmlUrl;
    data['description'] = description;
    data['fork'] = fork;
    data['created_at'] = createdAt;
    data['stargazers_count'] = stargazersCount;
    data['watchers_count'] = watchersCount;
    data['topics'] = topics;
    data['visibility'] = visibility;
    data['default_branch'] = defaultBranch;
    return data;
  }
}

class Owner {
  String? login;
  String? avatarUrl;
  String? url;

  Owner({this.login, this.avatarUrl, this.url});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['avatar_url'] = avatarUrl;
    data['url'] = url;
    return data;
  }
}
