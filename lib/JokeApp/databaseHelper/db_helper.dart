import 'dart:core';
import 'package:flutter/material.dart';
import 'package:jokes_app/JokeApp/models/joke_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBCheck{

  static final DBCheck instance = DBCheck._init();
  DBCheck._init();

  static Database? _db;

  Future<Database> get database async {
    if(_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join( dbPath,'jokes.db');

    return await openDatabase(path,version: 1,onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {

    //JOKES
    await db.execute('''
    
    CREATE TABLE jokes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    category TEXT,
    content TEXT UNIQUE,
    image TEXT,
    question TEXT,
    answer TEXT,
    is_favourite INTEGER DEFAULT 0,
    is_readed INTEGER DEFAULT 0
  
    )
    ''');

    //CONVERSATIONS

    await db.execute('''
    
    CREATE TABLE conversations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category TEXT UNIQUE
    
    )
    ''');

    //MESSAGES
    await db.execute('''
    CREATE TABLE messages(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    conversation_id  INTEGER,
    speaker TEXT,
    message TEXT,
    is_left INTEGER,
    FOREIGN KEY (conversation_id) REFERENCES conversations(id)
    )
    ''');

  }





  Future insertAllJokes() async {
    final db = await instance.database;

    final existing = await db.query('jokes');
    if(existing.isNotEmpty){
      print("Jokes already inserted");
      return;
    }

    List<Map<String, dynamic>> jokes = [
      {
        'type': 'philosophy',
        'category': 'general',
        'content': 'Life is simple, but we make it complicated',
        'image': '',
        'is_favourite': 0,
        'is_readed' : 0,
      },
      {
        'type': 'philosophy',
        'category': 'general',
        'content': 'Health is Wealth',
        'image': '',
        'is_favourite': 0,
        'is_readed' : 0,
      },
      {
        'type': 'riddles',
        'category': 'general',
        'question':'what is today',
        'answer':'today is today',
        'content': null,
        'image': '',
        'is_favourite': 0,
        'is_readed' : 0,
      },
      {
        'type': 'one line joke',
        'category': 'fun',
        'content': 'I am reading a book on anti-gravity. It’s impossible to put down!',
        'image': ''
      },

    ];

    for (var joke in jokes) {
      try{
        await db.insert('jokes', joke);
      } catch(e){
        print(e);
      }

    }
  }


  Future<void> updateJoke({required JokeContentModel model}) async {
    final db = await instance.database;
    await db.update('jokes', model.jokeMap(), where: 'id =?', whereArgs: [model.id]);
  }

  Future insertConversation() async {
    final db = await instance.database;

    int convId = await db.insert('conversations', {
      'category': 'Husband & Wife'
    });

    await db.insert('messages', {
      'conversation_id': convId,
      'speaker': 'Husband',
      'message': 'Hi',
      'is_left': 0
    });

    await db.insert('messages', {
      'conversation_id': convId,
      'speaker': 'Wife',
      'message': 'Hello',
      'is_left': 1
    });

    //bro and sis
    int bsId = await db.insert('conversations', {
      'category': 'Brother & Sister'
    });

    await db.insert('messages', {
      'conversation_id': bsId,
      'speaker': 'Brother',
      'message': 'Give me chocolate',
      'is_left': 0
    });

    await db.insert('messages', {
      'conversation_id': bsId,
      'speaker': 'Sister',
      'message': 'No ',
      'is_left': 1
    });

    int mdId = await db.insert('conversations', {
      'category': 'mom and dad'
    });


    await db.insert('messages', {
      'conversation_id': mdId,
      'speaker': 'mom',
      'message': 'dinner',
      'is_left': 0
    });

    await db.insert('messages', {
      'conversation_id': mdId,
      'speaker': 'dad',
      'message': 'cook Biriyani ',
      'is_left': 1
    });

  }

  Future<List<Dialogues>> getDialogues(int convId) async {
    final data = await getMessages(convId);
    //print('data from DB => ${data}');
    return data.map((e) => Dialogues.fromJson(e)).toList();
  }


  Future<List<Map<String, dynamic>>> getMessages(int convId) async {
    final db = await instance.database;

    return await db.query(
      'messages',
      where: 'conversation_id = ?',
      whereArgs: [convId],
    );
  }

  Future<List<Map<String, dynamic>>> getJokes(String type) async {

    final db  = await instance.database;
    return await db.query( 'jokes', where: 'type = ?', whereArgs: [type]);
  }


  List<JokeContentModel> mapJokesToModel(List<Map<String, dynamic>> data) {
    //print(data);
    return data.map((e) => JokeContentModel.fromJson(e)).toList();

  }


  Future <List<Map<String, dynamic>>> getFavouritesJokes() async{
    final db = await instance.database;

    return await db.query('jokes', where: 'is_favourite = ?',whereArgs: [1]);

  }




}