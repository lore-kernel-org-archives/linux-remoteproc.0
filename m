Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596562FBDF0;
	Tue,  4 Nov 2025 20:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288491; cv=fail; b=tGzphs7TTni3sGiBwdTB/8VXrCw8AYLyq5pwo1kvdPLvfr5B3a6d9hMuH2REBbWau8ukReYkb4DerfsOOQuirQd67eHL0TNVAi8Y/ref/7hn/OaBSxGPM8mf7ZGQ4SpHzZjcN/WIvaye19I2Gg8gT+HALA9oY1I5a+G1cULPkxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288491; c=relaxed/simple;
	bh=mXbagr4y8EJBisRcyYXQGdzy+agzjecuiZNPeVCdhnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DYT3NQfo8/7o8DMd7qF/ZoyUudaqSpQ8dkzEVb1FDK3Xv/kNcN3T3eBbH9blQbFxOttBc+5yBkDvBhJsU61S+QIGSfIUrXDO4kUpZhgzMTQ12ClV9FND6EhFChEJbJ1iB32WDFNARdgK2fTUcWx6HVV51XzRY8sVxqX9bQMkqsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VeQlUHCn; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VeQlUHCn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeQd83X+Ehj1u668D/MpmG/M1hQf/MJ8iFhC81xQHvx+lLKVj8zC6eN5jXrbc1Xv/LMLo28kLta8HlxnZbeuvia4ei4KgtRSG11YhguN4BA1HpwGmXVj54y/hwgKHvqj9l/Ms3nwS8Urv6kBQJHA7JErK+rBVm1tcaYL4aj839bm0eKon2xSADhIiPIuwvmihhTgFwPQ0hHOGltPbTaTDZXZSCGqwyGQan2JieinUuq75AYz2+Xg5tgk1nwc4GWyUoYcDwfEh5QRPpgvm9GY1D5dnupIQWYIO3+02xD9FnJ0b3EuAcE72l1TuKkSZRY2Un6vfcYkRIDHNBzmJmic0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubXJj17U+mUX8eGL/uVcbHFhMBESkpLa33TVHiYR1mc=;
 b=vPnAgSVDp6bn3/0hJmYgD/9DLd8gJStREBtA7kHmlhKXiJ0Qi9iYCeV1Qpt+aGYbCN5oO5jsqZlouEKo9tA3U6NBotT9geVgFdhxPYiuGvzPLIANtUdM8zfFXUkUS3TmbKOcBL6EyVzdjklwiFAfk3go+f1eptfBkFA3gRkwC+izBI2Gw/PN3qRYulMEwVzOrRsBJOWTdhHQMPsjFMkkLPrC++lBqXErVVsV6HzppIclI7XrGT57u+/iun2ehW5nwtp1HmTwp4whS6TxP2Rt1d60XVbwQNAHXJnEvO0mGl9LiFljEYDFkZYBpwTdiSwayAZ/KRyP+kAhpG0nG86AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubXJj17U+mUX8eGL/uVcbHFhMBESkpLa33TVHiYR1mc=;
 b=VeQlUHCn5Sa+dI0safFLBl58EvjeUlSvZwq0/XLusMZY3GEkfZKQdvxwxx39jPIE9LG35Hjl8jEPVnzrmIQJV+yimWHuNjZVF1kYbDgtsR4tb4OHNPCjsIWQrVfpZIFpfUQzmFLvGSaopc8CBlw1wID205GObX0zoLE3ucAmc1mwYy68WctTP5xYW+4hyVNK37E9xVyMUaykU+v/tm8pBCsnn0+M9FibMbZCytHQQ+87pFaLDPGUkBc6jU2voicS7zCYqlD30U++ePwLMxU6PXPk+xJCtJyORbt/4EVK8d2ICX3KpLZ8NI8tPMiQlIYuDRChrc92eRTv1vnHUFvWcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:45 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:44 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
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
	linux-doc@vger.kernel.org,
	linux-imx@nxp.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Date: Tue,  4 Nov 2025 14:33:14 -0600
Message-ID: <20251104203315.85706-5-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffa9938-453b-4de9-934e-08de1be196d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4sbuuUBKZRMhUWRp+ezyny9XN5pgFinEK9EHayWMckJWZ8ypae6tjGMczL+n?=
 =?us-ascii?Q?kISAzyKh1kcmtlTyP4mPWovTAMLbGatFJ2pTg6ojGWGIdpUxoQhpsUqpXACM?=
 =?us-ascii?Q?iU+o8Ki3YOi+bwWPPJjiSsNUc6WS8zQn52Am/uZszbWlqdEiLMD//vx1De1k?=
 =?us-ascii?Q?YTYWXq77C81gJ3dLfIhN+EBPK/ybUlu+mVxLU3UhqEXU5YRiSAlMCQO7wuVk?=
 =?us-ascii?Q?OrwWPpQZPVstxv4MUN3eEs9d5Wfv+66kNnoeKJX3NNrhTtqpdj36egyBMNLk?=
 =?us-ascii?Q?DFUTR62Ana8Ji7SyxmzLjVb6grFFaF+m5HGYLDMnFpFVkIHhp4Q2WUwss+zH?=
 =?us-ascii?Q?bbq6xxLmPlevorFbmUSfvUH3doUmV4ILXjqsdzymEIwdVi1mFKsZi9Zi2kpU?=
 =?us-ascii?Q?cecgw0HDDkwWGLGzZqYIPbN4c01zXh8bdR/cDAkykp7W/XY9crX5+Vfl3fAK?=
 =?us-ascii?Q?sqe/xnhYj4VdusX8hKrbRuh8KWSJMtOdFgTT5b+RHuyh6z/fenZ5owcfAScG?=
 =?us-ascii?Q?rBiJdPlvSRl8OxbvZytGIzflILMwsK1azkzOqjF+ZB5rFMsXQid/qY/nzv/6?=
 =?us-ascii?Q?Aj/SCDPoqqfJJ9D8bvWIW+mpaEg7gwNOmVu+iPB9ZrxUAfSLHfV2TndA38hq?=
 =?us-ascii?Q?sM/Im7xmopQaU/wYfh5undiPXI8436HeV8Btpp/YnFXnDSvK1ZDfA0VijrSY?=
 =?us-ascii?Q?2ZPIWT7VOh75lM8KrB72dasfGg99wCuhA1U2++ZUwIOSkbWBmmisTi4k13H2?=
 =?us-ascii?Q?7KWaXOraBdz5WUc7kwSyk8fRQwuLsCTvJ4iPdtZJwH5TuQQXQVvu3dKnXjC8?=
 =?us-ascii?Q?0jOaZBUE1qenXiL5nLhSE7mi3lK8UIHFUP+tHJsp3c2xzLn8k9qnGqA2uafA?=
 =?us-ascii?Q?P2MmznqWgjsqoVarjpGmBNFy+RJsxCYX8ahX38dIfagLgzQAIE6smGvKx8hd?=
 =?us-ascii?Q?aQbsGKzV8EXQ//QL3i1RVgGnWG9g+PI1BqrjRTmE/TKx4QLKHU7A316Aisoj?=
 =?us-ascii?Q?zRrLrum6tCE1oaYTm1/fL7zke1n07yGr/iNomcJtQzZFxRizvXPU7jXv2FaA?=
 =?us-ascii?Q?RCRqCIiMF9GC4Bok94BjKdfZHBrYR+zydF4BbxAlV/OIuC4iL/w8nP6TDbm9?=
 =?us-ascii?Q?AIEMZ/3LqfCgfLd2kTatiHs99JS2PyMjnDPhCMQo/JM+Mkfp6h+TZ/J8LVuu?=
 =?us-ascii?Q?t0OFObCZ2A1hNG9gk/m4X7Xw6H277AzR67q++yA/zF7AGn6gNf/TZhhcGpa7?=
 =?us-ascii?Q?dihKedW3xoRnj9r8i3O/7tx0ORippHa/vFnpYCMpVkKAs5/kymr6dMDZpm4t?=
 =?us-ascii?Q?dAPt2qj2z+DfXXYOkhs80aZv6tsCVer+32vuol8C7UmsQCXpQV1ElYm83bVD?=
 =?us-ascii?Q?/KoqC2fif+xHwbNE0MRrVW8aRlkXhBsNXDAkUIcTdnuyXEO1PxQDPVaTEnzL?=
 =?us-ascii?Q?FxjmStWCk+mrEqeOzFjN76jSOD4cvKl5F2Dtl8DdA497q+/zwjEahZd02un3?=
 =?us-ascii?Q?htzYlhjQZ8pYP81JxhKw4EeR/pLPMAWeduuZnvIh7AotuTSfUX5f7UY51A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9/QnhYgSuouLKRCN6zFxyLGJiBPJY4UO4cnSsOTatsJrt9A9OzOr0ChLSMi1?=
 =?us-ascii?Q?52t1x9SZXR+5706/juOx7NwqnfGWSwxJJ3LGCehNlISGPrPFr8PgwDg9v3/Y?=
 =?us-ascii?Q?DGch6LQKRuX8WjRRkAV0TJphj8P+D0goquQnTKEzTmqYuvkFKxZiw0ncIbUX?=
 =?us-ascii?Q?eYNM1DQtOPYQz99iZLGtuzPSa0Tnmcef5oHld2w9VMBXA5A5li+yf/jvoTfM?=
 =?us-ascii?Q?+8zwY0/Afzh622MOGl260HkmtUwtSEALUu57L4in2VS1iFyYjQiFS6ZwEer+?=
 =?us-ascii?Q?UlHgZCtnF+z5LsQwP7/jsE25lhqoZJd7vxntbfiYz7ZLKXvPIXnPCcyksaYl?=
 =?us-ascii?Q?XvFxDyEStiJT2ugbV4ju9oHuQxhX5Wyzr8eFBqeK+QM4w5tJQa0riMn/gf91?=
 =?us-ascii?Q?nY9pmc9/71YKxUo4MmZIJJ8FZ/KnYxbNa11PlzS11pLX1mVOTP56xCk0SRC+?=
 =?us-ascii?Q?w5uG+aHJowz4EaXq5RR2Sfzkz0fkarUC09mYJVSRiWRJV6jkgYP7hMq+lT5N?=
 =?us-ascii?Q?ydhnS1FXI3TqN1GMKeRz1n3m4nzdqe80CxPqj/ty+TL6649iYsIjD3V7fN8M?=
 =?us-ascii?Q?59epxsBl9sk+agt9RUBB7tvHi2olNXbkJ/TP0tjW/uIyCY9v3Z3fsNY14P2l?=
 =?us-ascii?Q?0i8Q2w0MyOKDi0YLdhTRj5FHTkmJE6YaUpEYZB4oLyFsExRdsfXscd85hHPP?=
 =?us-ascii?Q?KOZ/R5sGUFPTfV8mk8dYA1bSDv85fkK8W6P8Qh7u221diZdO0b7Q1W3p3mB/?=
 =?us-ascii?Q?Gb3ybBPgRZatdNKuxoYKL7h9Hf2q9mIAI5cjrvxQsE5NNuooeovj52IxD+OJ?=
 =?us-ascii?Q?seBTKrC4TJpLyfsN9u1B/v8mzfEbDujSpfd0adWHeL70N4K2fSNOMGKYaYKv?=
 =?us-ascii?Q?/iU/VOFxKv6vgO0x0RRBW+uhOmZLoZsHkkM3VM4ayfW+C0guiZ4/T/UnhJLY?=
 =?us-ascii?Q?SDsWdO9mrTaA30c9K+Lq6m04eqll5sNFez1UX5SBIv2t8fmBB6ZSkh+c8sP1?=
 =?us-ascii?Q?klQo4pyDnvFjt/uHEnHQy+D0llVN9MBGE1eXzKDrfAsE4NNuDvWQ7i21hQqQ?=
 =?us-ascii?Q?YHaW/q5TGRgwZ1vxFTk772mZml5tI5vmv93PlkJUCTdXn9lzGdUZeuDVDo01?=
 =?us-ascii?Q?fPnSVgvivwmVWIQ6CCqyi9hq7ZtoxnpysT9rRKT3EvQpe+b8kx6NnxOT6KZt?=
 =?us-ascii?Q?6DW6AI2OmRGxZR4tVjnyU8eV7L/HqqFMZAGnjiYq/HXzHu3v3rAQ0p3yX4oC?=
 =?us-ascii?Q?CH/scaxOMRugmPlxB5/uYVYYlGUAawifMck93rY9tfA90NFC0kiGGN3Pd2m0?=
 =?us-ascii?Q?/YrtY5TfRiGbuLIMa4fN0W2kSVA6ct/gii+EP+JjQy7B6NPoIhTB0bDGROqi?=
 =?us-ascii?Q?aB/eqw+mMwT5hYFyE9ma41SaCbwf4bGDKt+F80IFeIKrRITCnm2CHnlX21/U?=
 =?us-ascii?Q?/+j1llIrMKQv5HaFN3epBN1yNXwtNL+r3BiQI1spUgro+Q5Czid0oKCOAHKZ?=
 =?us-ascii?Q?mdtCIxTHn3HZ5Thxsl6ukr5VOQ0a/JmgIG7XbH31rNDJ6d3d0p7e6oYirKM1?=
 =?us-ascii?Q?fV6gUrjDz4TsSlBHlcl9dlclf/mR5bENqbHffsq/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffa9938-453b-4de9-934e-08de1be196d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:44.8397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBHnc3DyvVWfaThyd9XfDqMlBTRbcEQ4I71wdubG2KT6ACLhGoTaEteR2mSkYD8Z0Po8GDdPJoHBDdIgC6hFGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

On i.MX SoCs, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig          |  17 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c | 475 ++++++++++++++++++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc..97eda94b0ba1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1847,6 +1847,23 @@ config GPIO_SODAVILLE

 endmenu

+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_IMX_RPMSG
+	tristate "NXP i.MX SoC RPMSG GPIO support"
+	depends on IMX_REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default IMX_REMOTEPROC
+	help
+	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
+	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
+	  and i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER

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
index 000000000000..888c3fdeaa04
--- /dev/null
+++ b/drivers/gpio/gpio-imx-rpmsg.c
@@ -0,0 +1,475 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 NXP
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
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/imx_rpmsg.h>
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
+	GPIO_RPMSG_DIRECTION_GET,
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
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct imx_rpmsg_gpio_port {
+	struct gpio_chip gc;
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
+			"rpmsg channel doesn't exist, is remote core ready?\n");
+		return -EINVAL;
+	}
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
+			 sizeof(struct gpio_rpmsg_data));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		return err;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
+				info->reply_msg->out.retcode);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct gpio_rpmsg_data *gpio_setup_msg_header(struct imx_rpmsg_gpio_port *port,
+						     unsigned int offset,
+						     u8 cmd)
+{
+	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = cmd;
+	msg->pin_idx = offset;
+	msg->port_idx = port->idx;
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
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_DIRECTION_GET);
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
+					  unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
+	msg->out.value = val;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int val)
+{
+
+	return imx_rpmsg_gpio_set(gc, gpio, val);
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
+	msg = gpio_setup_msg_header(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
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
+static const struct irq_chip imx_rpmsg_irq_chip = {
+	.irq_mask = imx_rpmsg_mask_irq,
+	.irq_unmask = imx_rpmsg_unmask_irq,
+	.irq_set_wake = imx_rpmsg_irq_set_wake,
+	.irq_set_type = imx_rpmsg_irq_set_type,
+	.irq_shutdown = imx_rpmsg_irq_shutdown,
+	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
+	void *data, int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
+	struct imx_rpmsg_gpio_port *port = NULL;
+	struct imx_rpmsg_driver_data *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (msg)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		port->info.reply_msg = msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		port->info.notify_msg = msg;
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static void imx_rpmsg_gpio_remove_action(void *data)
+{
+	struct imx_rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
+	struct imx_rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	if (!pltdata)
+		return -EPROBE_DEFER;
+
+	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx > MAX_DEV_PER_CHANNEL)
+		return -EINVAL;
+
+	ret = devm_mutex_init(&pdev->dev, &port->info.lock);
+	if (ret)
+		return ret;
+
+	init_completion(&port->info.cmd_complete);
+	port->info.rpdev = pltdata->rpdev;
+	port->info.port_store = pltdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	if (!pltdata->rx_callback)
+		pltdata->rx_callback = imx_rpmsg_gpio_callback;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &pdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   pltdata->rproc_name, port->idx);
+	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
+	gc->base = -1;
+
+	gc->direction_input = imx_rpmsg_gpio_direction_input;
+	gc->direction_output = imx_rpmsg_gpio_direction_output;
+	gc->get_direction = imx_rpmsg_gpio_get_direction;
+	gc->get = imx_rpmsg_gpio_get;
+	gc->set = imx_rpmsg_gpio_set;
+
+	platform_set_drvdata(pdev, port);
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+					  pltdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
+
+	return devm_gpiochip_add_data(&pdev->dev, gc, port);
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
+module_platform_driver(imx_rpmsg_gpio_driver);
+
+MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
+MODULE_LICENSE("GPL");
--
2.43.0

