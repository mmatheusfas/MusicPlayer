// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_player_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerController on _PlayerControllerBase, Store {
  late final _$isPlayingAtom =
      Atom(name: '_PlayerControllerBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$totalSecondsAtom =
      Atom(name: '_PlayerControllerBase.totalSeconds', context: context);

  @override
  int get totalSeconds {
    _$totalSecondsAtom.reportRead();
    return super.totalSeconds;
  }

  @override
  set totalSeconds(int value) {
    _$totalSecondsAtom.reportWrite(value, super.totalSeconds, () {
      super.totalSeconds = value;
    });
  }

  late final _$playMusicAsyncAction =
      AsyncAction('_PlayerControllerBase.playMusic', context: context);

  @override
  Future playMusic(String url) {
    return _$playMusicAsyncAction.run(() => super.playMusic(url));
  }

  late final _$pauseMusicAsyncAction =
      AsyncAction('_PlayerControllerBase.pauseMusic', context: context);

  @override
  Future pauseMusic(String url) {
    return _$pauseMusicAsyncAction.run(() => super.pauseMusic(url));
  }

  late final _$stopMusicAsyncAction =
      AsyncAction('_PlayerControllerBase.stopMusic', context: context);

  @override
  Future stopMusic(String url) {
    return _$stopMusicAsyncAction.run(() => super.stopMusic(url));
  }

  late final _$_PlayerControllerBaseActionController =
      ActionController(name: '_PlayerControllerBase', context: context);

  @override
  dynamic updateSeconds() {
    final _$actionInfo = _$_PlayerControllerBaseActionController.startAction(
        name: '_PlayerControllerBase.updateSeconds');
    try {
      return super.updateSeconds();
    } finally {
      _$_PlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
totalSeconds: ${totalSeconds}
    ''';
  }
}
