class HomeSliderAndTourismDeatilResponse {
  String? type;
  String? name;
  Model? model;
  String? component;
  bool? open;
  bool? isContainer;

  HomeSliderAndTourismDeatilResponse(
      {this.type,
        this.name,
        this.model,
        this.component,
        this.open,
        this.isContainer});

  HomeSliderAndTourismDeatilResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    model = json['model'] != null ? new Model.fromJson(json['model']) : null;
    component = json['component'];
    open = json['open'];
    isContainer = json['is_container'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    if (this.model != null) {
      data['model'] = this.model!.toJson();
    }
    data['component'] = this.component;
    data['open'] = this.open;
    data['is_container'] = this.isContainer;
    return data;
  }
}

class Model {
  List<String>? serviceTypes;
  String? title;
  String? subTitle;
  int? bgImage;
  String? style;
  List<String>? listSlider;
  String? titleForCar;
  String? titleForEvent;
  String? titleForSpace;
  String? titleForHotel;
  String? titleForTour;
  String? hideFormSearch;
  String? titleForFlight;
  String? singleFormSearch;
  String? bgImageUrl;

  Model(
      {this.serviceTypes,
        this.title,
        this.subTitle,
        this.bgImage,
        this.style,
        this.listSlider,
        this.titleForCar,
        this.titleForEvent,
        this.titleForSpace,
        this.titleForHotel,
        this.titleForTour,
        this.hideFormSearch,
        this.titleForFlight,
        this.singleFormSearch,
        this.bgImageUrl});

  Model.fromJson(Map<String, dynamic> json) {
    serviceTypes = json['service_types'].cast<String>();
    title = json['title'];
    subTitle = json['sub_title'];
    bgImage = json['bg_image'];
    style = json['style'];
    if (json['list_slider'] != null) {
      listSlider = <String>[];
      json['list_slider'].forEach((v) {
        listSlider!.add(v);
      });
    }
    titleForCar = json['title_for_car'];
    titleForEvent = json['title_for_event'];
    titleForSpace = json['title_for_space'];
    titleForHotel = json['title_for_hotel'];
    titleForTour = json['title_for_tour'];
    hideFormSearch = json['hide_form_search'];
    titleForFlight = json['title_for_flight'];
    singleFormSearch = json['single_form_search'];
    bgImageUrl = json['bg_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_types'] = this.serviceTypes;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['bg_image'] = this.bgImage;
    data['style'] = this.style;
    if (this.listSlider != null) {
      data['list_slider'] = this.listSlider;
    }
    data['title_for_car'] = this.titleForCar;
    data['title_for_event'] = this.titleForEvent;
    data['title_for_space'] = this.titleForSpace;
    data['title_for_hotel'] = this.titleForHotel;
    data['title_for_tour'] = this.titleForTour;
    data['hide_form_search'] = this.hideFormSearch;
    data['title_for_flight'] = this.titleForFlight;
    data['single_form_search'] = this.singleFormSearch;
    data['bg_image_url'] = this.bgImageUrl;
    return data;
  }
}
