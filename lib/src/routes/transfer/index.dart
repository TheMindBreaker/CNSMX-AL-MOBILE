import 'dart:io';

import 'package:al/models/WareTransfers.dart';
import 'package:al/services/warehouse.dart';
import 'package:al/src/mainMenu.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';

class TransferIndex extends StatefulWidget {
  const TransferIndex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransferIndex();
}

class _TransferIndex extends State<TransferIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<WareTransfers>(
          future: WarehouseService().wareTransfers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data?.error == true){
                return _buildAlertDialog(snapshot.data?.stack);
              } else {
                return _buildOrValidation(snapshot.data!);
              }
            } else if (snapshot.hasError) {
              return _buildAlertDialog(snapshot.error.toString());
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        )
    );
  }

  Widget _buildAlertDialog(error) {
    return AlertDialog(
      title: const Text('Error!'),
      content:
      Text(error),
    );
  }

  Widget _buildOrValidation(WareTransfers info) {


    return SizedBox(
        height: (MediaQuery.of(context).size.height),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:info.data.length,
            itemBuilder: (context,index){
              var data = info.data[index];
              return Card(
                child: ListTile(
                    title: Text(data.proID + ' : ' + data.proDescription),
                    isThreeLine: true,
                    subtitle: Column(
                      children: [
                        Text('Movimiento: TRA:' + data.id.toString()),
                        Text('Origen: ' + data.wareNameOr),
                        Text('Destino: ' + data.wareNameDest),
                        Text('Cantidad: ' + data.quantity.toString() + ' ' + data.proUnit, textScaleFactor: 1.2,),
                      ],
                    ),
                    trailing: data.arrivedDate.isEmpty ? IconButton(
                        onPressed: () {
                          enterTransfer(data.destWare, data.productId, data.quantity, data.id, data.originWare, index, info);
                        },
                        icon:  const Icon(Icons.add, color: Colors.green,)
                    )
                        :
                    const Icon(Icons.close, color: Colors.red,)
                ),
              );
            }
        )
    );



  }

  void enterTransfer(int wareId, int productId,double quantity, int moveId, int originId, int index, WareTransfers info) {
    showLoader();
    WarehouseService().receiveTransfer(wareId, productId, quantity, moveId, originId).then((value) =>{

      hideLoader(),
      if(value.error) {
        showNotification(
          title: 'Error!!!!!',
          message: value.stack!,
          backgroundColor: Colors.red,
          autoDismissible: true,
          notificationDuration: 4000,
        ),
      } else {
        showNotification(
          title: 'Exito :D ',
          message: 'Entrada realizada con exito.',
          backgroundColor: Colors.green,
          autoDismissible: true,
          notificationDuration: 4000,
        ),
      }
    });
    setState(() {});

  }
}