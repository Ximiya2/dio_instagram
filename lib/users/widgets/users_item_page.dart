import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/usersModel.dart';
import '../../../service/users_service.dart';
import '../../../service/utils_service.dart';

Widget UsersItemPage(
    {required BuildContext context,
    required UsersModel users,
    required void Function() edit}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: edit,
              icon: Icon(Icons.edit)),
          SizedBox(width: 10,),
          IconButton(
              onPressed: () async {
                bool result = await GetUsersService.deleteUsers(users.id);
                if(result){
                  Utils.snackBarSucces('Deleted successfully', context);
                } else {
                  Utils.snackBarError('Someting is wrong', context);
                }
              },
              icon: Icon(Icons.delete)),
        ],
      ),
      Text(
        "Name - ${users.name}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "User name - ${users.username}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Email - ${users.email}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Street - ${users.address.street}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Suite - ${users.address.suite}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "City - ${users.address.city}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Zipcode - ${users.address.zipcode}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Geo lat - ${users.address.geo.lat}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        "Geo lng - ${users.address.geo.lng}",
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        'Phone number - ${users.phone}',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        users.website,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        'company name - ${users.company.name}',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        'Bs - ${users.company.bs}',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),
      Text(
        'CatchPhrase - ${users.company.catchPhrase}',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black
        ),
      ),


      Divider(thickness: 1,)
    ],
  );
}