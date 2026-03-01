import '../../domain/entities/package_entity.dart';


sealed class PackagesState {
  const PackagesState();
}

class PackagesInitial extends PackagesState {
  const PackagesInitial();
}

class PackagesLoading extends PackagesState {
  const PackagesLoading();
}

class PackagesLoaded extends PackagesState {
  final List<PackageEntity> packages;
  const PackagesLoaded(this.packages);
}

class PackagesError extends PackagesState {
  final String message;
  const PackagesError(this.message);
}
