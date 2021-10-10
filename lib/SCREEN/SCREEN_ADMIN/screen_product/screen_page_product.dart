import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doan/SCREEN/SCREEN_ADMIN/screen_product/screen_add_product.dart';
import 'package:flutter_doan/model/model_sanpham.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../service.dart';

class ScreenPageProduct extends StatefulWidget {
  static String routeName = "/admin/product";
  const ScreenPageProduct({Key? key}) : super(key: key);

  @override
  _ScreenPageProductState createState() => _ScreenPageProductState();
}

class _ScreenPageProductState extends State<ScreenPageProduct> {
  List<ModelSanPham> models_1=[];
  SanPham sanPham =new SanPham();
  _getSanPham() {
    EasyLoading.show(status: 'Loading Product...');
    sanPham.getSanPham_1().then((value) {
      setState(() {
        //EasyLoading.showSuccess('Success!');
        models_1 = value;
        EasyLoading.dismiss();
      });
    });

  }

  @override
  void initState() {
    super.initState();
    _getSanPham();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dashboard Product",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  ),

                  SizedBox(height: size.height*0.02,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenAddProduct())
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration:BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Add product",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                     padding: EdgeInsets.all( 10),
                    // margin: EdgeInsets.all( 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5
                                    )
                                ),
                              ),
                              children: [
                                tableHeader("Mã SP"),
                                tableHeader("Tên SP"),
                                tableHeader("ĐƠn giá"),
                                tableHeader("Hình ảnh"),
                                tableHeader("Chi tiết"),
                                tableHeader("SL Mua"),
                                tableHeader("SL Xem"),
                                tableHeader("SL BC"),
                                tableHeader("Mã NCC"),
                                tableHeader("Mã NSX"),
                                tableHeader("Mã LoạiSP"),
                              ],
                            ),

                          ],
                        ),
                       // models_1.length ==0 ? EasyLoading.show():
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: models_1.length,
                            itemBuilder: (context, index){
                              return Table(
                                children: [
                                  tableRow(
                                    context,
                                    size,
                                    masp: models_1[index].maSP,
                                    tensp:models_1[index].tenSP,
                                    dongia: models_1[index].donGia,
                                    ha:models_1[index].hinhAnh,
                                    ct: models_1[index].chiTiet,
                                    mua: models_1[index].soLanMua,
                                    xem: models_1[index].luotXem,
                                    bc:models_1[index].luotBinhChon,
                                    ncc: models_1[index].maNCC+ " : "+ models_1[index].tenNCC,
                                    nsx:models_1[index].maNSX+ " : "+ models_1[index].tenNSX,
                                    loaisp: models_1[index].maLoaiSP+ " : "+ models_1[index].tenLoai,
                                  ),
                                ],
                              );
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      )
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
    });
  }

  TableRow tableRow(context,size, {masp, tensp, dongia, ha, ct, mua, xem, bc, ncc, nsx, loaisp}){
    String ha1=ha;
    return TableRow(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: Colors.grey,
                width: 0.5
            )
        ),
      ),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
              margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
              child:Text(
                masp,
              )
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(tensp,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(dongia,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: ha1.length >=2000 ?  Image.memory(base64Decode(ha)) : Image.network(ha),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(
                ct,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(mua,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),


        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(xem,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),


        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(bc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),



        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(ncc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),



        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(nsx,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),

        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child:  Container(
            margin: EdgeInsets.symmetric( vertical: 20,horizontal: 15),
            child: Text(loaisp,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,),
          ),
        ),

      ],
    );
  }

  Widget tableHeader(text){
    return Container(
      margin: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
