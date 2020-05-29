import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:docesnathally/datas/product_data.dart';
import 'package:docesnathally/tiles/product_tile.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(snapshot.data["title"], style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.grid_on,color: Colors.white,),),
              Tab(icon: Icon(Icons.list,color: Colors.white),),
            ],
          ),
        ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").document(snapshot.documentID).collection("itens").getDocuments(),
          builder: (context,snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),);
            else
              return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GridView.builder(
                      padding: EdgeInsets.all(4),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 4,childAspectRatio: 0.65),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          ProductData data = ProductData.fromDocument(snapshot.data.documents[index]);
                          data.category =this.snapshot.documentID;
                          return ProductTile("grid", data);
                        },
                    ),
                    ListView.builder(
                        padding: EdgeInsets.all(4),
                      itemCount: snapshot.data.documents.length,
                        itemBuilder: (context,index){
                          ProductData data = ProductData.fromDocument(snapshot.data.documents[index]);
                          data.category =this.snapshot.documentID;
                          return ProductTile("list",data);
                        },
                    ),
                  ]);
          }
        ),
      ),
    );
  }
}
