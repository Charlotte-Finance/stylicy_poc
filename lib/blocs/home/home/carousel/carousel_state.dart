part of 'carousel_bloc.dart';

enum CarouselStatus { initial, loading, success, failure }

class CarouselState extends Equatable {
  final CarouselStatus status;
  final List<String> pictures;
  final int index;

  CarouselState({
    this.status = CarouselStatus.initial,
    List<String>? pictures,
    int? index,
  })  : pictures = pictures ?? [],
        index = index ?? 0;

  CarouselState copyWith({
    CarouselStatus? status,
    List<String>? pictures,
    int? index,
  }) {
    return CarouselState(
      status: status ?? this.status,
      pictures: pictures ?? this.pictures,
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [status, pictures, index];
}
