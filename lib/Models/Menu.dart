import 'dart:core';

class Menu{
    String name;
    String type;
    String description;
    String imageURL;
    num price;
    num calorie;
    num protein;
    num lipid;
    num carbohydrate;
    num sodium;
    num saltEquivalent;

    Menu(String name,String type,String description, String imageURL, num price,num calorie,num protein,num lipid,num carbohydrate,num sodium,num saltEquivalent){
        this.name = name;
        this.type = type;
        this.description = description;
        this.imageURL = imageURL;
        this.price = price;
        this.calorie = calorie;
        this.protein = protein;
        this.lipid = lipid;
        this.carbohydrate = carbohydrate;
        this.sodium = sodium;
        this.saltEquivalent = saltEquivalent;
    }
    Menu.fromJson(Map<String,dynamic> json)
        : name = json['name'],
            type = json['type'],
            price = json['price'],
            calorie = json['calorie'],
            protein = json['protein'],
            lipid = json['lipid'],
            carbohydrate = json['carbohydrate'],
            sodium = json['sodium'],
            saltEquivalent = json['saltEquivalent'],
            description = json['description'],
            imageURL = json['imageURL'];
    Map toJson(){
        return {'name':name,'type':type,'price':price,'calorie':calorie,'protein':protein,'lipid':lipid,'carbohydrate':carbohydrate,'sodium':sodium,'saltEquivalent':saltEquivalent,'description':description,'imageURL':imageURL};
    }
}