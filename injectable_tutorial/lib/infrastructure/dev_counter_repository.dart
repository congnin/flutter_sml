import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';

import '../injection.dart';

@Environment(Env.dev)
@Injectable(as: ICounterRepository)
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}