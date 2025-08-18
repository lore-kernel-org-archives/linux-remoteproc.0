Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013012.outbound.protection.outlook.com [40.107.159.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B780221DB3;
	Mon, 18 Aug 2025 20:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549928; cv=fail; b=g+ZtSOoJ2zCF5meQgIEp0sC3te1xj1XS2RCyLlbLb/CxjljLDMiVDnXEgKY2sEfpkE3hkDYcE0tm2mydv36rKVoIdldFCyX4cfWW/WYHcEYqEXIups3/En6RtKEtWtT05FfoBA1jUNp5o64HTGoCL/i/pP9U0xtzrzFLgmI1C60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549928; c=relaxed/simple;
	bh=rRJuHvB9DRkwUQPPgEQCJVt5yJBfEUhaWR4IkuampHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HbYlmjjQXtqLwBsMbikJPsY1+GzdoBpU/vd03OW1NLR7/7ft9ifHKtB0Rn9LyrDVUvOchT/0r0Uv7NOsS8LuOeBch/l2Wl8mUIANlv3xhMSMiBd6WkL4Kk1O+jT9brPNPh1moGa2ZW9taNMqzOt4Rn+jN8mdNvRzFp5crVQYD2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QxYG/9t+; arc=fail smtp.client-ip=40.107.159.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QxYG/9t+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbboLmLLUP0MZqa5W6BsPtpnf9fXQDpYxMhA5tfSHsTgzQPeXYUyHI8zjZarcqZ9lqU2BU4Lp/NI1k8j7qqax2PIPR8NEqF13/TGQNr2uMW/BsJGEOT+QrSYyMl7d9D6jvzQAr+MXKuSut9MZPvT8kMLwL+XMRCeiFC99tXXG3keu1QO1ij97Q7a3ZWZIvh8ISh8zat4QEuymFZWz6MVutwYEaRLe8XdISTwreHip3V4kbcSn4bepZ7u1gOhaU8Ymg/ir6NjfbOEwTTYLls38h/jaheEvKBhdIe952sfr1Rw19vYyN14lfSjwJ+m+89tFdZDGRTsjueMeq0UWWCVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrxeQz+8yExe1CsgO+6UjQXrrNfkM2QENrXmnO2rVgY=;
 b=rl3BYIxBLZ7BJwNgPuO0L0n8YDaKtICWp7b250V7aGWIVOc2e5R2UJIlnKfRFxccvkNyZsfVNhQD/Oda2uoQSG6/BGnQ2gLMU9rJeyc1QGcxQ/40dWJwfquA9qZZWI8IcyQfS1EsMqxQDBh1MZPF4zr1X948lGOOuUFVCIQKjJUAp+waRmRL/tgSj0yt4JrBkxotGLzLK1bCTX2F8ST7XtG+62F+YhETDI4A4xlqUP0WJeKblCgNf1XOmtasUA131PxLJzy39A3PKaySHwwl9IyHMcpVJkHDQo/6PNThXeXKPcFEiHRrK4jBHm6DpazLjE+YhQmtgAmuv7uzH2VI2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrxeQz+8yExe1CsgO+6UjQXrrNfkM2QENrXmnO2rVgY=;
 b=QxYG/9t+r6/PvgsyVopTTOxuSIFDViinGtXXG7/HvoWkPLNXf8nkdDwaA2Q3eSmyOrB03rgmaE35PH/iJ0bs53IPKRIL3kqe3oxpnEN2fZI7c4PsLEqPpxGEf+zCgTztx0CMm1IScJE9vxaQnY4bNqqSX1JbmZiYEJ6aI7qqfLQjkd+FiBQtAILK8cgkKw52+ceOyf3mQ9EBsBMUGQM0MDIdqupudsfYqQUZ6q+cqKc1zVOT4hCJOuGrpDe2BJsPw0U6w10L1k1Zko+BYs9FCIUMkxd0kVW15O7cR5nNwBaPwHaXE5p0y7ZXjwuMEjMFkO/qqnDgMXNaFKQCmMgySw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Mon, 18 Aug
 2025 20:45:24 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%7]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:45:24 +0000
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
Subject: [PATCH 2/4] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Mon, 18 Aug 2025 15:44:18 -0500
Message-ID: <20250818204420.794554-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818204420.794554-1-shenwei.wang@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:510:324::27) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|VI1PR04MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e85fc5-5ae0-440b-2cf4-08ddde98280b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c/uitelSSQFxr4H2BuuH2NJ/HBz4upQSaWmHq1cP9F18Oq4BxAsmuNTaXTmg?=
 =?us-ascii?Q?bjzUVQV3o0MJ1EgM++kVhHwrC+jmFbfiaVi9CIIlUd+/DbjbNWaq0XNnuyF7?=
 =?us-ascii?Q?YZ8sYyI++cCa6mJL6aSRCYkJ/tF7YmB1hOEIHgOUHphERoaZYJzxl07dl/1H?=
 =?us-ascii?Q?SpWJ4KXk3obeVnyo7tyclwf2AAXwICmfGar1U2H4LuYp3EBH1DCe6qKlcyLr?=
 =?us-ascii?Q?KLz8HP834oQRBLjRRB9EPwlktMlJM+bSP+O5keLuCOtElsvVyQee8W0r8P69?=
 =?us-ascii?Q?abT/lfbOSKNgTWY8xo0Q/nUOWPxydDThzwIMhM6rJX/HvOLL9z1mmsYvyLzD?=
 =?us-ascii?Q?5ThqUGvAPSES3fPViQm1LaA+GojsQjAOWZ9A7gxikBw/BPE+yGaquCcMiiWT?=
 =?us-ascii?Q?mieZX1PyuOCmTr7fb9T8adt/T2xcqul1nkFyihgPXX1B4KOCAPuwSd6hRZU0?=
 =?us-ascii?Q?9BIKVFhGIAlEzDRMNhpgJVYyZuZz1srQMLpCyMzd/A9kts9z22Dzz9wtnQW8?=
 =?us-ascii?Q?5jPTwQ21gq6xQqPB0Ps17W5j8cBj4wCNQs1Iu66leamGIF9PCZjcxDzQIAF7?=
 =?us-ascii?Q?2EAfh0J+5+X7spx//0oy2FYuY4SJ7V5jOUZIoEDzlgVkL4zcVfTU310FDbUT?=
 =?us-ascii?Q?oSlfDACBKiKkvixwEOgZPWOiFTL4sk5639sLowShdnjD8tEF7GP3Fo9WLXSA?=
 =?us-ascii?Q?gnxOtgefS6tsoqhGK1WZE7OmJtsukPRN+6kfLm0pSnMy1zepCAxsPG17RpZ8?=
 =?us-ascii?Q?KhKuDMZIuLWv8ske+uf/kggeQT5pFIMPjL4T5/RiFnXYF1NfgKGyNTjE9Jv/?=
 =?us-ascii?Q?pGZPQVizhKDypRINx6LwfsKTtrMxTlVlifNiTzgvGvaSKsCsjs6vGM18oe/+?=
 =?us-ascii?Q?TSdmJShN9v4Y8hQHA6ZZlsZ5DQ6Ewi/nMBR5PnJjT7Hcz9QzSXzO1/4tZqTs?=
 =?us-ascii?Q?g0hNCFvkyZWYYIDHKzEtwzO01f+zQTcfTLwZiRKQTw+WVYc8p8+Eu9sRI7NN?=
 =?us-ascii?Q?TJ29MfWtpoSWX3RngKN0KYbWOqmoPJh0noDFfdTdEpyfphJAPzCwIEb09B9M?=
 =?us-ascii?Q?KIl1QvtMWiVYTSeosOs76Wcd3bhU+8wfrZS2Uw1FuFX6dDtmqdlMu9uPlWT9?=
 =?us-ascii?Q?j8jOpalOVIuKdfr2fd6Udth7SI0H9/jsBQ78HZwVB/7TsuLXiPiVT4vMEI0I?=
 =?us-ascii?Q?+v6VF8bhQWXfCSmRemj/eZzLxkS3Ido/SFmBunti79NS7Y3QbjvxXULprxBt?=
 =?us-ascii?Q?HYM6QE9P6lF+KQ60hdOKf2BCa5s7CaKwEOQSkxK59osAb7D4GVl8Z4GdSJRr?=
 =?us-ascii?Q?/8TpRJeBMjJ4gD47iasHF/nuLQGh4w3/UUWQVvemhWO3lYPobPPZczTTDJok?=
 =?us-ascii?Q?CpiDLibAQedGZpxt2Aikb/6wagz9e9ZWP0Xu/xNQQYnb+6nx9hPnGg+C7Ijj?=
 =?us-ascii?Q?OqyiUFGZ/7AUrJVe4PjpAn2TmdqOW5ZJ/HONzpy0f42q65z7ylfUUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ejMWmt2ZCXy+/FpvsSOPvGzclipuAk/Fy5psffQrWzlwKGvhLM2wqa02FA6a?=
 =?us-ascii?Q?OTY3ReMX1BYJ5uQ1tN21qd78d+6BocAzZ0JF3Kc0NkRJLQRSam90VuwuqayN?=
 =?us-ascii?Q?ibvK8K2Os6EKBFXQP8eBUc7I0idhOCDWjuGi7wJEBNfV0HXRoFBsigScPlWp?=
 =?us-ascii?Q?aKchnSvmvHt5GApjeOUmsxNG4Bhim0M8oo8DRj5A0D1UnR0WDvfhL+sg7RxS?=
 =?us-ascii?Q?fkT2cNRXPQ+k0NvxgX72kMTfxffpQWCJmvKdQPYIM/Z62dA3rufyjWTuhDyx?=
 =?us-ascii?Q?0/ykCZItOjjKWu3y0pPbVczfx4nMlUDQaAh+5RQUojmukWRrXysFAC8XhWGg?=
 =?us-ascii?Q?IzbuXe4lJSnnCfQc1JsdxOIfdMp9ln+ATTNiz5yoIXIPk+6VWA2CHnrBD7Zn?=
 =?us-ascii?Q?NCuXYkl6xtrMFT3OKeM7kvsV2ptdIf3bDbq+S4DX70NevocG0s6IZtzkA/Hd?=
 =?us-ascii?Q?El3rQEGuIxK4CmODhTcJU7nHLW2umf8vP5WfuC9H/eebnFcF+7QaSQhoD1jy?=
 =?us-ascii?Q?XMKoGFBa3T+q8F0WAUdQmxbJEoHcJpVL5IkT0DfDCTpN1CfvOvZy7N4xaS2z?=
 =?us-ascii?Q?O6B8zr3/exqhNvTfte6BpO8vY3COaCwt8xbjwwgUMNyZWyZW48/qzRO1usH8?=
 =?us-ascii?Q?3GMJIRFul9Yhx0m/Jt1AzyYCu9bSS3W4qEYqzilP8Kic/dPxHxkBtAYGA4/P?=
 =?us-ascii?Q?2/oT3CfKUt6gD6xkAr1j2hgfw+9Rs72ZN5f1HVnvjOWkS3ysLdZOTbrxG9wC?=
 =?us-ascii?Q?YnNKqLzK455X0UmCce9pQRw+1DcN2/pn4btLTB5MnHHwuHxy7BhCd4lpfK4D?=
 =?us-ascii?Q?IBRwg2EfGTktzGX4JS9Uu9oUmvMI91UKRzUncAdIfgXI6PiyfVHXYQiX2G+z?=
 =?us-ascii?Q?rVoFC+MMlUSjmKnHbtYIkgH91y8ZiF2yD8m2TLovlNBS+b7ztYgSUZRCQSta?=
 =?us-ascii?Q?8hK7knlI4XR6QtQZ7VvaO65K7WryRRxmWBShUSSE9rkeo1kKXbNWht3T4Xcl?=
 =?us-ascii?Q?3xGZaRdw1XcJmNTMtAw6a42Ezftej/q3q5jkZB9sowO08sX4wyqQwT7LUEYV?=
 =?us-ascii?Q?LaMOZ2lGmSdHMspqxbKIb1yBUL6ct53MhQ39koP7GiJwz4/p17QQfTItIV31?=
 =?us-ascii?Q?93xGR5wUx6KnghPR5zqb/prB+vmOUeLWkW9sjXSwAJNSReGb2Hiq7xsC01XJ?=
 =?us-ascii?Q?YxuqnCwncRSo2a+542MuV5kKCTty+mwBok5xy/kDKnGMTeNsDCfOKDKEv5du?=
 =?us-ascii?Q?5qmz8j5oswQeGnZZ8S0cyZCAQgCHZypBj4Fg5n10/BJyr2NWIuX0wZ4HY7T7?=
 =?us-ascii?Q?rAnodWZeM3GW4b4OgGTAY3B1BJxXucTqLDsvzKYezNc5TAguy+uk/ZXYAlJh?=
 =?us-ascii?Q?0PB0ScyEq6lhjz3h2pcTsXrcuSDJhCXufGDyV1J4sFA4F8kH0tETicgfrw4t?=
 =?us-ascii?Q?53HXRZSXatceTM3y1b8IRNL+5mPsQeYprsmPoPx5/HIQ6GYPF1cYBcFNZ7aX?=
 =?us-ascii?Q?RjWMAS0EQTdm6lkBd9/eeZgQqo7C/PFo9nkNRrQluyJm4wzOYqtK/jalSmad?=
 =?us-ascii?Q?5z9CG1FeeQJcFBwIHXWzFJ04fGFtfBQmTClBWiyA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e85fc5-5ae0-440b-2cf4-08ddde98280b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:45:24.7091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISw9iVymxvFjQlua2tDVSmTiAVfnSB489q4vVfIcej6U3YZkhAaraACssnGu9T7VVQE3GhNcgUiXTg/3pWZ8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

Register the RPMsg channel driver and populate remote devices defined
under the "rpmsg" subnode upon receiving their notification messages.

The following illustrates the expected DTS layout structure:

	cm33: remoteproc-cm33 {
		compatible = "fsl,imx8ulp-cm33";

		rpmsg {
			rpmsg-io-channel {
				gpio@0 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <0>;
				};

				gpio@1 {
					compatible = "fsl,imx-rpmsg-gpio";
					reg = <1>;
				};

				...
			};

			rpmsg-i2c-channel {
				i2c@0 {
					compatible = "fsl,imx-rpmsg-i2c";
					reg = <0>;
				};
			};

			...
		};
	};

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 125 +++++++++++++++++++++++++++++++++
 include/linux/imx_rpmsg.h      |  55 +++++++++++++++
 2 files changed, 180 insertions(+)
 create mode 100644 include/linux/imx_rpmsg.h

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9..9b3396f3f1ec 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/imx_rpmsg.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -15,6 +16,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -22,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/rpmsg.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -1084,6 +1088,126 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+struct imx_rpmsg_driver {
+	struct rpmsg_driver rpdrv;
+	void *driver_data;
+};
+
+static char *channel_device_map[][2] = {
+	{"rpmsg-io-channel", "fsl,imx-rpmsg-gpio"},
+	{"rpmsg-i2c-channel", "fsl,imx-rpmsg-i2c"},
+};
+
+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev,
+	void *data, int len, void *priv, u32 src)
+{
+	struct imx_rpmsg_driver_data *drvdata;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (drvdata && drvdata->rx_callback)
+		return drvdata->rx_callback(rpdev, data, len, priv, src);
+
+	return 0;
+}
+
+static void imx_rpmsg_endpoint_remove(struct rpmsg_device *rpdev)
+{
+	of_platform_depopulate(&rpdev->dev);
+}
+
+static int imx_rpmsg_endpoint_probe(struct rpmsg_device *rpdev)
+{
+	struct imx_rpmsg_driver_data *drvdata;
+	struct imx_rpmsg_driver *imx_rpdrv;
+	struct device *dev = &rpdev->dev;
+	struct of_dev_auxdata *auxdata;
+	struct rpmsg_driver *rpdrv;
+	int i;
+
+	rpdrv = container_of(dev->driver, struct rpmsg_driver, drv);
+	imx_rpdrv = container_of(rpdrv, struct imx_rpmsg_driver, rpdrv);
+
+	if (!imx_rpdrv->driver_data)
+		return -EINVAL;
+
+	drvdata = devm_kmemdup(dev, imx_rpdrv->driver_data, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	i = drvdata->map_idx;
+	if (i >= ARRAY_SIZE(channel_device_map))
+		return -ENODEV;
+
+	auxdata = devm_kzalloc(dev, sizeof(*auxdata)*2, GFP_KERNEL);
+	if (!auxdata)
+		return -ENOMEM;
+
+	drvdata->rpdev = rpdev;
+	auxdata[0].compatible = channel_device_map[i][1];
+	auxdata[0].platform_data = drvdata;
+	dev_set_drvdata(dev, drvdata);
+
+	of_platform_populate(drvdata->channel_node, NULL, auxdata, dev);
+	of_node_put(drvdata->channel_node);
+
+	return 0;
+}
+
+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
+{
+	struct device_node *np __free(device_node), *channel;
+	struct imx_rpmsg_driver_data *driver_data;
+	struct imx_rpmsg_driver *rp_driver;
+	struct rpmsg_device_id *rpdev_id;
+	int i, ret;
+
+	int count = ARRAY_SIZE(channel_device_map);
+	struct device *dev = &pdev->dev;
+
+	np = of_get_child_by_name(dev->of_node, "rpmsg");
+	if (!np)
+		return 0;
+
+	for (i = 0; i < count; i++) {
+		ret = -ENOMEM;
+		channel = of_get_child_by_name(np, channel_device_map[i][0]);
+		if (!channel)
+			continue;
+
+		rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id)*2, GFP_KERNEL);
+		if (!rpdev_id)
+			break;
+		strscpy(rpdev_id[0].name, channel_device_map[i][0], RPMSG_NAME_SIZE);
+
+		rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
+		if (!rp_driver)
+			break;
+
+		driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
+		if (!driver_data)
+			break;
+
+		ret = 0;
+		driver_data->rproc_name = dev->of_node->name;
+		driver_data->channel_node = channel;
+		driver_data->map_idx = i;
+
+		rp_driver->rpdrv.drv.name = channel_device_map[i][0];
+		rp_driver->rpdrv.id_table = rpdev_id;
+		rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
+		rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
+		rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
+		rp_driver->driver_data = driver_data;
+
+		register_rpmsg_driver(&rp_driver->rpdrv);
+	}
+
+	if ((ret < 0) && channel)
+		of_node_put(channel);
+
+	return ret;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1177,6 +1301,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	imx_of_rpmsg_node_init(pdev);
 	return 0;
 
 err_put_clk:
diff --git a/include/linux/imx_rpmsg.h b/include/linux/imx_rpmsg.h
new file mode 100644
index 000000000000..300ada6237be
--- /dev/null
+++ b/include/linux/imx_rpmsg.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 NXP.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/*
+ * @file linux/imx_rpmsg.h
+ *
+ * @brief Global header file for iMX RPMSG
+ *
+ * @ingroup RPMSG
+ */
+#ifndef __LINUX_IMX_RPMSG_H__
+#define __LINUX_IMX_RPMSG_H__
+
+#include <linux/completion.h>
+#include <linux/mutex.h>
+
+/* Category define */
+#define IMX_RMPSG_LIFECYCLE	1
+#define IMX_RPMSG_PMIC		2
+#define IMX_RPMSG_AUDIO		3
+#define IMX_RPMSG_KEY		4
+#define IMX_RPMSG_GPIO		5
+#define IMX_RPMSG_RTC		6
+#define IMX_RPMSG_SENSOR	7
+/* rpmsg version */
+#define IMX_RMPSG_MAJOR		1
+#define IMX_RMPSG_MINOR		0
+
+#define MAX_DEV_PER_CHANNEL	10
+
+struct imx_rpmsg_head {
+	u8 cate;
+	u8 major;
+	u8 minor;
+	u8 type;
+	u8 cmd;
+	u8 reserved[5];
+} __packed;
+
+struct imx_rpmsg_driver_data {
+	int map_idx;
+	const char *rproc_name;
+	struct rpmsg_device *rpdev;
+	struct device_node *channel_node;
+	int (*rx_callback)(struct rpmsg_device *, void *, int, void *, u32);
+	void *channel_devices[MAX_DEV_PER_CHANNEL];
+};
+
+#endif /* __LINUX_IMX_RPMSG_H__ */
-- 
2.43.0

