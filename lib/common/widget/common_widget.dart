
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/z_model.dart';
import '../route/app_routes.dart';

/// 构建文章列表item
buildArticleItem(Article article,Function connect,Function(String author) author){
  var name = article.author;
  var collect = Icons.favorite;
  if (!article.collect) {
    collect = Icons.favorite_border;
  }

  return GestureDetector(
    onTap: () => AppRoutes.toUrl(article.link),
    child: Container(
      margin: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w),
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 2.0),
          ]),
      child: Padding(
        padding:
        EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w, bottom: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title
            Text(
              article.title,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.more_time_outlined,
                  color: Colors.grey[300],
                  size: 15.w,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  article.niceShareDate,
                  style: TextStyle(fontSize: 12.sp, color: Colors.black26),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () =>author.call(name),
                  child: Text(
                    '$name',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black45),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                Row(
                  children: article.tags
                      .map(
                        (e) => Container(
                      margin: EdgeInsets.only(right: 2.w),
                      decoration: BoxDecoration(
                          border:
                          Border.all(width: 1, color: Colors.purple),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(2))),
                      child: Text(
                        e.name,
                        style: TextStyle(
                            fontSize: 10.sp, color: Colors.black26),
                      ),
                    ),
                  )
                      .toList(),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        article.superChapterName,
                        style:
                        TextStyle(fontSize: 12.sp, color: Colors.black26),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => connect.call(),
                  child: Icon(
                    collect,
                    color: Colors.purple,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}