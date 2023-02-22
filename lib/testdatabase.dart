import 'package:postgres/postgres.dart';

void main() async {
  final conn = PostgreSQLConnection('localhost', 5432, 'kichwayachay',
      username: 'postgres', password: '303134');
  await conn.open();
  // ignore: avoid_print
  print('Connected to PosrgreSQL Database');

  // EXAMPLE TO CREATE A DATABASE
  //   await conn.query('''
  //     CREATE TABLE test(
  //       id int primary key not null,
  //       name varchar
  //     )
  // ''');

  // EXAMPLE TO CREATE DATA
  //   await conn.query('''
  //   INSERT INTO test VALUES (
  //     3031,
  //     'Patricio'
  //   )
  // ''');

  // EXAMPLE TO READ DATA
  // var results = await conn.query('SELECT * FROM test');
  // // print(results);
  // for (var row in results) {
  //   print('''
  //     ===
  //     id: ${row[0]}
  //     name: ${row[1]}
  //     ===
  //   ''');
  // }

  // EXAMPLE TO UPDATE DATA
  // await conn.query('UPDATE test SET name=\'Patricio\' WHERE id=3031');

  // EXAMPLE TO DELETE DATA
  // await conn.query('DELETE FROM test WHERE id=3031');

  await conn.close();
}
