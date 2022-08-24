---
description: 博观而约取，厚积而薄发。
---
# 前端知识体系
## 必备

### 团队协作

- Git​

	- 基本配置

		- git config [--global] --list # 查看配置
		- git config [--global] user.name "example" # 设置提交用户的name
		- git config [--global] user.email "example@email.com" # 设置提交用户的email

	- 初始化

		- git init # 创建一个git代码库
		- git clone [url] # 下载一个项目和它的整个代码历史

	- 增删文件

		- git add . # 添加所有文件到暂存区
		- git add [file1][file2][dir] # 添加文件/文件夹到暂存区
		- git rm --cached . # 停止追踪指定文件 该文件会保留在工作区 用到这个命令一般是要更新gitignore的时候

	- 提交

		- git commit -m [message] # 提交暂存区到仓库区

	- 分支

		- git branch

			- git branch # 列举本地分支
			- git branch -r # 列举远端分支
			- git branch -a # 列举本地分支加远端分支
			- git branch [new branch name] # 创建一个新分支，但停留在当前分支
			- git branch --set-upstream-to=origin/remote_branch  your_branch # set-upstream
			- git push origin --delete [remote branch name] # 删除远端分支
			- git branch -d [local branch-name] # 删除本地分支

		- git checkout

			- git checkout -b [new branch name] # 创建一个新分支并切换到该分支
			- git checkout -b [new branch name] origin/remote-branch # 创建一个新分支且切换到该分支，同时把该分支和远端origin/remote-branch建立连接

		- git merge [branch] # 合并指定分支到当前分支
		- git cherry-pick [commit id] # 合并指定提交到当前分支

	- 查看信息

		- git status # 查看状态
		- git log # 查看提交记录
		- git log --stat # 查看提交记录 包含每次commit发生变更的文件
		- git log -5 --pretty --oneline # 查看最近五次提交
		- git log --oneline --graph --decorate --all
		- git log --oneline --decorate --color --graph
		- git blame [file] # 查看指定文件的修改记录
		- git diff # 暂存区和工作区的差异
		- git reflog # 显示当前分支的最近几次提交

	- 远程同步

		- git fetch # 获取远程仓库的变动
		- git remote -v # 查看远程仓库
		- git remote set-url origin xxx # 设置远程仓库
		- git pull # 取回远程仓库的变化与本地分支合并
		- git pull --rebase # 用于提交时，取回远程仓库的变化并把自己的提交加到远程提交树的最后
		- git push # 推送本地分支到远程仓库
		- git push --force # 强制推送

	- 撤销

		- git checkout . # 撤销所有暂存区修改到工作区
		- git reset --hard # 重置暂存区和工作区
		- git reset HEAD~ # ...
		- git revert [commit] # 新建一个commit撤销指定的commit
		- git stash # 暂时将所有未提交的变化移除
		- git stash pop # 移入存储的未提交变化

	- 冲突

		- 产生原因

			- 推送本地分支到远程仓库时，git比对文件发现远程仓库和本地分支都修改了同一个文件

		- 解决冲突（常见场景）

			- 方式一

				- 方式一
				- git add .
				- git commit -m""
				- git push
				- git 提示你当前分支落后了远程分支几个提交，请先取回远程分支的变化
				- git pull
				- 发现冲突 解决冲突
				- git add .
				- git commit -m"merge: conflicts ....."
				- git push
				- 没有冲突
				- git commit -m"merge branch master of ....."
				- git push

			- 方式二

				- 方式二
				- git add .
				- git commit -m""
				- git push
				- git 提示你当前分支落后了远程分支几个提交，请先取回远程分支的变化
				- git pull --rebase
				- 发现冲突 解决冲突
				- merge conflicts:
				- src/ss/ss ......
				- git add .
				- git rebase --continue
				- 如果有冲突会自动新建一个merge conflicts提交，自动填写了此次冲突包含的文件列表
				- git push

	- 其他

		- git remote update origin --prune # git 更新远程分支列表
		- 全局设置代理
    		- git config --global https.proxy https://127.0.0.1:1080
    		- git config --global http.proxy http://127.0.0.1:1080
    		- git config --global http.proxy socks5://127.0.0.1:1080
    		- git config --global https.proxy socks5://127.0.0.1:1080
		- 取消全局代理
    		- git config --global --unset http.proxy
    		- git config --global --unset https.proxy

- eslint

	- [eslint-plugin-vue](https://eslint.vuejs.org/user-guide/)

	- [规则查阅](http://eslint.cn/docs/rules/)

- [commit lint](https://commitlint.js.org/#/)

	- [vscode 插件 conventionalcommits](https://www.conventionalcommits.org/en/v1.0.0/)

	- 提交规范

		- 类型（必填）

			- feat

				- 添加功能

					- 引入新特性

			- fix

				- 错误修复

					- 修复bug

			- docs

				- 文档变更

					- 添加或更新文档

			- style

				- 格式调整

					- 不会影响代码含义的更改（空格、格式，缺少分号等）

			- refactor

				- 代码重构

					- 既不是修复bug也不是添加特性的代码更改

			- perf

				- 性能优化

					- 更改代码以提升性能

			- test

				- 更新测试

					- 添加或者更新测试

			- build

				- 依赖调整

					- 影响构建系统或外部依赖项的更改（示例作用域：gulp、broccoli、npm）

			- ci

				- 脚本变更

					- 对CI配置文件和脚本的更改（示例作用域：Travis、Circle、BrowserStack、SauceLabs）

			- chore

				- 杂务处理

					- 其他不会修改源文件或者测试文件的更改

			- revert

				- 恢复版本

					- 恢复到上一个版本（常用于revert上一次或某一次提交）

		- 作用域（选填）

			- 多个作用域用"\"、"/"、"、"分隔开

		- gitmoji（选填）

			- git emoji表情

				- [emoji参考](https://hooj0.github.io/git-emoji-guide/)

		- 描述（必填）

			- 对本次提交进行一个剪短的描述

		- 正文（选填）

			- 对本次提交内容提供更多信息；理解为对描述的补充说明；一般用不到

		- 脚注（选填）

			- 列举相关的issues

- code review

	- 统一风格，提升代码质量
	- 互相学习，知识共享
	- 工作量统计

### 基础

- HTML和CSS

	- CSS​

		- 盒模型

			- 标准盒模型

				- content
				- padding
				- border
				- margin

			- IE盒模型

				- content

					- content
					- padding
					- border

				- margin

			- box-sizing

				- 定义了如何计算一个元素的总宽度和总高度
				- content-box

					- 默认值

						- 如果你设置一个元素的宽为 100px，那么这个元素的内容区会有 100px 宽，并且任何边框和内边距的宽度都会被增加到最后绘制出来的元素宽度中。

				- border-box

					- 可选值（常用）

						- 如果你将一个元素的 width 设为 100px，那么这 100px 会包含它的 border 和 padding，内容区的实际宽度是 width 减去 (border + padding) 的值。

		- 选择器

			- 基本选择器

				- id选择器

					- #id

				- 类选择器

					- .class

				- 标签选择器

					- body,html

				- 通配符选择器

					- *

			- 属性选择器

				- .class[attr=xxx]、[attr=xxxx]

			- 组合选择器

				- 分组选择器

					- .div1,.div2,div

						- 逗号分隔

				- 后代选择器

					- div span

						- 空格隔开，指定元素后代所有符合要求的元素

				- 子元素选择器

					- div>span

						- >隔开，指定元素子代所有符合要求的元素，强调子代

				- 兄弟选择器

					- .div~div

						- ~连接，匹配某元素后所有同级的指定元素

				- 相邻选择器

					- .div1+.div2

						- +连接，匹配元素后紧邻的兄弟元素

			- 伪元素选择器

				- ::after

					- 指定元素最后添加一个子元素，默认行内元素

				- ::before

					- 指定元素第一个位置添加一个子元素，默认行内元素

				- ::first-letter

					- 匹配元素的第一行第一个字符

				- ::marker

					- 匹配元素中有序或无序列表的序号或符号

				- ::selection

					- 匹配元素中被选中高亮的部分

			- 伪类选择器

				- 动态伪类

					- :link

						- 未访问的链接

					- :visited

						- 已访问的链接

							- 当前浏览器有访问记录的都算已访问状态

					- :hover

						- 鼠标悬浮

					- :active

						- 被激活的元素

					- :focus

						- 获得焦点（输入类元素）

				- 结构伪类

					- :first-child

						- 匹配父元素的第一个指定条件子元素

					- :last-child

						- 匹配父元素的最后一个指定条件子元素

					- :first-of-type

						- 匹配父元素中第一个指定条件的元素

					- :last-of-type

						- 匹配父元素中最后一个指定条件的元素

					- :nth-child(n)

						- 匹配父元素中第n个指定条件的子元素
						- :nth-child(odd)

							- 奇数序子元素

						- :nth-child(even)

							- 偶数序子元素

					- :nth-last-child(n)

						- 匹配父元素的倒数第n个指定条件的子元素

					- :nth-of-type(n)

						- 匹配父元素中第n个满足条件的元素

					- :nth-last-of-type

						- 匹配父元素中倒数第n个满足条件的元素

					- :only-child

						- 父元素中有且仅有一个满足条件的子元素，匹配该元素

					- :only-of-type

						- 父元素中有多个元素但只有一个满足条件的元素，匹配该元素

					- :empty

						- 匹配没有子元素的元素

					- :root

						- 根元素（对于HTML来说，相当于html）

				- UI元素状态伪类（多用于表单元素）

					- :checked

						- radio或checkbox被勾选的状态

					- :enable

						- 启用状态

					- :disabled

						- 禁用状态

					- :default

						- 默认状态

					- :read-only

						- 只读状态

					- :read-write

						- 读写状态

				- 语言伪类

					- :lang(language)

						- 匹配指定语言

				- 否定伪类

					- :not

						- 匹配除...之外的满足条件的元素

				- 目标伪类

					- :target

						- 匹配文档url的某个标签符的目标元素

							- 代表一个唯一的页面元素（目标元素），其id与当前url片段匹配

		- 样式优先级

			- 样式表优先级

				- 内联样式 >  css选择器样式 > link 引入的样式

			- 选择器优先级

				- !important

					- 正无穷

				- 行内样式

					- 1000

				- ID选择器

					- 100

				- 类选择器、属性选择器、伪类选择器

					- 10

				- 标签选择器、伪元素选择器

					- 1

				- 通配符选择器

					- 0

				- 继承属性

					- -1

			- 样式是层叠后的结果

				- 层叠样式表里权重最高的样式
				- 相同权重的写在后面的样式
				- 使用important的样式权重永远最高

					- 如果针对同一元素样式存在冲突且同时存在 !important ，那么选择器总权重值高者生效

		- position

			- 相对定位：relative

				- 相对自身进行定位

			- 绝对定位：absolute

				- 基于第一个非static定位的祖先元素定位

			- 固定定位：fixed

				- 相对浏览器窗口进行定位

			- [粘性定位：stricky](https://www.zhangxinxu.com/wordpress/2018/12/css-position-sticky/)

				- 滑动到一定距离，进行固定定位

					- 父级元素不能有任何overflow:visible以外的overflow设置，否则没有粘滞效果
					- 父级元素设置和粘性定位元素等高的固定的height高度值，或者高度计算值和粘性定位元素高度一样，也没有粘滞效果
					- 同一个父容器中的sticky元素，如果定位值相等，则会重叠；如果属于不同父元素，且这些父元素正好紧密相连，则会鸠占鹊巢，挤开原来的元素，形成依次占位的效果
					- sticky定位，不仅可以设置top，基于滚动容器上边缘定位；还可以设置bottom，也就是相对底部粘滞。如果是水平滚动，也可以设置left和right值

				- position:relative和position:fixed的结合体——当元素在屏幕内，表现为relative，就要滚出显示器屏幕的时候，表现为fixed

		- 布局方式

			- float浮动布局

				- 元素浮动，脱离原有文档流
				- 清除浮动

					- 浮动溢出的原因
					- 清除浮动的方式

			- position定位布局
			- [flex弹性布局](https://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)

				- 容器

					- flex-direction
					- flex-wrap
					- flex-flow
					- justify-content
					- align-items
					- align-content

				- 项目

					- order
					- flex-grow
					- flex-shrink
					- flex-basis
					- flex
					- align-self

			- [grid表格布局](https://www.ruanyifeng.com/blog/2019/03/grid-layout-tutorial.html)

		- 动画和2D/3D转换
		- [层级上下文](https://developer.mozilla.org/zh-CN/docs/Web/CSS/CSS_Positioning/Understanding_z_index/The_stacking_context)

			- 解释：假定用户正面向（浏览器）视窗或网页，而 HTML 元素沿着其相对于用户的一条虚构的 z 轴排开，层叠上下文就是对这些 HTML 元素的一个三维构想。众 HTML 元素基于其元素属性按照优先级顺序占据这个空间。
			- 层级上下文的元素

				- 文档根元素<html></html>
				- position为absolute或relative且z-index值不为auto的元素
				- position为fixed或sticky的元素
				- flex容器的子元素，且z-index值不为auto
				- grid容器的子元素，且z-index值不为auto
				- opacity属性小于1的元素
				- mx-blend-mode属性值不为normal的元素
				- transform、filter、backdrop-filter、perspective、clip-path、mask/mask-image/mast-border 属性值不为none的元素
				- isolation属性值为isolate的元素
				- will-change值设定了任一属性而该属性在non-initial值时会创建层级上下文元素
				- contain属性值为layout、paint或包含它们其中之一的合成值（如：contain: strict、contain: content）的元素

			- 层叠上下文可以包含在其他层叠上下文中，并且一起创建一个层叠上下文的层级。
			- 每个层叠上下文都完全独立于它的兄弟元素：当处理层叠时只考虑子元素。
			- 每个层叠上下文都是自包含的：当一个元素的内容发生层叠后，该元素将被作为整体在父级层叠上下文中按顺序进行层叠。

		- [BFC （块级格式化上下文）](https://developer.mozilla.org/zh-CN/docs/Web/Guide/CSS/Block_formatting_context)

			- 创建块级格式上下文的方式

				- 根元素（<html>）
				- 浮动元素（float 值不为 none）
				- 绝对定位元素（position 值为 absolute 或 fixed）
				- 行内块元素（display 值为 inline-block）
				- 表格单元格（display 值为 table-cell，HTML 表格单元格默认值）
				- 表格标题（display 值为 table-caption，HTML 表格标题默认值）
				- 匿名表格单元格元素（display 值为 table、table-row、 table-row-group、table-header-group、table-footer-group（分别是 HTML table、tr、tbody、thead、tfoot 的默认值）或 inline-table）
				- overflow 值不为 visible、clip 的块元素
				- display 值为 flow-root 的元素
				- contain 值为 layout、content 或 paint 的元素
				- 弹性元素（display 值为 flex 或 inline-flex 元素的直接子元素），如果它们本身既不是 flex、grid 也不是 table 容器
				- 网格元素（display 值为 grid 或 inline-grid 元素的直接子元素），如果它们本身既不是 flex、grid 也不是 table 容器
				- 多列容器（column-count 或 column-width (en-US) 值不为 auto，包括column-count 为 1）
				- column-span 值为 all 的元素始终会创建一个新的 BFC，即使该元素没有包裹在一个多列容器中

			- 作用

				- 包含内部浮动

					- 让浮动内容和周围的内容等高（参与高度计算）

				- 排除外部浮动
				- 阻止外边距重叠

					- 创建新的BFC避免两个相邻的div之间外边距重叠

		- BEM命名规范

			- Bem 是块（block）、元素（element）、修饰符（modifier）的简写，由 Yandex 团队提出的一种前端 CSS 命名方法论

				- - 中划线 ：仅作为连字符使用，表示某个块或者某个子元素的多单词之间的连接记号。
				- __ 双下划线：双下划线用来连接块和块的子元素
				- _ 单下划线：单下划线用来描述一个块或者块的子元素的一种状态

			- 优点

				- 获得更多的描述和更加清晰的结构，从其名字可以知道某个标记的含义

					- 通过 BEM 命名方式，模块层级关系简单清晰，而且 css 书写上也不必作过多的层级选择。

			- 例子

				- .el-image-viewer__prev
				- .el-step__title
				- .el-table__expand-icon--expanded

	- HTML​

		- 块元素
		- 行内元素
		- 语义化
		- 媒体元素
		- canvas

- javascript​

	- 数据类型

		- 基本类型

			- number
			- string
			- undefined
			- null
			- boolean
			- symbol

		- 引用类型

			- array
			- object
			- function

		- 判断

			- typeof 用来判断基本类型

				- 对于 null，则返回 object
				- array object 等其他引用类型，返回 object

			- instanceof 判断引用类型
			- Object.prototype.toString.call([]) 也可以用来判断类型
			- [flow.js](https://flow.org/en/)

	- this

		- this 是在运行时进行绑定的,并不 是在编写时绑定,它的上下文取决 于函数调用时的各种条件。this 的 绑定和函数声明的位置没有任何关 系,只取决于函数的调用方式。
		- 执行上下文

			- 当一个函数被调用时,会创建一个 活动记录(有时候也称为执行上下 文) 。这个记录会包含函数在哪里 被调用(调用栈) 、函数的调用方 法、传入的参数等信息。this 就是 记录的其中一个属性,会在函数执 行的过程中用到。

		- 绑定规则和优先级

			- 1.new绑定

				- 使用 new 来调用函数,或者说发生 构造函数调用时,会自动执行下面 的操作。
				- 1. 创建(或者说构造)一个全新的对 象。
				- 2. 这个新对象会被执行 [[ 原型 ]] 连接。
				- 3. 这个新对象会绑定到函数调用的 this。
				- 4. 如果函数没有返回其他对象,那 么 new 表达式中的函数调用会自 动返回这个新对象。

			- 3.隐式绑定

				- 调用位置是否有上下文对象,或者 说是否被某个对象拥有或者包含
				- 被隐式绑定的函数会丢失绑定对象,也就是说它会应用默认绑定,从而把 this 绑定到全局 对象或者 undefined 上,取决于是 否是严格模式。

			- 2.显式绑定

				- 硬绑定：由于硬绑定是一种非常常用的模 式,所以在 ES5 中提供了内置的方 法 Function.prototype.bind

					- bind的传参方式和call一致

				- 使用函数的 call(..) 和apply(..) 方法，第一个参数是一个对象,它们会把 这个对象绑定到this,接着在调用函 数时指定这个 this

					- apply的第二个参数是一个数组对象或类数组对象
					- call除第一个参数，后续为一个参数列表，传递多个参数

			- 4.默认绑定

				- 独立函数调用

		- 箭头函数并不是使用 function 关 键字定义的,而是使用被称为“胖箭 头”的操作符 => 定义的。箭头函 数不使用 this 的四种标准规则,而 是根据外层(函数或者全局)作用域 来决定 this。

	- 作用域

		- 词法作用域

			- 作用域气泡由其对应的作用域块代 码写在哪里决定,它们是逐级包含 的
			- 作用域查找会在找到第一个匹配的 标识符时停止。在多层的嵌套作用 域中可以定义同名的标识符,这叫 作“遮蔽效应” (内部的标识符“遮蔽” 了外部的标识符)
			- 欺骗词法作用域

				- JavaScript 中的 eval(..) 函数可以 接受一个字符串为参数,并将其中 的内容视为好像在书写时就存在于 程序中这个位置的代码
				- with 可以将一个没有或有多个属 性的对象处理为一个完全隔离的词 法作用域,因此这个对象的属性也 会被处理为定义在这个作用域中的 词法标识符

		- 函数作用域

			- 函数作用域的含义是指,属于这个 函数的全部变量都可以在整个函数 的范围内使用及复用(事实上在嵌 套的作用域中也可以使用)
			- 利用函数作用域隐藏内部实现

				- 有很多原因促成了这种基于作用域 的隐藏方法。它们大都是从最小特 权原则中引申出来的,也叫最小授 权或最小暴露原则。这个原则是指 在软件设计中,应该最小限度地暴 露必要内容,而将其他内容都“隐藏” 起来,比如某个模块或对象的 API 设计
				- 隐藏”作用域中的变量和函数所带 来的另一个好处,是可以避免同名 标识符之间的冲突, 两个标识符可 能具有相同的名字但用途却不一 样,无意间可能造成命名冲突

			- 匿名函数表达式

				- 匿名函数表达式,因为 function().. 没有名称标识符。函数表达式可以 是匿名的, 而函数声明则不可以省 略函数名——在 JavaScript 的语法 中这是非法的

					- 优点

						- 匿名函数表达式书写起来简单快捷,很多库和工具也倾向鼓励使用 这种⻛格的代码

					- 缺点

						- 1. 匿名函数在栈追踪中不会显示出有意义的函数名,使得调试很困难
						- 2. 如果没有函数名,当函数需要引 用自身时只能使用已经过期的 arguments.callee 引用
						- 3. 匿名函数省略了对于代码可读性 / 可理解性很重要的函数名

			- 立即执行函数表达式

				- IIFE,代表立即执行函数表达式 (Immediately Invoked Function Expression)

					- 形式一：(function foo(){ .. })()
					- 形式二：(function(){ .. }())
					- 用法一

						- 非常普遍的进阶用法是把它们当作 函数调用并传递参数进去

					- 用法二

						- 倒置代码的运行顺序,将需要运行 的函数放在第二位,在 IIFE 执行之 后当作参数传递进去

		- 块级作用域

			- with 从对象中创建出的作用域仅 在 with 声明中而非外部作用域中 有效
			- try/catch 的 catch 分句会创建一 个块作用域,其中声明的变量仅在 catch 内部有效
			- let/const 关键字可以将变量绑定到所在 的任意作用域中(通常是 { .. } 内 部) 。换句话说,let/const 为其声明的变 量隐式地了所在的块作用域

		- 变量提升

			- 变量和函数声明从它们在代码中出现的位置被“移动”到了最上面。这 个过程就叫作提升
			- 只有声明本身会被提升,而赋值或 其他运行逻辑会留在原地。如果提 升改变了代码执行的顺序,会造成 非常严重的破坏。函数会首先被提升,然后 才是变量

	- 闭包

		- 当函数可以记住并访问所在的词法作用域时,就产生了闭包,即使函数 是在当前词法作用域之外执行
		- 应用

			- 模块

				- 必须有外部的封闭函数,该函数 必须至少被调用一次(每次调用都 会创建一个新的模块实例) 。
				- 封闭函数必须返回至少一个内部 函数,这样内部函数才能在私有作 用域中形成闭包,并且可以访问或 者修改私有的状态。

			- 柯里化
			- 节流、防抖
			- compose 组合函数

	- 函数式编程
	- [垃圾回收](https://juejin.cn/post/6844904016325902344)

		- 新生代（副垃圾回收器）

			- 作用

				- 保存生存时间较短的对象

			- 实现方式

				- 新生代中用 Scavenge 算法来处理，所谓Scavenge 算法，是把新生代空间对半划分为两个区域，一半是对象区域，一半是空闲区域
				- 副垃圾回收器会把这些存活的对象复制到空闲区域中，同时它还会把这些对象有序地排列起来，所以这个复制过程，也就相当于完成了内存整理操作，复制后空闲区域就没有内存碎片了。
				- 完成复制后，对象区域与空闲区域进行角色翻转，也就是原来的对象区域变成空闲区域，原来的空闲区域变成了对象区域。这样就完成了垃圾对象的回收操作，同时这种角色翻转的操作还能让新生代中的这两块区域无限重复使用下去。

			- 缺点

				- 由于采用 Scavenge 算法，所以执行垃圾清理的时候，都需要把对象区域复制到空闲区域，每次都需要一定时间，所以一般新生去的空间会比较小

			- 特点

				- 因为新生代空间不大，所以很容易溢出，所以 V8 采用了对象晋升策略，如果2次辣鸡回收之后依然存活，就会被移动到老生代区域

		- 老生代(主垃圾回收器)

			- 作用

				- 保存时间较长的对象

			- 特点

				- 占用空间大
				- 存活时间长

			- 实现方式

				- 主垃圾回收器是采用标记 - 清除（Mark-Sweep）的算法进行垃圾回收的。
				- 首先是标记过程阶段。标记阶段就是从一组根元素开始，递归遍历这组根元素，在这个遍历过程中，能到达的元素称为活动对象，没有到达的元素就可以判断为垃圾数据。
				- 对一块内存多次执行标记 - 清除算法后，会产生大量不连续的内存碎片。而碎片过多会导致大对象无法分配到足够的连续内存，于是又产生了另外一种算法——标记 - 整理（Mark-Compact），这个标记过程仍然与标记 - 清除算法里的是一样的，但后续步骤不是直接对可回收对象进行清理，而是让所有存活的对象都向一端移动，然后直接清理掉端边界以外的内存。

		- 代际假说

			- 第一个是大部分对象在内存中存在的时间很短，简单来说，就是很多对象一经分配内存，很快就变得不可访问；
			- 第二个是不死的对象，会活得更久。

		- 工作流程

			- 第一步是标记空间中活动对象和非活动对象。所谓活动对象就是还在使用的对象，非活动对象就是可以进行垃圾回收的对象。
			- 第二步是回收非活动对象所占据的内存。其实就是在所有的标记完成之后，统一清理内存中所有被标记为可回收的对象。
			- 第三步是做内存整理。一般来说，频繁回收对象后，内存中就会存在大量不连续空间，我们把这些不连续的内存空间称为内存碎片。当内存中出现了大量的内存碎片之后，如果需要分配较大连续内存的时候，就有可能出现内存不足的情况。所以最后一步需要整理这些内存碎片，但这步其实是可选的，因为有的垃圾回收器不会产生内存碎片

		- 全停顿

			- 每次执行垃圾回收的时候，都会暂停js的脚本执行，等辣鸡回收完毕，在恢复执行，这种被称作全停顿
			- 新生代中，由于空间较小，且对象存活较少，所以影响不大，老生代的话，会容易出现卡顿。
			- 为了降低老生代的垃圾回收而造成的卡顿，V8 将标记过程分为一个个的子标记过程，同时让垃圾回收标记和 JavaScript 应用逻辑交替进行，直到标记阶段完成，我们把这个算法称为增量标记（Incremental Marking）算法。

	- OOP

		- 原型链
		- 继承

			- 构造函数继承
			- 原型链继承

	- [事件循环](https://juejin.cn/post/6844904079353708557)

		- 宏任务

			- setTimeout、setInterval、script、setImmedate、IO、Promise.resolve

		- 微任务

			- process.nextTick、Promise、async await、mutation observer

		- 浏览器

			- 执行宏任务，然后执行该宏任务产生的微任务，若微任务在执行过程中产生了新的微任务，则继续执行微任务，微任务执行完毕后，再回到宏任务中进行下一轮循环。

		- node

			- [Node.js 事件循环，定时器和 process.nextTick()](https://nodejs.org/zh-cn/docs/guides/event-loop-timers-and-nexttick/)

	- 异步

		- promise
		- async、await

	- generator
	- 迭代器 for of
	- 事件流

		- 捕获

			- 事件的传播顺序为从根节点到触发的的具体元素

		- 触发
		- 冒泡

			- 事件的传播顺序为从事件开始的具体元素直到根节点

	- 模块规范

		- es6module
		- commonjs
		- amd
		- cmd

	- [ES6](https://es6.ruanyifeng.com#docs/intro)

	- [Web Components](https://developer.mozilla.org/zh-CN/docs/Web/Web_Components)

	- 严格模式

		- 严格模式不会自动创建全局变量 (比如你压根没声明变量，就会直接报错)
		- 严格模式 无法给 NaN 进行赋值
		- 严格模式 如果删除不可删除的属性会报错
		- 严格模式要求参数名唯一（应该不会有人函数的参数名写的是一样的吧）
		- 严格模式禁止八进制数字语法（ECMAScript 规范并不支持这个， ES6 增加了一个 以 '0o' 开头的来表示八进制数字）
		- ECMAScript 6中的严格模式禁止设置primitive值的属性.不采用严格模式,设置属性将会简单忽略(no-op),采用严格模式,将抛出TypeError错误
		- 严格模式禁止使用 with

### typescript​ 

### ​浏览器​

- 渲染过程

	- 输入网址，浏览器交给浏览器进程开始处理你输入的内容
	- 如果不是网址，则开始跳到默认搜索引擎，执行搜索
	- 执行 beforeUnload 事件，卸载当前页面
	- 如果是网址，判断是否存在缓存，是的话，读取缓存并渲染，否则向服务器发送请求
	- 之后把控制权交给网络进程
	- 网络进程会开始执行 DNS 解析，获取 IP地址，并开始建立连接 ​计算机网络​ 
	- 请求会发送到对方服务器，然后 交给 nginx 进行处理 （如果有负载均衡，会发送到各地对应的服务器进行处理）
	- 建立连接

		- HTTP连接

			- 客户端发送SYN到服务器
			- 服务器接收到SYN，并生成ACK，发送给客户端
			- 客户端接收到服务的的SYN和ACK，标志连接建立成功

		- HTTPS连接

			- 客户端发送支持的加密协议和版本给服务端

				- Client Hello

			- 服务端找到适合的加密协议

				- Server hello

			- 服务端返回证书和公钥
			- 客户端使用根证书验证证书合法性，生成对称密钥，通过证书的公钥加密，发送给服务端
			- 服务端使用私钥解密，获取对称密钥，使用对称密钥加密数据
			- 客户端解密数据，建立SSL连接

	- 连接建立完成后，浏览器开始读取服务器返回的数据
	- 读取 HTTP 或者 HTTPS 响应的状态码

		- 是否返回 301 和 302，如果是，浏览器将读取HTTP的 Location 字段，执行重定向，并 执行 beforeUnload 之后的过程
		- 返回200，开始读取 Content-Type 字段，判断文件 MIMIE 类型

			- 并根据MIMIE 构建其他请求进行请求渲染

		- 返回404，nginx 是否有404 页面 或者 自定义 nginx 404 内容

			- 没有，执行浏览器默认的异常
			- 有，nginx 返回相关数据，开始渲染

		- 其他异常

	- 所有数据传输完成，断开连接

		- HTTP

			- 客户端发送FIN=1到服务器
			- 服务端接收到之后，发送ACK到客户端，进入等待关闭状态，此时仍然可以发送接收数据
			- 服务端发送FIN=1，表示数据已经发送完成
			- 客户端收到内容，断开连接

		- HTTPS

			- 客户端断开连接，发送close_notify

	- 渲染过程，将交给渲染进程 和 GPU 进程去负责
	- 解析的过程，其实是根据相关语义，通过词法分析和语法分析，开始构建 Token，如果不合法，将会在解析过程抛出异常
	- 解析HTML，构建DOM树
	- 解析CSS，构建styleSheets （可以通过document.styleSheets 查看浏览器解析好的一个 CSS 结构，浏览器在 CSS 解析的时候，是从后往前进行解析的，这样做的好处是可以更快的找到对应的 DOM）

		- [探究 CSS 解析原理 - Jartto's blog](http://jartto.wang/2017/11/13/Exploring-the-principle-of-CSS-parsing)

	- 合并HTML、CSS，生成render tree
	- 根据生成好的 render tree，计算每个节点的层级、transform等，并生成layout tree
	- 浏览器执行完分层后，会开始执行光栅化，并对每个渲染区域进行分块，这里浏览器做了优化。（渲染的时候，并不是全部都渲染的，由于内容过多，所以浏览器只会渲染可视区域的部分）

		- 重绘 Repaint

			- 只改变颜色，不改变位置、宽高的被称作重绘

		- 重排（回流） Reflow

			- 导致元素宽高、位置发生变化的被称为重排，重排一定会触发重绘

	- 浏览器通过显卡把需要显示的内容发送给显示器，显示器读取缓冲区的内容，根据逐行扫描的方式进行渲染
	- 渲染完成
	- 其他问题

		- 在渲染过程中，CSS是否会阻塞渲染，还有js？

			- 在渲染过程中，css会阻塞渲染，但不会阻塞解析，应该是因为需要计算样式的原因
			- js一定会阻塞解析和渲染，设置了async的script会并行下载，并立即执行，defer 会在dom解析的时候下载，但是会等完成后再去执行
			- 所以head内的js尽量不要操作dom，也不要放，不然会等js下载执行完成才会继续解析dom，造成白屏

		- css解析规则是啥样的？

			- css解析规则是从后往前进行解析的，这样的好处就是可以最快的找到被选择的样式，如果从前往后解析，可能会导致解析到一半发现不对，会再次重新解析。

- [缓存 (建议收藏)为什么第二次打开页面快？五步吃透前端缓存，让页面飞起 (juejin.cn)](https://juejin.cn/post/6993358764481085453?share_token=20ce80d0-b8e6-44d2-a47b-58b24fb9ebfe#heading-6)

	- 强缓存

		- 通过判断Expires和Cache-Control，如果可以缓存，返回200
		- Expires

			- HTTP1.0的缓存方式，一个绝对时间

		- [Cache-Control Cache-Control - HTTP | MDN (mozilla.org)](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Headers/Cache-Control)

			- public（可以被服务器和中间服务器缓存）
			- max-age=1000（表示n秒内可以读取该缓存）
			- private

				- 只能被服务器缓存

			- no-cache

				- 和服务器协商判断该文件是否可被缓存，但是不缓存过期的

			- no-store

				- 不缓存所有数据

			- must-revalidate

				- 如果浏览器缓存过期就去浏览器取

			- s-max-age

				- 该缓存可以在 代理服务端缓存多长时间

	- 协商缓存

		- 通过If-None-Match和If-Modified-Since进行判断，如果返回304，使用缓存，否则返回200，优先使用Etag进行判断，否则使用Last-Modified进行判断。

			- Etag可以准确的表示文件是否发生变化，而Last-Modified针对短时间内多次更改可能会造成缓存失效。Etag具有强弱之分，以W开头的为弱Etag，表示使用弱验证器，比较容易生成

		- If-None-Match

			- 携带Etag向服务器进行请求，判读是否可被缓存

		- If-Modified-Since

			- 携带Last-Modified向服务器进行请求，判断是否可被缓存

	- 启发式缓存

		- 如果响应头没有Expires、Cache-Control：max-age或Cache-Control: s-maxage，并且响应头不包含其他缓存的限制，就可以使用启发式缓存计算有效期，通常根据响应头中的Date字段（报文创建时间）减去Last-Modified值的10%作为缓存时间

	- 缓存位置

		- 缓存策略

			- 浏览器决定，优先使用memory cache，然后使用disk cache

		- memory cache

			- 读取速度快，适合小文件

		- disk cache

			- 读取速度慢，适合大文件

		- service worker
		- push cache

			- http2新增，当以上3种缓存都没命中之后使用，只会存在seession中，一旦会话结束就被释放，所以时间很短，并且只能被使用一次

- 跨域

	- 原因

		- 跨域主要是因为同源策略所引起的，同源策略要求域名、协议、端口三者一样属于同源

	- 解决方案

		- [CORS 跨源资源共享（CORS） - HTTP | MDN (mozilla.org)](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/CORS)

			- Access-Control-Allow-Origin（设置哪些地址可以访问，*为所有，多个域名通过，隔开）
			- Access-Control-Allow-Headers（允许的请求Headers，多个，隔开）
			- Access-Control-Allow-Methods（允许的请求方式，多个通过，隔开）
			- Access-Control-Allow-Credentials（是否允许Cookie，值为true和false，同时需要设置HTTP的same-site不能为none）
			- Access-Control-Expose-Headers（设置浏览器可以获取到的headers）
			- Access-Control-Max-Age (设置预检请求可以被缓存多久，在这期间内不在发起 options 请求)
			- 简单请求

				- 请求方式是head、get、post 3种之一
				- HTTP头部不超过Accept、Accept-Language、Content-Language、Last-Event-ID、Content-Type
				- Content-Type为： application/x-www-form-urlencoded、multipart/form-data、text/plain

			- 复杂请求

				- 非简单请求就是复杂请求，复杂请求POST会发送一个OPTIONS预检请求，判断服务器是否支持该请求方式，如果为OPTIONS请求，服务器应该返回204

		- nginx反向代理
		- document.domain
		- postMessage
		- jsonp

- 进程

	- 渲染进程
	- GPU进程
	- 浏览器进程
	- 插件进程

- web安全

	- 跨站脚本攻击 XSS（Cross Site Scripting）

		- 介绍

			- 是指恶意攻击者往Web页面里插入恶意 Script 代码，当用户浏览该页之时，嵌入其中Web里面的Script代码会被执行，从而达到恶意攻击用户的目的

		- 分类

			- 反射型（持久形）
			- 存储型（非持久形）
			- DOM型

		- 攻击方式

			- 通过xx方式，恶意注入代码，然后被执行

		- 防御

			- 对输入内容进行校验，并对一些字符做转义处理

		- [跨站脚本漏洞(XSS)基础讲解 ](https://www.jianshu.com/p/4fcb4b411a66)

	- 跨站请求伪造 CSRF（Cross-site request forgery） 

		- 介绍

			- 通过登录授信网站，并在本地生成cookie, 在不退出的情况下，去访问危险网站，就会收到攻击

		- 防御

			- 检查 http 的 Referer 字段，判断是否同域名下
			- 服务端生成一个随机的 token，每次请求的时候，服务端都去校验当前token是否过期

	- 内容安全策略 CSP（Content Security Policy）

		- 用于检测某些特定的攻击类型，包括XSS和数据注入，HTTP需要返回Content-Security-Policy，对浏览器内的资源进行检查

- 浏览器引擎

	- webkit  苹果
	- blink  谷歌
	- gecko 火狐

- F12 调试指南

### 框架

- ​Vue​ 

	- Vue2和Vue3的区别

		- data必须是个函数，在V2是可选的，不过.vue文件要求是必须的
		- 移除了 filter 过滤器
		- 实现方式从 DefineProperty 修改为 Proxy
		- vue3 中新增了 scope hoisted 用于静态提升
		- vue3中，template内支持多个根节点，而vue2是不支持的

	- 常见问题

		- data 为什么需要是个函数

			- 因为js的对象是按引用传递的，如果使用对象的话，会导致组件内数据无法保持唯一，可能会被其他组件数据修改，所以需要使用函数，每次都重新创建一个新的对象实现

		- v-for 为什么需要key

			- 在没有key的情况下（或者使用index），diff过程中，无法确定具体更新的节点，会导致删除的节点错误，所以需要一个唯一的key值，用于渲染更新，如果你不需要增删的话，用index其实也没啥问题

		- v-if和v-show的区别

			- v-show通过display none 和block属性进行控制
			- v-if 通过增删改节点进行显示控制
			- v-show要比v-if渲染性能开销要小

	- 组件传值

		- props、emit
		- $parent、$children
		- proivde、inject
		- $attrs、$listeners

	- 响应式原理

		- v2

			- 通过definePropery对data内的属性遍历添加getter、setter属性，通过watcher对Dep进行依赖收集管理，内部会通过Dep.target去维护一个当前的watcher，当数据更新的时候会去执行dep.notify方法，依次遍历当前dep内的watcher 进行数据更新
			- Observer 用于添加getter和setter
			- Dep 进行依赖收集 (收集的依赖就是watcher）
			- Watcher 

				-  watcher 主要负责保存依赖，从而在数据更新的时候，触发渲染
				-  类别

					-  data watcher
					-  watch watcher
					-  computed watcher

			- 针对数组的处理

				-  由于性能问题，Vue针对push、pop、shift、unshift、sort、splice、reverse的7个方法做了拦截处理（因为这7个会改变原有数组），进行更新。

			- 针对无法更新的处理

				-  $set

					-  在Vue2中，提供了$set的方式用于解决数据无法更新的问题，会先判断是否可以添加响应，可以的话，就调用defineReactive添加相应，并触发dep.notify执行更新

				-  $delete

					-  判断是否可以删除响应，并且不是私有属性和$data上的属性，就执行删除，继续调用dep.notify更新

		- v3

	- diff

		- [v2 Vue原理解析（八）：一起搞明白令人头疼的diff算法 - 掘金 (juejin.cn)](https://juejin.cn/post/6844903921408802829)

		- v3
		- 区别

			- v2，通过diff算法进行实现，而v3通过连续上升子序列进行判断

	- nextTick

		- 这里主要使用了事件循环的机制，通过一个callbacks数组用来维护需要异步更新的数据，从而在浏览器空闲的时候，遍历callbacks数组并执行
		- 判断是否支持Promise
		- 判断是否支持MutationObserver
		- 判断是否支持setImmediate （IE9 以上支持）
		- 降级为setTimeout实现

	- VueRouter

		- mode

			- v3

				-  hash
				-  history
				-  abstract

			- v4

				-  CreateWebHashHistroy
				-  CreateWebHistory
				-  createMemoryHistory

		- 区别

			- hash和history都是通过浏览器API进行实现的
			- hash通过hashchange的方式修改路由，而history通过history.pushstate、popstate来实现
			- abstract应用于服务端渲染，在SSR中，vue-router会自行判断路由模式来决定使用哪个

	- Vuex

		- module
		- state
		- actions
		- mutations
		- getters

	- 生命周期

		- v2

			- new Vue

				-  调用_init

					-  初始化生命周期
					-  初始化events
					-  初始化render
					-  调用beforeCreate和created

				-  initMixin

					-  给Vue原型添加_init方法

				-  stateMixin

					-  给原型挂载$data、$props

			- beforeCreate

				-  初始化data、computed、watch、props
				-  可用于第三方插件在该钩子内通过Vue.use进行挂载

			- created

				-  初始化provide、inject

			- beforeMount
			- mounted
			- beforeUpdate
			- updated
			- beforeDestory
			- destoryed
			- 执行顺序

				-  父beforeCreate created 子 beforeCreate、created
				-  父beforeMount 子beforeMount、mounted、父mounted
				-  父beforeUpdate 子beforeUpdate 、updated、父updated
				-  父beforeDestory 子beforeDestory 、destoryed、父destoryed

		- v3

			- setup

				-  替代掉v2的beforeCreate、created
				-  该函数执行完成后会开始把模板编译成render function

			- onBeforeMount

				-  在渲染前触发

			- onMounted

				-  渲染后触发

			- onBeforeUpdate

				-  更新前

			- onUpdated

				-  更新后

			- onBeforeUnmount

				-  销毁前

			- onUnmounted

				-  销毁完成

			- 生命周期是怎么执行的？

				-  内部实现了一个createHook，该函数内会去执行一个injectHook，并把组件内的生命周期函数保存到组件实例上，之后在执行渲染、更新销毁的时候，会去从组件实例取出并执行

			- 执行顺序

				-  除了beforeCreate、created在v3移除了，其余没啥变化

	- vue.js设计与实现

		- diff 对比算法

			- 简单 diff

				- [ 萌新学算法 - 简易 diff 算法 - 掘金 (juejin.cn)](https://juejin.cn/post/7050392340703707143)

			- 双端 diff

				-  介绍

					-  通过四个索引来维护需要更新的节点以及位置，如果 key 相同，则什么都不做， 如果 key 相同，则说明节点相同，可以被复用，说明需要移动节点，并且更新新旧节点索引， 如果 2个 key 相同，并且位置一样，则说明不需要移动，只需要 打补丁即可

				-  实现

					-  每次 判断更新条件为：头部的索引要小于等于尾部的索引 （无论新旧节点）
					-  新开始节点 和 旧开始节点做比较
					-  新结束节点 和 旧结束节点
					-  旧的结束节点 和 新的开始节点
					-  新的开始节点 和 旧的结束节点

				-  优点

					-  在理想情况下，每次更新我们都能找到需要移动的节点， 从而执行一次DOM 操作，而简单 diff 需要 2 次

				-  缺点

					-  双端 diff 后，无法找到可复用的节点

						-  如果 通过 上述 4 种对比，依然没有找到可以被复用的节点，我我们需要用新节点在旧节点中，进行查找，如果找到了，说明需要移动节点，移动后，我们需要设置旧 节点的值 为 undefined ,从而再次执行双端对比算法查找，并且 每次循环判断的时候，需要判断 旧的头尾部的节点是否存在，如果不存在，说明已经被处理过了，直接跳过，并移动索引。

					-  增加新节点的情况

						-  如果我们处理完，非理想情况，发现依然还有新节点，没有被处理，说明是新增的节点，所以需要在旧节点中进行插入

					-  遗漏新节点 （新增）

						-  如果 上述情况，均处理完成，如果 旧的结束节点小于旧的开始节点并且 新的结束节点大于新的开始节点   说明有节点被遗漏了，所以我们需要，去挂载这些新节点，

					-  遗漏旧节点（删除）

						-  与处理新增节点类似，反之，则说明旧的节点需要进行卸载

			- 快速 diff

				-  预先处理前后相同的节点，剩下的
				-  实现

					-  处理前置节点

						-  从开始位置循环查找具有相同key 的新旧节点，直到遇到不同的，这样就完成了前置节点的更新操作

					-  处理后置节点

						-  从结束位置循环查找具有相同key 的新旧节点，直到遇到不同的，这样就完成了后置节点的更新操作

					-  剩余节点

						-  当预处理结束后，发现如果 j > oldEnd，并且 newEnd >= j  依然还有节点未被处理，说明是新增节点
						-  如果 j > newEnd 并且 j <= oldEnd 说明需要卸载旧节点
						-  j 是之前预处理节点的索引
						-  上述情况处理完后，发现 j 可能不满足上述任何一个，然后我们需要 构建一个 source 数组，source 是剩余未处理子节点的索引，初始值默认为 -1，将用来存储新节点在旧节点位置的索引，后面可以通过这个计算出一个最长递增子序列，方便后续移动。
						-  移动DOM

							-   最长递增子序列 Seq 有个非常重要的意义，在新的一组节点中，重新编号索引为 0 和 1 的 2 个节点在更新后没有发行变化 （0 和 1 只是随便举个例子），说明这些节点是不需要移动的

				-  总结

					-  快速 diff 算法在实测中，性能最优，借鉴了文本 diff 的处理思路，通过预处理新旧节点中相同的前置和后置节点，当前置和后置节点都处理完后，如果无法通过挂载或卸载不存在的节点来更新，则需要根据节点的索引构造一个最长递增子序列，这个序列所指向的节点就是不需要移动的节点

		- 渲染器

			- Vue3 提出了一个渲染器的概念，这个主要是因为 现在 Vue3 不仅可以用来编写 web、也会用来编写小程序等，渲染器的主要目的是为了可以自定义渲染。
			- 渲染器 会返回 render（普通渲染）、hydrate（SSR）、createApp，具体代码在 packages/rumtime-core/src/renderer.ts
			- 自定义渲染器实现方式主要是给渲染器提供了一个 rendererOptions 类型的参数，该参数里面会包含 插入、设置、创建、删除等各种操作，这样就可以脱离平台，从而实现自定义渲染的功能。

		- 响应式

			- 调度器 Scheduler
			- 副作用函数 Effect
			- computed

				-  计算属性其实是一个懒执行的副作用函数，通过 lazy 属性，可以让副作用函数可以延迟执行，被标记为懒执行的函数可以手动通过调度器进行执行， 通过这个，定义 一个 dirty 变量，每次读取计算属性的时候，执行副作用函数，并把 dirty 属性设置为 false, 当计算属性发生变化的时候，dirty 属性 为 true，说明需要重新进行计算，这样就实现了缓存的效果。

			- watch

				-  watch 本身是用作监听，他接收 三个参数，第一个是需要监听的值， 第二个是回调函数，函数内会有监听的新值和旧值，还有个 onInvalidate，该函数会在副作用函数时，过期的时候执行。
				-  watch 的实现本质上依然是利用了 effect 和 scheduler，当值发生变化时，会通过 scheduler 来执行回调函数，并且把变化前后的值，传递给函数，每次更改时，通过一个变量，来保存上次更新的值，这样就实现了新旧值的变化。
				-  立即执行是如果设置了 immediate 属性，直接执行就行了
				-  深度监听本质还是 通过一个函数把需要监听的属性 通过递归的形式来传递给 watch
				-  onInvalidate （竞态问题，反正我是没遇到过，可能遇见也不知道），每次执行副作用函数之前，通过一个变量来保存过期函数的回调，每次执行回调函数之前，如果存在过期回调，则执行之前保存的过期函数，并把 onInvalidate 函数和新旧值传递给 watch 的回调函数。

			- reactive
			- ref

				-  由于 proxy 没办法对基本数据类型做代理，所以 Vue 内部 通过一个 createRef，去创建了一个 RefImpl 的包装对象，内部维护了一个 private 的 value 属性，用来保存 ref 的结果，因为 ref 和 reactive 都是通过 proxy 进行包装实现的，所以内部 会通过一个 __v_isRef 来标识。
				-  如果 ref 里面的值 是个对象的话，将会 通过 reactive 进行执行。
				-  并且，由于 ref 进行包装了一层，所以 vue 为了不让你在模板写 xxx.value，会在 组件安装的时候，通过 setup 拿到 组件 返回的结果，并且会执行一个 proxyRefs 方法，给你去掉 .value，这样在渲染期间就不用写 xx.value 了。

			- toRefs

		- 
		- 虚拟DOM

			- 原生计算

				-  js 创建并渲染
				-  innerHTML 销毁所有旧的，并创建新的

			- 框架计算

				-  创建 vdom 对象，并且 + diff 算法，找到最小更新

			- 渲染性能：innerHTML <  vdom < 原生 js

		- 构建产物

			- vue.runtime.esm-bundle.js 带-bundle 的 是给 webpack、rollup 用的
			- 而-browser 是给script的 type module 用的

		- 组件

			- 内置组件

				-  keepAlive

					-  LRU cache

				-  Teleport
				-  Transition

			- 渲染组件

				-  createComponentInstance 创建组件实例
				-  setupComponent 安装组件

					-  初始化 props、slots
					-  是否是状态组件（返回的是个对象，如果是函数，则说明是函数式组件）
					-  设置状态组件

						-  执行 setup。如果是 promise，执行 setup 返回的promie、 并进行处理
						-  如果 不存在 setup ，则完成 组件安装

					-  finishComponentSetup 完成组件安装

						-  如果组件有 render 函数，则保存到组件实例上的render 属性上
						-  如果不存在render，并且有 template，开始编译模板，并把编译后的模板，保存到 组件实例的 render 属性上
						-  注：这里保存的只是生成的渲染函数，执行是在后面去执行的

				-  执行 setupRenderEffect，开始准备渲染

					-  如果组件没被渲染

						-  执行 onBeforeMount （渲染之前）
						-  渲染根节点组件，并生成 subtree

							-   并设置当前渲染的组件实例
							-   执行 组件实例上的 render 函数，生成 subtree
							-   清空当前渲染的组件实例

						-  执行 patch 开始渲染组件
						-  执行 onMounted 渲染完成

			- 异步组件
			- 生命周期

				-  createHook 

					-  createHook 返回一个新的函数，函数内部执行了 injectHook（injectHook 的作用是把对应的生命周期都保存到组件实例上）

						-  设置当前的组件实例
						-  遍历所有 hook，并执行
						-  重置当前执行的组件实例

		- 编译器

			- parser 解析AST

				-  有限状态机

			- transform 转换节点 (在这一步去做点优化什么的，并且确定之后的节点要如何生成)

				-  创建转换器上下文
				-  针对 AST 节点，通过 DFS（深度优先遍历） 的方式，进行转换， 并对每个节点调用转换器函数，转换器会返回一个新的函数，从而在所有子节点转换完成后执行，再次进行处理

					-  transformOnce  转换 v-once
					-  createStructuralDirectiveTransform （处理指令，只有v-if、elseif、else、for，其余 v-model 等在 transformElement去处理）
					-  transformExpression 转换表达式
					-  transformSlotOutlet 转换 slot
					-  transformElement 转换节点 (在这一步处理 keepAlive、组件、标签，一些指令会依次再次执行，从而生成 patchFlag，并且执行完后，会最终确定该元素或者组件需要调用什么样的函数去进行生成)
					-  trackSlotScopes (处理 slot-scoped)
					-  transformText 转换文本
					-  ignoreSideEffectTags (处理 script 和 style，如果有这2个就给你报编译异常，并删除节点？) 
					-  transformStyle 转换样式
					-  warnTransitionChildren (transition 是否具有多个子节点，有就报错)

				-  第一次调用转换器表示进入这个函数（从前往后），最后执行完，再次执行转换器是倒序执行的，这样做的好处是，当执行退出的时候，再次执行转换器，当前访问的节点的子节点都会被处理过
				-  并且在转换期间，确定最终需要生成的帮助函数，如 v-for（renderList）
				-  scope hosited 静态提升

			- generator 生成 render function

				-  生成渲染函数，其实就是字符串拼接
				-  创建生成器上下文
				-  是否是 服务端渲染
				-  根据之前的帮助函数，从而注入生成函数所需要的内容( const {_h,  renderList: _renderList，$props,  $setup } = _Vue ) 等
				-  并通过 with 去包装 生成的渲染函数（这样，你就不用在模板 写 this 了）
				-  最终通过 new Function ()  保存到组件实例上，从而在后面组件渲染期间，调用 new Function 来生成 subtree (vnode tree)
				- [ Vue Template Explorer (vue-next-template-explorer.netlify.app)](https://vue-next-template-explorer.netlify.app#eyJzcmMiOiI8dWw+XHJcbiAgPGxpIHYtZm9yPVwiaXRlbSBpbiAxMFwiIDprZXk9XCJpdGVtXCI+PC9saT5cclxuPC91bD4iLCJzc3IiOmZhbHNlLCJvcHRpb25zIjp7Im1vZGUiOiJmdW5jdGlvbiJ9fQ==)

		- 编译器优化

			-  scope hosited 静态提升

				-  静态提升是指把纯静态的内容，在 transform 期间确定是否需要静态提升，从而在 generator 期间 在 渲染函数顶部进行生成，渲染函数内只会保存对节点的引用
				-  这样当数据发生变化的时候，渲染函数再次执行时，并不会创建新的虚拟节点，从而减少了性能开销
				-  可以减少更新时创建虚拟DOM带来的性能开销和内存占用
				-  静态提升的限制

					-  根节点的 block 节点不会被提升
					-  如果 节点 DOM 树下存在 动态节点，则整个节点都不会被提升
					-  如果 动态节点的 props 等是静态的，那该 props 依然可以被提升

			-  v-once  

				-  v3 不仅会缓存内联事件处理函数，配合 v-once 还可以实现 对虚拟DOM 的缓存，可以避免造成不必要的更新

			-  block tree 和 patchFlag

				-  Vue.js 会对根节点、v-for、if、elseif、else 所生成的节点，创建一个 block tree, 最终通过 dynamicChildren 来进行保存，通过这种方式，就可以收集到动态变化的子节点，从而跳过静态节点的更新。
				-  这样在 diff 的时候，如果存在 dynamicChildren 的话，就可以只更新动态的节点

			-  预字符串化

				-  预字符串是基于静态提升的一种优化策略，静态提升的虚拟节点或者节点树本身就是静态的，那么就可以直接生成对应的 html 字符串
				-  好处

					-  大块的静态内容可以通过 innerHTML 进行设置，在性能上具有一定优势
					-  减少创建虚拟DOM 的性能和内存开销

			-  Fragement

				-  Vue.js 支持了 template 下多子节点，实际内部是去创建了一个 Fragement 来实现

		- SSR 服务端渲染

			- CSR
			- SSR
			- 同构渲染

- ​React​ 

	- Hooks

		- useState
		- useEffect
		- useMemo
		- useCallback

	- 生命周期

		- 挂载

			- constructor

				-  如果不初始化State或者不绑定方法，则无需实现

			- static getDerivedStateFromProps() 不常用

				-  会在render函数调用前执行，并且在初始挂载和更新都会执行，需要返回一个对象来更新state，返回null则不更新

			- render 

				-  class组件必须实现的一个方法，需返回React元素、数组、Fragement、Portals、字符串、数组、布尔类型（不渲染）

			- componentDidMount

				-  会在组件挂载后（插入DOM中）立即执行，可以在这里进行网络请求

		- 更新

			- static getDerivedStateFromPorps()
			- shouldComponentUpdate 不常用
			- render
			- getSnapshotBeforeUpdate 不常用
			- componentDidUpdate

				-  会在更新后被立即调用，首次渲染不会执行，在这里调用setState必须包含在条件语句，否则可能死循环

		- 销毁

			- componentWillUnmount

				-  会在组件卸载和销毁之前直接调用，不应该在此调用setState
				-  取消定时器、移除事件监听器等

		- 错误处理

			- static getDerivedStateFromError
			- componentDidCatch

	- 
	- setState

		- setState() 将对组件 state 的更改排入队列，并通知 React 需要使用更新后的 state 重新渲染此组件及其子组件。这是用于更新用户界面以响应事件处理器和处理服务器数据的主要方式
		- setState() 并不总是立即更新组件。它会批量推迟更新


## ​计算机网络​ 

### HTTP3

- 介绍

	- 基于udp并封装了一层quic协议进行实现

- 优点

	- 彻底解决tcp阻塞

- [HTTP/3 原理实战 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/143464334)

### HTTP2

- 优点

	- 多路复用
	- 使用二进制传输
	- 头部压缩
	- server push

- 缺点

	- 依然存在TCP阻塞，部分情况下可能会比http1.1还慢

- 基于HTTPS协议，但是加密是可选的

### HTTP

- 状态码

	- 1xx 信息

		-  101 切换协议

	- 2xx 请求成功

		-  200 成功
		-  204 预见请求
		-  206 范围请求，如果有Range和 if-range 将返回206

	- 3xx 重定向

		-  301 永久重定向
		-  302 临时重定向
		-  304 存在协商缓存

	- 4xx 客户端错误

		-  400 客户端错误
		-  401 认证失败
		-  403 服务端接受到了请求，但是拒绝访问
		-  404 文件不存在
		-  405 请求方式错误
		-  415 未知的媒体类型

	- 5xx 服务端错误

		-  500 服务器异常
		-  502 网关错误
		-  503 服务器繁忙中
		-  504 服务器飞了

- 请求方式

	- GET 传输数据
	- POST 向服务端发送数据
	- OPTIONS 检查服务器是否支持给请求
	- PUT 发送文件
	- HEAD
	- DELETE
	- TRACE
	- CONNECT

- TCP 队头阻塞

	- TCP 在传输的过程中，会通过滑动窗口的形式进行拥塞控制
	- 原因

		-  报文丢失
		-  报文需要重传

	- 在传输的过程中，报文可能会因为网络原因导致传输失败，可能后面的已经接受到了，而前面的发生了丢失，这时候就会把断掉的报文后面的包丢失掉，然后重新传
	- 解决方案

		-  慢开始
		-  阻塞避免
		-  快重传
		-  快恢复

### HTTPS

- 在http的基础上，增加了 TLS/SSL 协议进行加密传输、身份认证网络协议，通过数字证书、加密算法（RSA）、非对称加密进行传输
- 对称加密

	- 客户端和服务端都采用一样的密钥，比如DES、AES

- 非对称加密

	- 客户端和服务端都采用不同的密钥，一把作为私钥，一把作为公钥，公钥加密的信息只能被私钥加密，反之，私钥加密的信息，只能被公钥解密。

- 安全

	- [HTTPS中间人攻击实践（原理·实践）](https://www.cnblogs.com/lulianqi/p/10558719.html#:~:text=%E4%B8%AD%E9%97%B4%E4%BA%BA%E6%94%BB%E5%87%BB%E7%9A%84%E5%9F%BA%E6%9C%AC%E4%BB%8B%E7%BB%8D%E5%8F%AF%E8%83%BD%E7%9C%8B%E8%BF%99%E9%87%8C%EF%BC%88%20https%3A%2F%2Fzh.wikipedia.org%2Fwiki%2F%E4%B8%AD%E9%97%B4%E4%BA%BA%E6%94%BB%E5%87%BB%20%EF%BC%89%E3%80%82%20%E5%A4%A7%E8%87%B4%E6%98%AF%E8%AF%B4%E4%B8%80%E7%A7%8D%E5%9C%A8%E7%BD%91%E7%BB%9C%E4%B8%AD%E5%8A%AB%E6%8C%81%E4%BC%9A%E8%AF%9D%E7%9A%84%E6%94%BB%E5%87%BB%E6%96%B9%E6%A1%88%EF%BC%8C%E5%A6%82%E6%9E%9C%E5%8F%AA%E7%9B%91%E5%90%AC%E6%B5%81%E9%87%8F%E7%A7%B0%E4%B9%8B%E4%B8%BA%E8%A2%AB%E5%8A%A8%E7%BD%91%E7%BB%9C%E6%94%BB%E5%87%BB%EF%BC%88passive%20network,attack%EF%BC%89%EF%BC%8C%E5%A6%82%E4%BD%95%E6%94%BB%E5%87%BB%E8%80%85%E4%B8%BB%E5%8A%A8%E4%BF%AE%E6%94%B9%E6%95%B0%E6%8D%AE%E6%B5%81%E7%A7%B0%E4%B9%8B%E4%B8%BA%E4%B8%BB%E5%8A%A8%E7%BD%91%E7%BB%9C%E6%94%BB%E5%87%BB%EF%BC%88active%20network%20attack%EF%BC%89%E3%80%82%20%E4%B8%8A%E5%9B%BE%E7%AE%80%E5%8D%95%E7%9A%84%E8%A1%A8%E8%BF%B0%E4%BA%86%E4%B8%AD%E9%97%B4%E4%BA%BA%E6%94%BB%E5%87%BB%E7%9A%84%E4%B8%BB%E8%A6%81%E8%BF%87%E7%A8%8B%EF%BC%88%E4%B8%8A%E9%83%A8%E4%B8%BA%E6%AD%A3%E5%B8%B8https%E6%B5%81%E9%87%8F%EF%BC%8C%E4%B8%8B%E9%83%A8%E4%B8%BA%E8%A2%AB%E5%8A%AB%E6%8C%81%E7%9A%84https%E6%B5%81%E9%87%8F%EF%BC%89%EF%BC%8C%E5%90%8E%E9%9D%A2%E6%88%91%E4%BB%AC%E5%8F%AF%E4%BB%A5%E5%AF%B9%E7%9D%80%E8%BF%99%E4%B8%AA%E5%9B%BE%E6%9D%A5%E5%AE%9E%E6%96%BD%E6%88%91%E4%BB%AC%E8%87%AA%E5%B7%B1%E7%9A%84%E4%B8%AD%E9%97%B4%E4%BA%BA%E6%94%BB%E5%87%BB%E3%80%82%201%EF%BC%9AFiddler%20%EF%BC%88%E6%B3%A8%E6%84%8F%E8%99%BD%E7%84%B6Fiddler%E6%8A%93%E5%8F%96HTTPS%E6%8A%A5%E6%96%87%E7%9A%84%E5%AE%9E%E9%99%85%E5%8E%9F%E7%90%86%E5%B0%B1%E6%98%AFMITM%EF%BC%8C%E4%B8%8D%E8%BF%87%E8%BF%99%E9%87%8C%E5%BD%93%E7%84%B6%E4%B8%8D%E6%98%AF%E7%94%A8Fiddler%E5%AE%9E%E6%96%BD%E4%B8%AD%E9%97%B4%E4%BA%BA%E6%94%BB%E5%87%BB%E3%80%82)

### HTTP和HTTPS握手

### DNS

- 查询

	- 查询的时候，会向域名服务器进行查询，接收这个查询请求的域名服务器首先会在自己的数据库进行查找，如果有该域名的ip则返回，没有则继续上上一层根域名服务器进行查询，直到根域名服务器
	- 解析器和域名服务器将最新的域名会缓存，方便下次查找

### OSI

- 应用层

	- 为应用程序提供服务并规定通信的相关细节

- 表示层

	- 将应用处理的信息转换为适合网络传输的格式，或者将下一层的数据转换为上一层能处理的格式，主要负责数据转换

- 会话层

	- 负责建立和断开连接，以及书的分割等数据传输的相关内容

- 传输层

	- 管理2个点的数据传输（确保数据被送达）

- 网络层

	- 将数据传输到目标地址，目标地址可以是多个网络通过路由器连接而成的地址，主要负责寻址和路由选择

- 数据链路层

	- 负责物理层上互联、节点之间的通信传输，将0、1序列划分为具有意义的数据帧传送给对方（数据帧的生成和接收）

- 物理层

	- 负责0、1比特流与电压的高低、灯光闪灭的转换

### CDN

### TCP

- TCP阻塞

	- 动画：如何给面试官回答 TCP 的拥塞控制？ (juejin.cn)

- 拥塞控制

	- 慢启动

		-  发送方向接收方发送 1 个单位的数据，收到对方确认后会发送 2 个单位的数据，然后依次是 4 个、8 个……呈指数级增长，这个过程就是在不断试探网络的拥塞程度，超出阈值则会导致网络拥塞；

	- 拥塞避免

		-  指数增长不可能是无限的，到达某个限制（慢启动阈值）之后，指数增长变为线性增长；

	- 快速重传

		-  发送方每一次发送时都会设置一个超时计时器，超时后即认为丢失，需要重发；

	- 快速恢复

		-  在上面快速重传的基础上，发送方重新发送数据时，也会启动一个超时定时器，如果收到确认消息则进入拥塞避免阶段，如果仍然超时，则回到慢启动阶段。

## ​数据结构和算法​ 

### 复杂度

- 大O表示法

	- O(1) 常量阶
	- O(logn) 对数阶
	- O(n) 线性阶
	- O(nlogn) 线性对数阶
	- O(n²) 平方阶 O(n^k) K方阶
	- O(2^n) 指数阶
	- O(n!) 阶乘阶

- 时间复杂度
- 空间复杂度
- 最好时间复杂度

	- 在最理想的情况下，执行这段代码的时间复杂度。

- 最坏时间复杂度

	- 在最糟糕的情况下，执行这段代码的时间复杂度

- 平均时间复杂度

	- 用代码在所有情况下执行的次数的加权平均值表示

- 平摊时间复杂度

	- 在代码执行的所有复杂度情况中绝大部分是低级别的复杂度，个别情况是高级别复杂度且发生具有时序关系时，可以将个别高级别复杂度均摊到低级别复杂度上。基本上均摊结果就等于低级别复杂度。

### 学习

- [数据结构与算法之美 (geekbang.org)](https://time.geekbang.org/column/intro/100017301)

- 刷题计划

	- [「算法」 - 学习计划 - 力扣（LeetCode）全球极客挚爱的技术成长平台 (leetcode-cn.com)](https://leetcode.cn/study-plan/algorithms/?progress=2vmobjd)

	- [「数据结构」 - 学习计划 - 力扣（LeetCode）全球极客挚爱的技术成长平台 (leetcode-cn.com)](https://leetcode.cn/study-plan/data-structures)

	- [「剑指 Offer」 - 学习计划 - 力扣（LeetCode）全球极客挚爱的技术成长平台 (leetcode-cn.com)](https://leetcode.cn/study-plan/lcof)

- 书籍

	- labuladong 的算法小抄
	- 剑指 offer

### 收集一些不错的网站

- [OI Wiki (oi-wiki.org)](https://oi-wiki.org)

### 数组

### 链表

- 单链表
- 双链表
- 解题思路

	- 理解指针的引用和含义：将某个变量赋值给指针，实际上就是将这个变量的地址赋值给指针，或者反过来说，指针中存储了这个变量的内存地址，指向了这个变量，通过指针就能找到这个变量。
	- 警惕指针丢失和内存泄漏
	- 利用哨兵简化实现难度
	- 重点留意边界条件处理
	- 举例画图，辅助思考
	- 多写多练，没有捷径

- 常见题

	- 简单 - 合并 2 个有序链表 
	- [206. 反转链表 - 力扣（LeetCode） (leetcode-cn.com)](https://leetcode.cn/problems/reverse-linked-list)

	- 判断链表是否有环
	- 判断链表的中间节点

### 可视化

- [Data Structure Visualization (usfca.edu)](https://www.cs.usfca.edu/~galles/visualization/Algorithms.html)

### 队列

### 栈

- 特点

	- 先进后出，后进先出

### 排序

- 冒泡排序
- 插入排序
- 选择排序
- 快速排序
- 归并排序
- 堆排序

	- 堆必须是个完全二叉树
	- 堆中的每个节点的值必须大于等于或者小于等于每个子节点的值

- 希尔排序

### 搜索

- BFC 广度优先遍历
- DFS 深度优先遍历

### 树

- 二叉树

	- 满二叉树

		-  除根节点以外，每个子节点都有2个叶子节点，被称为满二叉树

	- 完全二叉树

		-  除最后一层节点外，上层节点必须达到最大，并且最后一层子节点向左排列，被称为完全二叉树

	- 二叉搜索树

		-  特点

			-  在树中任意一个节点，左边的每个节点，都要小于这个节点，而右边的都要大于这个节点

		-  优点

			-  支持快速查找、插入、删除等

		-  缺点

			-  针对有重复数据的情况下，查找、插入、删除的时间复杂度会和高度成正比，会退化成链表和完全二叉树，所以就有了平衡二叉树

	- 遍历方式

		-  前序

			-  先打印当前叶子根节点，在打印他的左叶子节点，然后是右叶子节点

		-  中序

			-  先打印它的左叶子节点，然后打印当前叶子节点的跟节点，最后打印右节点

		-  后序

			-  先打印它的左叶子节点，然后打印右叶子节点，最后打印跟节点

		-  层序遍历

	- 相关例题 ​二叉树​ 

		-  二叉树的前中后序遍历

- 平衡二叉树

	- 定义

		-  二叉树中任意一个节点的左右子树的高度相差不能大于1

	- 红黑树

		-  特点

			-  跟节点是黑色的
			-  每个叶子节点都是黑色的null节点，也就是说，红色节点是被黑色节点隔开的
			-  每个节点，从该节点到达其可达叶子节点的所有路径，都包含相同数目的黑色节点

		-  性能稳定，实现具麻烦

- Trie树

### ​图​ 

- 树中的元素被称为节点，而图中的元素则被称为顶点，图中的一个顶点与任意其他顶点建立连接关系，这种关系被称为边，跟顶点相连接的边的条数被称为度。
- 分类

	- 有向图

		-  边有方向的图被称为有向图
		-  度

			-  入度
			-  出度

	- 无向图

		-  边没有方向的图没称为无向图

	- 带权图

		-  在带权图中，每条边都有一个权重，可以通过权重来表示关系

### 存储

- 邻接矩阵存储

	-  邻接矩阵是通过二维数组去存储的
	-  无向图
	-  有向图

		-  如果顶点 i 和顶点 j 之间，有一条箭头从顶点 i 指向顶点 j 的边，那我们就将 A[i][j] 标记为1，同理，从顶点 J 指向顶点 I，那就将 A[J][I] 标记为1

	-  带权图

		-  数组中就存储相应的权重

	-  优点

		-  存储方式简单，直接，基于数组，在获取两个顶点的关系时，非常高效
		-  方便计算，通过邻接矩阵存储图，可以将很多图的运算转换为矩阵之间的运算

	-  缺点

		-  如果存储的是顶点很多，单每个顶点的边并不多，就会造成空间浪费

	-  例题

		-  最短路径

- 邻接表

### 动态规划 DP

- [动态规划基础 - OI Wiki (oi-wiki.org)](https://oi-wiki.org/dp/basic)

### 贪心算法

- 例题

	- 简单   1221. 分割平衡字符串 - 力扣（LeetCode） (leetcode-cn.com)

### ​二分查找​ 

- 二分查找是通过每次计算数组中间的值，并通过low和high记录一个最高和最低值，并且每次循环计算的时候，不算缩小low和high的差距，最终并返回结果
- 二分查找适合有序的数组，时间复杂度为O(logn)
- 相关例题

	- 简单　704. 二分查找 - 力扣（LeetCode） (leetcode-cn.com)
	- 中等　34. 在排序数组中查找元素的第一个和最后一个位置 - 力扣（LeetCode） (leetcode-cn.com)

## 监控

### 性能监控 ​前端性能优化​ 

- 前端性能优化

	- 性能指标

		- FP（First Paint）首次绘制
		- FCP (First Contentful Paint) 首次内容绘制
		- LCP（Largest Contentful Paint）最大内容绘制
		- DCL (DocumentContentLoaded) dom加载完成
		- L （Onload）页面加载完成
		- TTI（Time To Interactive）可交互
		- TBT （Total Blocking Time）页面阻塞总时长
		- FID （First Input Delay）首次输入延迟
		- CLS （Cumlative Layout Shift）累计布局偏移
		- SI (Speed Index) 首次显示页面可见部分的平均时间

- 检测方式

	- F12 lighthouse 生成渲染报告 (要科学上网)
	- F12 performance 查看页面渲染过程
	- [Measure (web.dev)](https://web.dev/measure)

- 计算方式

	- 浏览器的Performance 

- [雅虎35条军规前端性能优化之雅虎35条军规 (juejin.cn)](https://juejin.cn/post/6844903657318645767#heading-26)

	- 服务器

		-  使用cdn
		-  使用浏览器缓存
		-  启用gzip
		-  配置etag
		-  ajax使用get请求（get可以被缓存，post不会）
		-  避免图片src为空
		-  尽早输出内容（服务端渲染）

	- 页面内容

		-  减少http请求
		-  减少dns查询
		-  避免重定向
		-  缓存ajax请求
		-  延迟加载
		-  预加载
		-  减少dom元素数量
		-  划分内容到不同域名
		-  减少iframe使用
		-  减少404

	- Cookie

		-  减少cookie大小
		-  静态资源使用无cookie的域名

	- 移动端

		-  保持单个文件小于25kb
		-  打包内容为分段multipart文档

	- 图片

		-  尽可能使用webp
		-  css sprite（雪碧图）
		-  不要在html中缩放图片
		-  使用体积小，可缓存的favicon.ico

	- js

		-  script放页面底部
		-  使用外部js和css
		-  压缩css js
		-  删除重复脚本
		-  减少dom操作
		-  使用高效的事件处理

	- css

		-  把样式表放在head内
		-  不用使用css表达式
		-  使用link代替@import
		-  不要使用filter（不是css3的filter，ie的东西）

### 异常监控

### 埋点

## webAssembly

##  ​node​ 

### 模块查找规则

- 模块支持的格式：js、json、node（c++编译后生成的模块）
- 查找是否内置模块
- 查找是否自定义模块 如/ ../ ./等
- 查找是否node_modules模块，会从当前目录的上一级一直查询到根目录下的node_modules目录
- 从环境变量的NODE PATH加载
- 报错：找不到模块
- 核心模块也可以使用require('node:http')，将会跳过缓存，直接从lib目录进行加载   node16以上支持
- 可以通过require.resolve(xxx) 获取模块的加载路径

### 模块实现原理

- node在加载模块的时候，会对模块进行缓存，引入多次也只会加载一次。
- (function(exports, require, module, __filename, __dirname) {// 模块代码实际存在于此处});

### stream

- readStream 可读流
- writeStream 可写流
- duplex 双工流
- transform 转换流

	- 压缩流
	- 加密流

### 非阻塞异步IO

- [Node.js理论实践之《异步非阻塞IO与事件循环》 (juejin.cn)](https://juejin.cn/post/6847902221317701640)

### 中间件

- [深入浅出node中间件原理 (juejin.cn)](https://juejin.cn/post/6891126082200993805)

### 插件

- node-gyp
- node-addon
- N-api

### [官方指南：指南 | Node.js (nodejs.org)](https://nodejs.org/zh-cn/docs/guides)

### 进程通信

## 工程化-基础建设

### Node 基础脚手架等

### 基本编译原理

### 构建工具

- ​webpack​ 

	- 编译流程

		- 创建 Compiler 编译对象
		- 初始化入口，解析入口文件，构建依赖树
		- 确定编译环境
		- 初始化内部解析
		- 开始对文件进行编译
		- 对每个模块创建Compilation

			- Compilation 会对依赖树的模块进行编译，可以在编译期间被加载、封存、优化、分块、重新创建

		- 编译结束
		- 输出文件
		- 编译完成

	- 编译优化

		- 优化分析

			- 体积分析：webpack-bundle-analyzer
			- 速度分析：speed-measure-webpack-plugin
			- 日志分析：webpack --stats

		- 优化方案

			- 使用dllPlugin
			- babel-loader添加cacheDirectory
			- 使用thread-loader优化loader
			- 使用高版本node和webpack
			- 开启tree shaking和scope hoisting
			- webpack5配置长缓存
			- 使用css-minimizer-webpack-plugin压缩css
			- 使用terser-wbpack-plugin压缩js，并去掉无用的js
			- webpack5的module-federation
			- split chunks 分包

	- HMR

		- webpack-dev-server 在启动的时候会给 entry 去注入webpack/hot/dev-server
		- 注入wbpack-dev-server/client/index.js
		- 判断是否存在webpack.HotModuleReplacementPlugin （作用：这个插件会注入一个module.hot的一个对象，该对象提供了一些方法，用于更新）
		- 监听webpack hooks的compile（编译）、done（编译成功） 、invalid （编译失败）钩子
		- 初始化express、webpack-dev-middleware
		- 启动express、socket服务

			- socket服务主要是用于监听一些特定的事件进行更新处理

		- webpack-dev-middleware会以watch的形式监听文件更改，当文件发生变化的时候，会生成xxx.hot-update.js（当前的文件）和xxx.hot-update.json（下次更改的hash），调用location.reload() 刷新页面

	- [tree shaking Tree Shaking | webpack 中文文档 (docschina.org)](https://webpack.docschina.org/guides/tree-shaking)

		- 基于es6的模块机制实现，主要是因为es6的模块是静态的，可以被webpack解析，而require、import是可以动态的
		- 如果有些模块没有副作用需要在package.json设置sideEffects: false
		- 副作用：在导入时会执行特殊行为的代码，而不是仅仅暴露一个 export 或多个 export。举例说明，例如 polyfill，它影响全局作用域，并且通常不提供 export

	- [模块解析规则 模块解析（Module Resolution） | webpack 中文文档 (docschina.org)](https://webpack.docschina.org/concepts/module-resolution#resolving-rules-in-webpack)

		- webpack 通过 enhanced-resolve 对模块进行解析，支持绝对路径、相对路径、模块路径 

	- 核心

		- mode

			- development
			- production
			- none

		- entry

			- 入口文件

		- output

			- 输出的路径

		- loader

			- webpack只支持js进行编译，而其他文件都需要通过loader进行转换，loader本质是个函数，每个loader都会拿到上一个loader所处理的结果，并在当前loader进行处理，然后并返回，传递给下一个loader。
			- 可以通过loader-runner进行调试，schema-utils对loader的参数进行校验
			- [Loader Interface | webpack 中文文档 (docschina.org)](https://webpack.docschina.org/api/loaders)

		- Hash

			- hash

				-  每次构建都会生成新的Hash，并且所有 chunk 一样

			- chunk hash

				-  每次构建如果文件发生变化则生成新的Hash，否则不生成，但是如果引用 css 文件，依然会导致 hash 重新生成
				-  chunk hash 根据入口的文件进行递归依赖解析，从而生成对应的 hash

			- content hash

				-  每次构建生成新的Hash，如果 css 发生了变化，js则不重新生成，css 则生成 hash
				-  content hash 根据文件内容生成，推荐使用

		- external 用来过滤模块
		- [devtool Devtool | webpack 中文文档 (docschina.org)](https://webpack.docschina.org/configuration/devtool)

			- ​Source Map​ 

		- target

			- web
			- node

	- plugin

		- 作用

			-  plugin 的作用是监听 webpack 的生命周期，在对应的生命周期进行相应的处理

		- 原理

			-  plugin是个类，需要提供一个apply方法，apply内接受compiler对象，compiler是webpack构建期间所生成的编译对象，可以通过监听compiler.hooks.xxx.tap 或者tapAsync，来实现插件，其中还有一个重要的对象是compilation，而compilation是webpack每次产生新的构建就会生成的一个对象，其中compiler在整个构建期间只会有一个，而compilation会有多个。
			-  compiler和compilation都继承于tapable，而tapable其实是类似于node的eventEmitter的一个库，插件主要就是通过compiler或者compilation对webpack的构建周期进行各种处理的一个方式。

	- tapable

		-  同步

			-  SyncHook
			-  SyncBailHook
			-  SyncWaterfallHook
			-  SyncLoopHook

		-  异步

			-  并行

				-  AsyncParallelHook
				-  AsyncParallelBailHook

			-  串行

				-  AsyncSeriesHook
				-  AsyncSeriesBailHook
				-  AsyncSeriesWaterfallHook

		-  类型

			-  bail

				-  当前函数有返回值，就停止执行

			-  waterfall

				-  调用时，值会传递给下一个函数

			-  loop

				-  如果某个hook 调用的时候，有返回值，则从第一个函数执行到当前函数（无限循环），如果没返回值，所有函数执行完成就结束

		-  注册方式

			-  同步通过tap进行注册，异步通过tapAsync、tapPromise

		-  调用方式

			-  同步通过call进行调用，异步通过callAsync、promise

	- 如何检测xx插件是否存在

		-  遍历插件，判断 plugin 的 constructor.name 属性即可

- ​Rollup​ 
- Vite

### 组件库

### 微前端

### 低代码

## 跨端

### mobile-h5
### React Native、Flutter

### jsbridge、Hybrid App、cordova

### 微信小程序

### uniapp、taro

### electron

## 单元测试

### jest
## DevOps

### docker

### nginx

### jenkins

### [Kubernetes](https://kubernetes.io)

### CI/CD

## 图形可视化

### canvas

### webGL

