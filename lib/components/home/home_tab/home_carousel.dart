part of '../home_tab.dart';

class _HomeCarousel extends StatelessWidget {
  const _HomeCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselBloc, CarouselState>(builder: (context, state) {
      switch (state.status) {
        case CarouselStatus.initial:
          context.read<CarouselBloc>().add(const FetchPictures());
          break;
        case CarouselStatus.success:
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                    context.read<CarouselBloc>().add(FetchIndex(index: index));
                  },
                ),
                items: state.pictures.map((picture) {
                  return Image.asset(
                    picture,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                }).toList(),
              ),
              DotsIndicator(
                dotsCount: state.pictures.length,
                position: state.index.toDouble(),
                decorator: DotsDecorator(
                  activeColor: Theme.of(context).colorScheme.primary,
                  color: Colors.grey.withOpacity(0.75),
                  activeShape: CircleBorder(
                      side: BorderSide(color: Colors.white.withOpacity(0.5))),
                ),
              ),
            ],
          );
        case CarouselStatus.loading:
          // TODO: Handle this case.
          break;
        case CarouselStatus.failure:
          // TODO: Handle this case.
          break;
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
