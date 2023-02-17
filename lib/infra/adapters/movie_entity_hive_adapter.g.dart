// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/entities/movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieEntityHiveAdapter extends TypeAdapter<MovieEntity> {
  @override
  final int typeId = 0;

  @override
  MovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieEntity(
      image: fields[0] as String,
      name: fields[1] as String,
      releaseDate: fields[2] as String,
      overview: fields[3] as String,
      voteAverage: fields[4] as double,
      genreIds: (fields[5] as List).cast<int>(),
      isFavorite: fields[6] as bool?,
      id: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.releaseDate)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.voteAverage)
      ..writeByte(5)
      ..write(obj.genreIds)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieEntityHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
