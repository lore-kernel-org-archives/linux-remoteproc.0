Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010040.outbound.protection.outlook.com [52.101.84.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF2E274653;
	Mon, 18 Aug 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549935; cv=fail; b=rt956y4jheeCOseM5V6c707HC6w7efcy4FaKGqRvZuAW5TqL83nq0eli+zq5EV7VrztcvjbYCyh4NXrhDcNdd8c8GmHlVu6QER2I7+fc4QMuSEgnEJOiwr/VKvepuXBgBAYYasHp4M2JB+Xt+7Mr3PG+EX4Vo4ZoAxhwbMemRgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549935; c=relaxed/simple;
	bh=BH2UpQcfdWO9KIzzO/Qjn3YmSwxTz/K6fnXVs+aIfZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LSZCqyTuQUmaBMU00ECyYs/TGiwWnOjZ3HI4GKgXhraBLDLbXK8z7qqvddQWDwHYxveo2KWwQUSClBJwDqz0i8xIQ3w8Cg3OeBzbyPdgEEjJxT1ZInyKOUiLpiMCUGUfHpK2eIhc49L8pFi+DRNYdROwhI847BL7qrzk7/F1DOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EElgz+j7; arc=fail smtp.client-ip=52.101.84.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EElgz+j7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsTY3NTveY61ijEZyv6dNfsusBYkYnPVgrVynmUhUTvYunUDrTLaK9rT5Tn06TRrvKPSe5XeFWpjQ0P2ZPaxWjcbYQfs7QIYArriMNOCwVvvkBwWI3mVyMV2vqdXN0WCeiNeZ63byhCa8JOOx5VoigwTJ45E79rQSWPWfRgl2n3r5AKrSf4N3cQrcNGhSmar1w5wBA2lAXCLTHsUhchCKmU07+lcHJZJyoS+xYilzffvkOCOTnguEzcjMBzSf0pPKaJEFIaF+RRPTRBzty3A+2M8KHKPifuoRiZpDRgc2z1BN3olbxILOeParoBUNf+1zSbR4MxuvEt1AGfXBN9e0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6Wbxfh9byr+DWOzmWeC4myTNrKDMdzoD+8zkzVuJE4=;
 b=DW9gavKWANXjHnnuEQt907RvErRYe+L6Z7YoCVm3mSXp30VLzvOM1gAd0YsNL2menTiDIjXfcU9yzFb+kxQK1XpoX/cNQDsCU7YQ3lCOh0XhSyw3DasCSGYsyMGfhrgYXgMU4qm0bs2mtZmoisiBHKEdb8h73U4/AK5abxOU2sc+AFjHcq5yo7iFV+Jm8wpch6suxCJIuW4FuHzCO1YzoD01wEohpatT5yOhIyqK4+Iw6PcchLnNiWEBeb9gH0rv/JvJPSEd2kvwMS1xycdDRqvMC352NsIJ2e8wNRV+tF4yrAdB6Xh1nz5+PHTlXeTwfW1BQpZXoSnHEogZKyKGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6Wbxfh9byr+DWOzmWeC4myTNrKDMdzoD+8zkzVuJE4=;
 b=EElgz+j71OHUKv2V0SfdS88Tk+YbzD6uYx8HrCRAMipYoIMCTZrVciNgMgZc4zByVJQHNTzChcCs24/UJ5N3Yo2QUXO3R3xnkrG+/Q27hod5MNATOwAQypUdEkWpbmJhl8wnRPYfuaNpzr6Rd7wkTAtwTropIuCnDpxURvc9jkGAZVZrD4ugwzFAlsOL4TcbpmEKuSDdvCIy5OuTU9slrvru2oiFxlcdTC0G7Vjf8m2peNLDBKqe/PUsPek+N9TExL+yoev83uTMg8hh+pmedGdhJYpsPWC6fIAGMDAZTJlRRBms77ItRmToCBXCZj1asxLnR/9qpvr/OlwU0xoVAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Mon, 18 Aug
 2025 20:45:29 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:45:29 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Date: Mon, 18 Aug 2025 15:44:19 -0500
Message-ID: <20250818204420.794554-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 9563007b-3bc9-48bc-38f3-08ddde982b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bG4XT1crqVnVOzOhc8Cv0nivB//hdtmoby92OyXYGhuzrmS7IjUsOLn/yXPX?=
 =?us-ascii?Q?gSzaegvwTF/LFedbURelar9YycT1VHju/+8P356pdysfeMLCjwwy+NjSCSHJ?=
 =?us-ascii?Q?JdKbATeIhDHmnitnCH35RnqZN/EQVEAKQQ+lztne6lk7gHyBCvF/nw44WeRn?=
 =?us-ascii?Q?2fwYVzPDNbzpbrQCV35lRIXaazZHEJGWOkoGvLQRCuryikACfSjnDGEymUaH?=
 =?us-ascii?Q?5NNWFouiT+ZJW2oqgQx2ed3SlAqZ63tVEuohLRowSb0FAqb8h0YJcw3AYvvP?=
 =?us-ascii?Q?Y31UvKMJAtnQ7+3dvoXNvQlj0epO/KWKqJ1/n/GPVVkiONU9DDlh4LlDoDa2?=
 =?us-ascii?Q?JBRQuobTbsYrIUMS5vHVt0HqhsbGZDvI0zD5yNjVlVZO0L7HLv6PC/mGlZZZ?=
 =?us-ascii?Q?2hAxXuKGby5zMJo1O6aFsrLgVESIWaUS6spjBAaGv1KIcYMAg4KH+N5zs3Mp?=
 =?us-ascii?Q?pIbhhIeCcoOOqEq59bCl2kTXx4xCaRd5Rs2UulwK4bvDND4fDCyjyd+1fUDW?=
 =?us-ascii?Q?w6sIMqkjSEnXFUW+VeVYMzlnuRJV2/fCZsgxxFFhuUFCEiGn32q3Kfdasjpe?=
 =?us-ascii?Q?5kbsN+GZTMgJjrs7wofgPLTbgEbUAffSN4eJL/Va+sBHBHm7SoCNNiMDRKTp?=
 =?us-ascii?Q?8+lw2tJrwfAPSbnf1UXoP6TUjlzcpgGU19BWve/XzlgMv0RUBhaAiECa3+cs?=
 =?us-ascii?Q?FTBuJGLZUJtaTglOiy4ehZM/PnpAs13ohjnXCzXwLxtvd9NXQd4sViPSmGVB?=
 =?us-ascii?Q?naD/noGZMo8S4f/dxDWemzkEShUWLOI6eLP2EVmgMhmPkI+BGzySOYtHvUb9?=
 =?us-ascii?Q?efNP5AOiVqIXj89f2xhqwDphydjEK7NbCNHRSHbLBWjC371eQNkZ5SFnlJhB?=
 =?us-ascii?Q?hali+Gjg+E+uqwb6BM3K0bePqNlACQlpXZOlRTDJPwZJwuqN0pVwwW3FQsOd?=
 =?us-ascii?Q?9akBCP3xjk+dNYmTpzexZ48/2E+zFBZAP5ANhHSlkcrQWQggFN2p9Gga7ryr?=
 =?us-ascii?Q?NUushJ/FSm9k1OYnxGZxgeEypGZLkXu0B5E/Z/nB+x4JULsh/Yz5F4++sDMe?=
 =?us-ascii?Q?3JY4oe0ZN/2eyvKoqGmIiAjEVtt7CgWMB742jLsCCd0d6J/8MzUEvwVpbEnq?=
 =?us-ascii?Q?yvkWERc4m/tczInyURC9qqGnlC8sBmRb516BVG/v8dcnFkDzbYqKRPrEK6dz?=
 =?us-ascii?Q?oZPjjLFAtZQtIYXr9elogSTY5D26f9nST+509/MBhcD0HRg2JdYGv8k/LKqc?=
 =?us-ascii?Q?/zsUQmwbF07uTS+KsGkolmSaHDPWlpaMI1iv6DptD9MoDkKeq1eQog+auciO?=
 =?us-ascii?Q?hRYReUlmfni11e8GTEeIJtcK8q7L2KHOUa/GJxvgUeGGCXMFsn4jfMnNYhZ9?=
 =?us-ascii?Q?jxnCD1wfAhYIyyPKv4Ad9x0UCkGUptDqE+1+QW/QfH9ck1gqyjBeJtRHMU3r?=
 =?us-ascii?Q?f9eulqUqugYt9KRyDNMzjDS4TLUe14kUHN1BURIpLaxbqpcVRSsA+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVbBoskz/hNX7shYN6cJMMn+00qzDyjinhjNlplCnMma7vyWaaTlDMA6fzvI?=
 =?us-ascii?Q?9m/+ikF+WeyeLH7DSIA5ZIgVJKsS+6zNCK1ZrMFXPGLbNiFuSrj57l7uUzUN?=
 =?us-ascii?Q?jboFfz3tGG5v7IgddFVHzzleFLrhIX4HN04zUqRC9ByLqLU+GPVn8RlMyUnv?=
 =?us-ascii?Q?PVPT4+G8gfF+ia+ssqPzGFc+JkHIzaL79CZzi1B5amHvpsq14RflQKBUh9Wk?=
 =?us-ascii?Q?W8Wf4Oc0+qBF/1JRsv93HHWiHjSO4dxbS7hmfE6qehuwKKYvQN8Qarpa9BmS?=
 =?us-ascii?Q?ndSan/ETm+cvRQIxIz/bflXi7pHwQ8k56YdNY5BxZks7K2b2ilbr6g2+OCl4?=
 =?us-ascii?Q?ofRWO5w/BTw6WQbg0/zUE4BQMcnkKJDywJ0BKl2BE+4tW9DYbx8B7/NK02BA?=
 =?us-ascii?Q?gZGVueLwWlyPqvC7sAXh3dJzJlPJVDtloT+v6cl2V3+SiDR7Tw4lo8dE7cCL?=
 =?us-ascii?Q?aqQhflraPlzBU6Vnp4nBfwrFhFxp20/cTsen8TK451NudPLuTGbfYgyF5gFu?=
 =?us-ascii?Q?0Mwl8pZrbILtT4MX7dR60IQSZ13W7UZTU4Rjz1Ak6MNtBII6smQqi9WMuLv4?=
 =?us-ascii?Q?WOx1FkQakQUnWY8YgE7VSEsBQfFKSuhoxGaCNoRrMRZRNbmJ3RJouUacHV+V?=
 =?us-ascii?Q?fFCyscOiRxbKw0JswSeRju84tsdOaP2aEemMJcbqNwP4/d9aWtPPozPxT1BH?=
 =?us-ascii?Q?yEgKJ2LR7kcHzHg4i0ibU6w9Tawazjmaill3z5ciWKd9dBKvzvMWjMO302Uy?=
 =?us-ascii?Q?53wSKEkVBIfZC3VAa3Zn1sJ4ZGnx2fnvoUWt9K9unyr3VoE9TkxwtayLSYh3?=
 =?us-ascii?Q?G5tAAW52aNyUo2o05CVjeGPIouFDpFBAWvL77T0ZvTIKEznesdh+xnRdSUp2?=
 =?us-ascii?Q?1Eel/Ka6SkvlqC6dYx7Rcfi5H6g/ZfZ4o6IMZsu7kjR0WttuGWGWTgLxDqzv?=
 =?us-ascii?Q?NpHRQ7wVJh8GKldlgc8QKpjJj2n3RF0m/3ALCi80pAeYZrOWIdMG01NqS0bH?=
 =?us-ascii?Q?ZVyCYb95JUM19Q5iy/1xSi9cMWgzYNAZhVT0dwstyfTauCTcpKN+hWuyw/7S?=
 =?us-ascii?Q?nHn0ZPJTvEar/GKFM6s/6tCut88RVxWrGEUqSrhGHqG3HSJk7fjQk5sua38V?=
 =?us-ascii?Q?7q8RFGKSA7kVT4nPY1S30erj0RevpgXGy008vlKpM3An8e/VwcIFdqSXEINq?=
 =?us-ascii?Q?k9B9Tf+BxpDP/hApnN0uSiWGHO2Lo3IrynbpcX1t3zr30u5nDi7/2NqQVm3c?=
 =?us-ascii?Q?xbJ1VR4+WjbodE9PdEp4isPhni93qC+Q+3oPLRiOfYyB1bTVyaVfFeb/XOuT?=
 =?us-ascii?Q?k6HIZsZxbOOqzO4bgCQmGXghpRULhecZupkifH1rvmHTQJowYymhTbIhzyau?=
 =?us-ascii?Q?U9QORRuzdi8dH+oEkQAwSmwGID1LMWBOU1QA5KH2znoPjygSoXNJhCWYmqmC?=
 =?us-ascii?Q?yY0E1mvADN+WXhQ39GY7gYluZC5eNUV72OAoAdlLZzRO7iA5y+G0n8WV9+8+?=
 =?us-ascii?Q?hH+Htfn/nVGmZ1jEuHQgegvvBGn1hAuqQXkB9THxDXWv0n6Hodrxw+u8BAWJ?=
 =?us-ascii?Q?mKhr/D3U0PbXZCR/SdSXtj+s/vBsYLq3CJSuCLg/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9563007b-3bc9-48bc-38f3-08ddde982b06
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:29.8134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qnx5HOPXVkBPwxRXQ5cpMhcj3uxWMHZl5U5Lratdljb/EeKocMAww7SytjfzANQaBsBZMT5VEDhjN+5ys2rhcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On i.MX SoCs, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig          |  11 +
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c | 559 ++++++++++++++++++++++++++++++++++
 3 files changed, 571 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc..2ce4e9b5225e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -402,6 +402,17 @@ config GPIO_ICH
 
 	  If unsure, say N.
 
+config GPIO_IMX_RPMSG
+	tristate "NXP i.MX SoC RPMSG GPIO support"
+	depends on IMX_REMOTEPROC && RPMSG && GPIOLIB
+	default IMX_REMOTEPROC
+	help
+	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
+	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
+	  and i.MX9x.
+
+	  If unsure, say N.
+
 config GPIO_IMX_SCU
        def_bool y
        depends on IMX_SCU
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..e01465c03431 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
 obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
 obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
+obj-$(CONFIG_GPIO_IMX_RPMSG)		+= gpio-imx-rpmsg.o
 obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
 obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
diff --git a/drivers/gpio/gpio-imx-rpmsg.c b/drivers/gpio/gpio-imx-rpmsg.c
new file mode 100644
index 000000000000..0f9c5ceec651
--- /dev/null
+++ b/drivers/gpio/gpio-imx-rpmsg.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/imx_rpmsg.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_qos.h>
+#include <linux/rpmsg.h>
+#include <linux/virtio.h>
+#include <linux/workqueue.h>
+
+#define IMX_RPMSG_GPIO_PER_PORT	32
+#define RPMSG_TIMEOUT	1000
+
+enum gpio_input_trigger_type {
+	GPIO_RPMSG_TRI_IGNORE,
+	GPIO_RPMSG_TRI_RISING,
+	GPIO_RPMSG_TRI_FALLING,
+	GPIO_RPMSG_TRI_BOTH_EDGE,
+	GPIO_RPMSG_TRI_LOW_LEVEL,
+	GPIO_RPMSG_TRI_HIGH_LEVEL,
+};
+
+enum gpio_rpmsg_header_type {
+	GPIO_RPMSG_SETUP,
+	GPIO_RPMSG_REPLY,
+	GPIO_RPMSG_NOTIFY,
+};
+
+enum gpio_rpmsg_header_cmd {
+	GPIO_RPMSG_INPUT_INIT,
+	GPIO_RPMSG_OUTPUT_INIT,
+	GPIO_RPMSG_INPUT_GET,
+};
+
+struct gpio_rpmsg_data {
+	struct imx_rpmsg_head header;
+	u8 pin_idx;
+	u8 port_idx;
+	union {
+		u8 event;
+		u8 retcode;
+		u8 value;
+	} out;
+	union {
+		u8 wakeup;
+		u8 value;
+	} in;
+} __packed __aligned(8);
+
+struct imx_rpmsg_gpio_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_data msg;
+};
+
+struct imx_gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_data *notify_msg;
+	struct gpio_rpmsg_data *reply_msg;
+	struct pm_qos_request pm_qos_req;
+	struct completion cmd_complete;
+	struct mutex lock;
+	struct imx_rpmsg_gpio_port **port_store;
+};
+
+struct imx_rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct irq_chip chip;
+	struct device *dev;
+	struct irq_domain *domain;
+	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
+	struct imx_gpio_rpmsg_info info;
+	int idx;
+};
+
+static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_data *msg,
+			     bool sync)
+{
+	struct imx_gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	if (!info->rpdev) {
+		dev_dbg(&info->rpdev->dev,
+			"rpmsg channel not ready, m4 image ready?\n");
+		return -EINVAL;
+	}
+
+	cpu_latency_qos_add_request(&info->pm_qos_req, 0);
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
+			 sizeof(struct gpio_rpmsg_data));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		goto err_out;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			err = -ETIMEDOUT;
+			goto err_out;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "rpmsg not ack %d!\n",
+				info->reply_msg->out.retcode);
+			err = -EINVAL;
+			goto err_out;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+
+		err = 0;
+	}
+
+err_out:
+	cpu_latency_qos_remove_request(&info->pm_qos_req);
+
+	return err;
+}
+
+static struct gpio_rpmsg_data *gpio_get_pin_msg(struct imx_rpmsg_gpio_port *port,
+						unsigned int offset)
+{
+	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
+
+	return msg;
+};
+
+static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	mutex_lock(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_GET;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	mutex_unlock(&port->info.lock);
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
+					  unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	mutex_lock(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+
+	msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+	msg->in.wakeup = 0;
+
+	ret = gpio_send_message(port, msg, true);
+
+	mutex_unlock(&port->info.lock);
+
+	return ret;
+}
+
+static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_chip *gc,
+		unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_OUTPUT_INIT;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+	msg->out.value = val;
+}
+
+static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	mutex_lock(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
+	ret = gpio_send_message(port, msg, true);
+
+	mutex_unlock(&port->info.lock);
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	mutex_lock(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
+	ret = gpio_send_message(port, msg, true);
+
+	mutex_unlock(&port->info.lock);
+
+	return ret;
+}
+
+static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This function will be called at:
+ *  - one interrupt setup.
+ *  - the end of one interrupt happened
+ * The gpio over rpmsg driver will not write the real register, so save
+ * all infos before this function and then send all infos to M core in this
+ * step.
+ */
+static void imx_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void imx_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	/*
+	 * No need to implement the callback at A core side.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+	port->gpio_pins[gpio_idx].irq_mask = 1;
+}
+
+static void imx_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
+}
+
+static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct gpio_rpmsg_data *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	if (port == NULL) {
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	/*
+	 * For mask irq, do nothing here.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+
+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
+		port->gpio_pins[gpio_idx].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = gpio_get_pin_msg(port, gpio_idx);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
+	msg->pin_idx = gpio_idx;
+	msg->port_idx = port->idx;
+
+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+		msg->in.wakeup = 0;
+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
+	} else {
+		 /* if not set irq type, then use low level as trigger type */
+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
+		if (!msg->out.event)
+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
+		if (port->gpio_pins[gpio_idx].irq_unmask) {
+			msg->in.wakeup = 0;
+			port->gpio_pins[gpio_idx].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
+	}
+
+	gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static struct irq_chip imx_rpmsg_irq_chip = {
+	.irq_mask = imx_rpmsg_mask_irq,
+	.irq_unmask = imx_rpmsg_unmask_irq,
+	.irq_set_wake = imx_rpmsg_irq_set_wake,
+	.irq_set_type = imx_rpmsg_irq_set_type,
+	.irq_shutdown = imx_rpmsg_irq_shutdown,
+	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
+};
+
+static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
+	void *data, int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
+	unsigned long flags;
+	struct imx_rpmsg_gpio_port *port;
+	struct imx_rpmsg_driver_data *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (msg)
+		port = drvdata->channel_devices[msg->port_idx];
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		port->info.reply_msg = msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		port->info.notify_msg = msg;
+		local_irq_save(flags);
+		generic_handle_domain_irq(port->domain, msg->pin_idx);
+		local_irq_restore(flags);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static int imx_rpmsg_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	int irq;
+
+	irq = irq_find_mapping(port->domain, gpio);
+	if (irq > 0) {
+		irq_set_chip_data(irq, port);
+		irq_set_chip_and_handler(irq, &port->chip, handle_level_irq);
+	}
+
+	return irq;
+}
+
+static void imx_rpmsg_gpio_remove_action(void *data)
+{
+	struct imx_rpmsg_gpio_port *port = data;
+
+	irq_domain_remove(port->domain);
+	port->info.port_store[port->idx] = 0;
+}
+
+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx_rpmsg_driver_data *pltdata = dev->platform_data;
+	struct device_node *np = dev->of_node;
+	struct imx_rpmsg_gpio_port *port;
+	struct gpio_chip *gc;
+	int irq_base;
+	int ret;
+
+	if (!pltdata)
+		return -EPROBE_DEFER;
+
+	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx > MAX_DEV_PER_CHANNEL)
+		return -EINVAL;
+
+	mutex_init(&port->info.lock);
+	init_completion(&port->info.cmd_complete);
+	port->info.rpdev = pltdata->rpdev;
+	port->info.port_store = (struct imx_rpmsg_gpio_port **)pltdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	if (!pltdata->rx_callback)
+		pltdata->rx_callback = imx_rpmsg_gpio_callback;
+
+	gc = &port->gc;
+	gc->parent = &pltdata->rpdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   pltdata->rproc_name, port->idx);
+	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
+	gc->base = -1;
+
+	gc->to_irq = imx_rpmsg_gpio_to_irq;
+	gc->direction_input = imx_rpmsg_gpio_direction_input;
+	gc->direction_output = imx_rpmsg_gpio_direction_output;
+	gc->get = imx_rpmsg_gpio_get;
+	gc->set = imx_rpmsg_gpio_set;
+
+	platform_set_drvdata(pdev, port);
+	ret = devm_gpiochip_add_data(dev, gc, port);
+	if (ret < 0)
+		return ret;
+
+	devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
+
+	/* create an irq domain */
+	port->chip = imx_rpmsg_irq_chip;
+	port->chip.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+					 pltdata->rproc_name, port->idx);
+	port->dev = &pdev->dev;
+
+	irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, IMX_RPMSG_GPIO_PER_PORT,
+				   numa_node_id());
+	if (irq_base < 0) {
+		dev_err(&pdev->dev, "Failed to alloc irq_descs\n");
+		return irq_base;
+	}
+
+	port->domain = irq_domain_create_legacy(of_node_to_fwnode(np),
+						IMX_RPMSG_GPIO_PER_PORT,
+						irq_base, 0,
+						&irq_domain_simple_ops, port);
+	if (!port->domain) {
+		dev_err(&pdev->dev, "Failed to allocate IRQ domain\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id imx_rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "fsl,imx-rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver imx_rpmsg_gpio_driver = {
+	.driver	= {
+		.name = "gpio-imx-rpmsg",
+		.of_match_table = imx_rpmsg_gpio_dt_ids,
+	},
+	.probe = imx_rpmsg_gpio_probe,
+};
+
+static int __init gpio_imx_rpmsg_init(void)
+{
+	return platform_driver_register(&imx_rpmsg_gpio_driver);
+}
+
+device_initcall(gpio_imx_rpmsg_init);
+
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

