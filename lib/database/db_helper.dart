import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static final String _tablesell = 'sellproperty';
  static final String _dbName = 'newdoor.db';
  static int _dbVersion = 1;

  static final String _fname = 'first name';
  static final String _lname = 'last name';
  static final String _email = 'email';
  static final String _contact = 'contact';
  static final String _usertype = 'user type';
  static final String _gender = 'gender';
  static final String _address = 'address';
  static final String _propertyname = 'property name';
  static final String _propertytype = 'property type';
  static final String _propertydesc = 'property desc';
  static final String _propertyaddress = 'property address';
  static final String _area = 'area';
  static final String _bhk = 'bhk';
  static final String _avability = 'avability';
  static final String _selecteditem = 'selected item';
  static final String _addresslink = 'address link';


  static Database? _database;
  void getDatabase(){
    if(_database == null){
      createdatabase();
    }
  }
  Future<void> createdatabase() async {
    var path = join(await getDatabasesPath(),_dbName);
    print('database path : $path');
    return await openDatabse(path,version :_dbVersion

    );

  }
  void insert(){

  }
  void delete(){

  }
  void update(){

  }


}