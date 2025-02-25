Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A7267AF1;
	Tue, 25 Feb 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478776; cv=fail; b=bRnSc1GnBUons7UKOrwdohr18oo1ALfS+cv2wnPE51lY+0IiDowmA9A6s+sZGLPlBL0i1eb5RDp3gs/PHNNAlc2cRmkH0PopDj1IfSNRXtc47y9IVvIKXPoFc5jC1OX2EmPzCyo1So4RVJxiH6KDrLzh3lF4HzLDL2SnOI1nLpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478776; c=relaxed/simple;
	bh=Tz51Mc9oXGv5Limh93c6WqH71QGEwHg0l3lFP3hkV1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RaiT7UB2rYOtJyv15WIR4CttJiSlBJwSeYYFaQss09xpz++sitHdd4P8iqA0/mjFOGkNurbAvpjom151/VkIunoMeUneUmwD9w/0C4XtKYq48OYhHDMxYj3ClgE4X372rx1n3ctLGNV9QABs6mVXdqCAshX4aGga5k+0xMJBnBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HNUP3GGB; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HNUP3GGB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaxAC+IijgeLhUKY6VDnmbQvWtgCJJtAfA4REvtVXwdclMMBSo9ywl5rltmeM625iy0aNTasHbDBlwBTFhU68ASf3HYFQ1GzU4M0Rv/EGqcgdokcA2c4LYKE+5B2EYtPZikv65MDsEdbEYvSrdxuPEof7IZv48wVZ149VS9SOCx33ud+y8NvMtJwXP0YaCb58ei5Ek8d39AoBib9biS3VHb7lHBUzlz0X4WuKz2+CqOlo1Eqtz+f/LizW91UWN7XyTsJXxw2xY7r1TV6RNu7cUHoqg/W72eu38+hdexqEY7Rihak/wIXtSC7TdU6U5qjaUyWGg9n4j+9HPfIYkLtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E7rMZWWWzZiX0DBwXDpOig+HfHr51C7Z+KwWyy3E8T4=;
 b=BWqaIJ4nTGKXkIBvy/U6PEJCmqTG2dAlbItgKjnJaHk4u3b3g6tBPuHi8E5+NZcIMMJP09r1YCCHfB47aB3RjfOuS2LejmNHVyZBRYYlzVLx9LOpac8REMBId3MsE5dRcgXdycyqeuHp1gmTllJmshzak7bsua+N0xwpZjZec3VWXC6125gpwlQT3sjK4ra/Ppn5zBLIhfuQgUhi89ig77U8I2pOGxP39/AJYRpxygtjtur9ye2A5CwBzN8DYW3ooZz7L4GmJIQqJW0yt1RQlInHbxYbqr1Rldy62bQZe7Rp3B/oQISL0NB2RJHQ4Tyev7sxNXO/jqk/xvkqZb6tMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7rMZWWWzZiX0DBwXDpOig+HfHr51C7Z+KwWyy3E8T4=;
 b=HNUP3GGBwEJokp2d/IwmglpJpXFReMDeSUTvnPWLRrUVQdAkUMwwF98rLCK74IRqyjnCiDDf2c1pGbyXJ2K9xvBil/xE/zkQTgVMlcxfdAXe/bwMc0ESjcFZ89YpUESsTWmzrAv+MVqFJwp4CM5wJSySkiHctBu9PpXqgB3VTnpV/KQQ/1SRNrmg0xd1eK1iOMufeUUQNgUUqD8EppYrxnq3XoGRO5qw5ojNuVr5Zu4vzfNoL0G6cw94WNkKoJ/qUgOz/Q6chP3g3GjqdIBxHtfZOgPmQ7ID5mZnlu4BSzN1wwDCz9vGbmCirZCZRyES25Dz0H+pyCuZ5kN/KmFzjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:19:31 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:31 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 5/8] reset: imx8mp-audiomix: Prepare the code for more reset bits
Date: Tue, 25 Feb 2025 12:20:02 +0200
Message-ID: <20250225102005.408773-6-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: ec54d316-c9f4-4422-2fed-08dd5585e4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3OayBs0OC1O7fZd8WZauQaeOjPHxyMU99Si+Ro2Vdxtq9uCrtO8DOvTufpkR?=
 =?us-ascii?Q?MBgXcZR9udaH1lRqmgIgzoMFuoovz+8/LXhhc09SCaEH389Rw8Yf+sM5Q9EI?=
 =?us-ascii?Q?zHC4uk0mkS+83N6CYpAZZQbFCQELZiPWQ6F/4fHKmx1h8WAwte7rnsIT0kkM?=
 =?us-ascii?Q?jMQC2nD0vdKnSQSWOjbtNiu5u/oLq5iYFECdG6FT0OAX/7b5Bu6z8tXE/AnU?=
 =?us-ascii?Q?elcdk5JnJeQQUOtAv8BTKQRcIYvrutARL0fVfQwCiMTX8vqVfCZNt1d1knFl?=
 =?us-ascii?Q?h+3eG/bobSuhpdcLe6DYiHUhCTleW66eaaQh8FNR7G40+wsDp+pfTuDNWQ50?=
 =?us-ascii?Q?0nQTHP021aa9JMnkFYrf2VMXzuiw4bSeWJCRQ9dUIpyoypGsgrnJiiIB5cjT?=
 =?us-ascii?Q?7Waud6MQ0BohFQ5xo/Wf5yRe8aa7Jn6F2QYOj7NhCFVoYMvBmxtyPWRn7/MO?=
 =?us-ascii?Q?YTiQlutJEdDWCa+x5eim+EVX23GrXxMYIVbuYPSRq/q8X99fW0YtYx7LTJvg?=
 =?us-ascii?Q?cjtCX6WQ1FmRrmsXx0DH7wYowPuembGJxj03aQFdoxdBm3hVQ74VC/lie/8j?=
 =?us-ascii?Q?0QwVZE2TiwNFQikhUEEw9Kn8wBXUp5XZG3GKFTxQ7LL+iMAFm4bTamho50SF?=
 =?us-ascii?Q?mT3RyeqQZ9QKLUYpFEKzG7p9eS8lgvA4+C/wXmzPSRAkm7bepHK3sulfIoTp?=
 =?us-ascii?Q?0wkfUlnm1ZFr5finZK138xahlNaSeZJmlRc0sKPqcXvZhI8bFQZBXB4qSkVX?=
 =?us-ascii?Q?SIvkmTQc+smpfEn3eSJo+FIIwb97sGmt/PgJUBuMeGi6WdJKMkizLy/CoWEb?=
 =?us-ascii?Q?TtVCJYi6ynatFlIU19gcz1vdLwJlm2k1QeGPsp7/4aQCuDLlvS2pDvUX4W9m?=
 =?us-ascii?Q?zhcvx03Z7QbglYGDGyiOh1YVJzKHvv2HeJZBphzg06IsV2gpHFgxqidgG036?=
 =?us-ascii?Q?FGZUdLXUZuJYQiNdWTzOkc7btTF6d275NPlcZfAOfEAjxQ2eU7pQ1vxxD5bw?=
 =?us-ascii?Q?oh4ja3RDaUnLw04cuie3p/8SWfqpJbY0OCiz2wNTQKIIwZYcTWOtPADQGQX7?=
 =?us-ascii?Q?+02NgUcTY5mq4tltky4wyAR/Sb4IWKTWIkxY3Layd+vuCVFl6qOmglR1iVq3?=
 =?us-ascii?Q?aUqJbr4Vf6p/qesd7hRKejAokoYfcU1UtJvmb3NOvy7NbyA5W+niUCyvzJhT?=
 =?us-ascii?Q?bNgur750ggqI/xOQX120eVpfqi8/U33MYZ6NAjhAXpuMZoFMwOzl2RmHMpDU?=
 =?us-ascii?Q?i/ClU+S5r84xGBrsWBxx+ZHhzAjSbYa2N2dZSTAqMQcJQ4xDhvE34no+lbk9?=
 =?us-ascii?Q?fsNDLoXNBuTZ+GyH8kkaMUxT7t+L0DIYe5tkJ1CBQEGRRkpqkuO12x+DdQ04?=
 =?us-ascii?Q?IZ9JiAZDpHlFphmmcevQqxgc0zm3XVm7exZzd7Hv9UT9Dnb4yIZFrf5OpQLl?=
 =?us-ascii?Q?SxO2rzD2bL/rZPd3XSRL5JNxt/OFpg5C?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GAp2yCsE+uxewE8BeEOyUbjRUbr9BWKR844BKvwuA6GPRfH12B4d7RiouUcT?=
 =?us-ascii?Q?kM8yPtN10m1eJ8RlpqXAmM3ijaTwLlOazab/Owo6jBtr8YrS+O8bjLP0BgWG?=
 =?us-ascii?Q?joBx/k0F/SnWgU3DW2V3jlLeaJu/Jsn6TPdBJtQuk465K2h3cxxbDk+M1XSw?=
 =?us-ascii?Q?vNYUva5sxLKmRnEex/kh05y7q6M8B43i5dtWlozEaIEKxISRKVFy4+SXbide?=
 =?us-ascii?Q?yBI0VUrTwP5EQ/CPj6eJ9dLunQHN1ZesfV+P+zwWNiOuy+HIMeOpBRiZF0yw?=
 =?us-ascii?Q?SQwG326AnQOtaAjLibR2mKlVRMzHwRMKA/WFDfB7ngImbIIojg/Yzdf1oxkX?=
 =?us-ascii?Q?En/vy6PTbazRCO4uasIyL/m34WPf3IZ8uz8XYVwpXZc3VfRUZyWHClkm+Quc?=
 =?us-ascii?Q?CqtsmLuX4J8CVy5iwh+JbCbUxQP+XW9Q8X5cY2IZ2ihpjsQ5F+98RQZimMtM?=
 =?us-ascii?Q?3ktVDzArVjZAAyne4WKM/EgfA4kZAJIkidZ4UYw0VGuyrbeJSUaOdvZkpUST?=
 =?us-ascii?Q?0XpdNBzifsUZvzyL3SQeRawqEIeTUdk1bD8JS+HrrqCv1pFy1MABLNs0iPbR?=
 =?us-ascii?Q?M+tF4u4LTl9qxqqzqN4iHZyRcBoF0eMvUiAWs8MkVVY0SEPVaR4FaQY21B/e?=
 =?us-ascii?Q?j3QSEQPLv1jM01G7vYImU6HL9D5zOmgNxosL52EG/ez/fpT3Iu3IF/oJSNTH?=
 =?us-ascii?Q?9g9/jVOO2fth9Wv/suIZBCkWv7znbeZesMZBpfjRrz+fwp9HYbJ5YNBGTL3T?=
 =?us-ascii?Q?4SOJShBN5AxBbZ2YxEqv2Y2vUklceAfzbcqTcngedl9r7n+saM8hoq8cdW9F?=
 =?us-ascii?Q?sk/RZioZk/p55AbHaxcUYEPU55Br2zjeEdPGOs3qaylwDotTi8DThP6BEzwG?=
 =?us-ascii?Q?VeGCU/K3tFf6fatXS3uyYVnold63sdxVnhKSy84lflgbkBT/50AolBKu21CX?=
 =?us-ascii?Q?ypVpAWCcjGZNSPmEW3V4LuVg1g4w3ScEzOCL2v1+3aMD+HFRq0Hrx4LK3ygu?=
 =?us-ascii?Q?9/+B29zdBeXjOOVTbYNvimaYoqgFw4cqRx6AJa/x4yTigdZC26FaAqfk+d7u?=
 =?us-ascii?Q?CEZnqSSWIONSgGZTbuXGEfWh/V813dPnHKGSOWj/8TVdq2oPt3XTlIKLK8Qf?=
 =?us-ascii?Q?d4cIskwgmGj4tPIi7KBrUfoMptF9OOMfslFCPftzlKQjIzFxsfXJ0ITIrNxT?=
 =?us-ascii?Q?kGphFRjQdilh7ncTgbuDAQxICwyxhAV5m9XKr0bGKAr5HElwjRjXX2tuxx2E?=
 =?us-ascii?Q?IrWQ93cpBQwdi+e9weJHNq+Q1nxqEpcMBWZKhZkyQDz8WcOLiF9x2K628RPd?=
 =?us-ascii?Q?TOFeoFxwVrKuziKBl4ulu8fv7SfCnBloGXW83RAlKYcVK8Vziq4+qyq7Gt2r?=
 =?us-ascii?Q?URfohgW5tYpgb1NLI09WDFnRjYNI2I9Leew+SlPff7SnP0TgXCCf0duQ8RQb?=
 =?us-ascii?Q?WF///RKey5UmkGmMA5gGWRxYSzRfUezWAmS3zIdP2nUBXzYlFfmwbgF9y+Kh?=
 =?us-ascii?Q?8KaHMxAFEOQq5Ix+mQtvslCYwK6DUdcJCvJxqr5miWdZ3IZcAfS4k83WE2tq?=
 =?us-ascii?Q?1eJEBfmJgVkCwGqz2X53rTnbbkRzsFiGbNUDogfg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec54d316-c9f4-4422-2fed-08dd5585e4b1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:31.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XPk3anunRYE0qaxegD5eJKQttChGX1FoBx76hKCbFK+Z21u4nF/BGooGrE1P3jjxsOoUVaCbhwpHgExiydxSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

Current code supports EARC PHY Software Reset and EARC Software Reset
but it is not easily extensible to more reset bits.

So, refactor the code in order to easily allow more reset bits in the
future.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 43 ++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 1fe21980a66c..d632bd380053 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,8 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/imx8mp-reset-audiomix.h>
+
 #include <linux/auxiliary_bus.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -12,7 +14,24 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+
+struct imx8mp_reset_map {
+	unsigned int offset;
+	unsigned int mask;
+};
+
+static const struct imx8mp_reset_map reset_map[] = {
+	[IMX8MP_AUDIOMIX_EARC] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+	},
+	[IMX8MP_AUDIOMIX_EARC_PHY] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+	},
+};
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -30,13 +49,15 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
-	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg & ~mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -47,13 +68,15 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
-	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg | mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -78,7 +101,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
+	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
-- 
2.43.0

