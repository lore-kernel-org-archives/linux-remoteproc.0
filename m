Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C2286426;
	Thu,  9 Oct 2025 22:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048866; cv=fail; b=JLuAeIO9NZQeAphvmWfqWS7Mt7qqrVgUeq2jkKWJVUtC2DZUct+RjWnOU4gYlcbds7Ed1X8/FKBIaJ9bynUBTu+6zBDDm+bHO6fGNykESBAi25+rhMUjTnQb5F3IMa6tcgL6Il6N/3zJL1wj1ufW8YmjL6z+byYgnSwBY9jC+oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048866; c=relaxed/simple;
	bh=52IRiiDXXnRu2J5ufbHI6RZO3m22OQUuMfsTQygFuuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h9yh5lQlxuDgVcDZsgSdU+2Yk9OP0fhnY4yXonz6mwat8fvXi4HwnibgejgnRnKUyLeRxfbVRwQf26+aYYyroSKwp1jq3gkxs76s/19y4FT659xP/zwcFcnZzRRfRQRTcKd7Qc4z567hdUpbJEckZIA3u/0IfEp1j3Bphfkfj4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QAnKUf1T; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QAnKUf1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/tQzpQwfnyjVxMnkWyu3V7I7ORjcSDexcmhoOoTyrceGzA0RTknFLpDUSFZ8Vfep+Jgu7e4nOJrYheeb9XtRyHX6F39yjqBe+0tXPkbf60NUQ7RLnVFRP8OFnkzL8n8vyqHM/7o8dSr80cF8Qi6UxT50GkOYJEpJhXrWuSwv+a3jYH1XeKrz6+dtBm9N7q8f9v0aiUdE/iHe3qbxGPvJwvMM522lFjS2Z11Ib5SJuCfCvSdtKhhi6Zyw2Nlty++xkNkoISTrcyuYv5J4K+iQbj/aWPBpdpndxIGaYBDhrMi6jDCI3cp62FTmBDXib0PrBk/XGg/S13kIseqXKTcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=y3IMgIRgr1iD4CMKO/RWni2wN7AI+0yvhG/GJ54fnGV5T6E04H+tT3kKL6p5rmSMR+mBfR0IYDG56bVY6hDWEZca+TSyQMaV6h/smSF8xuUMg/6xl5aWLYRMTxhkb6Cm9lXg+CaJSebpvlZcbWXJueruwpCYFqzhDfHF2/fi8KsBSvIw2GEaBsyl/3QG9Zow9dxchcVZdMrFrA5mNLoE7ICgBNwWezEkeH/ihw8Pa7Tv03RHdg2zwZN7NK+b9M3MGrQPvKnklM954Yxmz/Quv0JZR62l6RBXQD0Fcnz+gIOJPeNuFTw64yZBqC8M0BEc2fTUm3fR83tXg8QyX1ob0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=QAnKUf1TkbhCDGBYZ4CHuFbYgcSSUWfO7muzUwb54xz/ZsZDqib2dgDabuA5RlKxqUe0So9yxIvn4QzP4z1CCpShBrljSJ5nPo0ZPKmrs1k1ZOlnLNz8QMsTHyqd5u4cpMeKdxCsXsg0oKEKQvPp2hiIY83re4IByL0l3ISvSuIvLIO+sVh/djxSygTLeEOlUS5l3MzdnvptbJ/vHo2NIurX+GwMg1NSauS9X8tGtff1OteDQs1qZFXH8DEmB3XO6ZIJPsT0GoQ+J+8boeGphyB8xw6OnAxdZiJKzXSQdtSSW+ydL3Enj9gHlacniqY1OtLvaftfxieLViObxwlQjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:27:39 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:27:39 +0000
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
Subject: [PATCH v3 2/4] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Thu,  9 Oct 2025 17:27:14 -0500
Message-ID: <20251009222716.394806-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009222716.394806-1-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10852:EE_
X-MS-Office365-Filtering-Correlation-Id: 699af6b9-9488-44b3-e98c-08de07830e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kaY0rnpQ9SMHwzTZolXCGE75hPh/57gLXYzSN40aztkQIO3kiXksEdhNJniX?=
 =?us-ascii?Q?WdfYn+0ajCiFhmK/zWq13oZiAjGOhEdMs2Bc9DtL4oes1E11rKPRNJg2A5bk?=
 =?us-ascii?Q?ee7X5RPpMFNKxGOsMVG/UFzJJZxvckG5XdWdjcC1roLDn02aJjNMg1xjawAx?=
 =?us-ascii?Q?QdE5U2StaC6DzMs7tNxrIouoI5TM5Crh2KYPWVp8tIXPc1ZSLp1UOfe13E62?=
 =?us-ascii?Q?GF6JLs6vnqkrO6OXVwBldd5uUgmiYjdMh3hSvsTOqLrRcrimO/umbISzLS8t?=
 =?us-ascii?Q?45coCLRAjjanG7t4gxxUksXquGI27RFVinALDzn4HJlwPqXIO6bdpnRw8g/s?=
 =?us-ascii?Q?TAZarjFFfKHK2AE/rfE3xHyLiyKiBDQrZzNIFv4as/yqraCPWl5CSDogGoIy?=
 =?us-ascii?Q?5gF5oPkJbWj2yzl+TA/NXpKWBj7X5bJXlukkYYnpRV2XH6s6SXTXYWF+Ntra?=
 =?us-ascii?Q?O7YMJ76Uh8DKx9xqklpjHoV5Fy01tK7b7WmDCnUDQAreMGPEe5mgPgYw+z/b?=
 =?us-ascii?Q?hYzWZXRr8amy/mE0ZfwZL3ckJ5gVe3YkbRcjjxKyXOU28OJKKC8Jw3KBHd4f?=
 =?us-ascii?Q?JcxT6Km3B8l3OO/Q4bc/kDiNhqxws+fdLmDKINS2ZzS2SuBBSHKV/VUkfdpy?=
 =?us-ascii?Q?lD/Nrrsdw7Q2DWI3AzH+kHAVLgNZiOlFaiqpaHbNoM7R8NhMX+XgAKJBfZuJ?=
 =?us-ascii?Q?vJ63wzViJXp4FZW3AgmPp2OBZD8F7WiUE6Ua/H5nZTc+no2X735WfNUUEc7M?=
 =?us-ascii?Q?N3HAgWMH21kXTTJJGvKfXJZBd/yvzoa8Y/vwANKncgMW9z/qtOeKWglajHWM?=
 =?us-ascii?Q?BGc8qDdRnwXXCRvxeq3vaW3XHN6I21mT5qf53nbpIeUryEtaKiu8mqNhrBQv?=
 =?us-ascii?Q?P/MefoEATRai26xDpcA6gDOKf5jS03fnk+77NcXujKGXoJJhPYOkLC3dfNqy?=
 =?us-ascii?Q?xtDMEPnASB8MAp1MtPFGjLE8JDX9GUvhJrZM6A1FEyxhL2470z/qBFKWuBG/?=
 =?us-ascii?Q?1vmAatL8Kh/4fcoj9nEf21wrnfuFi8Gjq+6CY2TCY60Semy+U6WTnXKwLbpb?=
 =?us-ascii?Q?awIKCGxWj1IK+2mPArHV0uqvqETauXuDPB9Y6b7LKQ2p5qfykb/vPEtv6nWj?=
 =?us-ascii?Q?KATZkxOXBllecLPJoK0iazXISNEVKKJoV0tnc3YzXuAwpT7iTJ0c+dyxeqRg?=
 =?us-ascii?Q?iPA3+gNrRma3ixYc82zDzhTlsffvdAvy3YfXb2ntLhJTE4qxKXxzodA/OXwk?=
 =?us-ascii?Q?zy+v/PIYfNph0xR5rsqpEzvlRQCMOIOi9hqA41Z+lOF9/7hDe7qjueD4/51b?=
 =?us-ascii?Q?4cwpp2s1z1IKjll8AacGmsDbboVoi15JUMW7nayaTFi3E/E/0HUDq9tj/hT2?=
 =?us-ascii?Q?pvmEoWoMKHmB50BZ+OIlpq1P2kxnrAbbcYyX6bkI47IRiocb80XXfeG2CTk+?=
 =?us-ascii?Q?P3QPPLmCYywYTbx7WiE2Yo/c34WJEaiK7C8xC2XJbmgEfTXK3CZzdbU18woj?=
 =?us-ascii?Q?Ke2k2PdvaQj5A3zg6gBsr24A9BGjL7rM2Odt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U/qTDKhl87kYVkR3uYasPx1YCyzGFmjnNRphm1unLdW+HrBbKVrhh/mm2TpF?=
 =?us-ascii?Q?acSJrFwDBrQFcdKLJQQRBB52NYZwDgizB8Cvj/CnjXk5KwPY8XdeYifhVJon?=
 =?us-ascii?Q?v89QJ0AFXgrc3hMxkCNFrBxRTJjYJ8oUL9ttRZbBSMbfWuxsbXIyBxI3asqL?=
 =?us-ascii?Q?tUyjWyOfnOoQHga/0hcLDED2+Bt72lCmB6+Ep+SoO5UmKGZOOOYDTwiXaVxR?=
 =?us-ascii?Q?+yemuWHNZlI+5U+WTQPBRtsNdILyAbKcHIJ9DRpL7JTvZ+3bL6BZbNIX3OhP?=
 =?us-ascii?Q?8VXjrbVbgyWjUT78vXiNSwFxpT2LnSaCx7FZEt0BnJgToD6KsR82J+MdTd0y?=
 =?us-ascii?Q?olLUpYgVKKxXKqb4BYxwaNWC0xS7spgVZNPZvkd2eKrpj2ANSHrlDqKkQsYw?=
 =?us-ascii?Q?Za60ro9SHr08htykKw0XV7e0lBcWShqXhHZeXlxgwM3HbPJ0R5oX+55F/s0f?=
 =?us-ascii?Q?MYIGRRxCcAjW2I3eKYPXmrP1l1PB/EiIzUrKTy1RFhlIYzeJKPSy2uUW337S?=
 =?us-ascii?Q?jLgMj8oF7TflijlCEudKAq4x5MegQTJeVJwXx0o7wCsq+bmdcJB1XiQofKMz?=
 =?us-ascii?Q?zRi6l7K7+s15X2MF9fh9q/3fN/sQKqxbfeZ1endASsan7dgfeiBdabNNSFWb?=
 =?us-ascii?Q?axfC3av772sL/pNBOFk1tubnzzv8AC27tWFbRigwfxwGm83ME6TERU8omD7g?=
 =?us-ascii?Q?ny9H/FUxXlQFg/fwwnrF9a7KH7DjDXzoKqh7IGoJhKdHqH+YqPphrW4Xe1+D?=
 =?us-ascii?Q?/K/DT8lIjlMG4bHRaMMH8vU3alFAny7ek0bRaMo5wyAryEgghMtcSPkG2cK7?=
 =?us-ascii?Q?+ybARwQHxfLTE5HUDbTJ9BVHk2PjcS8zo6/JDiG13Iksz1BTozdircxsm9wH?=
 =?us-ascii?Q?fxGCKEZ1x8p9VjaZjgtIOe69hVusb65Z8GbktXqrrcFlhwgNxWz6A5gNEGbk?=
 =?us-ascii?Q?QInHtYyPRZBWCw3hFe1K82w4lGs+5QdE2ELdyZ2eDq7RkkIOiHPuGL5+qjne?=
 =?us-ascii?Q?udw/0TPkV5zkHIwnOnlzmCYEac89YQNaMia9T9qhFHePg8KAcHSVvPWV1xfv?=
 =?us-ascii?Q?/ppg2Fba6rJMU2/SaCx1h7ZTw7AUpHOCDVkGnnGNRx7QGd9+EctrFhWaHwPL?=
 =?us-ascii?Q?RBzvaC4zNDs6Wb7TEp3KgxUvjryh2sXiMtnflR4NUST/Xw6FkaSoeQJgynvm?=
 =?us-ascii?Q?PL8nL0zflujySpbpXPTdINC2oT1BwhpuIaiVe2dmKY1h+NDAF7vjKJHTBuq+?=
 =?us-ascii?Q?M5cEnae/A7fsjvcSjH9G/wxGCxNjn6F8G8rKxYnrgnjoBmprG3WcfDnyQaDj?=
 =?us-ascii?Q?ohQ0UJ4EK8BqOQxJdL+eyP4+SHAtBPHjNmqUzL4aXrYk/NX2VeiFxdaRiFaS?=
 =?us-ascii?Q?tZ70KUP25mihAe3RkWGjWiFpFhFsVRG4ksL2U5/aqKzzH+JeUj01SmGsAETR?=
 =?us-ascii?Q?zHnc7Hi9z6tUTWSVSx+u29xUKaWNjiz/tlHKyq2lQKGRfSqzYqfzKvsaDIYp?=
 =?us-ascii?Q?IKBeKd65Ye17faVg4McoKAuspNZ8NRuBB9yKYD6Jrv3HG7r4wLOut7l836e1?=
 =?us-ascii?Q?cEx09YTaq+Es5nWE7w5l174kfyKlo4BV3o/qYKuc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699af6b9-9488-44b3-e98c-08de07830e1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:27:39.4411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBCkDmI4bnhR2/hrpUyEPhHt5e3dG5keodyu/rvkvMEOKWgh1DXOrrtuZS/LGfNKk3KWrNPUyL9Fn//tXLebNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852

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
 drivers/remoteproc/imx_rproc.c  | 146 ++++++++++++++++++++++++++++++++
 include/linux/rpmsg/imx_rpmsg.h |  48 +++++++++++
 2 files changed, 194 insertions(+)
 create mode 100644 include/linux/rpmsg/imx_rpmsg.h

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index a6eef0080ca9..e21a7980c490 100644
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
@@ -1084,6 +1088,144 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
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
+static int imx_rpmsg_endpoint_cb(struct rpmsg_device *rpdev, void *data,
+				 int len, void *priv, u32 src)
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
+	auxdata = devm_kzalloc(dev, sizeof(*auxdata) * 2, GFP_KERNEL);
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
+static int imx_of_rpmsg_is_in_map(const char *name)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(channel_device_map); i++) {
+		if (strcmp(name, channel_device_map[i][0]) == 0)
+			return i;
+	}
+
+	return -1;
+}
+
+static int imx_of_rpmsg_register_rpdriver(struct device_node *channel,
+					  struct device *dev, int idx)
+{
+	struct imx_rpmsg_driver_data *driver_data;
+	struct imx_rpmsg_driver *rp_driver;
+	struct rpmsg_device_id *rpdev_id;
+
+	rpdev_id = devm_kzalloc(dev, sizeof(*rpdev_id) * 2, GFP_KERNEL);
+	if (!rpdev_id)
+		return -ENOMEM;
+
+	strscpy(rpdev_id[0].name, channel_device_map[idx][0], RPMSG_NAME_SIZE);
+
+	rp_driver = devm_kzalloc(dev, sizeof(*rp_driver), GFP_KERNEL);
+	if (!rp_driver)
+		return -ENOMEM;
+
+	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	driver_data->rproc_name = dev->of_node->name;
+	driver_data->channel_node = channel;
+	driver_data->map_idx = idx;
+
+	rp_driver->rpdrv.drv.name = channel_device_map[idx][0];
+	rp_driver->rpdrv.id_table = rpdev_id;
+	rp_driver->rpdrv.probe = imx_rpmsg_endpoint_probe;
+	rp_driver->rpdrv.remove = imx_rpmsg_endpoint_remove;
+	rp_driver->rpdrv.callback = imx_rpmsg_endpoint_cb;
+	rp_driver->driver_data = driver_data;
+
+	register_rpmsg_driver(&rp_driver->rpdrv);
+
+	return 0;
+}
+
+static int imx_of_rpmsg_node_init(struct platform_device *pdev)
+{
+	struct device_node *np __free(device_node);
+	struct device *dev = &pdev->dev;
+	int idx, ret;
+
+	np = of_get_child_by_name(dev->of_node, "rpmsg");
+	if (!np)
+		return 0;
+
+	for_each_child_of_node_scoped(np, child) {
+		idx = imx_of_rpmsg_is_in_map(child->name);
+		if (idx < 0)
+			ret = of_platform_default_populate(child, NULL, dev);
+		else
+			ret = imx_of_rpmsg_register_rpdriver(child, dev, idx);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1177,6 +1319,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
+	ret = imx_of_rpmsg_node_init(pdev);
+	if (ret < 0)
+		dev_info(dev, "populating 'rpmsg' node failed\n");
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

