// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_playlist.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarPlaylistCollection on Isar {
  IsarCollection<IsarPlaylist> get isarPlaylists => this.collection();
}

const IsarPlaylistSchema = CollectionSchema(
  name: r'IsarPlaylist',
  id: 596231180705832295,
  properties: {
    r'creator': PropertySchema(
      id: 0,
      name: r'creator',
      type: IsarType.string,
    ),
    r'currentSongIndex': PropertySchema(
      id: 1,
      name: r'currentSongIndex',
      type: IsarType.long,
    ),
    r'currentSongTimeSec': PropertySchema(
      id: 2,
      name: r'currentSongTimeSec',
      type: IsarType.long,
    ),
    r'isShuffled': PropertySchema(
      id: 3,
      name: r'isShuffled',
      type: IsarType.bool,
    ),
    r'order': PropertySchema(
      id: 4,
      name: r'order',
      type: IsarType.string,
      enumMap: _IsarPlaylistorderEnumValueMap,
    ),
    r'playlistImagePath': PropertySchema(
      id: 5,
      name: r'playlistImagePath',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 6,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _isarPlaylistEstimateSize,
  serialize: _isarPlaylistSerialize,
  deserialize: _isarPlaylistDeserialize,
  deserializeProp: _isarPlaylistDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'songs': LinkSchema(
      id: -1394658498559321984,
      name: r'songs',
      target: r'IsarSong',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarPlaylistGetId,
  getLinks: _isarPlaylistGetLinks,
  attach: _isarPlaylistAttach,
  version: '3.1.8',
);

int _isarPlaylistEstimateSize(
  IsarPlaylist object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.creator.length * 3;
  bytesCount += 3 + object.order.name.length * 3;
  bytesCount += 3 + object.playlistImagePath.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _isarPlaylistSerialize(
  IsarPlaylist object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.creator);
  writer.writeLong(offsets[1], object.currentSongIndex);
  writer.writeLong(offsets[2], object.currentSongTimeSec);
  writer.writeBool(offsets[3], object.isShuffled);
  writer.writeString(offsets[4], object.order.name);
  writer.writeString(offsets[5], object.playlistImagePath);
  writer.writeString(offsets[6], object.title);
}

IsarPlaylist _isarPlaylistDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarPlaylist();
  object.creator = reader.readString(offsets[0]);
  object.currentSongIndex = reader.readLong(offsets[1]);
  object.currentSongTimeSec = reader.readLong(offsets[2]);
  object.id = id;
  object.isShuffled = reader.readBool(offsets[3]);
  object.order =
      _IsarPlaylistorderValueEnumMap[reader.readStringOrNull(offsets[4])] ??
          PlaylistOrder.normal;
  object.playlistImagePath = reader.readString(offsets[5]);
  object.title = reader.readString(offsets[6]);
  return object;
}

P _isarPlaylistDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_IsarPlaylistorderValueEnumMap[reader.readStringOrNull(offset)] ??
          PlaylistOrder.normal) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarPlaylistorderEnumValueMap = {
  r'normal': r'normal',
  r'flipped': r'flipped',
  r'byCreator': r'byCreator',
  r'byCreatorFlipped': r'byCreatorFlipped',
  r'byTitle': r'byTitle',
  r'byTitleFlipped': r'byTitleFlipped',
  r'byTime': r'byTime',
  r'byTimeFlipped': r'byTimeFlipped',
};
const _IsarPlaylistorderValueEnumMap = {
  r'normal': PlaylistOrder.normal,
  r'flipped': PlaylistOrder.flipped,
  r'byCreator': PlaylistOrder.byCreator,
  r'byCreatorFlipped': PlaylistOrder.byCreatorFlipped,
  r'byTitle': PlaylistOrder.byTitle,
  r'byTitleFlipped': PlaylistOrder.byTitleFlipped,
  r'byTime': PlaylistOrder.byTime,
  r'byTimeFlipped': PlaylistOrder.byTimeFlipped,
};

Id _isarPlaylistGetId(IsarPlaylist object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarPlaylistGetLinks(IsarPlaylist object) {
  return [object.songs];
}

void _isarPlaylistAttach(
    IsarCollection<dynamic> col, Id id, IsarPlaylist object) {
  object.id = id;
  object.songs.attach(col, col.isar.collection<IsarSong>(), r'songs', id);
}

extension IsarPlaylistQueryWhereSort
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QWhere> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarPlaylistQueryWhere
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QWhereClause> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarPlaylistQueryFilter
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QFilterCondition> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'creator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'creator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creator',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      creatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'creator',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentSongIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentSongIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentSongIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentSongIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongTimeSecEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentSongTimeSec',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongTimeSecGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentSongTimeSec',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongTimeSecLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentSongTimeSec',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      currentSongTimeSecBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentSongTimeSec',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      isShuffledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isShuffled',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderEqualTo(
    PlaylistOrder value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      orderGreaterThan(
    PlaylistOrder value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderLessThan(
    PlaylistOrder value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderBetween(
    PlaylistOrder lower,
    PlaylistOrder upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      orderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'order',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> orderMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'order',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      orderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      orderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'order',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playlistImagePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playlistImagePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playlistImagePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playlistImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      playlistImagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playlistImagePath',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension IsarPlaylistQueryObject
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QFilterCondition> {}

extension IsarPlaylistQueryLinks
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QFilterCondition> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition> songs(
      FilterQuery<IsarSong> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'songs');
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'songs', length, true, length, true);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'songs', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'songs', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'songs', 0, true, length, include);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'songs', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterFilterCondition>
      songsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'songs', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarPlaylistQuerySortBy
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QSortBy> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByCreator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByCreatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByCurrentSongIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongIndex', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByCurrentSongIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongIndex', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByCurrentSongTimeSec() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongTimeSec', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByCurrentSongTimeSecDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongTimeSec', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByIsShuffled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShuffled', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByIsShuffledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShuffled', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByPlaylistImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistImagePath', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      sortByPlaylistImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistImagePath', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarPlaylistQuerySortThenBy
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QSortThenBy> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByCreator() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByCreatorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creator', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByCurrentSongIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongIndex', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByCurrentSongIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongIndex', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByCurrentSongTimeSec() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongTimeSec', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByCurrentSongTimeSecDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentSongTimeSec', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByIsShuffled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShuffled', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByIsShuffledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isShuffled', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByPlaylistImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistImagePath', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy>
      thenByPlaylistImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playlistImagePath', Sort.desc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension IsarPlaylistQueryWhereDistinct
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct> {
  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct> distinctByCreator(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creator', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct>
      distinctByCurrentSongIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentSongIndex');
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct>
      distinctByCurrentSongTimeSec() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentSongTimeSec');
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct> distinctByIsShuffled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isShuffled');
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct> distinctByOrder(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct>
      distinctByPlaylistImagePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playlistImagePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPlaylist, IsarPlaylist, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension IsarPlaylistQueryProperty
    on QueryBuilder<IsarPlaylist, IsarPlaylist, QQueryProperty> {
  QueryBuilder<IsarPlaylist, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarPlaylist, String, QQueryOperations> creatorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creator');
    });
  }

  QueryBuilder<IsarPlaylist, int, QQueryOperations> currentSongIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentSongIndex');
    });
  }

  QueryBuilder<IsarPlaylist, int, QQueryOperations>
      currentSongTimeSecProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentSongTimeSec');
    });
  }

  QueryBuilder<IsarPlaylist, bool, QQueryOperations> isShuffledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isShuffled');
    });
  }

  QueryBuilder<IsarPlaylist, PlaylistOrder, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }

  QueryBuilder<IsarPlaylist, String, QQueryOperations>
      playlistImagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playlistImagePath');
    });
  }

  QueryBuilder<IsarPlaylist, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
