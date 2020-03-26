class Link {
  String method;
  String rel;
  String href;

  Link({this.method, this.rel, this.href});

  Link.fromJson(Map<String, dynamic> json) {
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
