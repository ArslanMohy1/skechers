import 'package:path/path.dart';
import 'package:skechers/model/order_model.dart';
import 'package:skechers/model/profile_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('orders.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    print('Database path: $path'); // Print the database path

    final database = await openDatabase(path, version: 2, onCreate: _createDB);
    print('Database opened'); // Add a log to indicate database opening
    return database;
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    print('Creating orders table'); // Add a log to indicate table creation
    await db.execute('''
    CREATE TABLE orders (
      id $idType,
      name $textType,
      price $intType,
      size $textType,
      quantity $intType,
      image $textType
    )
    ''');
    print('Orders table created');

    await db.execute('''
  CREATE TABLE profile (
    id $idType,
    name $textType,
    email $textType,
    phoneNumber $textType,
    address $textType,
    imagePath $textType
  )
''');

    await db.execute('''
    CREATE TABLE orderhistory (
      id $idType,
      name $textType,
      price $intType,
      size $textType,
      quantity $intType,
      image $textType
    )
    ''');

    // Add a log to indicate table creation success
  }

  Future<int> insertOrder(Map<String, dynamic> order) async {
    final db = await instance.database;
    return await db.insert('orders', order);
  }
  Future<int> insertOrderhistory(Map<String, dynamic> order) async {
    final db = await instance.database;
    return await db.insert('orderhistory', order);
  }
  Future<List<Order>> getOrders() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('orders');
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        size: maps[i]['size'],
        quantity: maps[i]['quantity'],
        image: maps[i]['image'],
      );
    });
  }
  Future<List<Order>> getOrderhistory() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('orderhistory');
    return List.generate(maps.length, (i) {
      return Order(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        size: maps[i]['size'],
        quantity: maps[i]['quantity'],
        image: maps[i]['image'],
      );
    });
  }

  Future<void> updateOrder(Order order) async {
    final db = await instance.database;
    await db.update(
      'orders',
      order.toMap(),
      where: 'id = ?',
      whereArgs: [order.id],
    );
  }
  Future<void> deleteOrder(int? orderId) async {
    if (orderId == null) {
      // Handle the case where orderId is null
      return;
    }
    final db = await database; // Assume you have a method to get the database instance
    await db.delete(
      'orders', // Replace 'orders' with your actual table name
      where: 'id = ?',
      whereArgs: [orderId],
    );
  }

  Future<int> insertProfile(ProfileModel profile) async {
    final db = await instance.database;
    return await db.insert('profile', profile.toMap());
  }

  Future<ProfileModel?> getProfile() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('profile');
    if (maps.isNotEmpty) {
      return ProfileModel.fromMap(maps.first);
    }
    return null;
  }

  Future<void> updateProfile(ProfileModel profile) async {
    final db = await instance.database;
    await db.update(
      'profile',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

Future<void> deletetable() async {
  final db = await instance.database;
  await db.delete('orders');
}
}


