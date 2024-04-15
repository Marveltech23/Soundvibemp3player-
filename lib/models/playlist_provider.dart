import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:soundvibe/models/songs.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: 'I Remeber',
        artistName: 'Travis green',
        albumArtImagePath: 'assets/images/travisgreen.jpg',
        audioPath:
            'audio/Dunsin_Oyekan_-_Who_Is_On_The_Lords_Side_CeeNaija.com_.mp3'),
    Song(
        songName: 'I Remeber',
        artistName: 'Travis green',
        albumArtImagePath: 'assets/images/travisgreen.jpg',
        audioPath: 'audio/Travis_Greene_-_I_Remember_CeeNaija.com_.mp3'),
    Song(
        songName: 'I Remeber',
        artistName: 'Travis green',
        albumArtImagePath: 'assets/images/travisgreen.jpg',
        audioPath: 'audio/Travis_Greene_-_I_Remember_CeeNaija.com_.mp3'),
  ];

  // current song playing index
  int? _currentSongIndex;
  //audioplayer

  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //construction
  PlaylistProvider() {
    ListenToDuration();
  }

  // initially
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
  }
  //pause current song

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //  play new song

  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to next song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // play previous song

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //list  to duration

  void ListenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((newPosition) {
      _currentDuration = newPosition;

      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
// listen  for current  duration

  // dispose audio play

  //getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  //setters

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    notifyListeners();
  }
}
