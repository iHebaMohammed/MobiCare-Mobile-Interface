class VideoModel{
  late String ? imageUrl;
  late String ? firstName;
  late String ? lastName;
  late bool ? isMale;
  late String ? video;
  late String ? dateTime;
  late String ? dUId;
  String ? caption;

  VideoModel({
    required this.firstName,
    required this.lastName,
    required this.isMale,
    this.caption,
    required this.dateTime,
    required this.dUId,
    required this.imageUrl,
    required this.video,
  });


  VideoModel.fromJson(Map<String , dynamic> json){
    imageUrl = json['imageUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isMale = json['isMale'];
    caption = json['caption'];
    video = json['video'];
    dUId = json['dUId'];
    dateTime = json['dateTime'];
  }

  Map<String , dynamic> toMap(){
    return {
      'imageUrl':imageUrl,
      'firstName':firstName,
      'lastName':lastName,
      'isMale':isMale,
      'caption': caption,
      'video':video,
      'dUId':dUId,
      'dateTime':dateTime
    };
  }
}