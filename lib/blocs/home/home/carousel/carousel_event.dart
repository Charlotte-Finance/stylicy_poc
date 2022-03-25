part of 'carousel_bloc.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class FetchPictures extends CarouselEvent {
  const FetchPictures();

  @override
  List<Object> get props => [];
}

class FetchIndex extends CarouselEvent {
  final int index;

  const FetchIndex({required this.index});

  @override
  List<Object> get props => [index];
}
