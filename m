Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610022F39C1;
	Tue,  4 Nov 2025 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762288481; cv=fail; b=PQspY6jOC63FZL4XCJBnT8Sf1I2if3/Q/qDsu5fZliUnGEU6ZDz+omLSSkbdILgLgiRFwcKIV9sDMY74lFGgr9tmJS/HMbX6pOjOzaLcFCGtqewZAvLialS4RJLKL7QFDJ7OtUXnspSvbeoFoRGHcb2u1zM40mnPElV1xOzzUpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762288481; c=relaxed/simple;
	bh=52IRiiDXXnRu2J5ufbHI6RZO3m22OQUuMfsTQygFuuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MS0KmCEvqMI3x3dbIxGCzwbz7a8EcLwh2Vroz5GXOM6YOUbHnRilP8MkwYIi8oKikfAwUiGExQ3tZohYGgToVSDC87W16pEv68uvelMm2klaZpiLVU1zgAuCHZKaIjdYKYooNfmZyk2bc2jv1Ey3VgeWwX0cWcCrYflJK9OCczY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ClnpBfjU; arc=fail smtp.client-ip=40.107.159.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ClnpBfjU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2Q+unNsmRCn7JT1iUmMYjhPDBxJJYjfPw7SlMCj8yOVyDmdKc9JrrXy5roXI+IDzFAPHOf1xqC0xAKsTBKGFXMWDjlj7H7YYqlXiptmg6/F9AShWqzWIh9iPJ0AfPlvowdUiuQk+fqB7nclxTSyyS99mD3EowdmaS+MoOk8fW55+8uUm3XCja7BX6y+I3NugiOYvTf0PFSI/G1KSkr9wuqHqjUgaXCSkoSVXPiCBybM1gOdk6tgKz4Da/tj4VbH8PwXT0rYxJ/8KfVFxD6v4/XQRWZ0rAMRrLXlagdLcAn//UfqdltVItOSNNF+wgFXHt+5P7pbhN3o369/cZHX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=GGOfFta/0AJ+VPaQ3UYywejf90X2yBnvJeuLq35QqmcyYsyga+5X7+4ojfvR2fSU43LSYWlL8q6PWwrN3lV6PJBSOAsLDh9T9QwHouniv5r3iXWv90z6VJdZmD/gZwciLTA8MJcoSrJyGNxMaGaArmMtlnAPpkraq+DDh7Pulb36KbdxE/nKrYV4789u8W6QWEHlo0tZH0LxxRZOSg5laAehCxRygJXN2HVt5ZgDb9qTmm8iG0R+oq0gBPKulnIHzr4K2sehvRmJeS0jpoCtTOluOkdCG4cD5ryO75mOyDeo8A50f6C1gJBmfaRjZjZszpYi7s1eIKChB5FprBFT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0p18WesvVVXd88qUeVYZmRMwAzAiEQXCGYe9xiNfVE=;
 b=ClnpBfjUUZHg1+RSSZSHOvfksKzAnQLICRZkrAx+QW2v4j+CjvsgJ46Rh02OwFZa0Uv1kYqgLm1Z+ywtRAc1ngsc9dcFMoYBnAHzKQ9mf9M8y/4dnucCMLjJYiGL+RX++aGO1nd4TsyRLw1PdzUyYnDN8WLHo1NJ0zm6mpqaJ6usX+yMWORt2IfXM5c/IzLBFi35zcRXhsJsHHPNvh5MygnEzbkqizqDDYcRDChyyxY3Y3ikhaWQvDCkHlR9VYNwBtuAQLCx3n1P9eZUCn9ki/wDYTHqwdD6ja6ymgn1JpGVqusgriV7+vysgmtcV8Lv0JGNDUdI0IiFsLeSeC/m4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 20:34:33 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 20:34:33 +0000
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
	linux-imx@nxp.com
Subject: [PATCH v5 2/5] remoteproc: imx_rproc: Populate devices under "rpmsg" subnode
Date: Tue,  4 Nov 2025 14:33:12 -0600
Message-ID: <20251104203315.85706-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104203315.85706-1-shenwei.wang@nxp.com>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0034.namprd08.prod.outlook.com
 (2603:10b6:a03:100::47) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dadce1b-92c2-4a68-1d4f-08de1be19056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|19092799006|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D+NBTtrnR4oATRxI1sSVOAi3Dpq3tPTGXt+XJcaN7KxYlxJnOksbGbqPbvvf?=
 =?us-ascii?Q?rAEB7DmnFXDCYi1nFtlCyOo53WdhGuWgGViTdaS6q0vq0D4xWGj7ct1bBnGe?=
 =?us-ascii?Q?Y7qZjWcoBrz0EFfqcNjV+pNJ94VWELHLe0kO0Vaklfe1R/SLZCLZsll5n3s+?=
 =?us-ascii?Q?jpl+9lzDFU0UEFeS48tJIZAVF4N7kuGpmC9wy4MjM+L8z+R4AcKF3tv6jMem?=
 =?us-ascii?Q?2n234YLPCseSWzheYnwZM76NF60M8BlY/bBKXOJ4vU3zQZL75UBJ5YaJHDdL?=
 =?us-ascii?Q?2JYNuNb4nt2jV/wQErfHAttoMtROIzl04plLMpl8rJ33h6TCt3VqkE5Os/Ke?=
 =?us-ascii?Q?9QcRyOz6brOGbG8A8E6UfiJ7iE6t1z6kTghVQ609BHxA9Fiuv/ZcYGVD5/80?=
 =?us-ascii?Q?3zjAQe9RxTPlgTHI/9jyes5ZoZjBNESmBQwcW1THzTji8jG63GDdfywhetT2?=
 =?us-ascii?Q?ue9Luj2yRcfQxhwTshwM8AoDo1+p+AyEl7AkRHFzJH4Q8UIAhKvE0CsiZl6Q?=
 =?us-ascii?Q?ErsudAK+e/X0vr7cpvEDpheXdXHGoVdUiMtyNlKJdERks2UbWJ1aVI0iFJ+r?=
 =?us-ascii?Q?75SRZrscHP8qXSB+OdhF5PAcdFOlce6qhBelBRf03zmCBL5auLo5aq9U21EO?=
 =?us-ascii?Q?J8NohqeKrmlE687z8DakJNdjPD1qikTMGE3G5hJMzPAehazN88omk3Rh/0Yi?=
 =?us-ascii?Q?oGJQUZHcAWP4hSzpsjIE69xM4oQVLzi6s9yTtDQbr6OQICcB2TtHX9gPV561?=
 =?us-ascii?Q?tphZ12OuKGQXL58RRviw3oe5MXHfREp9QBiT0U+o/tuJru+yhHDsrK6+RsQm?=
 =?us-ascii?Q?+BXYR0f21ESOw9+TyLHazwzkdHYEsj6ynN3ScNuvKf40h1Q+Ej+RVn8sFKu7?=
 =?us-ascii?Q?osCVmwxNcwX2eqN7QYsFUohpqA3OxwQ2oJpEnff4mn9nhuYHkJHPww3pHk2g?=
 =?us-ascii?Q?hiidBPLQPJqcYjdQeMxpQz/8sEsz8eRxDtFYkERkSesNv0jKt7eZvmjD8aAT?=
 =?us-ascii?Q?Sgat20ssM4KfFstNSfuPEU6PZ0uSOSVTDVWMYIZN/Hsomzk/3K6h2QckJ7RO?=
 =?us-ascii?Q?tD2wDRAzL3Zv7JTip2gqKk0AcdtI4nQ1TwVwH8Y4g8BSqJjdAG1PyQObkhM7?=
 =?us-ascii?Q?Ry3iYIDKJ6cNZrZeuZ2xnyHWsCv24HlSG1V1hF0e+T4UYZS0ZpmmysErcY6J?=
 =?us-ascii?Q?hAoEMOjyFRDonHrhO5SCgwqA3ZiC0gtfIY7evzh9WiCPZBqlAXd2K5d61PFI?=
 =?us-ascii?Q?kfjr+ZCNuL+6zAq5JmN5uIM9HkAAmwv7boJWDpOMQWfRm/vHxZjGR7SHgGmr?=
 =?us-ascii?Q?rllHDDfrs3ZDiZeUk6wRbmOMQdK+DS3juTzlC4pB/6+JusYXJ3bbdqDhmtwp?=
 =?us-ascii?Q?1HOswZlPppLsa5jG72vA2yfV18nRpfxDiNI16RBV2bBIbkDY4LFr14dkOpAC?=
 =?us-ascii?Q?S+y6oPAtWRaU+7c3S2RyCnRZq7Xhm+gKv0Znxc0A9Uf2T393YSdMeTEI46JC?=
 =?us-ascii?Q?ew53Q3VbS3tig4oVbMfrKghDJWKKDqfp8N4lM22MpTxx8h/gT7X31SSyog?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4UjOJzm5m8CoXeeZkt7+YugOxMsLI01raKeXi7xp76y93Yi5z8W8wsjXjUnJ?=
 =?us-ascii?Q?N6kpvIdMyfzcPm2y/gmBhfnQW74/z1rEPXhSdyspUeS4L6s4fJ4Cpr2ClHMI?=
 =?us-ascii?Q?1ln+svXkhTnH3WH9qKu/T4kojJ16e/tUiBmHXyz6KFce77C0zNWw/9QU/zLN?=
 =?us-ascii?Q?qYMWcWJScfx6z5GfeAXTxE/eAGnTJzm1zsPbMsl0Z5jF00kD7gq82Pg5uWel?=
 =?us-ascii?Q?E9z/ijLHN0wNc8eaeIIM2qXrl44sNOrtpCsEDOjoDRn7YxwuZRUkrMUAL8G7?=
 =?us-ascii?Q?UV01mvyo0k6Fza2KidJSMNS++EzI3R7MuwL6QpUoqHj/bbb/GYXGw/dpzdaR?=
 =?us-ascii?Q?jAQ6KijaIO9Pl+jkSIKiMS9vSo7TN6R95RJSv5TQ3vodqUuEzK7bqJzYTxa5?=
 =?us-ascii?Q?DMozVyiTT6vfWT9XTFVhQsI6KGS9xAvj8EwM9C3ekCAPloT6zO1G2kjQdW9r?=
 =?us-ascii?Q?4SeZ5zDNxjdRWo3EeDRQ4Q48AHFzHNI0m9VmLxoRppOzpHLLrlMLwejMqaGG?=
 =?us-ascii?Q?1yV9SLL2ciqILZ9gsXG21qlG43hzetus619sNmpR3TpztyAt6DNQPPShkaZU?=
 =?us-ascii?Q?UhrbMHLEVuuIUSwlVA0xBKXw6/NMnYbXnhawCW0lbJnFuJuKjq1nWqtMPWys?=
 =?us-ascii?Q?wCyoOGaYY46gJOeUJpEa1sDy9nfdb2xTYmkdWAhzw/5E7LGoB1JdHHprZOg7?=
 =?us-ascii?Q?Lx51R4rLMpdFJ02JZeOPXyTVnqSJXgjpnToJUpGoTlT0KZzd22546XXiy+lU?=
 =?us-ascii?Q?3N315IgYVGcXwNy9FqlAZv8IUvbETbrXfCeE3ZJAmlm4ltXgd1taOe/QFnYd?=
 =?us-ascii?Q?1MuF/XOKulY5z+qbMRBORXf6bs+ag7QxG4bTCPss1w0P91b3OR/zRX5KuZto?=
 =?us-ascii?Q?GbKzvru4g9o/60acLkpvZFbRwvxXwZjRllKIBFRcNvTYmnH7e/mxGhL/wgZD?=
 =?us-ascii?Q?B/BN0Bg4ilOj8C2hwW4hM7DDDZDs5WfZfa/HZX2P/8ZRmC9eMwbkS6ila2p1?=
 =?us-ascii?Q?FgIgj1djxUSXKtpzQicQIy5lmQ3RCvIG94a0G7MFaXpZhDLR3+lITxkb5G3a?=
 =?us-ascii?Q?xvKtCZGcj/rEq2CKGiNOtYxoJs5p5+KqOGTnkucrnwJGdpUoz/FG27qFaPDA?=
 =?us-ascii?Q?iokUwYmoHuDvde8mUTPxnypIpapmxw4TZ4hGhnp3Q0kEaMQGh8tqbvFTOgbW?=
 =?us-ascii?Q?fcrfSCQgooGt7jNANQnFcnZVXZ0Im5OhEnX4QqVux9lDoa7yApydocbFt/Dg?=
 =?us-ascii?Q?DZwkl6grCAN7flcROF82ACmffsklWBfvO56Agd+kSVmne2waaovsfOKNDVp8?=
 =?us-ascii?Q?sTK3lcSzpnIvWbCrDRTgF2xREA1/3N553/FEOnxIaV7gWMT7uwg0FuGX0JDN?=
 =?us-ascii?Q?jHOU/sPXSptJ8aFgtMLcaDUwIYQ8K+XkXMn0F3IExA1hzweSTH2ObpB5ehn6?=
 =?us-ascii?Q?3I5vGkDa6stkmf+pX95p9oihuJP1mscC6QK2Tej7BrBN2xRoEhR2zk9sPQeW?=
 =?us-ascii?Q?RLEro9A/bREw0YkB7bJZX0fC+Sl3W8aw6LOk1y0KMRpNAfWxAHjtv9xYJqTj?=
 =?us-ascii?Q?a4C1ISLAN1C+sAaDsyL6VQXj6pcJe2OQS+y93Nw3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dadce1b-92c2-4a68-1d4f-08de1be19056
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 20:34:33.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlhyMOTGPtKZDWDqpwWuzW+7GfDRMSchzZbu4LSXyalD7r5qwToBGwIaxx9COTDLVS3VxKMIFgRIccBnH7Wryw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

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

