import 'package:bloc_example/bloc/app_bloc.dart';
import 'package:bloc_example/common_widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({Key? key}) : super(key: key);

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void valfn() {
    if (_formKey.currentState!.validate()) {
      context.read<AppBloc>().add(
            AddItem(keyy: controller.text),
          );
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Bloc 8 - Example\nAdd , Remove from list",
                  textAlign: TextAlign.center,
                  style: style(22, Colors.blue, FontWeight.w600)),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: TextFieldWidget(
                hint: "Enter something",
                controller: controller,
                secure: false,
                errMsg: "Please enter something",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: valfn,
                    child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: 100,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.blueAccent),
                        child: Text(
                          "Add",
                          style: style(16, Colors.white, FontWeight.w600),
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => context.read<AppBloc>().add(RemoveItem()),
                    child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.blueAccent),
                        child: Text("Remove",
                            style: style(16, Colors.white, FontWeight.w600))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(state.list[index].toString(),
                                style:
                                    style(18, Colors.black54, FontWeight.w700)),
                            trailing: GestureDetector(
                              onTap: () => context
                                  .read<AppBloc>()
                                  .add(RemoveIndex(indx: index)),
                              child: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

TextStyle style(double size, color, FontWeight weight) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight,
  );
}
