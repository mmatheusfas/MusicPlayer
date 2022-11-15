// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_favorites.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  late final _$favoritesMusicsAtom =
      Atom(name: '_FavoritesControllerBase.favoritesMusics', context: context);

  @override
  ObservableList<MusicModel> get favoritesMusics {
    _$favoritesMusicsAtom.reportRead();
    return super.favoritesMusics;
  }

  @override
  set favoritesMusics(ObservableList<MusicModel> value) {
    _$favoritesMusicsAtom.reportWrite(value, super.favoritesMusics, () {
      super.favoritesMusics = value;
    });
  }

  late final _$addFavoritesAsyncAction =
      AsyncAction('_FavoritesControllerBase.addFavorites', context: context);

  @override
  Future addFavorites(MusicModel music) {
    return _$addFavoritesAsyncAction.run(() => super.addFavorites(music));
  }

  late final _$_FavoritesControllerBaseActionController =
      ActionController(name: '_FavoritesControllerBase', context: context);

  @override
  dynamic removeFavorites(String? id, bool favorite) {
    final _$actionInfo = _$_FavoritesControllerBaseActionController.startAction(
        name: '_FavoritesControllerBase.removeFavorites');
    try {
      return super.removeFavorites(id, favorite);
    } finally {
      _$_FavoritesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritesMusics: ${favoritesMusics}
    ''';
  }
}
