import 'package:app/api/api.dart';
import 'package:app/api/profile/models/post.model.dart';
import 'package:app/utils/assets.util.dart';
import 'package:app/widgets/home/post.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;

  late final List<Post> _posts;

  @override
  void initState() {
    super.initState();

    getPosts();
  }

  getPosts() async {
    final posts = await API.home.getPosts();

    setState(() {
      _posts = posts;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('socialko'),
        centerTitle: true,
      ),
      backgroundColor: AppAssets.colors.background,
      body: _loading
          ? const Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            )
          : _posts.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemCount: _posts.length,
                    itemBuilder: (context, index) => HomePostWidget(
                      width: width * 0.95,
                      post: _posts[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15.0),
                  ),
                )
              : const Center(
                  child: Text('There are no posts'),
                ),
    );
  }
}
