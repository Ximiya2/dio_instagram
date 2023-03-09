import 'package:dio_instagram/users/widgets/users_item_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/usersModel.dart';
import '../../service/users_service.dart';
import '../../service/utils_service.dart';

class UsersPageItem extends StatefulWidget {
  UsersPageItem({this.id, Key? key}) : super(key: key);
  int? id;

  @override
  State<UsersPageItem> createState() => _UsersPageItemState();
}

TextEditingController idCtr = TextEditingController();
TextEditingController nameCtr = TextEditingController();
TextEditingController userNameCtr = TextEditingController();
TextEditingController emailCtr = TextEditingController();
TextEditingController addressCtr = TextEditingController();
TextEditingController phoneCtr = TextEditingController();
TextEditingController websiteCtr = TextEditingController();
TextEditingController companyCtr = TextEditingController();

TextEditingController streetCtr = TextEditingController();
TextEditingController suiteCtr = TextEditingController();
TextEditingController cityCtr = TextEditingController();
TextEditingController zipcodeCtr = TextEditingController();

TextEditingController latCtr = TextEditingController();
TextEditingController lngCtr = TextEditingController();

TextEditingController nameCompanyCtr = TextEditingController();
TextEditingController catchPhraseCompanyCtr = TextEditingController();
TextEditingController bsCompanyCtr = TextEditingController();

class _UsersPageItemState extends State<UsersPageItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          nameCtr.text,
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              idCtr.text = '';
              nameCtr.text = '';
              userNameCtr.text = '';
              emailCtr.text = '';
              addressCtr.text = '';
              phoneCtr.text = '';
              websiteCtr.text = '';
              companyCtr.text = '';
              _showBottomSheet(context, () async {
                if (idCtr.text.isNotEmpty &&
                    nameCtr.text.isNotEmpty &&
                    userNameCtr.text.isNotEmpty &&
                    emailCtr.text.isNotEmpty &&
                    addressCtr.text.isNotEmpty &&
                    phoneCtr.text.isNotEmpty &&
                    websiteCtr.text.isNotEmpty &&
                    companyCtr.text.isNotEmpty) {
                  Geo newGeo = Geo(lat: latCtr.text, lng: lngCtr.text);
                  Address newAddress = Address(
                    street: streetCtr.text,
                    suite: suiteCtr.text,
                    city: cityCtr.text,
                    zipcode: zipcodeCtr.text,
                    geo: newGeo,
                  );
                  Company newCompany = Company(
                      name: nameCompanyCtr.text,
                      catchPhrase: catchPhraseCompanyCtr.text,
                      bs: bsCompanyCtr.text);
                  UsersModel newPost = UsersModel(
                      id: int.parse(idCtr.text),
                      name: nameCtr.text,
                      username: userNameCtr.text,
                      email: emailCtr.text,
                      address: newAddress,
                      phone: phoneCtr.text,
                      website: websiteCtr.text,
                      company: newCompany);
                  bool result = await GetUsersService.createUsers(newPost);

                  if (result) {
                    Utils.snackBarSucces('Added successfully', context);
                    Navigator.pop(context);
                  } else {
                    Utils.snackBarError('Someting is wrong', context);
                  }
                } else {
                  Utils.snackBarError('Please fill all fileds', context);
                }
              });
            },
            icon: Icon(Icons.add),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: GetUsersService.getUserById(widget.id!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return  Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: UsersItemPage(
                    context: context,
                    users: snapshot.data!,
                    edit: () async {
                      idCtr.text = snapshot.data!.id.toString();
                      nameCtr.text = snapshot.data!.name;
                      _showBottomSheet(
                        context,
                            () async {
                          if (idCtr.text.isNotEmpty &&
                              nameCtr.text.isNotEmpty &&
                              userNameCtr.text.isNotEmpty &&
                              emailCtr.text.isNotEmpty &&
                              addressCtr.text.isNotEmpty &&
                              phoneCtr.text.isNotEmpty &&
                              websiteCtr.text.isNotEmpty &&
                              companyCtr.text.isNotEmpty) {
                            Geo newGeo =
                            Geo(lat: latCtr.text, lng: lngCtr.text);
                            Address newAddress = Address(
                              street: streetCtr.text,
                              suite: suiteCtr.text,
                              city: cityCtr.text,
                              zipcode: zipcodeCtr.text,
                              geo: newGeo,
                            );
                            Company newCompany = Company(
                                name: nameCompanyCtr.text,
                                catchPhrase: catchPhraseCompanyCtr.text,
                                bs: bsCompanyCtr.text);
                            UsersModel newPost = UsersModel(
                                id: int.parse(idCtr.text),
                                name: nameCtr.text,
                                username: userNameCtr.text,
                                email: emailCtr.text,
                                address: newAddress,
                                phone: phoneCtr.text,
                                website: websiteCtr.text,
                                company: newCompany);
                            bool result =
                            await GetUsersService.editUsers(newPost);

                            if (result) {
                              Utils.snackBarSucces(
                                  'Update successfully', context);
                              Navigator.pop(context);
                            } else {
                              Utils.snackBarError(
                                  'Someting is wrong', context);
                            }
                          } else {
                            Utils.snackBarError(
                                'Please fill all fileds', context);
                          }
                        },
                      );
                      if (idCtr.text.isNotEmpty &&
                          nameCtr.text.isNotEmpty &&
                          userNameCtr.text.isNotEmpty &&
                          emailCtr.text.isNotEmpty &&
                          addressCtr.text.isNotEmpty &&
                          phoneCtr.text.isNotEmpty &&
                          websiteCtr.text.isNotEmpty &&
                          companyCtr.text.isNotEmpty) {
                        Geo newGeo =
                        Geo(lat: latCtr.text, lng: lngCtr.text);
                        Address newAddress = Address(
                          street: streetCtr.text,
                          suite: suiteCtr.text,
                          city: cityCtr.text,
                          zipcode: zipcodeCtr.text,
                          geo: newGeo,
                        );
                        Company newCompany = Company(
                            name: nameCompanyCtr.text,
                            catchPhrase: catchPhraseCompanyCtr.text,
                            bs: bsCompanyCtr.text);
                        UsersModel newPost = UsersModel(
                            id: int.parse(idCtr.text),
                            name: nameCtr.text,
                            username: userNameCtr.text,
                            email: emailCtr.text,
                            address: newAddress,
                            phone: phoneCtr.text,
                            website: websiteCtr.text,
                            company: newCompany);
                        bool result =
                        await GetUsersService.editUsers(newPost);

                        if (result) {
                          Utils.snackBarSucces(
                              'Update successfully', context);
                          Navigator.pop(context);
                        } else {
                          Utils.snackBarError(
                              'Someting is wrong', context);
                        }
                      }
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text('No data'),
                );
              }
            }),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, void Function() func) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (
        BuildContext context,
      ) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Add new album',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  controller: nameCtr,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextFormField(
                  controller: userNameCtr,
                  decoration: InputDecoration(labelText: 'User Name'),
                ),
                TextFormField(
                  controller: emailCtr,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: phoneCtr,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  controller: websiteCtr,
                  decoration: InputDecoration(labelText: 'Website'),
                ),
                TextFormField(
                  controller: companyCtr,
                  decoration: InputDecoration(labelText: 'Company'),
                ),
                ElevatedButton(
                  onPressed: func,
                  child: Text('Add'),
                ),
                SizedBox(
                  height: 400,
                )
              ],
            ),
          ),
        );
      });
}
