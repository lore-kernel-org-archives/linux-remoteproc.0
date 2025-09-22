Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11F31B801;
	Mon, 22 Sep 2025 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571507; cv=fail; b=nxy6HIuAgy4J+lRda7YPqOJdV1qBo+6lIV9YJDNQJMur09fBnyv3s5r/aVKPK4e8J/zSTq9VcMxxyPDdruhVk01FMSnxTzMXhmvDfQt5KmOQpGEqsTfVdcOA/yEp1eN0FyQj41Whp4wFrDFr7h2/85WjX2OAjVbHc+DAYAX4Yvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571507; c=relaxed/simple;
	bh=7ngjY+8OAjzxr20nwBtezy6b8l98NjjReFpGd7oTb2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HDZ4jtci6a/z6lHvZPJQK83o/AFX2uJ2+tq3KJRgQZo8e/9tlCzTV7HtQHgj2VNDtLoZa5uM4hWPE2eh4c5xQPBVG/VzEVgpfYF8+7pjTh3gEl7f1vEV+pju1+wILdxLqu3JvJ6edCN6jPvEs9+CLxgqjwnEId1FSPYmMbvPS/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XP7nfsDu; arc=fail smtp.client-ip=52.101.65.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XP7nfsDu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4dVvIDe2fWwbhkhbGbpRk3+QI0YvyThOj3Oe3Viv/useZl2T69NM0gieiKkrwpX/Vfe6eBgWOG4ZhEnTcHwaMPzmZPfM1xwf5mHPf4sBJ/zoPLng/amT0+NVaiaJH4Zq5faLU6MzZj1TcK6VEBxRxOy9o4c9MXy0RnMJRcizJjQU4BnbqU51KrI3cf72T9byJRCvfVA1ybz3I/XBuJskd7lkshzXuqGEE3zr835IZzeCLjwJz2/3opMfvelvjWCBfEWRvh3jx+80bgovMUzz+Tt1Ean0pyKoczW51nbIN0TJsU4j1N0NYTmd9p2/qkP5/egbbW+z57T99G1QJpx7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HW8u73PLyqfKZoMZCvoef4fL9mkRsv2xmyIYga1aYY=;
 b=Bbriaqe9ZSD1H7ZvIm3E5gSX/QTR242QalZOOsIc0Kj9u6Whu8irBHVs/r2gM4Cp4y7vMaY93gVCCu9hOSnQm24oj0rXKdqd+q2x/LfJJgJ4xNpZNdTmRc6IGxaIbB71YYkzBiGgQsaOvPoq5kYMriKoUGYlZtNvDElnV7dtNvZdbyKkNgqfM5AIAYKzoeQNWtbXyCCydjf/F/e5GRRmw6+vnkBy3mvKVOpDotMzEB8lRzzq+t6IF2mCMzOcsfEHdJfw5ostSGhwn/S4bVx+kMnZsh5Jn97EGQWql/BdY1xE6fx1f9L0UUc7/Di5Z9oCtuocbq+c8RpU2XTQoV+gOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HW8u73PLyqfKZoMZCvoef4fL9mkRsv2xmyIYga1aYY=;
 b=XP7nfsDu5sfkaK0GH+3tULAyn6KtjCBhByzRZAWPmnUPz3xIER6QtCWh/VBHlbkEQ4q/CKtABlTx853XdYpsjHNWcZf9te+2hxu7M24ocV/++W/JJDo41k99ug1n+QRZj4StQm1//illAEGUE4eND4C1f0gPCjrh5c0flTrwfQriIoQhqUBGaMSh3Z4qBMgdlJ3JiGaEy3nIyng8L2fbGXOmLTFpyc3SkM3Tb/Q/ss69ucLEEgdbt1JUTolUpjLTDn5oFrvWhTZyjFuwIAFGCae2wYtZfvLxiSr8tdz8W7ok+2K3RqBr0oEvObOdnzXsPam7PR2ibpB7oqFpXMy5GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 22 Sep
 2025 20:05:02 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 20:05:02 +0000
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
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2 2/4] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Mon, 22 Sep 2025 15:04:11 -0500
Message-ID: <20250922200413.309707-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922200413.309707-1-shenwei.wang@nxp.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: bafb7c29-4a4f-46c2-6b52-08ddfa1350c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X6YGeJKBzgfGpRwmFtjPJH/Xg7ETcf+eP2346TZlZ/hpzS9LWwDMlnEHQRuC?=
 =?us-ascii?Q?sxm/npP6B3J69wtXrLba8P724QIxTm+l/Vr/HABEEZCOzhjwm1O/obgjAZET?=
 =?us-ascii?Q?un28q1W+Mnoj+ZUvkGkSJx1aArtElARe4RPISxr7BPYVhJqbInpApBpDsnqB?=
 =?us-ascii?Q?ywexa+uEGjCo6KeKhncw2Bqf4DzRAjeiyI0ECZdaNTcFazDLAGD74KA2T/uC?=
 =?us-ascii?Q?Ccy4knUdDO7e2HLSnQqz+URQFoUPIa5iSpfzy31GVFQ5BzPf6t2wNr2ZCewj?=
 =?us-ascii?Q?M1YbkI0g2ThdiBVH6e7yVHdKgonGSABxtToZkp5juSnqxjTHR2S1w5s2+tDS?=
 =?us-ascii?Q?/ccO4PRS9my4pG5YAvvD7MKDqMkOB/tcqARbmlqu69/VhiS1/ZMAh7Hx89Je?=
 =?us-ascii?Q?iE3V+cvUeDntt4GiUnirwRI9qVhVPLSF8X7D7itkmpZqIS73mWRTauCDkK7l?=
 =?us-ascii?Q?6jwxfYHKhZxBNBZe1lh6DT0zeFF7/ZSbzGGOLrI+A50oogww9366x7VRIdSL?=
 =?us-ascii?Q?XrlNckDV/otbVPgDuSBeDRoubvaiHNpz73jOIVuqStrVHgfqZCq4geOopmnS?=
 =?us-ascii?Q?nPYLpqRj3k/7U/0A1E7441Gzvd2vG54zGb4aOJ/dbmo+EmYKYnzry0MGLOZR?=
 =?us-ascii?Q?SyW4PfTEFei/ZUTG9uU32bckIUGmh9tt+QygNaNgzc7/gCABy6BYpxOPisPe?=
 =?us-ascii?Q?gfCIdrVvzsK9p++3ov8c7kAD+Y4Z/Vtll7o6sd2NZL0fu789mTAV9kI5Voy1?=
 =?us-ascii?Q?ZfBf1bwX3PqpploS+veZFjG13GVM2zzC5yS9K7DLsQ515+m1uEuvzYMZpJPt?=
 =?us-ascii?Q?GTIndaYLyzbLceRyyWe95BpFclqZhZ1QMNIP3DZnumnqMShPeB9qCg1D0UXL?=
 =?us-ascii?Q?9xVj8xuv/RAW867xRBfpY/pCxH/vG/lVu/1PiaU3sn5ai+stcW2s9iqBLDZg?=
 =?us-ascii?Q?TDHIdqIcWxImz+nfFTNOjtxO0+1PgIPGvlFDJpE/3/mlqUusBLnUZE567KO/?=
 =?us-ascii?Q?q8VL60EVYBU02GL2Y8Ebd0P/uqc05TxLqfNO/e/GrEb5xHc11tV8Z3o4hizI?=
 =?us-ascii?Q?CDJmlh3QZfbSVtZjtGuzOJDraM62GtW680eMa4bGlOx6q5jKDQ+gT8Hkmjlr?=
 =?us-ascii?Q?P5/EcD4tIqjF8A7BOanYSKJgBGSZZLdWZIwwoPkRVTes4hUM5JMRfGGUCtZm?=
 =?us-ascii?Q?3ID3f4b4HvdhHU9++tZLf+5/vPP/8nUck4/yhIwDrwlbAwlLin+l03StSAEZ?=
 =?us-ascii?Q?L4x6GgNF8Tcyt/AjPynIK9VvrvLyhJz5yMylC9iFwPQzOjTDz/jgrG44NFVu?=
 =?us-ascii?Q?X30QwaWWvRfItIZfjPX5L50oB7hzgQQp31bdPuodEgWvV9SaC58DD2i0sqAd?=
 =?us-ascii?Q?ZyYAdKSF+5Hhhy9kSOvJ1N6CXbH+9HD18IsF8whwDlGMvu+N0laWqbVeD80T?=
 =?us-ascii?Q?gU/g4lbEy2pPcC4OHtIy2xHTSlDZrH3DPaDUlUcEvOSJMaWmSA3jyw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GWre8mkBru+AIhguQ+Aoyx17ySQLyd1VqVJe5T1gCv318cLx/Qb+eVkXalgE?=
 =?us-ascii?Q?2Q7BKcrxwKmg/b9QJ0ZjBs3RiK3PwTbvzAykZvH49U7s87hB0dGz9Ufsx0Rt?=
 =?us-ascii?Q?+k82PePUmw/i5IO73GrHaodzQK9jb5bDV2XfMnJiXW2/1cgSH3OPquAablq5?=
 =?us-ascii?Q?gqXP8HbO/7IznADSdeVRg9Lu6MT6Yy/xDDVYBwES7X+spxxlJOBPaxX6m19R?=
 =?us-ascii?Q?r5H7piqVC9a88HoO99islFvQkq0dIYWgYQQGiElDsjqxK4LhVlgKnVXMQFG6?=
 =?us-ascii?Q?L5OORoEMc2oYEM8bJzmOKu6t5ATKBD2/sXlHM63Vq+N22zPULqdv1dydtzV6?=
 =?us-ascii?Q?2Y8Za6lmQapCd7mOHSjAo4CuZi1kGaz36fFveDdJXYU3k6Q6sepWQxE1hXcN?=
 =?us-ascii?Q?a5FyM2ujbhMVwspA7/JsgUpW/Zb3X0IKjLmb0/Pizym1d2CX8sTSUKJMBvlZ?=
 =?us-ascii?Q?cfhuS2fV1auXTUt7+NvRUH8on6Z+MhdQxlzlQbHuuY9e/dbsu3BBrmnzNFtt?=
 =?us-ascii?Q?AusZvao6cbDVp8zbVITKOS5aMT2/J+ZlVUxmpy2JiUvJ37pk7gdIyeK3j//R?=
 =?us-ascii?Q?6QNBGgMBL9zB8TE6Sbhg5oomx2IUSmWHKoirKBKbtNvfNs/WVvM0Y98VPUSc?=
 =?us-ascii?Q?vvsbGd5hNdbN7LjMaG4t1ENqkUI0xyv8rkVMu9uBaA53PWC6SGKaOyjVHoX+?=
 =?us-ascii?Q?Xn7Gcl2G8g8LrQHrTpNuKl0zv3vu/KAjv2rXwa7jwyjwe16XbNhz/orZ5IS3?=
 =?us-ascii?Q?nzPOUyl2uz7I34Lecknwpi/w64FojZVAtafLc6EzyiTimK/0hlTMUnTEllkA?=
 =?us-ascii?Q?3kXw09GTYsAktZ8KR2oW5IvVjgPk9V6LEIMhTywQcNYw+gLqYfHKNMTaUqlL?=
 =?us-ascii?Q?LQU3J/YnSUQ5lL+lH9KiHjalVNbc339SEg1KndWwWB2i8Wdpqsv62eZ1W34v?=
 =?us-ascii?Q?WAqUQqvpGcP+O5KD9OH6Lj9dNR2Cus2U5T640QkgLAA4gmcNQVEH/x8haksn?=
 =?us-ascii?Q?Q4ISBnTDsKw4tELuKQR52aTVP5BAQdK1HYuOYyFgJcMK4RcMwnjnmd6awma8?=
 =?us-ascii?Q?axkegbgmoE/DM/5Zsm9Lne33O1PIDajwT4s07uGE3NYkUOfn88yC6p5Ehnst?=
 =?us-ascii?Q?2tUdoCHR7LRlu0v5Yx3hgB5u2bh4Wjq3V0tgzjtND+5rqYN97UOVlk6PKLVm?=
 =?us-ascii?Q?syjv3wYMdpcOgMXVd5DQqB2lIw/TzCxHVS9xaeJLhssSqQtMYjlErVsvQE5S?=
 =?us-ascii?Q?84AIxfEqb7zzXM/uCdTf9BonTIH6GKMCdHQEX3IrvTLFgdhWUCqfRI58DL2f?=
 =?us-ascii?Q?cbzRiLaI4Qrvv85OXWM/7xjdQicI4K2+6bYzAcVN+ztPeL3xwHYDeoKhTryD?=
 =?us-ascii?Q?WZsiYXKkJvk/JgIuv4zq5D9UvVNWPFwWxyDkIYBQeD4c+NvXnz+N5oOLiAD0?=
 =?us-ascii?Q?TMi3b3PrfzFJiDBEch25a2UagOOcuBaE3W2i6C+eJjsk2MjgqwWT6CjbyPRT?=
 =?us-ascii?Q?9RU6qZEtQd6rxTI0vyn+D4+KE5mxOGWxUN9KYy72cEsUU+FsGJTrb43yRTZ4?=
 =?us-ascii?Q?OH4kOgp4bG5G4V6lO9glZPmgl4+iKWVcn0EkLaMe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafb7c29-4a4f-46c2-6b52-08ddfa1350c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:05:02.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qQbnOsmyIQJDvAx5iAgGKxyIAr7stS9YCES/7X4hnWG04N9ExJqEFrgn2S8QUUhV03gIeb6i6exNdvp/wsQMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

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
 drivers/remoteproc/imx_rproc.c  | 126 ++++++++++++++++++++++++++++++++
 include/linux/rpmsg/imx_rpmsg.h |  48 ++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9..07ea6127e34e 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/rpmsg/imx_rpmsg.h>
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
@@ -1177,6 +1301,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	imx_of_rpmsg_node_init(pdev);
+
 	return 0;
 
 err_put_clk:
diff --git a/include/linux/rpmsg/imx_rpmsg.h b/include/linux/rpmsg/imx_rpmsg.h
new file mode 100644
index 000000000000..04a5ad2d4a1d
--- /dev/null
+++ b/include/linux/rpmsg/imx_rpmsg.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright 2025 NXP */
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
+/* Category define */
+#define IMX_RMPSG_LIFECYCLE	1
+#define IMX_RPMSG_PMIC		2
+#define IMX_RPMSG_AUDIO		3
+#define IMX_RPMSG_KEY		4
+#define IMX_RPMSG_GPIO		5
+#define IMX_RPMSG_RTC		6
+#define IMX_RPMSG_SENSOR	7
+
+/* rpmsg version */
+#define IMX_RMPSG_MAJOR		1
+#define IMX_RMPSG_MINOR		0
+
+#define MAX_DEV_PER_CHANNEL	10
+
+struct imx_rpmsg_head {
+	u8 cate;	/* Category */
+	u8 major;	/* Major version */
+	u8 minor;	/* Minor version */
+	u8 type;	/* Message type */
+	u8 cmd;		/* Command code */
+	u8 reserved[5];
+} __packed;
+
+struct imx_rpmsg_driver_data {
+	int map_idx;
+	const char *rproc_name;
+	struct rpmsg_device *rpdev;
+	struct device_node *channel_node;
+	int (*rx_callback)(struct rpmsg_device *rpdev, void *data,
+			   int len, void *priv, u32 src);
+	void *channel_devices[MAX_DEV_PER_CHANNEL];
+};
+
+#endif /* __LINUX_IMX_RPMSG_H__ */
-- 
2.43.0

