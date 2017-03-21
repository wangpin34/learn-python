# wood

windows下开发app，底层container有很多dll，而这些dll的来源分为下面几种

* container发布版

发布版包含很多 dll

* platform 组正在开发中的 dll
这一部分是最杂乱的，可能正在开发的app依赖数个 dll， 而这些 dll来自若干个同事。

针对这样的情况，临时开发一个微型的依赖管理程序。

ps: 当然，如果要从根本上解决这个问题，应该从规范项目开发流程开始，不过那不是可以很快达成的。