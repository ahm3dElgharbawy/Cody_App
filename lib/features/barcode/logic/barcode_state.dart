part of 'barcode_cubit.dart';

sealed class BarcodeState extends Equatable {
  const BarcodeState();

  @override
  List<Object> get props => [];
}

final class BarcodeInitial extends BarcodeState {}


final class CreateBarcodeSuccess extends BarcodeState{}
final class CreateBarcodeFailure extends BarcodeState{}