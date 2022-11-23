# React Native 实战记录

## 安装
> 按照[官方搭建环境方案](https://reactnative.cn/docs/environment-setup)搭建开发环境
- **注意**
  - 搭建过程中`pod install`实在过于缓慢，和网速以及代理配置有相当大的关系
  ```shell
  git config --global http.proxy socks5://127.0.0.1:1080
  git config --global http.https://github.com.proxy socks5://127.0.0.1:1080
  # 设置代理的作用无法确定，每天尝试pod install用了整整一星期，实在不确定到底代理有无生效和作用
  git config --global --unset http.proxy
  git config --global --unset http.https://github.com.proxy
  ```
  - react-natvie@0.69.0 有一个bug，参考[stackOverflow](https://stackoverflow.com/questions/72768245/typeerror-cli-init-is-not-a-function-for-react-native)
  ```shell
  # 解决方案 使用react-native@0.68.2
  npx react-native init AwesomeProject --version 0.68.2
  ```

## 打包发布事宜
> 参考文章
> - 打包流程：[https://blog.csdn.net/ych1274816963/article/details/120967009](https://blog.csdn.net/ych1274816963/article/details/120967009)
> - 设置图标启动页：[https://www.jianshu.com/p/727c6057fc0a](https://www.jianshu.com/p/727c6057fc0a)
> - 图标生成：[https://icon.wuruihong.com/](https://icon.wuruihong.com/)

### Android

### 打包流程
- 第一步：生成一个签名密钥
  ```shell 
  keytool -genkeypair -v -storetype PKCS12 -keystore my-release-key.keystore -alias my-key-alias -keyalg RSA -keysize 2048 -validity 10000
  ```
- 第二步：设置 gradle 变量
  - 把my-release-key.keystore文件放到你工程中的android/app文件夹下。
  - 编辑~/.gradle/gradle.properties（全局配置，对所有项目有效）或是项目目录/android/gradle.properties（项目配置，只对所在项目有效）。如果没有gradle.properties文件你就自己创建一个，添加如下的代码（注意把其中的****替换为相应密码）
  ```shell
  MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
  MYAPP_RELEASE_KEY_ALIAS=my-key-alias
  MYAPP_RELEASE_STORE_PASSWORD=*****
  MYAPP_RELEASE_KEY_PASSWORD=*****
  ```

- 第三步：把签名配置加入到项目的 gradle 配置中
> 编辑你项目目录下的android/app/build.gradle，添加如下的签名配置：

```javascript
...
android {
    ...
    defaultConfig { ... }
    signingConfigs {
        release {
            if (project.hasProperty('MYAPP_RELEASE_STORE_FILE')) {
                storeFile file(MYAPP_RELEASE_STORE_FILE)
                storePassword MYAPP_RELEASE_STORE_PASSWORD
                keyAlias MYAPP_RELEASE_KEY_ALIAS
                keyPassword MYAPP_RELEASE_KEY_PASSWORD
            }
        }
    }
    buildTypes {
        release {
            ...
            signingConfig signingConfigs.release
        }
    }
}
...
```
- 第四步：生成发行APK包
```shell
cd android
./gradlew clean
./gradlew assembleRelease
```
#### 修改应用名称和图标
-  修改：`android/app/src/main/res/values/strings.xml`
```html
<resources>
-    <string name="app_name">test</string>
+    <string name="app_name">测试程序</string>   
</resources>
```
- 生成好图标文件后替换`android/app/src/main/res`对应文件

### IOS

#### 打包流程
- 第一步：首先在package.json里设置bundle-ios命令，在package.json里的scripts添加如下代码
```json
"bundle-ios": "node node_modules/react-native/local-cli/cli.js bundle --entry-file index.js --platform ios --dev false --bundle-output ./ios/bundle/index.jsbundle --assets-dest ./ios/bundle"
```
- 第二步：在ios文件目录下创建bundle文件夹
```shell
yarn bundle-ios
# 等待bundle文件下生成assets和其他相关文件
```
- 第三步：通过xcode打开`project.xcworkspace`项目
- 第四步：在xcode中右击项目名称，点击`Add Files To ....`
- 第五步：`Product-Scheme-Edit Scheme` 修改 `Run` 和 `Archive` 的 `Build Configuration` 为 `Release`
- 第六步：开始打包
  - Product->Archive
  - Distribute APP

#### 修改应用名称和图标
- 修改名称：在xcode里根据图形化界面的提示修改 `DisplayName、Bundle Display Name` 等
- 生成好图标文件后替换`ios/test/Images.xcassets/AppIcon.appiconset`中的内容

### 安卓给空包签名

``` shell
jarsigner -verbose -keystore [你签名的位置] -signedjar [要生成的签名包] [未签名的包] [你签名的alias]
```
