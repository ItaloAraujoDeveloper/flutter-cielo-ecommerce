class Links {
  String method;
  String rel;
  String href;

  Links({this.method, this.rel, this.href});

  Links.fromJson(Map<String, dynamic> json) {
    method = json['Method'];
    rel = json['Rel'];
    href = json['Href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Method'] = this.method;
    data['Rel'] = this.rel;
    data['Href'] = this.href;
    return data;
  }
}
