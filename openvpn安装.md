# OpenVPN 安装与配置指南

本教程适用于使用一键脚本快速部署 OpenVPN，并通过 GL.iNet 路由器导入配置文件使用的场景。

---

## 🧩 一键安装脚本

在终端执行以下命令：

```bash
curl -fsSL https://raw.githubusercontent.com/devService-lab/useless/refs/heads/main/openvpnoneclick.sh -o install-openvpn.sh && chmod +x install-openvpn.sh && sudo ./install-openvpn.sh
```

在执行过程中，系统将提示你选择配置项。直接按回车使用默认值即可。

如下图所示：

![图1](./openvpn-images/1.png)
![图2](./openvpn-images/2.png)

---

## 👤 添加客户端

安装脚本过程中会提示你输入客户端名称：

```
请输入客户端名称: rocketrobot
```

如下图所示：

![图片3](./openvpn-images/3.png)


等待安装完成,安装完毕如下图所示：

![图片4](./openvpn-images/4.png)

---

## 📂 获取配置文件

安装完毕后，在当前目录执行：

```bash
ls
```

你会看到类似 `rocketrobot.ovpn` 的文件。

如下图所示：

![图片5](./openvpn-images/5.png)


查看内容：

```bash
cat rocketrobot.ovpn
```

复制从 `client` 开始直到 `</tls-crypt>` 结束的全部内容。

如下图所示：

![图片7](./openvpn-images/7.png)
![图片8](./openvpn-images/8.png)

---

## 💾 保存配置文件

1. 在电脑桌面创建一个文本文件，命名为 `rocketrobot.ovpn`。
2. 将刚才复制的内容粘贴进去并保存。

---

## 🌐 配置路由器

打开浏览器，访问你的路由器管理页面：

```
http://192.168.8.1/#/login
```

1. 登录并切换语言为 English（如选中文可能看不到 VPN 菜单）。
2. 点击 “New Group” 如果当前有了可以跳过。
3. 点击 “Upload Configuration File”。
4. 上传你刚创建的 `rocketrobot.ovpn` 文件。

如下图所示：

![图片9](./openvpn-images/9.png)
![图片10](./openvpn-images/10.png)
![图片11](./openvpn-images/11.png)
![图片12](./openvpn-images/12.png)
![图片13](./openvpn-images/13.png)


---

## ✅ 应用配置

1. 点击 `Apply` 应用上传的配置文件。
2. 在 VPN Dashboard 和 Configuration Files 页面中即可看到新的配置项。

成功启用后，你就可以开始使用 VPN 服务了。

如下图所示：

![图片14](./openvpn-images/14.png)


---

## ⚙️ 高级设置（可选）

你可以设置只让某些特定的域名走 VPN，以节省流量和资源。

如下图所示：
![图片15](./openvpn-images/15.png)
![图片16](./openvpn-images/16.png)

---
