import 'package:flutter/material.dart';
import 'cart.dart';

class cartDialog extends StatefulWidget {
  final Cart?cart;
  final Function(String productname,int quantity) onClickedDone;

  const cartDialog({Key? key,
      this.cart,
      required this.onClickedDone,
      })
      : super(key: key);

  @override
  _cartDialogState createState() => _cartDialogState();
}

class _cartDialogState extends State<cartDialog> {
  final formkey =GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  @override
  void initState(){
    super.initState();
    if(widget.cart != null){
      final cart = widget.cart;
      nameController.text=cart!.productname;
      quantityController.text=cart.quantity.toString();
    }
  }
  @override
  void dispose(){
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isEditing = widget.cart!=null;
    final title = isEditing?'Editcart':'Addcart';

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8),
              buildName(),
              SizedBox(height: 8),
              buildAmount(),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        buildCancelButton(context),
        buildAddButton(context,isEditing: isEditing),
      ],
    );
  }
  Widget buildName()=> TextFormField(
    controller: nameController,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Enter Name",
    ),
    validator: (name)=>name!=null && name.isEmpty ? "Enter a name": null,
  );
  Widget buildAmount()=> TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Enter Amount",
    ),
    validator: (amount)=>amount!=null && int.tryParse(amount)==null ? "Enter a valid number": null,
    controller: quantityController,
  );
  Widget buildCancelButton(BuildContext context)=>TextButton(
      onPressed: ()=> Navigator.of(context).pop(),
      child: Text("Cancel"),
  );
  Widget buildAddButton(BuildContext context,{required bool isEditing}){
    final text= isEditing ? 'Save': 'Add';
    return TextButton(
        onPressed: () async{
          final isValid = formkey.currentState!.validate();
          if(isValid){
            final name = nameController.text;
            final amount = int.tryParse(quantityController.text)??0;
            widget.onClickedDone(name,amount);
            Navigator.of(context).pop();
          }
        }, child: Text(text));
  }
}
