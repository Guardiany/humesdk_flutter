# 应用管理中心分包SDK Flutter版本

## 简介
  humesdk_flutter是集成了应用管理中心分包SDK的Flutter插件，只针对Android系统

## 官方文档
* [Android](https://bytedance.feishu.cn/docs/doccnWHO1ZOWn3YrZVblvoEw4th#)

## 集成步骤
#### 1、pubspec.yaml
```Dart
humesdk_flutter:
  git: https://github.com/Guardiany/humesdk_flutter.git
```

#### 2、Android
找到您的App⼯程下的libs⽂件夹，将humesdk-1.0.0.aar拷⻉到该⽬录下；

在app的build.gradle⽂件中添加如下依赖:
```
allprojects {
    repositories {
        flatDir { dirs 'libs' }
    }
}

dependencies {
    implementation files('libs/humesdk-1.0.0.aar')
}
```

## 使用

#### 1、获取SDK版本
```Dart
await HumesdkFlutter.sdkVersion;
```
#### 2、获取渠道号
```
await HumesdkFlutter.channel;
```