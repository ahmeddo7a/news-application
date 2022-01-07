import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
            image: NetworkImage("${article['urlToImage']}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "${article['title']}",
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${article['publishedAt']}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      )
    ],
  ),
);

Widget articleBuilder(list,context){
  return  ConditionalBuilder(
    condition:  list.length>0,
    builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index) => buildArticleItem(list[index],context),
        separatorBuilder: (context,index) => drawDivider(),
        itemCount: 10
    ),
    fallback: (context) => const Center(child: CircularProgressIndicator()),
  );
}

Widget drawDivider() {
  return Container(
    height: 1,
    width: double.infinity,
    color: Colors.grey.shade100,
  );
}

