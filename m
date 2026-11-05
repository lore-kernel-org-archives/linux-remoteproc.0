Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846300;
	b=4kJeV569YEl8IpCOe605vd6Tk1eZkBjJEy3dqKYcawXX8As8QyhGpCS7U3K5rEeyZMIY
	 sQhUo7riMe/RPbjwtCBrfZs9musatJqZphbIg7SSgbD0Dbaim7Xoa2lZi8fOsEvihitIL
	 rPGWBrSE64nxPZQyBPT8mGd21Qsbd/fReaq7Mc4zAetA0Oy3qtkbdKzdBUCkknbPA5TxT
	 KkGvXJpMdxWwI/p4GBYOViVKjQU/HcLZS/TVBTn/jHXpcnQeUYJONuD9mXhuWwjeeimyM
	 +jh4XPCZFzBAei9S53b1hbch/FLcSSea56NvVVyJcqYdXmUrUEz7k68zeJPJaa8A7/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846300;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=adAGv+c24JjtxqccgqfB41SqauLAo+aL0+sq/CnB7qA=;
	b=3023L+0I1ComAYGkVKa04dfXRbg9sIqTK2+bQO9ZB+cEFV+ZDqQPWZ3l9STFRF6Gt0rK
	 YWWrBCt2Fzhd1lsdEiIlk1LCv8WIIkACCAHMIeyIZlmriXif92nPQzeoj8zdtJOAsB5+V
	 pUMp3UbmHkolloyZijP5BCRd+a9znjhrtA/qCchqSEx3y/n/8UNUgPESlvFnSNqyvHC9D
	 tS0TMNdxp9cXiRrwxEm88srqUnH1xzafer8HWMkzA6CJN/Xt9pgWSWgmb2ACIGZ+ZUs6t
	 AoDfIKz2+77s37JxGvfLAAjV51YxOSMKm5EAhjAx9hq8Bi1LkLqST3jIk785expbawQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F6DOb06z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.56
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA644606A32D;
	Thu,  5 Nov 2026 02:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA644606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=F6DOb06z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNGf54XzTcaDilEFC+tvWzNnAIQeF/DBj6TG+w9/B2BEipfbGVZcqQpqumZKWB4riIbuYlflFYc3hBZpIxXlwOf4tEs7DMf+tKdt6NkG21iKmdZ7L+zYw3OfqIneWGTYm9bDPW/VU4m42DEC2mgPZpbOkalNufgtXUitDlBYPV/wrXqI+QzHIu+MPz0AQkvZeKPEpKPj+OEr4PiNTh77Utamtgnmf7+eGOBR+2J4mhbOU7Vw8JDoXsO1GvG+V/UMRp+0sbk2o+EBn84+6QBplA5ma8vAxUGyGTv1yX2222lEzQhHEW6C9zvbWxBMUW3rxhTgvEK9FcUcMHypWCeySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adAGv+c24JjtxqccgqfB41SqauLAo+aL0+sq/CnB7qA=;
 b=t8SJk7fQrO9Ldf3157mfn/q4vvXWfv/DVCF7kv2frJmMfkdeJnsgaugOrf9UFr5E+PWpvWmAxkgTVMMBzrENNDS+z2MBqpHNS/enCN4g/dEeHWk7hu3iR0jd7JWS2sZ/bgb7Ky8HjEP+o0dSHMJF7usXKbvdxq9xEkD1KcZIbHUawOoUFUoz+uOVv/v7J9bwYuP/TsdTHSOVY1CJNh2vwZtwH6i7KDyRwoa/RyP9o32bLhYLdGfZTou9XLW/GwqcxsK3KIPwRVapzHIz2XUUiQykK0f8v+gR3fAXE1DkzoVFad1u/RIs/cJS9qeTNFXAWJx7YxAFNcB84RW2BxgKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adAGv+c24JjtxqccgqfB41SqauLAo+aL0+sq/CnB7qA=;
 b=F6DOb06zIISOQaQ+DLtvF/VQ+upXMByxgJe2e9E1ZXCatO3jmgNf6ffKyJ8E97FIHJmcashu3gZaliMKNGdeoeION3J5DoXv1zSfCfWSwiBfYDsvCHw1yDaMy39S34mbiY5XKm/A4IRX6UVWxeLqfuCv345hyCtf+fYIVmNjA6uYeIn7eh+g3YzX1VYKjOIOGzEsQwkIOxCPbJ3TNo3+uMFfVdsw1U85ycDTYCTkmCGviqn7HKs9VepkzPNbWQpkjorCvvP4LKiNpFHgIvYPSgogFn+aPxigMAzVIQJybPtuVV+6LnIxVqDumrfzPZ9oQv5PzyzJ32IxO6L5yFaD5A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:38:16 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 02:38:16 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: dts: imx8ulp: add HiFi4 DSP node
Date: Thu,  5 Nov 2026 10:41:05 +0800
Message-Id: <20261105024106.338791-4-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0198.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB12060:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce62372-462c-4589-cad6-08df3ae5d89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261102123227099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	a7T00ihYS1oqv/0AwbABkVChRyxpMtb3HIE8ba7j5hJJc2y+Z/mTKW3BvcFdE8g9fACkdvPLvQJJHHDyNipNqQmoyxog+QIbuT97Mpuy+BhlJ1YUXlMOcwJn1qT4qFau1rg+CfOMvqaW3OxopXMCbV7S+TfoHIJQHfdIyf3DtYHZIgx8ABffCZ5loK+K3ALQtc9rNP+aNVLpWGXSSyJauFuhhJOJbaLnw0lj5jreJi73vwVBQtNxye8dnIck4N5HJAo3r7Ac9g+nCNuQUSSS98G11wIBCu1TqCZ9u4e8NxqhrrJEUI36jjmjlxyevo3ZuQoOQE9JERLHLX0igVH1oWNrpDi+j6zzkwaSRo9oVw1jJwendGo+K5wFZ2zLbOzKQpkOU+gVB4aWUq0PYhqvew568WAaJc81nAx8yVSCbPGrWHWZzQwti1VXrM3IGrMHfFfJYZGX1dzpLQKvhPgAD3KVK0NQ/MCkIBToKpe0/Eg0ggFRk1rQE9KKvCvWnF40Vgga2gQYigm+/TdcPFackRMK1RYoFtqf0JNH90KO9vWm999quKtKUaT9b3RLdY7xhnv37u9rKjvPhVVZgS7qids6UEeZ1iefq6Aim5rET1BRFRDDO0UHw1MoP0UbozggNGjQIVKSocxXtd9zLncAbbwQnV0FG7zZ8usHD9yBydXorT6mSiFjlGjn+BEq2GXfagPu/oN86YVXDqIAUTMUlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YeE0dDsPAhrked82QWt6P5tT30aLBfV1ohcn2O6vO8bviDwJnoF9KSlbiHbP?=
 =?us-ascii?Q?LqcybiOH12ZH8Oz2sRPp+aJ+Q+zSPQFzO/zXTwArrbqz0EZewaoiGoUhYW5N?=
 =?us-ascii?Q?rzqNDUYBVvAl+zqrEpJ8rPP+CqnzEHj92+ynnlv3OUNJ1eLkt60wkLw4b3C3?=
 =?us-ascii?Q?bLZCZBnJ7Ap5mMH1Imd965LUlvzIcpCxsHNjFg6ybb+KABRuxm0OjUvbrff6?=
 =?us-ascii?Q?p/ilyfkzZZGUNS9f2+SeGFofZpwfw09QGpNnu6EOag7FTxVHckT/anA57PnM?=
 =?us-ascii?Q?JKuOZi23QTcJ7cJELoPwEfL4cclVpRveeVVTYfijSkuE8rm42CUChNnaiNbC?=
 =?us-ascii?Q?EKc4mi5zW+j8UhLXlBC8QMHPEu+rtgg80YCjPGO+sNnvSZdwov5WFhm7uQH/?=
 =?us-ascii?Q?L0auURPWBmLx6ZmbOdcxfcWWPfkAfsUmQzJyGmdkoin6GqEIObu15c0o70uL?=
 =?us-ascii?Q?YZ1S54rXfvHfQVu/E7kc+dYnz3m95QB64RS+YEAglqUfX1B80GHLjFMfbDjP?=
 =?us-ascii?Q?poVcr0rRTT3Q2wi/64GLz9vYtC8t9PbkSX0RMpuCgbZrA8ZWJstnCmzVTlIT?=
 =?us-ascii?Q?dp3mh5LnnTxKgweLpXyF9Bj7vR2cgv56rdKmCMn2zc6shehp1mJ7HFg7kna4?=
 =?us-ascii?Q?Da390O5G+MUw0r1TecPdlWqRYTLw49G/oJ5Ug06uKu6NbWiHgDCLCqyEw31l?=
 =?us-ascii?Q?052byCWw1nOj1K7CnTyVmzKXawh0ePC5oumSV/KegTQEa2ve0ALk/7tXpkRT?=
 =?us-ascii?Q?sehyoinJJ0Q6GdRqlspahEI9RK/2saZ7VvQocm+MNaKIFzx7EUh7VB+6Epjc?=
 =?us-ascii?Q?muEjg8nxk9iL5p28ii8Bvr1GIzJW+YmKRbnCIzNLn7QY85UU8y3+RDM4alXv?=
 =?us-ascii?Q?VHh74DbO+AfNrT0R3qN92HNLhszbqQymsGCbby3Z/q9oqARafJiGaqIZom3e?=
 =?us-ascii?Q?jNTUO91fS2KTF2KHus0EYio2Iym0XRj9sCuWCekIRlEgRt3Mb5lIRB4o/I3N?=
 =?us-ascii?Q?HYLDDPn8ueUHzWyWCYkkEpOu7hadLWrMyKS84+o7OPluMBjHb6mf2OORXKvB?=
 =?us-ascii?Q?NwpH/Tc5NiwLguoSmvX+Rfw7Bw/g7c9k4PNxyo5loXQ8AC2ko0fo+Y0Mxx1B?=
 =?us-ascii?Q?DbyaE8wFMgjieXTGIsDETmV61LTiJc4rt7/6SIudSJcPPnUgsLxovx5G6Fq7?=
 =?us-ascii?Q?hnSn+rIhChpOmQoygmr8emWSul0UpM0q9j0VPZVa1cZc+br/hgQipertutuT?=
 =?us-ascii?Q?J2YfvuQNGI4WQsXuJzXMjMzl9DGAG9XOnuI6EUH9qQM5Zcz5/0Ofnoeqtfap?=
 =?us-ascii?Q?dpgK8iSWGp8oODPobkSHiLnn9fXjg7r+sVcknFPjlNo87/bia6T9YFdw1vie?=
 =?us-ascii?Q?i21Er/nDZ/E+zGonLVx8gpsoJ4ourZNpRnq5x/G5RkQouIXLSNxt2/qMaPfx?=
 =?us-ascii?Q?+IA7Waz/N83ETtL/X8zXfDiOgL98pUlQpiey8t7VnOCatklOi9CLWLV5uyzy?=
 =?us-ascii?Q?qh3nleo2o4yekDsxpZds4wKvalnMjJ2y1Dlzjl58+KARrZnA2ztbc+zy4r2n?=
 =?us-ascii?Q?bkplRamnh97OIBHZb6z2dJMGKjjbHgFmrSF7wz34AKokdpgBBV8h95PUbQzF?=
 =?us-ascii?Q?6tkrhk78WJ2Oh/DuEROpQ1jyu8xniktHzTZRTb7cnusDE7+U2L+srZsZCwai?=
 =?us-ascii?Q?5eatQJv+Orz7v+nNdU/IU0/fnG2RTrP5UEvcrjRlGBNo3gQrKdJhl53AOSWJ?=
 =?us-ascii?Q?0+9I1VDPB3qJ/gZ2AS64PO9/Luy5wpQ5oHW1unl5U4n1kz9lWWTN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce62372-462c-4589-cad6-08df3ae5d89c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:38:16.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hk8rPTbzGveJR+ym6ZSKRTf+6VC7FDGMVZmMrMwvVjj+weELwgXpousGL2VeS2pA5aaRcHfCui8DBvSluxfAT7f4gfIua8L7XwenIg7oasC3y/DR2GFNj1p3pcWO5mKU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add the HiFi4 DSP node with the required registers, clocks, firmware
reference, and mailbox connections.

Keep the node disabled by default, allowing boards to enable it when
HiFi4 DSP support is needed.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index ac8293f81c6b..6d8dccaf8ac3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -208,6 +209,28 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x40000000>,
 			 <0x60000000 0x0 0x60000000 0x1000000>;
 
+		dsp: dsp@21170000 {
+			compatible = "fsl,imx8ulp-hifi4";
+			reg = <0x21170000 0x20000>;
+			clocks = <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK>,
+				 <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT>,
+				 <&sim_lpav IMX8ULP_CLK_SIM_LPAV_HIFI_CORE>,
+				 <&cgc1 IMX8ULP_CLK_DUMMY>,
+				 <&pcc5 IMX8ULP_CLK_MU3_B>;
+			clock-names = "ipg", "ocram", "core", "debug", "mu";
+			firmware-name = "imx/dsp/hifi4.bin";
+			mboxes = <&mu3 0 0>,
+				 <&mu3 1 0>,
+				 <&mu3 3 0>;
+			mbox-names = "tx", "rx", "rxdb";
+			power-domains = <&scmi_devpd IMX8ULP_PD_HIFI4>;
+			resets = <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_RST>,
+				 <&sim_lpav IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST>;
+			reset-names = "runstall", "softreset", "dbgreset";
+			status = "disabled";
+		};
+
 		s4muap: mailbox@27020000 {
 			compatible = "fsl,imx8ulp-mu-s4";
 			reg = <0x27020000 0x10000>;
-- 
2.34.1

