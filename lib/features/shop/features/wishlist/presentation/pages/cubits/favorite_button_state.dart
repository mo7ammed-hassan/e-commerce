abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState {}

class ToggleFavoriteButton extends FavoriteButtonState {}

class FavoriteButtonError extends FavoriteButtonState {
  final String message;
  FavoriteButtonError(this.message);
}
