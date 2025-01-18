abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState {}

class ToggleFavoriteButton extends FavoriteButtonState {
  final String message;
  ToggleFavoriteButton(this.message);
}

class FavoriteButtonError extends FavoriteButtonState {
  final String message;
  FavoriteButtonError(this.message);
}
