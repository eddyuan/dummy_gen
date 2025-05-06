// ignore_for_file: public_member_api_docs, sort_constructors_first
class DummyVideo {
  final String video;
  final String thumb;
  final String title;
  final String subtitle;
  const DummyVideo({
    required this.video,
    required this.thumb,
    required this.title,
    required this.subtitle,
  });

  @override
  bool operator ==(covariant DummyVideo other) {
    if (identical(this, other)) return true;

    return other.video == video &&
        other.thumb == thumb &&
        other.title == title &&
        other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return video.hashCode ^ thumb.hashCode ^ title.hashCode ^ subtitle.hashCode;
  }

  DummyVideo copyWith({
    String? video,
    String? thumb,
    String? title,
    String? subtitle,
  }) {
    return DummyVideo(
      video: video ?? this.video,
      thumb: thumb ?? this.thumb,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  static const _vp =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample";
  static const _tp =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images";
  static List<DummyVideo> get allVideos => const [
        DummyVideo(
          video: "$_vp/BigBuckBunny.mp4",
          thumb: "$_tp/BigBuckBunny.jpg",
          title: "Big Buck Bunny",
          subtitle: "By Blender Foundation",
        ),
        DummyVideo(
          video: "$_vp/ElephantsDream.mp4",
          thumb: "$_tp/ElephantsDream.jpg",
          title: "Elephant Dream",
          subtitle: "By Blender Foundation",
        ),
        DummyVideo(
          video: "$_vp/ForBiggerBlazes.mp4",
          thumb: "$_tp/ForBiggerBlazes.jpg",
          title: "For Bigger Blazes",
          subtitle: "By Google",
        ),
        DummyVideo(
          video: "$_vp/ForBiggerEscapes.mp4",
          thumb: "$_tp/ForBiggerEscapes.jpg",
          title: "For Bigger Escape",
          subtitle: "By Google",
        ),
        DummyVideo(
          video: "$_vp/ForBiggerFun.mp4",
          thumb: "$_tp/ForBiggerFun.jpg",
          title: "For Bigger Fun",
          subtitle: "By Google",
        ),
        DummyVideo(
          video: "$_vp/ForBiggerJoyrides.mp4",
          thumb: "$_tp/ForBiggerJoyrides.jpg",
          title: "For Bigger Joyrides",
          subtitle: "By Google",
        ),
        DummyVideo(
          video: "$_vp/ForBiggerMeltdowns.mp4",
          thumb: "$_tp/ForBiggerMeltdowns.jpg",
          title: "For Bigger Meltdowns",
          subtitle: "By Google",
        ),
        DummyVideo(
          video: "$_vp/Sintel.mp4",
          thumb: "$_tp/Sintel.jpg",
          title: "Sintel",
          subtitle: "By Blender Foundation",
        ),
        DummyVideo(
          video: "$_vp/SubaruOutbackOnStreetAndDirt.mp4",
          thumb: "$_tp/SubaruOutbackOnStreetAndDirt.jpg",
          title: "Subaru Outback On Street And Dirt",
          subtitle: "By Garage419",
        ),
        DummyVideo(
          video: "$_vp/TearsOfSteel.mp4",
          thumb: "$_tp/TearsOfSteel.jpg",
          title: "Tears of Steel",
          subtitle: "By Blender Foundation",
        ),
        DummyVideo(
          video: "$_vp/VolkswagenGTIReview.mp4",
          thumb: "$_tp/VolkswagenGTIReview.jpg",
          title: "Volkswagen GTI Review",
          subtitle: "By Garage419",
        ),
        DummyVideo(
          video: "$_vp/WeAreGoingOnBullrun.mp4",
          thumb: "$_tp/WeAreGoingOnBullrun.jpg",
          title: "We Are Going On Bullrun",
          subtitle: "By Garage419",
        ),
        DummyVideo(
          video: "$_vp/WhatCarCanYouGetForAGrand.mp4",
          thumb: "$_tp/WhatCarCanYouGetForAGrand.jpg",
          title: "What care can you get for a grand?",
          subtitle: "By Garage419",
        ),
      ];
}
