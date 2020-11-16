class TenisCourt {
  int court_num;
  bool lights_enabled;
  String player;

  TenisCourt(
    this.court_num,
    [
      this.lights_enabled = false,
      this.player = "Free",
    ]);
}
