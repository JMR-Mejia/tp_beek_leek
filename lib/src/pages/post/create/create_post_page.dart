import 'package:flutter/material.dart';
import 'package:tp_beek_leek/src/pages/post/create/create_post_controller.dart';
import 'package:tp_beek_leek/src/widgets/button_app.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({super.key});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late final CreatePostController _createPostController = CreatePostController(context);
  late final args = ModalRoute.of(context)!.settings.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Text(
                  'Que piensas?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                // "titulo" como valor por defecto
                child: TextField(
                  controller: _createPostController.titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Titulo',
                  ),

                ),
              ),
              // description campo grande
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: TextField(
                  controller: _createPostController.bodyController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    hintText: 'Descripcion',
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: ButtonApp(
                    text: 'Crear',
                    onPressed: _createPostController.createPost,
                  )),
            ],
          ),
        )),
      ),
    );
  }
}