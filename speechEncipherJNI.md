---
title: speechEncipher Java API v0.1 使用说明
author: 苏州大学
date: 2015-06
...

# 概述

本类库为 speechEncipher 引擎的 Java 语言封装，提供了较简单的调用方式。
开发人员只需要导入 speechEncipherJNI.jar 归档文件就可以调用这些 API 函数
了。

本类库包含的包如表 \ref{tpackages} 所示。

包                      描述
-----                   -----
edu.suda.speechencipher speechencipher 包

Table: 包列表\label{tpackages}

# 快速入门

代码示例：

```java
import edu.suda.speechencipher.speechEncipher;
...
speechEncipher se = new speechEncipher();
...
se.SetConfig(nWorkMode); // nWorkMode = 1 for encipher, 0 for decipher.
...
short Input[];
short Output[];
...
int nProcessed = se.Process(Input, nInputLength, Output, nOutputLength);
...

```

# edu.suda.speechencipher 包

edu.suda.speechencipher 包含的类如表 \ref{tclasses} 所示。

类              描述
-----           -----
speechEncipher  speechEncipher 封装类

Table: edu.suda.speechencipher 类列表\label{tclasses}

## speechEncipher 类

层次关系：  
`
java.lang.Object`  
`----edu.suda.speechencipher.speechEncipher`

```java
public class speechEncipher
extends Object
```

本类基于 JNI 实现了对 speechEncipher 二进制引擎的封装，实现了
speechEncipher 的配置与数据处理功能。

其构造方法简列如下：

* `speechEncipher()`  
  默认构造函数

该类所支持的方法见表 \ref{tsemethods}。

------------------------------------------------------------------------
修饰和类型  方法和描述
-----       ------------------------------------------------------------
`int`       `SetConfig(int nWorkMode)`\
            设置 speechEncipher 工作模式

`int`       `Process(short Input[], int nInputLength, short Output[], int nOutputLength)`\
            根据配置加解密语音数据

------------------------------------------------------------------------

Table: speechEncipher 类的方法\label{tsemethods}

### speechEncipher 构造方法

```java
public speechEncipher()
```

创建 speechEncipher 对象，并负责调用 speechEncipher 引擎进行底层原生对象
的创建。底层对象会在 speechEncipher 对象被 JVM 回收时一并销毁。

### SetConfig

```java
public int SetConfig(int nWorkMode)
```

设置 speechEncipher 对象的工作模式。

**参数：**

`nWorkMode` - 工作模式。1 加密；0 解密。

**返回：**

设置成功则返回 0，否则返回负数。

### Process

```java
public int Process(short Input[],
            int nInputLength,
            short Output[],
            int nOutputLength)
```

根据配置加解密语音数据，处理后的数据存储在 `Output` 数组内。

**参数：**

`Input` - 待处理的语音数据，以数组形式存储，原生字节序。

`nInputLength` - 输入数据长度，不可超过 `Input` 数组长度。

`Output` - 处理完毕后的语音数据，以数组形式存储，原生字节序。

`nOutputLength` - 输出数据长度，不可超过 `Output` 数组长度。正常与
输入数据等长。

**返回：**

实际处理的数据长度，不大于 `nInputLength`。
