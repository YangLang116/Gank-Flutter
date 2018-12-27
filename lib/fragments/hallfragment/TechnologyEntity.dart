class TechnologyResultEntity {
  bool error;
  List<TechnologyEntity> results;

  static TechnologyResultEntity fromMap(Map<String, dynamic> map) {
    TechnologyResultEntity resultEntity = new TechnologyResultEntity();
    resultEntity.error = map['error'];
    resultEntity.results = TechnologyEntity.fromMapList(map['results']);
    return resultEntity;
  }
}

class TechnologyEntity {
  String _id;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  String who;
  bool used;
  List<String> images;

  static TechnologyEntity fromMap(Map<String, dynamic> map) {
    TechnologyEntity resultsListBean = new TechnologyEntity();
    resultsListBean._id = map['_id'];
    resultsListBean.createdAt = map['createdAt'];
    resultsListBean.desc = map['desc'];
    resultsListBean.publishedAt = map['publishedAt'];
    resultsListBean.source = map['source'];
    resultsListBean.type = map['type'];
    resultsListBean.url = map['url'];
    resultsListBean.who = map['who'];
    resultsListBean.used = map['used'];

    List<dynamic> dynamicList0 = map['images'];
    if (dynamicList0 != null) {
      resultsListBean.images = new List();
      resultsListBean.images.addAll(dynamicList0.map((o) => o.toString()));
    }
    return resultsListBean;
  }

  static List<TechnologyEntity> fromMapList(dynamic mapList) {
    List<TechnologyEntity> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
