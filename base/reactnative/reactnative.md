# React Native 官方文档阅读笔记

## 文档

### 基础篇

- 滚动视图使用：ScrollView
- 长列表使用：FlatList、SectionList
- 特定平台编码
  - Platform模块
    - Platform.OS
      - ios上 返回'ios'
      - Android设备或模拟器上 返回'android'
    - Platform.select()
    - Platform.Version
      - android 类型是数字 指示Android的api level
      - ios 类型是字符串 指示ios的系统版本
  - 特定平台扩展名
    - *.ios.js | *.android.js
    - *.native.js | *.js
    - 引用时不需要写明后缀名
### 开发流程篇

- 链接原生代码
  ```shell
  npx pod-install
  npx react-native run-ios
  npx react-native run-android
  ```
- 查看某个库是否支持某个平台
  - [https://reactnative.directory/](https://reactnative.directory/)

- 更新react-native包
  ```shell
  npx react-native upgrade
  # 指定参数
  npx react-native upgrade 0.61.0-rc.0
  ```
### 网络连接
- 使用fetch
  - [https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API)
- 内置的[XMLHttpRequest API](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest)
  ```javascript
  const request = new XMLHttpRequest()
  ```
- 支持WebSocket
  ```javascript
  const ws = new WebSocket('ws://host.com/path');
  ```
### 设计
- 使用style属性定制样式，支持接受对象或数组
- 使用`StyleSheet.create`集中定义组件的样式
- 尺寸
  - React Native中的尺寸都是无单位的，表示与设备像素密度无关的逻辑像素点
  - flex:1，2，3，等等来分配占据空间
  - 支持百分比宽高
- flexbox布局
  - react-native中flex-direction的默认值是column
- 图片`<Image source={require('./my-icon.png')} />`
  - `borderTopLeftRadius、borderTopRightRadius、borderBottomLeftRadius、borderBottomRightRadius`这些边框圆角样式在IOS图片上不支持

### 交互
- 点击事件
  - onPress 点击操作
  - onLongPress 长按操作
  - Touchable系列组建
    - TouchableHighlight - 此组件的背景会在用户手指按下时变暗
    - TouchableNativeFeedback - only android 在用户手指按下时形成类似墨水涟漪的视觉效果
    - TouchableOpacity 在用户手指按下时降低按钮的透明度，而不会改变背景的颜色
    - TouchableWithoutFeedback 在处理点击事件的同时不显示任何视觉反馈
  - 动画
    - Animated
  - 响应者的生命周期
    - [https://reactnative.cn/docs/gesture-responder-system](https://reactnative.cn/docs/gesture-responder-system)

### 性能调优等内容参阅官网

## 组件

### 核心组件和API

#### ActivityIndicator

> 加载中

