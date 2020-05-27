import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';

import '../injection.dart';

@Environment(Env.prod)
@Injectable(as: ICounterRepository)
class CounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 1;
}