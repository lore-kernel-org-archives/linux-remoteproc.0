Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EC43901B;
	Tue, 21 Jul 2026 20:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784666914; cv=fail; b=m7OmUW03Gy3SFnahJi1pT0I8vA8KIreVw+exDnJAkylEh5ZqigrACLYSk/aDo+Wcc98BSzGdwTuYH6tUDLC/f8h4PUM4I2THqO7/IKU/acv4dUSEDifHXXfSNlfEy3ssy1l/38HimfjBOBelz/Rk9jASZYJSCnLoq2mblwWU6DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784666914; c=relaxed/simple;
	bh=GDco7f3oLgHntWWyJOCm3sIuJkc4YcuJDvhgFiAfnBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hLjRZ4rO36qJh9qa9SKoCLXH7zGhJI7i+jx8cY9t+bD3RbJFAPfZ1MlCFPS0ozEtH/ihmzUiHEz5HiIRgE+1oPRzxTOt6Aa2VEPLzR6bg/Zhe3FJIWj16je+MKLSCLutv9STdkCHwUu/YC2wO6UBFSKGd2jWMDIIbIiVWjynGCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XZXbDATG; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XZXbDATG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbJKHlmSmj2qIXf2oXN2dksdaTK/ivc2OonJkoWKQhxZYtPt63YXonH2y4qvg48qEezEpXCVq+6mNlW13U5y2sSifd0YCSarNFcUDjg6ntmNf1TX9Z5/t2HT4ofdhkzgr3nl+uCC3npyZHQzBDwt5lj/JbBVWnFtO/Z2bSQROnGKolhPSEQJP2KI+jJcfFDj9bBgQmYM39m8BjvHh44xd304/XWtiJZIvslTNzNwsm59d/tFzj2HttBK6hHD53oQskjOzNWIncixGK82nIJQFbCvg2ere25MavqwBLx6zlFPn4VjSTLoehFEJ3FhEgsHj8LsugQmzRIgUMkeOUArvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp4odsnw1L595ulsyKuDRzoxABwB2Ifnp043P9ex7Us=;
 b=AqCJrD8HqkE+UZ09SR1HNG50tQV2kXcvsoaaU91fjPeWsl6slOUi1TPAKgJgSBB+8fqp+n0AgjqaJTJv5xyMMfShdHEl0Rh5QMVAZa5obPwxysFph+f8AwG1s35vWH1Ue/RoIDTDuK14xcEfcIHLUjOK5PAUO7epUNg9CbccxRnXQJwNsO5mOWqWzsZoYztNmW8Ag7rXFF8RRpOLA+gUGOhbDRv50rNBGYhwyMgeTCsBXAC5ilUxPyOUtthGL4FfTlZZFarPhslEnjySuKXXx14gh3UoX1uO8jUc0rSjBhp8Kc50bDTcL6Jl1mcERZZbIX3AbbHiU+KV29T9QvxwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp4odsnw1L595ulsyKuDRzoxABwB2Ifnp043P9ex7Us=;
 b=XZXbDATG73EVxonC2lFuxrWsBhU8V3pozjNFU0F0G8kokzXZMQkR84zcQ8ncM5lGEl8UbynLifFqQSvOoNGIm6kOoretc/xaNj1Gn424wzl+ss3M32g40iJ2ikR6+HqohKO9pnI2L4UbbuFKff1tKt0l8OEopsQBsClhvX88Uh8o6YvQB8CJmPbd1rfhV73dX0YMbz5Sn/jeU4hPMEoY14aamokcKR86l+v9ADNUX9fuTmKTi765U0RsbLs8f7Hh6TJMwsMG7rg3mOM4zMeMqIxetaKW7WcT7EG5M8mUY0KjiIcuZbnq6ZeSwNUdfl2h9xWbGFkJQXSHkwT6MJ+7CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:27 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:26 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Tue, 21 Jul 2026 15:46:47 -0500
Message-ID: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:806:121::10) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6f2e17-9dd6-452e-4373-08dee76969ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|5023799004|11063799006|3023799007|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	ItOSK6aC6z5t346zIGJJ1z5TW9IGjAKS5qjhpS5j4J3BY4c7RKtiVtg7cBn15qrWQrzAfTw737Vu2M39IONbQfOB8pNo3uU69KYP6OLzLujDhADGycOXqxizYWMTqqi0IXdV+i9mL3FGJWn8IJqBLBE7KO5ogXsKYGQ2L3DpEUoYE0SH89DsCwlQVgiNMj/xnOhLSKOoVQtPGK6AdYiJq4MsFjSWUymSOi45s1RuABFBifIi3JYV5fFLpwkg7KT4QjV+TxS9SS9ogEbGWE9ecpB/UESju73wTverrKhKRWTJHHoS8/MkudM8NvPCT/r8Ngs/3q0l1sEC6hYucAQTWAK2pGeTtftSz+yP3f3XnCZJ30Pf8ARjsoACBoesCgGow0c8iQSyXMHlb6AX0jwVB8WcvcfWl1ZWf3YvYcIDKDq1ycndt1vckjH2CrTV5kSBPNux6B1XbVVrk7ebnYTtnpg5bip+PSmkQWiq4h17imBK0JQgjVVyvEhiUmYwoZRBLaBiPyIhqVwkBSWjkyOfd108DLL7iw41eg1KHSnmiMJDrGx1Q0QYldZ8zdZWiJWdjcYX0X8eUjhMr+fLau9RThZouqAIIJwHILH6+oQh1PszVy0vGLcXx8fMxnhjqU0+PHyYcm/eOlSe+F9EDGce4pR+J4dz6oysjHkLyXTaD2TRhH3Cm8sXY3JtDHeBJ47onWoBzQjgFzv9hA6OoNxmYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(5023799004)(11063799006)(3023799007)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrWmaL5kH6vIQHikmhlELUUdH8jth5dx5WNbhop1BU2AYRktx6t5qgu5EZLq?=
 =?us-ascii?Q?kqDdLiDeXG65TKMuxb9l9SLpV9enkBMywa/Odgfu+PJ50/1sP0sEOJeIfz+i?=
 =?us-ascii?Q?weQJ7FgoiQrg8+CUJM4BP0qhyftheCttEuTrtQgg8+WqUdSzIghT5ByVwsmk?=
 =?us-ascii?Q?yF5QXGlpzDRLDguue6ZaEK+s4v6odrpB8H+Z18bMUzds3zXDs0pQlo6QnnwV?=
 =?us-ascii?Q?FhPaWVwD0zBp63hYfCmfjEi/quz/RL0WNisLY84JCItVHp8bmnZYL8OU8NpI?=
 =?us-ascii?Q?cyqUKnjbUIGzH3pKLZlI4N5QWhtndNwTJ9ZJR3DIWiDjJlAb0xx7UZ/Yf+wq?=
 =?us-ascii?Q?8BqM4kd+dnyGHhGFEUBvydqTlItwDWMKs6w5N3HOmJQ1gPYx9j2MMbgSiyr7?=
 =?us-ascii?Q?caT/6Q39CxQXa5jQgwGd8RP6cStLXiuLQbgO3a1xTf6gBQeXLSUqAZtCAnWi?=
 =?us-ascii?Q?U7yBk9zAWTO8cZlpcGB+Oe4gAjUOxagfTetc759QM697pcGY9uW/llSBUrHp?=
 =?us-ascii?Q?bTC4wlZqCiCaB3DirJdfL4SIz2/7DdmuuFDYhqaBON/yNObmq/NjrPfP49vp?=
 =?us-ascii?Q?nhGfKiC7JsDlgnHnFhHg4VK5d26lqtSdlJLDnCg0O5TLzVVbnK8bBTWbgY6n?=
 =?us-ascii?Q?t4xTRc+J8Zgx6jqqoU8BfeEcIULXkxkzCq/SWJMFrNEEweHc7PAadmZmKe+U?=
 =?us-ascii?Q?NWSb8AfdH9XiRYq7eeysIIeAZYix+YmHjt6PuDRQrDB1WJJ6yrc/WRP+Jnwd?=
 =?us-ascii?Q?oqnEmxxfw+5IYLgUcoDuIuMTvjVYRmAZtueCOucdxpphNR0XjLpvoW7CB65+?=
 =?us-ascii?Q?ZRWpWJzWBWhzeVxfK0lSoNynN14wjMH8Pw7+yXPB9yYF7vEoeq/GK+sqcAAu?=
 =?us-ascii?Q?DuJDJTuKCxJttbT+SZt21V0J1XbqpTo4WMTRIRF7TToBtPfqHlz+f96a7vWV?=
 =?us-ascii?Q?fQMFhXU4B7ckKaMf5qDWPZleBLRPrn3RvmQItI0agydrrGbTew2k/EJE50bS?=
 =?us-ascii?Q?ZZThbI458fOwLPBs6DfzIEFDcaPf2L+LldqPl5yL6ekaYN4ZGxjv66aQa4jh?=
 =?us-ascii?Q?YV/2nGNRT5d1WRe3SnznpQETrXCjqEZUgEONeFYtsWM4760IB//Myuj/wOJH?=
 =?us-ascii?Q?t7xlij142DvsfmK1FM9q9a56QuUlmL2jJlUvI6HF6QiAZGtIXVSZG81UcqCy?=
 =?us-ascii?Q?nVQxvFdNx8rFC2m2CboZ31fa1HqFBtZBDPE0UxzE81A2I5usFfLHfihl9Gqt?=
 =?us-ascii?Q?igoIMJ3CUjRh/PG+U6awa4+CDD2Yll3qI7g4I7bdzJJdi/dfXMfomiyskccG?=
 =?us-ascii?Q?QNImacEU3suwtGhcVll1kOSfPUo9teM8Ix5rwPO2VlRRnTDcDnqiYtpKMJ6H?=
 =?us-ascii?Q?3hdixhCMBoCXlhzbdZM2w9wwwTNVMrOswZCdw9wLb6gTnstcMfjFs7yzhnKo?=
 =?us-ascii?Q?PfWTme3Jju2jFvrjgIvUurm01Kw/rlWVEGDsCWHiAwM+rw6qjNdHgHvMsu+M?=
 =?us-ascii?Q?jph8va/AHlDoL8BVL4/Raz0RD8fmvN9heAFeGjGmzrJuHuOggEgQ/Sc3b4ay?=
 =?us-ascii?Q?vnxtHAGH5C4EX6yRvlEl4ET0yHPQk+clvQ5CeZQ7lRBcYTAq91bE40ljL8ta?=
 =?us-ascii?Q?DaHZ3gnzNye7NBwztv0NEEQftXwIDDX4EYs/EUem+t96dg1AUlt2NIwzUFcy?=
 =?us-ascii?Q?XxwhFhF5gU/X+57aHKhoCDT1Xx3fIZpIciG/72CGYYJ9crvJSg+6pcI0QHRD?=
 =?us-ascii?Q?oi9QJe3e5C2URuqeCOI1oZGv7r2WYkRthFJv5aEZbayekjByBjbP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6f2e17-9dd6-452e-4373-08dee76969ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:26.9110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IJWmWKgL/Q8qgL/bZ01XQk5j8O6sfdvvFmFPJr/wX/E3ZnRvUPnJSf2LQ28MdG0/XdvrSC3Nur469FWqC8AckLOgh/eXCzoG29GcGQohRYMreiXbTBpItY/Jb709ss8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284

From: Shenwei Wang <shenwei.wang@nxp.com>

On an AMP platform, the system may include multiple processors:
	- MCUs running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig      |  17 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-rpmsg.c | 587 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 605 insertions(+)
 create mode 100644 drivers/gpio/gpio-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f03c05288376..9fb8ab4d3616 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1954,6 +1954,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_RPMSG
+	tristate "Generic RPMSG GPIO support"
+	depends on OF && REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default REMOTEPROC
+	help
+	  Say Y here to enable GPIO controllers exposed over an RPMSG
+	  communication channel to a remote processor. GPIO operations
+	  and interrupt configuration requests are forwarded to the
+	  remote side through RPMSG, allowing Linux to control GPIOs
+	  implemented by a remote firmware.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index fa14581e3995..89d26f1aaf1c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
 obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
 obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
 obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
+obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
 obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
 obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
 obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 000000000000..5d2d59e6314b
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,587 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
+#include <linux/virtio_gpio.h>
+
+#define GPIOS_PER_PORT_MAX		32
+#define RPMSG_TIMEOUT			1000
+
+/* GPIO Receive MSG Type */
+#define GPIO_RPMSG_REPLY	0
+#define GPIO_RPMSG_NOTIFY	1
+
+#define CHAN_NAME_PREFIX	"rpmsg-io-"
+#define GPIO_COMPAT_STR		"rpmsg-gpio"
+
+struct rpmsg_gpio_response {
+	__u8 type;
+	union {
+		/* command reply */
+		struct {
+			__u8 status;
+			__u8 value;
+		};
+
+		/* interrupt notification */
+		struct {
+			__le16 line;
+		};
+	};
+};
+
+struct rpmsg_gpio_line {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_type;
+};
+
+struct rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct rpmsg_device *rpdev;
+	struct virtio_gpio_request *send_msg;
+	struct rpmsg_gpio_response *recv_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	struct work_struct eoi_work;
+	DECLARE_BITMAP(pending_eoi, GPIOS_PER_PORT_MAX);
+	u32 ngpios;
+	u32 idx;
+	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_MAX];
+};
+
+static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
+{
+	int ret;
+
+	reinit_completion(&port->cmd_complete);
+
+	ret = rpmsg_send(port->rpdev->ept, port->send_msg, sizeof(*port->send_msg));
+	if (ret) {
+		dev_err(&port->rpdev->dev, "rpmsg_send failed: cmd=%d ret=%d\n",
+			port->send_msg->type, ret);
+		return ret;
+	}
+
+	ret = wait_for_completion_timeout(&port->cmd_complete,
+					  msecs_to_jiffies(RPMSG_TIMEOUT));
+	if (ret == 0) {
+		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=%d\n",
+			port->send_msg->type);
+		return -ETIMEDOUT;
+	}
+
+	if (port->recv_msg->status != VIRTIO_GPIO_STATUS_OK) {
+		dev_err(&port->rpdev->dev, "remote core replies an error: cmd=%d!\n",
+			port->send_msg->type);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static struct virtio_gpio_request *
+rpmsg_gpio_msg_prepare(struct rpmsg_gpio_port *port, u16 line, u16 cmd, u32 val)
+{
+	struct virtio_gpio_request *msg = port->send_msg;
+
+	msg->type = cpu_to_le16(cmd);
+	msg->gpio = cpu_to_le16(line);
+	msg->value = cpu_to_le32(val);
+
+	return msg;
+}
+
+static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_VALUE, 0);
+
+	ret = rpmsg_gpio_send_message(port);
+	return ret ? ret : port->recv_msg->value;
+}
+
+static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION, 0);
+
+	ret = rpmsg_gpio_send_message(port);
+	if (ret)
+		return ret;
+
+	switch (port->recv_msg->value) {
+	case VIRTIO_GPIO_DIRECTION_IN:
+		return GPIO_LINE_DIRECTION_IN;
+	case VIRTIO_GPIO_DIRECTION_OUT:
+		return GPIO_LINE_DIRECTION_OUT;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
+			       VIRTIO_GPIO_DIRECTION_IN);
+
+	return rpmsg_gpio_send_message(port);
+}
+
+static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
+
+	return rpmsg_gpio_send_message(port);
+}
+
+static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
+{
+	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int ret;
+
+	guard(mutex)(&port->lock);
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);
+	ret = rpmsg_gpio_send_message(port);
+	if (ret)
+		return ret;
+
+	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
+			       VIRTIO_GPIO_DIRECTION_OUT);
+	return rpmsg_gpio_send_message(port);
+}
+
+static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
+		break;
+	default:
+		dev_err(&port->rpdev->dev, "unsupported irq type: %u\n", type);
+		return -EINVAL;
+	}
+
+	port->lines[line].irq_type = type;
+
+	return 0;
+}
+
+/*
+ * This unmask/mask function is invoked in two situations:
+ *   - when an interrupt is being set up, and
+ *   - after an interrupt has occurred.
+ *
+ * The GPIO driver does not access hardware registers directly.
+ * Instead, it caches all relevant information locally, and then sends
+ * the accumulated state to the remote system at this stage.
+ */
+static void gpio_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_unmask = 1;
+}
+
+static void gpio_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	/*
+	 * When an interrupt occurs, the remote system masks the interrupt
+	 * and then sends a notification to Linux. After Linux processes
+	 * that notification, it sends an RPMsg command back to the remote
+	 * system to unmask the interrupt again.
+	 */
+	port->lines[line].irq_mask = 1;
+}
+
+static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	port->lines[line].irq_shutdown = 1;
+}
+
+static void gpio_rpmsg_eoi_irq(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	set_bit(d->hwirq, port->pending_eoi);
+	schedule_work(&port->eoi_work);
+}
+
+static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->lock);
+}
+
+static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 line = d->hwirq;
+
+	/*
+	 * For mask irq, do nothing here.
+	 * The remote system will mask interrupt after an interrupt occurs,
+	 * and then send a notification to Linux system. After Linux system
+	 * handles the notification, it sends an rpmsg back to the remote
+	 * system to unmask this interrupt again.
+	 */
+	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
+		port->lines[line].irq_mask = 0;
+		mutex_unlock(&port->lock);
+		return;
+	}
+
+	if (port->lines[line].irq_shutdown) {
+		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
+				       VIRTIO_GPIO_IRQ_TYPE_NONE);
+		port->lines[line].irq_shutdown = 0;
+	} else {
+		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
+				       port->lines[line].irq_type);
+
+		if (port->lines[line].irq_unmask)
+			port->lines[line].irq_unmask = 0;
+	}
+
+	rpmsg_gpio_send_message(port);
+	mutex_unlock(&port->lock);
+}
+
+static const struct irq_chip gpio_rpmsg_irq_chip = {
+	.name = "rpmsg-gpio",
+	.irq_mask = gpio_rpmsg_mask_irq,
+	.irq_unmask = gpio_rpmsg_unmask_irq,
+	.irq_eoi = gpio_rpmsg_eoi_irq,
+	.irq_set_type = gpio_rpmsg_irq_set_type,
+	.irq_shutdown = gpio_rpmsg_irq_shutdown,
+	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static void gpio_rpmsg_eoi_work(struct work_struct *work)
+{
+	struct rpmsg_gpio_port *port =
+		container_of(work, struct rpmsg_gpio_port, eoi_work);
+	unsigned long pending[BITS_TO_LONGS(GPIOS_PER_PORT_MAX)];
+	unsigned int line;
+
+	guard(mutex)(&port->lock);
+
+	bitmap_copy(pending, port->pending_eoi, port->ngpios);
+	bitmap_zero(port->pending_eoi, port->ngpios);
+
+	for_each_set_bit(line, pending, port->ngpios) {
+		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
+				       port->lines[line].irq_type);
+
+		if (rpmsg_gpio_send_message(port))
+			dev_err(&port->rpdev->dev, "EOI error for line %u\n", line);
+	}
+}
+
+static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, u32 idx,
+				   struct device_node *np, const char *name)
+{
+	struct rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&rpdev->dev, &port->lock);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
+	if (ret || port->ngpios > GPIOS_PER_PORT_MAX)
+		port->ngpios = GPIOS_PER_PORT_MAX;
+
+	port->send_msg = devm_kzalloc(&rpdev->dev,
+				      sizeof(*port->send_msg),
+				      GFP_KERNEL);
+
+	port->recv_msg = devm_kzalloc(&rpdev->dev,
+				      sizeof(*port->recv_msg),
+				      GFP_KERNEL);
+	if (!port->send_msg || !port->recv_msg)
+		return -ENOMEM;
+
+	INIT_WORK(&port->eoi_work, gpio_rpmsg_eoi_work);
+	init_completion(&port->cmd_complete);
+	port->rpdev = rpdev;
+	port->idx = idx;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &rpdev->dev;
+	gc->fwnode = of_fwnode_handle(np);
+	gc->ngpio = port->ngpios;
+	gc->base = -1;
+	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   name, port->idx);
+
+	gc->direction_input = rpmsg_gpio_direction_input;
+	gc->direction_output = rpmsg_gpio_direction_output;
+	gc->get_direction = rpmsg_gpio_get_direction;
+	gc->get = rpmsg_gpio_get;
+	gc->set = rpmsg_gpio_set;
+
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_fasteoi_irq;
+
+	dev_set_drvdata(&rpdev->dev, port);
+
+	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
+}
+
+static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
+{
+	const char *name = NULL;
+	struct device_node *np;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np = of_node_get(rproc->dev.of_node);
+	if (!np && rproc->dev.parent)
+		np = of_node_get(rproc->dev.parent->of_node);
+
+	if (np) {
+		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
+		of_node_put(np);
+	}
+
+	return name;
+}
+
+static struct device_node *
+rpmsg_find_child_by_compat_reg(struct device_node *parent, const char *compat, u32 idx)
+{
+	struct device_node *child;
+	u32 reg;
+
+	for_each_available_child_of_node(parent, child) {
+		if (!of_device_is_compatible(child, compat))
+			continue;
+
+		if (of_property_read_u32(child, "reg", &reg))
+			continue;
+
+		if (reg == idx)
+			return child;
+	}
+
+	return NULL;
+}
+
+static struct device_node *
+rpmsg_get_gpio_ofnode(struct rpmsg_device *rpdev, const char *compat, u32 idx)
+{
+	struct device_node *np_chan, *np_rproc, *np_rpmsg, *np_io;
+	struct rproc *rproc;
+
+	rproc = rproc_get_by_child(&rpdev->dev);
+	if (!rproc)
+		return NULL;
+
+	np_rproc = of_node_get(rproc->dev.of_node);
+	if (!np_rproc && rproc->dev.parent)
+		np_rproc = of_node_get(rproc->dev.parent->of_node);
+
+	if (!np_rproc)
+		return NULL;
+
+	np_rpmsg = of_get_child_by_name(np_rproc, "rpmsg");
+	of_node_put(np_rproc);
+	if (!np_rpmsg)
+		return NULL;
+
+	np_io = of_get_child_by_name(np_rpmsg, "rpmsg-io");
+	of_node_put(np_rpmsg);
+	if (!np_io)
+		return NULL;
+
+	np_chan = rpmsg_find_child_by_compat_reg(np_io, compat, idx);
+	of_node_put(np_io);
+
+	return np_chan;
+}
+
+static int rpmsg_get_gpio_index(const char *name, const char *prefix)
+{
+	const char *p;
+	int base = 10;
+	int val;
+
+	if (!name)
+		return -EINVAL;
+
+	/* Ensure correct prefix */
+	if (!str_has_prefix(name, prefix))
+		return -EINVAL;
+
+	/* Find last '-' */
+	p = strrchr(name, '-');
+
+	if (!p || *(p + 1) == '\0')
+		return -EINVAL;
+
+	if (p[1] == '0' && (p[2] == 'x' || p[2] == 'X'))
+		base = 16;
+
+	if (kstrtoint(p + 1, base, &val))
+		return -EINVAL;
+
+	return val;
+}
+
+static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
+				       int len, void *priv, u32 src)
+{
+	struct rpmsg_gpio_response *msg = data;
+	struct rpmsg_gpio_port *port = NULL;
+	u32 line;
+
+	port = dev_get_drvdata(&rpdev->dev);
+
+	if (!port) {
+		dev_err(&rpdev->dev, "port is null\n");
+		return -EINVAL;
+	}
+
+	if (msg->type == GPIO_RPMSG_REPLY) {
+		*port->recv_msg = *msg;
+		complete(&port->cmd_complete);
+	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
+		line = le16_to_cpu(msg->line);
+		generic_handle_domain_irq_safe(port->gc.irq.domain, line);
+	} else {
+		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
+	}
+
+	return 0;
+}
+
+static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
+{
+	struct device *dev = &rpdev->dev;
+	struct device_node *np;
+	const char *rproc_name;
+	int idx;
+
+	idx = rpmsg_get_gpio_index(rpdev->id.name, CHAN_NAME_PREFIX);
+	if (idx < 0)
+		return -EINVAL;
+
+	if (!dev->of_node) {
+		np = rpmsg_get_gpio_ofnode(rpdev, GPIO_COMPAT_STR, idx);
+		if (np) {
+			dev->of_node = np;
+			set_primary_fwnode(dev, of_fwnode_handle(np));
+			return -EPROBE_DEFER;
+		}
+	}
+
+	rproc_name = rpmsg_get_rproc_node_name(rpdev);
+
+	return rpmsg_gpiochip_register(rpdev, idx, dev->of_node, rproc_name);
+}
+
+static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
+{
+	struct rpmsg_gpio_port *port = dev_get_drvdata(&rpdev->dev);
+
+	cancel_work_sync(&port->eoi_work);
+}
+
+static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
+	{ .name = CHAN_NAME_PREFIX },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
+
+static struct rpmsg_driver rpmsg_gpio_channel_client = {
+	.callback	= rpmsg_gpio_channel_callback,
+	.id_table	= rpmsg_gpio_channel_id_table,
+	.probe		= rpmsg_gpio_channel_probe,
+	.remove		= rpmsg_gpio_channel_remove,
+	.drv.name	= KBUILD_MODNAME,
+};
+module_rpmsg_driver(rpmsg_gpio_channel_client);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("generic rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

