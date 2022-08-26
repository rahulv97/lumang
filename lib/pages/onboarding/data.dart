class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  sliderModel.setTitle("SELECT");
  sliderModel.setImageAssetPath("assets/onboarding/1.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  sliderModel.setTitle("PAY");
  sliderModel.setImageAssetPath("assets/onboarding/2.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  sliderModel.setTitle("RECEIVE");
  sliderModel.setImageAssetPath("assets/onboarding/3.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
