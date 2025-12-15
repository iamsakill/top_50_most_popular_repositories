part of 'github_repo_model.dart';

class GithubRepoModelAdapter extends TypeAdapter<GithubRepoModel> {
  @override
  final int typeId = 1;

  @override
  GithubRepoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GithubRepoModel(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      stars: fields[3] as int,
      updatedAt: fields[4] as DateTime,
      owner: fields[5] as String,
      avatar: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GithubRepoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.stars)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.owner)
      ..writeByte(6)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GithubRepoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
