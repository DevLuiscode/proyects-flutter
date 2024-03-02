import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/objectbox/data/datasource/localdata/localdata/local_datasource.dart';

import 'package:personal_proyects/features/objectbox/data/datasource/memorydata/memory_datasource/memory_datasource.dart';
import 'package:personal_proyects/features/objectbox/data/repository/local/product_repository_local_impl.dart';

import 'package:personal_proyects/features/objectbox/data/repository/memory/product_ropository_imp.dart';

final repositoryProvider = Provider(
  (ref) {
    // return ProductRepositoryImplementation(
    //   productMemoryDatasource: ProductMemoryDatasource(),
    // );
    return ProductRepositoryLocalImplementation(
      productLocalDataSource: ProductLocalDataSource(),
    );
  },
);
