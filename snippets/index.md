---
description: 不积跬步，无以至千里；不积小流，无以成江海。
---
# 代码片段记录整理
## 正则表达式收集

### 校验链接

```javascript
/^(https?|ftp):\/\/([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&%$-]+)*@)*((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(:[0-9]+)*(\/($|[a-zA-Z0-9.,?'\\+&%$#=~_-]+))*$/
```

### 校验字符串大小写、字母

```javascript
/^[a-z]+$/; // 全小写字母
/^[A-Z]+$/; // 全大写字母
/^[A-Za-z]+$/; // 全为字母
```

### 校验邮箱

```javascript
/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
```

### 校验手机号

```javascript
/^[1][0-9][0-9]{9}$/
```

### 校验金额格式

```javascript
/^(([1-9]\d*)|\d)(\.\d{1,2})?$/
```

## 防抖函数

```javascript
/**
 * @param {Function} func
 * @param {number} wait
 * @param {boolean} immediate
 * @return {*}
 * @tips 使用的时候注意不要用箭头函数，会丢失this的绑定
 */
export function debounce(func, wait, immediate) {
  let timeout, args, context, timestamp, result

  const later = function() {
    // 据上一次触发时间间隔
    const last = +new Date() - timestamp

    // 上次被包装函数被调用时间间隔 last 小于设定时间间隔 wait
    if (last < wait && last > 0) {
      timeout = setTimeout(later, wait - last)
    } else {
      timeout = null
      // 如果设定为immediate===true，因为开始边界已经调用过了此处无需调用
      if (!immediate) {
        result = func.apply(context, args)
        if (!timeout) context = args = null
      }
    }
  }

  return function(...args) {
    context = this
    timestamp = +new Date()
    const callNow = immediate && !timeout
    // 如果延时不存在，重新设定延时
    if (!timeout) timeout = setTimeout(later, wait)
    if (callNow) {
      result = func.apply(context, args)
      context = args = null
    }

    return result
  }
}
```

## el-form校验失败滚动到对应位置

```javascript
// el-form校验失败滚动到对应的错误位置
export function elFormErrorScrollIntoView() {
  const element = document.querySelectorAll('.el-form-item__error')[0]
  element.scrollIntoView({
    behavior: 'smooth',
    block: 'center'
  })
}

// 使用
this.$nextTick(() => {
  elFormErrorScrollIntoView()
})
```

## 封装localstorage、sessionstorage

```javascript
export const LocalStorage = {
  set(key, val, expiration = 604800000) {
    if (!val) {
      this.remove(key)
      return
    }
    // 离线缓存默认存储有效期为7天
    expiration = expiration > 0 ? Date.now() + expiration : 0
    const obj = {
      key,
      value: val,
      expiration
    }
    localStorage.setItem(key, JSON.stringify(obj))
  },
  get(key) {
    const obj = JSON.parse(localStorage.getItem(key))
    if (!obj) {
      return null
    }
    if (!obj.expiration) {
      return obj.value
    }
    return Date.now() <= obj.expiration ? obj.value : null
  },
  remove(key) {
    localStorage.removeItem(key)
  },
  clear() {
    localStorage.clear()
  }
}

export const SessionStorage = {
  set(key, val) {
    if (!val) {
      this.remove(key)
      return
    }
    const obj = {
      key,
      value: val
    }
    sessionStorage.setItem(key, JSON.stringify(obj))
  },
  get(key) {
    const obj = JSON.parse(sessionStorage.getItem(key))
    if (!obj) {
      return null
    }
    return obj.value
  },
  remove(key) {
    sessionStorage.removeItem(key)
  },
  clear() {
    sessionStorage.clear()
  }
}
```

## 原生JS实现滚动条滚动到某个指定位置

```javascript
Math.easeInOutQuad = function(t, b, c, d) {
  t /= d / 2
  if (t < 1) {
    return c / 2 * t * t + b
  }
  t--
  return -c / 2 * (t * (t - 2) - 1) + b
}

// requestAnimationFrame for Smart Animating http://goo.gl/sx5sts
var requestAnimFrame = (function() {
  return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || function(callback) { window.setTimeout(callback, 1000 / 60) }
})()

/**
 * Because it's so fucking difficult to detect the scrolling element, just move them all
 * @param {number} amount
 */
function move(amount) {
  document.documentElement.scrollTop = amount
  document.body.parentNode.scrollTop = amount
  document.body.scrollTop = amount
}

function position() {
  return document.documentElement.scrollTop || document.body.parentNode.scrollTop || document.body.scrollTop
}

/**
 * @param {number} to
 * @param {number} duration
 * @param {Function} callback
 */
export function scrollTo(to, duration, callback) {
  const start = position()
  const change = to - start
  const increment = 20
  let currentTime = 0
  duration = (typeof (duration) === 'undefined') ? 500 : duration
  var animateScroll = function() {
    // increment the time
    currentTime += increment
    // find the value with the quadratic in-out easing function
    var val = Math.easeInOutQuad(currentTime, start, change, duration)
    // move the document.body
    move(val)
    // do the animation unless its over
    if (currentTime < duration) {
      requestAnimFrame(animateScroll)
    } else {
      if (callback && typeof (callback) === 'function') {
        // the animation is done so lets callback
        callback()
      }
    }
  }
  animateScroll()
}
```

## 封装axios

```javascript
import axios from 'axios'
import { MessageBox, Message } from 'element-ui'
import store from '@/store'
import { getToken } from '@/utils/auth'

// create an axios instance
const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000 // request timeout
})

// request interceptor
service.interceptors.request.use(
  config => {
    // do something before request is sent

    if (store.getters.token) {
      // let each request carry token
      // ['X-Token'] is a custom headers key
      // please modify it according to the actual situation
      config.headers['X-Token'] = getToken()
    }
    return config
  },
  error => {
    // do something with request error
    console.log(error) // for debug
    return Promise.reject(error)
  }
)

// response interceptor
service.interceptors.response.use(
  /**
   * If you want to get http information such as headers or status
   * Please return  response => response
  */

  /**
   * Determine the request status by custom code
   * Here is just an example
   * You can also judge the status by HTTP Status Code
   */
  response => {
    const res = response.data

    // if the custom code is not 20000, it is judged as an error.
    if (res.code !== 20000) {
      Message({
        message: res.message || 'Error',
        type: 'error',
        duration: 5 * 1000
      })

      // 50008: Illegal token; 50012: Other clients logged in; 50014: Token expired;
      if (res.code === 50008 || res.code === 50012 || res.code === 50014) {
        // to re-login
        MessageBox.confirm('You have been logged out, you can cancel to stay on this page, or log in again', 'Confirm logout', {
          confirmButtonText: 'Re-Login',
          cancelButtonText: 'Cancel',
          type: 'warning'
        }).then(() => {
          store.dispatch('user/resetToken').then(() => {
            location.reload()
          })
        })
      }
      return Promise.reject(new Error(res.message || 'Error'))
    } else {
      return res
    }
  },
  error => {
    console.log('err' + error) // for debug
    Message({
      message: error.message,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)

export default service
```

## 时间转换为字符串

```javascript
export function parseTime(time, cFormat) {
  if (arguments.length === 0 || !time) {
    return null
  }
  const format = cFormat || '{y}-{m}-{d} {h}:{i}:{s}'
  let date
  if (typeof time === 'object') {
    date = time
  } else {
    if ((typeof time === 'string')) {
      if ((/^[0-9]+$/.test(time))) {
        // support "1548221490638"
        time = parseInt(time)
      } else {
        // support safari
        // https://stackoverflow.com/questions/4310953/invalid-date-in-safari
        time = time.replace(new RegExp(/-/gm), '/')
      }
    }

    if ((typeof time === 'number') && (time.toString().length === 10)) {
      time = time * 1000
    }
    date = new Date(time)
  }
  const formatObj = {
    y: date.getFullYear(),
    m: date.getMonth() + 1,
    d: date.getDate(),
    h: date.getHours(),
    i: date.getMinutes(),
    s: date.getSeconds(),
    a: date.getDay()
  }
  const time_str = format.replace(/{([ymdhisa])+}/g, (result, key) => {
    const value = formatObj[key]
    // Note: getDay() returns 0 on Sunday
    if (key === 'a') { return ['日', '一', '二', '三', '四', '五', '六'][value] }
    return value.toString().padStart(2, '0')
  })
  return time_str
}
```

## 时间间隔字符串显示

```javascript
/**
 * @param {number} time
 * @param {string} option
 * @returns {string}
 */
export function formatTime(time, option) {
  if (('' + time).length === 10) {
    time = parseInt(time) * 1000
  } else {
    time = +time
  }
  const d = new Date(time)
  const now = Date.now()

  const diff = (now - d) / 1000

  if (diff < 30) {
    return '刚刚'
  } else if (diff < 3600) {
    // less 1 hour
    return Math.ceil(diff / 60) + '分钟前'
  } else if (diff < 3600 * 24) {
    return Math.ceil(diff / 3600) + '小时前'
  } else if (diff < 3600 * 24 * 2) {
    return '1天前'
  }
  if (option) {
    return parseTime(time, option)
  } else {
    return (
      d.getMonth() +
      1 +
      '月' +
      d.getDate() +
      '日' +
      d.getHours() +
      '时' +
      d.getMinutes() +
      '分'
    )
  }
}
```

## 获取url里的参数

```javascript
/**
 * @param {string} url
 * @returns {Object}
 */
export function getQueryObject(url) {
  url = url == null ? window.location.href : url
  const search = url.substring(url.lastIndexOf('?') + 1)
  const obj = {}
  const reg = /([^?&=]+)=([^?&=]*)/g
  search.replace(reg, (rs, $1, $2) => {
    const name = decodeURIComponent($1)
    let val = decodeURIComponent($2)
    val = String(val)
    obj[name] = val
    return rs
  })
  return obj
}

/**
 * @param {string} url
 * @returns {Object}
 */
export function param2Obj(url) {
  const search = decodeURIComponent(url.split('?')[1]).replace(/\+/g, ' ')
  if (!search) {
    return {}
  }
  const obj = {}
  const searchArr = search.split('&')
  searchArr.forEach(v => {
    const index = v.indexOf('=')
    if (index !== -1) {
      const name = v.substring(0, index)
      const val = v.substring(index + 1, v.length)
      obj[name] = val
    }
  })
  return obj
}
```

## 原生JavaScript操作元素class

```javascript
/**
 * @param {HTMLElement} element
 * @param {string} className
 */
export function toggleClass(element, className) {
  if (!element || !className) {
    return
  }
  let classString = element.className
  const nameIndex = classString.indexOf(className)
  if (nameIndex === -1) {
    classString += '' + className
  } else {
    classString =
      classString.substr(0, nameIndex) +
      classString.substr(nameIndex + className.length)
  }
  element.className = classString
}

/**
 * Check if an element has a class
 * @param {HTMLElement} elm
 * @param {string} cls
 * @returns {boolean}
 */
export function hasClass(ele, cls) {
  return !!ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'))
}

/**
 * Add class to element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function addClass(ele, cls) {
  if (!hasClass(ele, cls)) ele.className += ' ' + cls
}

/**
 * Remove class from element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function removeClass(ele, cls) {
  if (hasClass(ele, cls)) {
    const reg = new RegExp('(\\s|^)' + cls + '(\\s|$)')
    ele.className = ele.className.replace(reg, ' ')
  }
}
```

## 深克隆

```javascript
/**
 * This is just a simple version of deep copy
 * Has a lot of edge cases bug
 * If you want to use a perfect deep copy, use lodash's _.cloneDeep
 * @param {Object} source
 * @returns {Object}
 */
export function deepClone(source) {
  if (!source && typeof source !== 'object') {
    throw new Error('error arguments', 'deepClone')
  }
  const targetObj = source.constructor === Array ? [] : {}
  Object.keys(source).forEach(keys => {
    if (source[keys] && typeof source[keys] === 'object') {
      targetObj[keys] = deepClone(source[keys])
    } else {
      targetObj[keys] = source[keys]
    }
  })
  return targetObj
}
```

## 随机字符串

```javascript
/**
 * @returns {string}
 */
export function createUniqueString() {
  const timestamp = +new Date() + ''
  const randomNum = parseInt((1 + Math.random()) * 65536) + ''
  return (+(randomNum + timestamp)).toString(32)
}
```
## 自适应移动端不同设备宽度
```javascript
(function (doc, win) {
  let docEl = doc.documentElement;
  const isIOS = navigator.userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
  dpr = isIOS ? Math.min(win.devicePixelRatio, 3) : 1;
  dpr = window.top === window.self ? dpr : 1; //被iframe引用时，禁止缩放
  scale = 1;
  resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize';
  docEl.dataset.dpr = dpr;
  let metaEl = doc.createElement('meta');
  metaEl.name = 'viewport';
  metaEl.content = 'initial-scale=' + scale + ',maximum-scale=' + (scale * dpr) + ', minimum-scale=' + Math.ceil((scale / dpr));
  docEl.firstElementChild.appendChild(metaEl);
  let recalc = function () {
    let width = docEl.clientWidth;
    if (width / dpr > 375) {
      width = 375 * dpr;
    }
    let winWidth = document.documentElement.clientWidth || document.body.clientWidth;
    // 乘以10，px : rem = 10 : 1
    if (winWidth >= 768) {
      // 处理pad及以上设备，成比例放大
      // docEl.style.fontSize = winWidth * 10 / 375 + 'px';
      // pad及以上设备，不成比例放大
      docEl.style.fontSize = '10px';
    } else {
      docEl.style.fontSize = 10 * (width / 375) + 'px';
    }


  };
  recalc()
  if (!doc.addEventListener) return;
  win.addEventListener(resizeEvt, recalc, false);
})(document, window)
```

## 颜色rgb转16进制
```javascript
const rgbToHex = (r, g, b) => "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
    
rgbToHex(0, 51, 255); 
```


## vue-cli 发布静态资源到阿里云oss存储，静态资源全走cdn
- oss.config.js
```javascript
module.exports = {
    accessKeyId: 'xxxxx',
    accessKeySecret: 'xxxxxx',
    region: 'oss-cn-xxxxx',
    bucket: 'xxxxx'
}
```
- vue.config.js
```javascript
// https://www.npmjs.com/package/aliyun-oss-webpack-plugin
const AliyunOSSPlugin = require("aliyun-oss-webpack-plugin")
const ossConfig = require('./oss.config.js')

chainWebpack(config) {
  config
    .when(process.env.NODE_ENV !== 'development',
      config => {
        config
          .plugin('deployStaticToOss')
          .use(AliyunOSSPlugin)
          .tap(() => [
            {
              ...ossConfig,
              headers: {
                'Cache-Control': 'max-age=36000'
              }
            }
          ])
      }
    )
}
    
```

## vue-cli 设置图片小于某一大小，编译为base64编码，减少页面图片请求

```javascript
chainWebpack(config) {
  config
    .when(process.env.NODE_ENV !== 'development',
      config => {
        config.module
          .rule('images')
            .use('url-loader')
              .loader('url-loader')
              .tap(options => Object.assign(options, { limit: 20000 }))
    )
}

```

## React Native 上传图片组件
```javascript
import { Button, Icon, Image } from "@rneui/themed";
import React from "react";
import { View, StyleSheet } from "react-native";
import { getAliyunAuthorization } from '../api';
import { createUniqueString } from "../utils";
import theme from "../utils/theme";
import ImageCropPicker from "react-native-image-crop-picker";
import AliyunOSS from 'aliyun-oss-react-native';
import Toast from "react-native-root-toast";

AliyunOSS.enableDevMode();

const configuration = {
  maxRetryCount: 3,
  timeoutIntervalForRequest: 30,
  timeoutIntervalForResource: 24 * 60 * 60
};
const endPoint = 'xxx.aliyuncs.com'
const bucketName = 'xxxxx'
export default class UploadImage extends React.Component {
  constructor(props) {
    super(props)
    let arr = []
    // 如果有需要回显的图片先处理成可展示图片的数组
    if (typeof props.value === 'string' && props.value) {
      arr = props.value.split(',').map(uri => ({ uri }))
    }
    this.state = {
      imageList: arr || [], // 图片列表
      moduleName: props.moduleName || 'xxxx', // 图片存放的文件夹名称 按模块存放图片文件，建议传
      limit: props.limit || 1, // 最多上传数量
      multiple: props.multiple || false, // 是否可以多选图片
      openType: props.openType || 'picker', // 选择图片方式 picker = 通过相册, camera = 通过相机
      disabled: props.disabled || false, // 禁用上传
      securityToken: null, // 阿里云初始化参数
      accessKeyId: null, // 阿里云初始化参数
      accessKeySecret: null, // 阿里云初始化参数
      expiration: null, // 阿里云初始化参数
      uploading: false, // 是否处在上传中
      value: props.value || '' // 需要回显的图片，字符串：多张图片用逗号分隔
    }
  }

  // 图片数组变化传到父组件
  uploadSuccess() {
    if (this.props.onChange) {
      // 在外面传入一个onChange函数进来在父组件获取当前上传成功的图片
      // 直接转换为多张图片用逗号连接的字符串给父组件，可以直接赋值
      const str = this.state.imageList.map(img => img.uri).join(',')
      this.props.onChange(str)
    }
  }

  // 上传阿里云
  async uploadImage(files) {
    await this.initAliyunOSS();
    return Promise.all(files.map(f => this.singleUpload(f)));
  }

  // 初始化阿里云上传控件
  async initAliyunOSS() {
    const { securityToken, accessKeyId, accessKeySecret, expiration } = this.state
    if (!securityToken || new Date(expiration).getTime() <= Date.now()) {
      const r = await getAliyunAuthorization();
      const response = r.data;
      AliyunOSS.initWithSecurityToken(response.securityToken, response.accessKeyId, response.accessKeySecret, endPoint, configuration)
      this.setState({
        securityToken: response.securityToken,
        accessKeyId: response.accessKeyId,
        accessKeySecret: response.accessKeySecret,
        expiration: response.expiration
      });
    } else {
      AliyunOSS.initWithSecurityToken(securityToken, accessKeyId, accessKeySecret, endPoint, configuration);
    }
  }

  // 单张图片上传
  singleUpload(file) {
    const { moduleName } = this.state;
    const obj = file.filename;
    const fileExtention = obj.substring(obj.lastIndexOf('.') + 1);
    const fileName = [createUniqueString(), fileExtention].join('.');
    return AliyunOSS.asyncUpload(bucketName, `${moduleName}/${fileName}`, file.sourceURL).then(r => {
      const uri = `https://${bucketName}.${endPoint}/${moduleName}/${fileName}`;
      return Promise.resolve({ uri });
    }).catch(e => {
      return Promise.reject('fail');
    })
  }

  // 删除图片
  onDeleteImage(file) {
    const arr = this.state.imageList.filter(f => f.uri !== file.uri)
    this.setState({
      imageList: arr
    });
    Toast.show('删除成功');
    this.uploadSuccess();
  }

  handleButtonPress() {
    const { openType, multiple, disabled, uploading, limit, imageList } = this.state
    // 禁用或上传中的状态点击按钮不操作
    if (disabled || uploading) {
      return false
    }
    // TODO：选择相册方式支持多种，目前只用这一种，代码为后续预留
    if (openType === 'picker') {
      ImageCropPicker.openPicker({
        multiple,
      }).then(images => {
        const imgs = multiple ? images : [images]
        const length = imgs.length + imageList.length;
        if (length > limit) {
          Toast.show(`最多上传${limit}张图片`)
          return Promise.resolve();
        }
        this.setState({
          uploading: true
        });
        this.uploadImage(imgs).then(r => {
          Toast.show('图片上传成功');
          this.setState({
            uploading: false,
            imageList: this.state.imageList.concat(r)
          });
          this.uploadSuccess();
        });
      })
    }
  }

  render() {
    const { imageList, limit, disabled } = this.state
    return (
      <View style={styles.uploadContainer}>
        {
          imageList.map(image => (
            <View style={styles.uploadedWrap} key={image.uri}>
              <Image source={image} resizeMode="cover" style={styles.uploadedImage} />
              {
                disabled ? <></> : <Icon onPress={() => this.onDeleteImage(image)} containerStyle={styles.uploadedIcon} color={theme.colors.white} name="closecircleo" type="antdesign" size={20} />
              }
            </View>
          ))
        }
        {
          imageList.length < limit ?
            <Button
              onPress={() => this.handleButtonPress()}
              disabled={disabled}
              type="outline"
              title="上传图片"
              buttonStyle={styles.uploadBtn}
              titleStyle={styles.uploadBtnTitle}
              icon={() =>
                <Icon containerStyle={{ marginRight: 5 }} name='clouduploado' type='antdesign' color={theme.colors.primary} />
              } />
            :
            <></>
        }
      </View>
    )
  }
}

const styles = StyleSheet.create({
  uploadContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap'
  },
  uploadBtn: {
    width: 100,
    height: 100,
    borderStyle: 'dashed',
    backgroundColor: 'rgba(255, 149, 0, 0.06)'
  },
  uploadBtnTitle: {
    fontSize: 12,
    color: theme.colors.secondary
  },
  uploadedImage: {
    width: 100,
    height: 100,
    borderRadius: 8
  },
  uploadedWrap: {
    width: 100,
    height: 100,
    borderRadius: 8,
    position: 'relative',
    marginRight: 10,
    marginBottom: 10
  },
  uploadedIcon: {
    position: 'absolute',
    right: 5,
    top: 2,
    zIndex: 3
  }
})
```