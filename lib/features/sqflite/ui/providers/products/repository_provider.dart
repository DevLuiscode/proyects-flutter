import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_proyects/features/sqflite/data/datasource/localdata/localdata/product_local_datasource.dart';

import 'package:personal_proyects/features/sqflite/data/repository/local/product_repository_local_impl.dart';

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
