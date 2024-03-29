import 'package:bloc/bloc.dart';
import 'package:bloc_examples/github_search/model/search_result_error.dart';
import 'package:bloc_examples/github_search/repository/github_repository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'github_search_event.dart';
import 'github_search_state.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  final GithubRepository githubRepository;

  GithubSearchBloc({@required this.githubRepository});

  @override
  Stream<Transition<GithubSearchEvent, GithubSearchState>> transformEvents(
    Stream<GithubSearchEvent> events,
    Stream<Transition<GithubSearchEvent, GithubSearchState>> Function(
      GithubSearchEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  void onTransition(
      Transition<GithubSearchEvent, GithubSearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  GithubSearchState get initialState => SearchStateEmpty();

  @override
  Stream<GithubSearchState> mapEventToState(
    GithubSearchEvent event,
  ) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final results = await githubRepository.search(searchTerm);
          yield SearchStateSuccess(results.items);
        } catch (error) {
          yield error is SearchResultError
              ? SearchStateError(error.message)
              : SearchStateError('something went wrong');
        }
      }
    }
  }
}
