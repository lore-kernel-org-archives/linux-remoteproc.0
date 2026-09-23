Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2753D9C4;
	Wed, 23 Sep 2026 18:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189043; cv=fail; b=VQuTbt0KK9cihJ59m05Au2lYgJkrlW+EdBSVQoFEHZZjhyaAb7V7TeglUe79J8wum8XnbvnmYXD3AKLGdIG/9bH+jF4VegiV6QDkhzfJZXJvWBfwsOrCsYZis73YuyMEshn8JPdTaouF4/DL5eS6FJKD/T3IhIb3XAg0O9vZZhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189043; c=relaxed/simple;
	bh=KTDbsQRY3FD8429N6L3y2lIqtOsEzmB5EqoICUTnRsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e7zLSoxphkz+9jTeQnrM3yBb0ZZMFYOKmel7V0I/rbFyi5JQ83Y+9VYLVPqaRcRAMnLU9mPpbHjrsNbOVKmxjkbSEmEKQV7FlsO0s4i0yo1Tg8CIOspJEq94FVVsVRgqUgzBOEHJ0zI+JeXbeVZUdw1uCPcHCQFcd6poSJYsQXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D6l5lOp2; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D6l5lOp2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4gtLxWfjcJPx1NKXyxvo05YSZmqU3uJKGpr0BNSjNsb7CQp0OVvk4HvzRsixP2KHnpn9tscr1I+bCkiyOJ5WhzWovPpdiE14oReWLzxhiaewV0tdJs+MVGQHxbQTc3/zmNRNAdvgOj69APimwLINpIvOPTDxQpXPE++/qS4QogpnXu44f6kIrQ8YcDwUlE8gJZFvEPxP83PLZfamHo1jbhZCWUIHOAOm6KkALMCak1hhMaKac++0NuOWDJkH5EOF4HkHoq1FoWUgCF/HisRUqCDFT9qFyF+ix4ONi7q9NmKlJ9uLAXTuHLPD0PAbRdyPKK2r0i0bILCE2/I/p61yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/H1YyuagMU2vpEo7MezxjIyywaVEJaP1k+mxsJgxb1o=;
 b=Zvlm5sWByXGxf/9qK2SWze0yt2ElVhk4ixQofnAVUyRHLd3yibfK998fn/FgbEfeMIlyDLkUTsaReaW7FDENsZ5ugat5+3appthVrvyQTUizqM5uWLN+hAkmkVvt8yHx8IWrB8QsgIIpn7rGtdq/RmQMysgV6oJ5Ki5KWW+mzGupENKtKhn6M5LrCTNBuvNRZI648WCwsXuhba6b1A4wgYOOKJO/Rv6HrvzR5pXZvAQiExG5regsEOgzucByiW+1fEP7BlO7M4a2JqN0l0HzRdq0gRjl/B1WnXXcH5qmLXeQQNRUFwm9nvyEpTHIcTvaa4xu0nk3Bx2jPqIhZHT3+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/H1YyuagMU2vpEo7MezxjIyywaVEJaP1k+mxsJgxb1o=;
 b=D6l5lOp2lCpyM/zPYRYd0BJFcnqZ8rozLymPMgKxu9f21o62YElPYI1TTMlecfIA8cCptzqDmXunX0hzao/ef7UxU1mW5V6SGeUPg4MLCV1YFq/nMHJRdZDRTSwJ+zD6jOCVGhKJ9wnqcFyQOQO/LPlrjQboFhZ7ts4L5fqRMfsHPCzZVkOoNBmqBioerk7QTJFxtzDSVA5qO9IE9N46PdybXrDsx2F08EMmlZqYnLUj9e4/XPwMLijWvyJ72NIVcmpF/1wlyhK1yS8LCQ90wT/i8F17/+WG0x3BFbT4zxb4tScSUIWoRhcxvjmHJ9oz/G3VqW7bAlQ9GafFeRlCyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:35 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:35 +0000
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
Subject: [PATCH v16 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Date: Wed, 23 Sep 2026 13:42:31 -0500
Message-ID: <20260923184255.299034-5-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::18) To DB8PR04MB7129.eurprd04.prod.outlook.com
 (2603:10a6:10:127::12)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 215bde81-a870-4152-3000-08df19a29221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|6133799003|3023799007|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zm39ZiFvygxbln0jPcbvrD6h6sHnEhSsY7wRuil1SYkdhZPk0q8HbdfEjF1KdNHOfKupZidSHMaZf1wE63KtIGKBQQJhsmwX/+Q9PLp35UusjgPtMSabbdaqYhmZQ5ArBQOehF1dhItf2ROaOzWiQ8gmD/niq49ixJjCz8uwyqCztBtpQFBtkH9r8mFnoYBh5ZPPcP1MFQGW+Tir1a0HyTNPrmMS0BM6XfLy9zkpS0xC9idY9ZLTwE5HLYie4JB0ND7rM/9GuEXsRrFjsMEnseOt/HfjmEA8ljHb0dZr7m7YwnXLWxoR0TNq3K3YZhhBTUio8HA0OK4CErqYakU61ARxC1A+4wXnWEQgKKfCdX9USc7Xvc0Oykr98k2nK6nbNfbCeR5sQ5IQxtxRMLdvt8M3YVdQU1CXa7sCvY2K7tBrWtr8mI1NigXEyI3MNf/yJyZ4p4j/cJBHKfd5T/saHTmIIHV4MHYSOKe32EqytDL4QB/+Xykurdbl9nJAYud3yun1GQsrKn3nehYlrvItsksLXPbgX36ivC6I8AO/jidQy7WcWoX7HjDfii6tapHyRLQtO9A93fu2DxzLVsCJ4Mq9KKOVJ+nHZkwdtQ4DIZmUYYBzz818NrDTGn5QjVBmo9Mbvc+lklgT8kSBkUyvFkSbLWzGCvtQG7KWyL/qiB/59I2Z5eoEtc0IU700eMxX8XGQSnsuRTx1PYKQdovOrA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FB29LQD3+wvMEOW9Cif/4br5GgjmAXthRhMlk9LgNpCzpmr17FADUQehoh+s?=
 =?us-ascii?Q?HBsGdUzAu0Z4baDkPhq9R86BNHSQiet4DEqoIWjcgWQ7cueeTMMH34BFQ3gx?=
 =?us-ascii?Q?AlpgZVWkW06II8SXcjJ/l+W2Elvcab7VwBPKtQ1opVPCsnsW1li1moxYF4yg?=
 =?us-ascii?Q?dZB8Lj2RssgpFNnHco5Wao9Gkaa4KCbLNRAKxZn0GK2QFTcEM8wxa0Nfv66F?=
 =?us-ascii?Q?ChrOKKPw7Ld5eN90aZqaDv6MfndkwDOI/EPBg2nI/sbj4cCvvVKaz4+MJbmq?=
 =?us-ascii?Q?sIRQb9OvWEfizO6+W6mq9oL3y9zTtM9btcHVn1es7LWG3nSSevZR/XO53CGr?=
 =?us-ascii?Q?qEK+ohvqDnArDSdcsz9SA/JBvK/kXttHwLsQtc/4P4bNWixO0ZOtfQUWOkxA?=
 =?us-ascii?Q?LV7TvRjc+6ztZIeDQ6MJz+BOJyHQQ7nOT8nx5hel5WWyGbjjrPAwTHHbevpY?=
 =?us-ascii?Q?sJsZQIWH5oVYHOy1VB3XWvrcylPaYJZIGRY1Bao6SNE48YSKfA6QzCOR2jya?=
 =?us-ascii?Q?Ol0RxZvIfaXeD0LGgColn9YoBbwcSr0T8ykhLhfzOnVuH/c6bpRh94r8TKtJ?=
 =?us-ascii?Q?R3v85uLHWW4kl3RidNwaOtEzprIEn1+clM3S7RcRSHKmRSsPsSmJxF+RoAhS?=
 =?us-ascii?Q?S4jWiODTU/Eg1XGM7vL7Udaj8HWKJYZo/CA8fA+RPv+FO6flq/BH5wJhUyz1?=
 =?us-ascii?Q?eOlO7dBhlKQg6852Y60Y1neRQpR0/jnaGpnGTup+YsvTQEL5tH6yp8m15y+s?=
 =?us-ascii?Q?LeHpV8BlBcXck0FkjCJhIidNQkBwPKtLJZ9425/yknPUPLmm/g+tuMrHxGdG?=
 =?us-ascii?Q?odsa+vu8bMP97h666Rn/QlJVOWqhA2NoXHd8v8ONvQ8/D7DXymPa/HBRDqd/?=
 =?us-ascii?Q?YGuh2pmbUvWrrRKAoQa1rLgQ6RPm9DbgQn4wabXvJpkewNkuGYiFLTipn1Vi?=
 =?us-ascii?Q?0WEwXkHg1zlVkdcMNiHyeD+svdiVPOqwVPfvU9rWo2aUOb8K7uqI6+wsfg7P?=
 =?us-ascii?Q?L3YtCA5I4wi4n5ZgIEzSLaNXrlDSceo4CKQkE6hzb4/2HvT0Suuq/8dJ9ntt?=
 =?us-ascii?Q?Zv2HwESrdetuVa4RUtzLRT4yzQRO3g9zjfqAn9v/Y5gUUHoB4Kw9NVKElS6H?=
 =?us-ascii?Q?0uKI/9E3c/j1GNUa8+mK0blfyu31uMY6xX3Vd5C1BjMM4cG7QJmwHHzZ32Mz?=
 =?us-ascii?Q?rfq75PG9Dmawgw96IYusl9rmpeg2U/2xzPR46I3qAB+gcoy/z8chO6Uur6oy?=
 =?us-ascii?Q?wBPpewNoJ3xtWb4kcZiC51FiJ9uLoOtCI4GBXJUUByUaAra609ZioJF1De11?=
 =?us-ascii?Q?UppSjABvWDjHFLt79hYHWMFb0XkJ5kO/Q9222RWSlMSbHY38umQ5Xyxbh8qW?=
 =?us-ascii?Q?Z8sDQgsqP5iRznsmKm+yIjibwHvzOUYpmH+ZIC2/SLbThIbGNTzbm5qhPG3q?=
 =?us-ascii?Q?E/kr/ru0N7Y82C1pV5kxDFD/tRZSkvj8t3+6ZppEStVfoVPGR9DsoGWvmHJL?=
 =?us-ascii?Q?xKA3TY1dbnVxiAm2m8cczN9TDsAIE6KG7ekiJ5x7PHntlNg8zYrshS20+hCs?=
 =?us-ascii?Q?ELozn+/uYijBscihs3WxsxFgLvjdGQyHTLfw7ZtSGwX2JPiy8uHoyglnBdJ1?=
 =?us-ascii?Q?+mGUwtrQmjb7PZ6T8DGeCJDbHhyLaUZY1fLl/tWWSrJR2D/yCF0WESSEW2Hf?=
 =?us-ascii?Q?yv0lkiWM2Y60SY/h5abRPqqsBXBU/wImI9LgS2q/S7Qs04ryoPFRkT61wBJ8?=
 =?us-ascii?Q?zH7WMQ6sDbCFmH/Eh0MRaSJQaLI7eCtIigNn53RoEyM34e9ncMpk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215bde81-a870-4152-3000-08df19a29221
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7129.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:35.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vexq40MXTWfl9hi3IUAW3IJr74ojXEvX4BucEfw06+TvN3Uo/Lm8NpQtJ+NnwmMoqmga0TzMGUiPguqtVmSTkYgzya6bUxAzFKTghEnNj3A4Nt7LQ7TO8ebWnkn2TsTy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

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
 drivers/gpio/gpio-rpmsg.c | 580 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 598 insertions(+)
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
index 000000000000..076af781f3bf
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,580 @@
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
+struct __packed rpmsg_gpio_response {
+	__u8 type;
+	union {
+		/* command reply */
+		struct {
+			__u8 status;
+			__u8 value;
+		};
+
+		/* interrupt notification */
+		__le16 line;
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
+	gc->can_sleep = true;
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
+	struct device_node *np_chan, *np_rproc, *np_rpmsg;
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
+	np_chan = rpmsg_find_child_by_compat_reg(np_rpmsg, compat, idx);
+	of_node_put(np_rpmsg);
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
+	{ }
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

