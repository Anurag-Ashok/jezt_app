import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jezt_app/const.dart';
import 'package:jezt_app/pages/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class newsPage extends StatefulWidget {
  const newsPage({super.key});

  @override
  State<newsPage> createState() => _whetherPageState();
}

class _whetherPageState extends State<newsPage> {
  final Dio dio = Dio();
  List<Article> articles = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(1000, 216, 191, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10000, 216, 191, 216),
        title: Text(
          "News Updates",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: loading == true
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ListTile(
                  onTap: () {
                    _launchUrl(Uri.parse(article.url ?? ""));
                  },
                  leading: Image.network(
                    article.urlToImage ?? image,
                    height: 250,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(article.title ?? ""),
                  subtitle: Text(article.publishedAt ?? ""),
                );
              },
            ),
    );
  }

  Future<void> _getNews() async {
    final response = await dio.get(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-02-13&sortBy=publishedAt&apiKey=${NEWS_API_KEY}");
    final articlesJson = response.data["articles"] as List;

    setState(() {
      List<Article> newsArticle =
          articlesJson.map((a) => Article.fromJson(a)).toList();

      //newsArticle = articles.where((a) => a.title != "[Removed]").toList();

      articles = newsArticle;
    });
    loading = false;
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception("Could not launch $url");
    }
  }
}
