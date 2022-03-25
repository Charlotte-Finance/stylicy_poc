import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousel_state.dart';

part 'carousel_event.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselState()) {
    on<FetchPictures>(_onFetchPictures);
    on<FetchIndex>(_onFetchIndex);
  }

  Future<void> _onFetchPictures(
      FetchPictures event, Emitter<CarouselState> emit) async {
    emit(state.copyWith(status: CarouselStatus.loading));
    try {
      List<String> pictures = [
        'assets/home_carousel/0.jpg',
        'assets/home_carousel/1.jpg',
        'assets/home_carousel/2.jpg',
      ];
      return emit(
        state.copyWith(
          status: CarouselStatus.success,
          pictures: pictures,
        ),
      );
    } catch (_) {
      return emit(
        state.copyWith(status: CarouselStatus.failure),
      );
    }
  }

  Future<void> _onFetchIndex(
      FetchIndex event, Emitter<CarouselState> emit) async {
    emit(state.copyWith(index: event.index));
  }
}
