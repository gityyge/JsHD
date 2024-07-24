<p align="center">
  <img width="230px" src="https://yyyp.oss-cn-beijing.aliyuncs.com/%E4%BB%A3%E7%A0%81%E7%9B%B4%E9%93%BE/JsHD%E8%B0%83%E8%AF%95%E5%99%A8/%E5%9B%BE%E6%A0%87/icon.png">
</p>
<div align="center">
<h3>
  JsHD调试器 - 体验手机端的F12
</h3>
</div>
<p align="center">
 <img src="https://img.shields.io/badge/lua-5.3-%231a75cf" />
<img src="https://img.shields.io/badge/androlua-base-%2328c728" />
<img src="https://img.shields.io/badge/javasrcpt-es6-%23ffcc00" />
<img src="https://img.shields.io/badge/eruda-1.4.4-%23e7320c"/>
  <br>
</p>

- 🚀 手机端可视化调试页面
- 💎 一键生成Js代码

## 软件介绍
JsHD调试器(简称:JH)是一款可视化的网页js调试器，它可以在手机端对网页元素进行可视化编辑并生成js代码，它会让你爱上调教网页的感觉。
#### 👓 编辑可视化
它提倡可视化操作的编辑流程，全部网页元素尽收眼底，让你在编辑网页元素时不需要任何JavaScript知识就可以对网页元素进行编辑
#### 🔧 元素编辑功能强大
它能够对网页元素进行编辑
- 1.屏蔽删除网页元素
- 2.输入框自动填写
- 3.输入框提示编辑
- 4.模拟点击元素
- 5.自定义点击链接
- 6.修改网页图片 ...........
妈妈再也不用担心我不会编辑网页啦~
#### 🐞 智能分析调试模块
JsHD内置Js调试模块能智能分析网页动态元素，如元素的最大悬浮层级、统计cookie、资源数、动态标签、嵌套标签等，无需复杂操作，轻松修改网页信息
#### 📚 Js参考手册
JsHD内置了Js常用方法、属性、事件手册，让小白能够快速上手查阅相关语法
#### 📦 Js模板库
它还支持外接的js模板如 强制去除悬浮广告、网页翻译、点击特效等、飘落特效等 在侧边栏找到js模板库直接导入
#### 🧬 Js自定义调用
在JsHD调试器编辑的任何操作，都可以生成JS代码方便各平台调用等
总之JsHD调试器很强大，修改元素分分钟解决

## 💎 作者独白
#### 🎋梦想的种子
本项目开发之初，只是为了解决 能够在手机端屏蔽网页元素的功能，在五年前此功能相当的重要，当时作者还是一个不太懂技术的小白 只是想做一款不用电脑就能屏蔽各种网页元素的软件，于是就开发了JsHD调试器
#### 🏗️实施与落地
通过不断的学习相关技术将JsHD调试器的功能慢慢的完善，从当初的只能屏蔽普通的元素到后来能够支持动态屏蔽，处理其他的简单编辑、导出、js模版等功能....
#### 👾目前状况
作者已从以前的不会到会再到熟练，按理说应该会开发的更快，但随着工作后空闲时间慢慢减少，这些东西在本项目的开发上慢慢发生了变化，以前没有技术的时候只是想着如何去实现它，现在确是在设计、代码质量上，软件维护性上面都要做权衡和考量
自己对于软件的设计不再那么单纯，总是想着要开发的很深入，在设计方面总是觉得有点欠缺，这可能是技术成长的必经之路，一个人的能力有限，完不成的事情太多了。
#### 🌈美好的愿景
 其实类似Fusion App的软件有很多，但是做网页的封装确实不太友好，如果以后能有一款直接通过网址就能够生成原生布局的App工具的话，那么将极大的减少目前小型公司以及个人对于app的开发成本，让跟多的小白能够做出自己的原生app，
JsHD调试器 希望将网页数据分析 然后动态回调抓取列表，在app客户端将数据适配成模版布局生成app，此时数据列表来源于网页返回，将多个网页的数据进行合并映射成app客户端的一个列表。当然这只是一个愿景，如果有感兴趣的小伙伴可以联系作者一起开发新的版本，
#### 📜愿景功能
 - Js的断点调试Hook (Hook各类函数)
 - 自动化分析网页列表数据
 - 适配数据生成布局 并实现打包(自定义签名、权限)
 - 数据库板块（数据合并、远程上传等）
 - ....

本项目的于2019年左右开始由壹影(Gityyge)独立开发并持续更新维护，当时技术条件有限，用老板Fusion App进行开发,并于2020年左右上架各安卓市场，本项目上架后得到了许多用户的一致认可，在此感谢各位粉丝老铁的关注与支持
目前我已是一名全职的后端程序员，在工作中需要投入大量的时间精力去研究工作内容，此项目为独立开发，从交互设计到UI(图片&图标设计)再代码的逻辑编写都是一个人完成的，所以没有太多时间对项目进行升级维护，故在此开源，
本项目采用Apache-2.0 license开源协议，具体见详细开源协议...

## 开源说明 & 代码结构
 此项目初代版本开发时间过于久远(2019)，许多代码冗余，方法名变量名多为中文，逻辑分支不是非常严谨，望使用者见谅，此项目大部分代码都是远程加载 远程加载代码主要在主页、可视化调试页面，主页会默认请求
 - home_loadstring_os.lua - 加载必要函数功能模块(手册) - 主页
 - home_js_mod_os.lua - 加载js调试模块 - 主页
 - home_start_os.lua - 首页的必要函数(杂七杂八的函数) - 主页
 - debug_funs_os.lua - 公共函数(只用于调试页)-可视化调试页
 - debug_js_grab_os.lua - 爬虫Js抓取数据-可视化调试页
 - debug_main_tools_os.lua - 主要编辑窗(屏蔽元素那个窗口)-可视化调试页
 - debug_plugin_os.lua - 调试插件(如爬虫，需要对单个元素定位的一些插件)-可视化调试页
 - debug_style_edit_os.lua - 样式编辑页面-可视化调试页
 - debug_style_tools_os.lua - 样式弹出对话框(长按下键)-可视化调试页
 - debug_action_track_os.lua - 动作跟踪-可视化调试页
 
 

### Migration Tool :hammer_and_wrench:

We have made a migration tool for you to migrate your project from [Element UI](https://element.eleme.io) to Element Plus.

You can find the [gogo code migration tool](https://github.com/thx/gogocode/tree/main/packages/gogocode-plugin-element) here.

We have tested this on [Vue Element Admin](https://github.com/PanJiaChen/vue-element-admin). You can find the transpiled code [here](https://github.com/gogocodeio/vue-element-admin).

### Playground

You can also try Element Plus out with the components built-in playground.

#### Try it with our built-in playground

[Playground](https://element-plus.run/)

#### Try it with code sandbox

[![Edit element-plus](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/s/element-plus-demo-dxtcr)

<p align="center">
  <b>Special thanks to the generous sponsorship by:</b>
</p>
<br/>
<p align="center">
  <b>Platinum Sponsors</b>
</p>
<table align="center" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center" valign="middle">
        <a href="https://melecode.com/" target="_blank">
          <img width="150px" src="https://github.com/element-plus/element-plus/assets/82012629/9ca4269c-7545-4463-9bdc-8e5a1fbd0b08">
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="https://www.vform666.com/" target="_blank">
          <img width="150px" src="https://user-images.githubusercontent.com/17680888/156870588-b25a42d5-888b-4943-8b1b-5239dfd8f4d2.png">
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="https://www.jnpfsoft.com/index.html?from=elementUI" target="_blank">
          <img width="150px" src="https://github.com/element-plus/element-plus/assets/17680888/6a044d82-c393-48ab-90b8-de0d3aad1624">
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="http://github.crmeb.net/u/Element?from=element-plus" target="_blank">
          <img width="150px" src="https://github.com/element-plus/element-plus/assets/17680888/7abd3c5a-04fb-4eae-9540-0d21c5ed71ed">
        </a>
      </td>
    </tr>
    </tbody>
</table>
<p align="center">
  <b>Gold Sponsors</b>
</p>
<table align="center" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td align="center" valign="middle">
        <a href="https://doc.buildadmin.com/?from=element-plus" target="_blank">
          <img width="130px" src="https://user-images.githubusercontent.com/17680888/173179536-30e35fd1-cd5a-482a-bc41-9d5f0aa66fd4.png">
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="http://www.i-renderer.love/home/index" target="_blank">
          <img width="130px" src="https://github.com/element-plus/element-plus/assets/82012629/0004917d-71ad-48f9-b3ce-9299f0ff78c6">
        </a>
      </td>
      <td align="center" valign="middle">
        <a href="https://bit.dev/?from=element-ui" target="_blank">
          <img width="130px" src="https://user-images.githubusercontent.com/10095631/41342907-e44e7196-6f2f-11e8-92f2-47702dc8f059.png">
        </a>
      </td>
    </tr>
  </tbody>
</table>

---

## Translations

Element Plus is translated to multiple languages, you can click the badge to help up update the translation or apply to become
a proofreader [![Crowdin](https://badges.crowdin.net/element-plus/localized.svg)](https://crowdin.com/project/element-plus)

For now we are only showing English and Chinese for resource reasons, but we are looking forward to translate it into more languages, please go to the link
above and leave a message if you want to help translating Element Plus into your desired language.

### How to help translating

See how to help translating in [Translating Element Plus](https://element-plus.org/en-US/guide/translation.html).

## Stay tuned :eyes:

Join our [Discord](https://discord.com/invite/gXK9XNzW3X) to start communicating with everybody.

## This thing is broken, I should help improve it!

Awesommmmmmee. Everything you need is down below. You can also refer to
[CONTRIBUTING](https://github.com/element-plus/element-plus/blob/dev/CONTRIBUTING.md) and
[Code of Conduct](https://github.com/element-plus/element-plus/blob/dev/CODE_OF_CONDUCT.md)
where you'll find the same information listed below.

## I would like to become a part of the development team!

Welcome :star_struck:! We are looking for talented developers to join us and making Element Plus better! If you care to join the development team, please
reach out to us, you are more than welcomed to join us! :heart:

We are now lacking of experts of `Testing`, `GitHub Actions`, `PM`, if you do feel like you can and willing to help us, please do reach out to us. :pray:

## Contributors

This project exists thanks to all the people who contribute.

And thank you to all our backers! 🙏

<a href="https://github.com/element-plus/element-plus/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=element-plus/element-plus" />
</a>

## License

Element Plus is open source software licensed as
[MIT](https://github.com/element-plus/element-plus/blob/master/LICENSE).