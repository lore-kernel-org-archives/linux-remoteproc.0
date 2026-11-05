Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846306;
	b=GE5FugUYw0GWKBsX6GsU4VuQpr8LLgYDYpmDP1oShFWbeLUBN06PHvePtXtiabD3XcjD
	 ySdfcXnHVm0w/wA3S8PHJe01nxbmwBKyT5qQ40IcxHINTF6xsVIOuyhm5KQJI+B9QBjZI
	 t13j5a6BklNfLrEWt+j5UCStbgjHO60vED69u2Hb+N2n9C2A8PcrsCohaqWm2BfI6N1p8
	 Ssht2FfwIgVFkU8KnLaYFFFhBWnmm5fw12nEbCbA+O+pN6/19yyMXjoEBwZGE7OSZNrm6
	 U4Q+lZH7X1z8FnYtcVw/sfvWAcdpaA/Z0rVQxFHTiCAVbZ1xJMtBOTOAvdKQU4L1Fag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846306;
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
	bh=zXkwO3x1Gmd5xD1tuP34LIUT18tcznN3Z4pab/o2Qhs=;
	b=qqWOe+nIUhAN3XWdb56QGDfaIlMcr0O3gyyDaROwEtM69b/3u2t5BDWW/Ufv7hbcGlV2
	 BCDfjYe6Coyvpx5NFSivu6jjMypCht5pf8l+IG5+RZNu4OKXAHso/qMVoDAUHyG8kcYVm
	 w28kJNvG5j3jfa+VK5uSl/H50tbn0XRdgW0LRJHQWwwG/Wj/Np2rVswL7ahT7y57EYCaB
	 gLCvdBx/lK1rSOChc0jcXXxy1NO5MiDw1VUe7qc2f41TpWKbCJH7IX3FeId1RTdJ/uEQZ
	 KTAJvTEoIkbhh4Bx4OLshsGHexnQvI66LVxrKO+GxnqQyaVrinc4fR3VmXgK8IKBR6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yENUdRwd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.15
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87442606A331;
	Thu,  5 Nov 2026 02:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87442606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=yENUdRwd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6a/MlxJdGVqImCWfObQYIbMBX55y5Gmy6aqd9BXVIqsyQ/aDam7WjcdZT0sqoAH3fdbbn/H9CL4Np4IF25q25xeHr7daXz45SKUjRniznk/lIpj3P6bofW3GgMSKDkDRc8c4vkpsUa8vlaXWTQxEmuMWqb4d8OEcLmoRkNjtPVJ3u8Bq8n0zR/0wWiFHBejjhZ0ppXRD0dYunjRIR+OAW3FUS5oUFqmwZXVWqOH693EZNCrrlbM2RXcnmv7pmk8YE1yjPDrKKjN6S/Ow3ovkhbzjZn1kxkQLn1Cs6b92A62fh/Qo+B/48rabtOI7h7wydIijHJ6ESrwIm4yzBbkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXkwO3x1Gmd5xD1tuP34LIUT18tcznN3Z4pab/o2Qhs=;
 b=DKnFsJ4oQSWDVT8QycE+6vXKfawspoMKtI8SWbMsGXm8ywhVt0CubyFfLRsMbDlaleP9444cdCE3xs9UcB/AuViEHzvnzyCn3SkJNGH0HkubX9CJdOgCNIY60T4OwmEKgDFCs4IhegjM1YhW5AjnOS7L1sEpWYB3G7zVIeXxTDU2QL3mdpGqIxVtLmmw46WOEDG0MXMFfBYDTxZrlXb/PhPMlcj2gZe+6ZXt8MwpksJw5/zPndtRiCtEJ0unuSM27m6Uzm3Sb6zPmEWsj54lZwdm4tuYcMz4XpzgKnoMsF3IYYtsB+W5KdUpjYacEtaHkASGBaKO8QtBHoRLoeuLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXkwO3x1Gmd5xD1tuP34LIUT18tcznN3Z4pab/o2Qhs=;
 b=yENUdRwdqFG5wSyKE7QqIm79Yi3GQlDsCb8yWguDYLDZCEgu4nqB2SINV/9N8Xl0s4aPwcgpMX+wssP+ytVPhkVGkExFb4BjqRQ3NmCtnfMX5DotIaUd00oCq/HK6WGJp/ja6GPrNziKG7Yx6Zznk23eWsoodcVq3yq6bKtQKh2guhCRXnMOt7C0o8xVIQ41h93+gpdd0Lr2aGDK3wNeIGc+xVJ/nfd7+Wn0NjmXPjKsA7POtfP+fuFIn4ZQVF3ZACK+Qa9AV45IknfStwc4+b83BKztC7+z1+4YiFTzlqdTQNlyMeeG66h1l2W6EiqHbg/6r6ORsjzptiehwXChXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB12060.eurprd04.prod.outlook.com (2603:10a6:150:2bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 02:38:22 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 02:38:22 +0000
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
Subject: [PATCH v2 4/4] arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
Date: Thu,  5 Nov 2026 10:41:06 +0800
Message-Id: <20261105024106.338791-5-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 68685a5c-5666-458b-c8da-08df3ae5dc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|7416014|10067099003|22082099003|18002099003|921020|56012099006|11063799006|261102123227099003|261021135927099003|261022105027099003|261026140227099003|261028144727099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	qQHikfiriXlgsRqZJ8orut3J1pJeeCI7E4e7t2sWSzO7Vevg2RDMtckXm/PrBlg1P6wNTCA7Oj/Uk5UdBPwGokrO/N8gXlhy5zfGgXnkUQE+wRb7HebOngqJhacLAvF+vHRUXmoDUMkMjqPSTmlbbjmzGS9KLPxaFGetfWrFhokF/LkJx6s/2Yr2fLYmwEdb8Cb6c6E34rDz0uhfdVWsTidPHhR/sqYujvpLl1udXQdwZnQl8CLUiQ8rDFNGe3wzXf7IJSqanz7L3cgKPCRG/gKG3cJyiK+jjNqUyeycCdZO3ZtHjbQx6n9GAaC4uGFDUiOSgqM6t/ssg8H/oUd9GHmJH2bihLnbSIC5Q9KISYZithYyXLaM+2oc1wBg33i2VvyB5/LA3cBGF0AEmIKGItGfUFobww4pwlq0qwS+HLe9WcCNiOR0gDtwcAuSuhtNNKRxYZXeBTnAQaxcBn7e1NuJLofx3+Ch9Uv1axX6LxRDtI82S0ez97/H4t01GD4GKGw0N+4VKudvnICvbR+1O+CAeqZzddR/BuRJJtt6zRRAq/t+i9Ap1kf0riyYABov/5nk2QUuUORhZA7sjpAW0picDD9XOzaOfHm0Ei85cle5sgwkpO3rvkt9Dtu6PQMoUZ5n4X7c7FQbUbtIcZYsBUXRQvqeQk4NsuykgDTfoumU3w/1A6f7gnFuLObKFb4cYtU+2ElUkD3XU/a+3Hb8lQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(7416014)(10067099003)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(261102123227099003)(261021135927099003)(261022105027099003)(261026140227099003)(261028144727099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zxEauydm19m6lVwkkJhOoIavW0wX/BsUclxK1WgAUOEo9AYbtdQm7AvZNakV?=
 =?us-ascii?Q?Pr+LzQvkxPuhpyknQNXtG5dzpYwRAFiFP7SqgKOLj3SR8bkmrH6O+yOWlss/?=
 =?us-ascii?Q?vfPuHnibwK7vubmHsqieJ8ll3b3PLJKb/7LxllZKVo5RbFiC8RN/U8ODmFjv?=
 =?us-ascii?Q?XeifEMslVzWbQTkXFbXtT4IFqXSzuq7f85cpY56pyvBxkTBSoK8Yy1xKJrF1?=
 =?us-ascii?Q?6OrSGE+ZRycgejg4vRZDeWICd9ETVc0/NTWxBoGJrV+aIWElpe1JSOBI0O9M?=
 =?us-ascii?Q?ozEYZILK3RsWr7izk7JXlEzc6Sj58pzOER+QNzU1nc5c9IDcLJSJp57fmbmL?=
 =?us-ascii?Q?oJv9iIn3tPFlfkZvyE4Xhk8k1qxE0ehRG6ShIWn/rA6FWAygRbcGt38dyCL9?=
 =?us-ascii?Q?OyLlU1bCoyD07xFE6swOGUrmgQ2Xc1jw9sfTLQ817UvMiZlDGVAq5zrkAAX8?=
 =?us-ascii?Q?vpMSftnhqk8l7RcxPPO3zmfQ/9rfVuwraWJ6AabYaMCKXgt71PrTraP6NiTW?=
 =?us-ascii?Q?t8pKdq+tuxHvkC3MFxHYrJZJhXixpjwI2fsmYgmFoSp8MhB8e959VyqZEp3d?=
 =?us-ascii?Q?MCwqAQU21iOnhcg9MJ0u5iDH3lCaMvtVqZyeSfi85EhlJFE1lzwrHJf2HmCn?=
 =?us-ascii?Q?KSeSz7QpJRF8xll3s2zYYqK5XppkdD3uA8h70wO/Zi33HddCGKH9BY/Uk0SB?=
 =?us-ascii?Q?Lg1njS0GXknqOQt1xzoXuqW++n3TPNhWDGJMRxywwK2N554YwNgAhlrUnCr8?=
 =?us-ascii?Q?86kxm+nreRCPWs3PF7GB9vDbIazSN2PTOD04Yv+Depp+Gaz4IwBACNKywiVM?=
 =?us-ascii?Q?vUqjOTaGDznBDxDkeYd6jR1y6RmyT49q+Ds2Dja7zB6bzgagUOkzwbaR7tzx?=
 =?us-ascii?Q?4HLSVN51O1OFa4ftNKr8ZS/5lZlrVQDe5GkmPyUMzAYxuZYrUvZFFMKd+GWo?=
 =?us-ascii?Q?YVwHvomU9O0eiXDEgV4PtIC1rV3o/TXYQ6EY/F0+hWHoBoENMH2LVLM9B8+L?=
 =?us-ascii?Q?Q1sV31YrQ5TX6jPA7KG34TGRi12199t91MJhDYIs53VH/NkCkFgFcvAAwbEW?=
 =?us-ascii?Q?wspjXqySIyxx0ac+VNjk/2Q8AxWx/rcW8E5RNLvQRT8F8mvx6x5GaZVZTIuQ?=
 =?us-ascii?Q?bvui8Y4qPwbwY/v+cyNXZ6zA2nNHiVdtMCKN6eBMmxkGBqaJMl9BWU99jL10?=
 =?us-ascii?Q?Ri6s9nkRRcosyDSE4LdHdy9ToMAB98rlGPJKR86e3dv1Sz7U42JLHU9Rl/O+?=
 =?us-ascii?Q?Gsn4PnS/0cVDEQwr2vKY/dMn5Z/ECvUSZMPLVYPuW9b9CBnJBHEYnhTdBJR6?=
 =?us-ascii?Q?/KTKBctVzV2iD0ISQdyihx20D5F6P3NcPd8BvYkNv3RutFl7TQX8+pg2y5CD?=
 =?us-ascii?Q?J3j3ZfHLafHZbU3/a1w+oPxG3v/j2ghDGjEsEgjSYGnnhbOTb5WyK+obRnDd?=
 =?us-ascii?Q?eYCi2wZ30Z32lloe7GGYt1w0ie1dh0Jh5X1TBpCuqmQFmNkd8ld9JimSJJkj?=
 =?us-ascii?Q?pGO3DUhTyWfnoMmuHpUbm4ABCD/UFqlumX0t++sLuyhGxDGrZyEJuVVibstN?=
 =?us-ascii?Q?ekReKnXp1NYMmK+zwrmNhak4sBRavwSBkhZn8UgLkEqkLGEZRTMqhh3oCW6G?=
 =?us-ascii?Q?9LOiGmAp8ByVQrwRMXTIg8EHJw7k6ASPlaA6CcXdeRfrZ6Pzlt82k1kS2l0a?=
 =?us-ascii?Q?NsGl3bj4AjB90Ps24FuyjfikH5Qj+a2ux/RRPwD8WjTf+G35m11uj4YvraDS?=
 =?us-ascii?Q?ffJv5+c2xEeGThEv7YVLXMVTWYKmYOjxQuyQir/nHFrInGvAIVoE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68685a5c-5666-458b-c8da-08df3ae5dc11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:38:22.4977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tmi4pW2YNxE9x0Qq8ycCd4RyEP+5og+pSwtRbj8PH6wne5kBhdvI4/9/mNmWSchaxRLBEHXPRHEmoBHP5mqWWnkQniNyXgEeqGj3sV+5jfHwXAN10MN5g2bo4S6vpiEQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12060

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Configure the HiFi4 DSP clocks and memory regions, including the
vdev0vring0, vdev0vring1, vdev0buffer, and dsp_reserved regions.

Enable MU3, which provides the mailbox used for communication with
the DSP, and enable the HiFi4 DSP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index fdf3aab2224b..f985a9e7010d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -61,6 +61,27 @@ rsc_table: rsc-table@20000000 {
 			no-map;
 		};
 
+		dsp_reserved: memory@8e000000 {
+			reg = <0 0x8e000000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: vdev0vring0@8fef0000 {
+			reg = <0 0x8fef0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@8fef8000 {
+			reg = <0 0x8fef8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@8ff00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x8ff00000 0 0x100000>;
+			no-map;
+		};
+
 		vdev0vring0: vdev0vring0@aff00000 {
 			reg = <0 0xaff00000 0 0x8000>;
 			no-map;
@@ -145,6 +166,15 @@ &cm33 {
 	status = "okay";
 };
 
+&dsp {
+	assigned-clocks = <&cgc2 IMX8ULP_CLK_HIFI_SEL>, <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>;
+	assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD0>;
+	assigned-clock-rates = <0>, <475200000>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &flexspi2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_flexspi2_ptd>;
@@ -321,6 +351,10 @@ &mu {
 	status = "okay";
 };
 
+&mu3 {
+	status = "okay";
+};
+
 &iomuxc1 {
 	pinctrl_enet: enetgrp {
 		fsl,pins = <
-- 
2.34.1

