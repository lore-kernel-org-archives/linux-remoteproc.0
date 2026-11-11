Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366953;
	b=Y19RyAolhoYQqlxlB7x7XoiOLpHsuhiBH2/cImErTygywhvhL43F6qnPFUD2AsirzYMT
	 KIIftlbxdvfSRKeXEcrGiuWb5UJ5pH5qC+jD2NOQYHKb6pljyP3P9riu3LRqNZ26rNqnU
	 7qVwJsP+9XqQMwzqnp0iL6BQe/6AA97ENaVrC9vlcu9nBUsygm4jK19sLYAEedUC1W4XV
	 yhmDF1rCNhOXYBYb/63Sb1eT1Wr5AQT013JvgWmYbJ2NvCBNPpBlO4NSYx8o0EzAEtOGB
	 zv6qoSjNVU9fzDOxH2g6HRurAbZRn5GzFrAu5ANN0ROas8V3xv5zp6/zaCa1gwobuMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366953;
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
	bh=aAlm++K6eFdd1XlvYrGNfXgjIsMDXHzHWgYaXUrhK7Y=;
	b=CXWxrSnFbQzqzHKhFMGu8ZgLks74G/qCff0133SJGJpcBxrF7LU8kMdMrdtElIkr7xMl
	 uJdt3FfKKW8dFKWBfQO72H8xex4QsmKYxPx5VUz/gWhv6gEnJM9GHWeLXVeVqhRRF3NA6
	 cn+j5gr3mPMKSvHIggcobhVywNJjyYILnhfYFL32MuYHKNFDnNW2f909E36X2b0GJdyhL
	 5mSxt5QUaSAQPi3TZir3VPGPEAIFtTD2vLbak1v0wBwBj3nVdL0Ytw6q9Lzm2pBz8pmVM
	 31NtOb3EkmYrI+8VvRX4hdHZH3HmM2EtAnncXWZlAO4ehOD1y3Ldgr8VP40P7DchV/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gCWsikMs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.46
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F26606A320;
	Wed, 11 Nov 2026 03:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F26606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gCWsikMs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5RxNIgc7cePFtDt0IFjaq8dHyq8DX33yP8ufG6Frg5UeST/yHQgKCDDArT5vWuMIwbPiXKxsxezy4S+EZmZAq79WsJN4E7JSSJ7o/2uHTpxKcbnqxvuXK0f0xNsdhJEX9xu73KKNoKVJuvaVfnRIJts2ONkDzGXHQTno+avOlkFWb5sYJ7u5YQHMZ9JrVHW8xnS4VWMJ+DaRkW3uzsw9JVQkNeH0Sv1wQ2hVD9g2OTrP3G7+IzkImKbWUJ5xspWo5u0cZNohbFL77Vp4u+GmDLp9aIphEhDdMQHzkbdRjeAvh+hFl+yq+I0MxQ3vSAD+bMwunW9xuhCMlgOxK9qQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAlm++K6eFdd1XlvYrGNfXgjIsMDXHzHWgYaXUrhK7Y=;
 b=MxEUpvAuFmvSGwYOva5nV7pSzyUxOhLNIpEPeEiTSyWYN97iheR/eC2eZIl1f6o412qc3Z+wAA5sLgPlP3HwWPbAZA69BacHfD12xUVtnTF0H9pWOCN23Et9DAZK+qPEaOxAIuIla6EOd0wUx03GxDPmtyFi1mRtXQ+ZRusLg1+gnqZKidtCmQGYPwoxFwTx5twq00OwaM8titGlZPubvbn5RLRHyuWZyRLyUPBcWUiAvRoBVpQdgdmH/Z8vVH7uhwqR/WZrvTGxpL8JKfodz9B1QXHMvenAIPOEWmHvE47WEmFWx9DzcF6BTM9h/YhaFR/KpYi/5JnTyRHZAVwQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAlm++K6eFdd1XlvYrGNfXgjIsMDXHzHWgYaXUrhK7Y=;
 b=gCWsikMsTcTCm1pfquqhAzMHUlV6xEKXjy9TjvYZN0XWxbHuIyIysleQkGJ+PTrYyLwwMMf8P7ZQJcXuX53CTHAHEoMkxUvRmCRyEt3rlePRjcXa4KxKQUnXvFcSKmgipS81uG9C+5oFoF8W+jWrh9aIIASI8hjvpqrUnJx6vbt1Ed/svLwjEOPl34UbdqRzoKX8xYtYEV+uwubjelYruNKue6XFGl4WRKtmRaRmnu6EjAH6HaEBDNcqFrnyZPMkO/sQl0mkYtc+RFJ4Y3E+3fWbRN8/bKPiLSqtiyVQFzBynYu9MjvcVkG2u2pdDYaX4vqrE9yDIbxPyl0t/m7lAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:50 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:50 +0000
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
Subject: [PATCH v3 5/5] arm64: dts: imx8ulp-evk: Enable HiFi4 DSP
Date: Wed, 11 Nov 2026 11:18:08 +0800
Message-Id: <20261111031808.570680-6-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f66039-cb38-46d6-a4ad-08df3fa21659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|261028144727099003|261021135927099003|11063799006|261102123227099003|261021121427099003|56012099006|261009223027099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SMdl6eETQ8tTG9VxMRapMGbwt8lhN1dwow/E0zHSJbP+GY/B3Opzdw5s74JqwhHNNViYyiWY9s2OIISWOF9d/omVXlElJS/tab9JcK2vS58vs+i7QyTSdd6X6gN++jpKlaYGwWFrKsQDLKgvlVh9/HeGrGFT7Wg8hzX7LpMV9QFzi/Lr0oT1SKq9z/TWVNxJ73UeiNpfAm1mAC6J0vjCT9aUb1TaQ1NMilfdzp+g5zyB9eZkJNfuRD4iLSyQyxdp5Vmv9P/2ox6R8TNz/Jd1LrLowV/44v0tCJiiNmqiA0u92+cx0dLqPe7BDo28WV1VkjOrVRaY1ILjUtNgzUPSrvU8bG/T7jldYa6ehW1XunikTjSTWTxrWjEQQeo0x/Nrk7DKOFbUsUbebHujwOxKtLYn0JWuzzURrFNevFkEqjhIxwvwbK+iUKpQgsVLghw9Ts1wdssvr91u/wTUS1x6H9ZihOz7bCF9Osn2rffWyPrZLanNbjXzDO53ZoCJEn4gRf74gVh1kqswFIqVFBabuDzQ0h/QLO6d+vPzODLbqQtU2RsEIYIqIs+I6IHzfXlyuhWAujkaq29zIRlEZV/eE0Eg55XwvBZwmShPEt8zeza57EVM5v3c9rP48tYfsKgeVUldFqvB++aXFAXB0BwshlSQ1fTVQocP9QJXLi1T/a+gPB+XYrmtUnTxe4nX0A97V2+9ynAeb46wTN/mOL+V+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(261028144727099003)(261021135927099003)(11063799006)(261102123227099003)(261021121427099003)(56012099006)(261009223027099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Ta8Oqrm/98V8EMwnkaEV/uoOSyO5sC7vw/8E+SEXpgNc5ptVPN6TFfOxMxO?=
 =?us-ascii?Q?/yScyH5vocW5SigqE3G+35JRukPrBkazqK8fCKbMbakdjTrfMwVAg5To0Vpl?=
 =?us-ascii?Q?zXQXBBprhQnhuP6k6EQFqAohfbsrIDXdDdI/UNTBelNYN3yCrlFyHHzxdxWi?=
 =?us-ascii?Q?wfmvwq5Q8npb1H5o1ocr1YdFdc0WSAeEDJUhH/leK+jwZadwCTmfkeMK9XlA?=
 =?us-ascii?Q?lJftyZp1AMig5LMf+bJKipMRgI2N570wv8kqpMco1ovo0L9Es3wkVK0kWasm?=
 =?us-ascii?Q?/jycnphIl1xRb+ah1ZskAT8kWuEf31BjLCcOToUfYWALN+mtKmVY3BYb3zmX?=
 =?us-ascii?Q?kYK37YWupD7FmjdHFd4uZcc/VuxfrLigy89cgyok4v0qtEEF2BQQa5ekTlSA?=
 =?us-ascii?Q?N7ZKIQF3at6z++Kcdsu4dTd/0Z1FpOQ1gMCt5Xxae3Y+XUO4gqjkiKQBapny?=
 =?us-ascii?Q?OSiOfoeQI577NlPOoxFZA+bBWEIv3BazIX8WJpUEP4DgxAevsTaQLp9p32QE?=
 =?us-ascii?Q?EuUl9w+x6/xdjMOp/0aaOUms4AA5yHS5BJwOQTHGvfx4sU5QBmTcWKJcmzqE?=
 =?us-ascii?Q?rRJwQtOrRlsDIlatzuLLQ1tu8CCD/aBvx5/cCmL8kPwfFnPEOI11sdwUfGZh?=
 =?us-ascii?Q?p31KxPlde6MUD7usQbjrtE+CngYsQt+gEVMnCWSzWqJmWPv+fo7nYhYSENEJ?=
 =?us-ascii?Q?v/8SGptShCkHfhz22lqKoqSbqWrSF8MDXcxt8TsQIy5MEEuYeoXqMpKoVifd?=
 =?us-ascii?Q?0oZNJEfe1nGey+O9nrqzXKQiPXP+GY5rt6D3FCvQfbWdnZeFPTx/SwJSQrHD?=
 =?us-ascii?Q?+4fe7EcIzBH+Kbxm53Yki77bvY07nOWhEq1GV3dBvwLAEGQsgenKHR3LKDZL?=
 =?us-ascii?Q?U9vKb3y1NK2va9laikqICNtsSGRPBZsV6dqatvU7BNDJYwNw3h4uQqG20N5l?=
 =?us-ascii?Q?rR4NrAKzFI3FWoqPnTMtsCI6HAXQ4oiMM5WFfWGbOxepJJ7ICZm6ErfiZO5i?=
 =?us-ascii?Q?+HA80gU8P2Fj1CXcPbNjBP2PgBGxg32J0TL2J7I6z1tXW8oLD0q8yorV4y7M?=
 =?us-ascii?Q?CZ9l/qOP0p0A7HbpUQq7GoLG8JCP6ZaM00zpePDyDsBEb9BUtsUhlgY2+j7h?=
 =?us-ascii?Q?XKxlpW2aK9x9saN8m7CZ6Qy57mBPDP8JL2CZv+OrsvOWl3SDNZtJoMaQ1rzm?=
 =?us-ascii?Q?Gn2tsecgnUFT2Wmz1H136HzZxqDFaC7ASMQwvZqL9bLZbfe8MRU4Snf9nR0Q?=
 =?us-ascii?Q?B5HyLAQw2nBFFNH0CRF/DcVRsAC00/sm5sL4Xjl54VwCuMeABYFpThSgPA7n?=
 =?us-ascii?Q?ho9qU2epVXLUiyIKRJftywvYyVock/q2At4psqt0Q8VAGo0+Wt+TABYkUGvw?=
 =?us-ascii?Q?dGZX5+rX6dyEekhHFBwibvWh7fy9WJ+Mf7YaqCHZ1U0vLYvwMRzzpay1f2n9?=
 =?us-ascii?Q?RniZRctFVMAykr0ytdnEgLbtkOmt7fiODC3N2ks9jaiaW8nNjMtx8SlN0NhE?=
 =?us-ascii?Q?1ghNve44QYs2ZlcQ6si8qlHK0NU8OwoZDZUIhar2pUp2l9ds0Ut1xqxXcxTs?=
 =?us-ascii?Q?CIhcWgcb4Ww7QctBALEbWoQJXQsOe496/xK7Qp5glGTcVhZBLgil6CCTDxyT?=
 =?us-ascii?Q?mXx94F9IodUDw2iu2Fheza21v1sVn8gMrjvITQsZOkHkMiljjpnwtNDr6Xb1?=
 =?us-ascii?Q?POh5CpKQhj2LbLrRwqIQpYlgNh96ZubkprZl8L/8K2ENKSfARJIU2R6Z9rwV?=
 =?us-ascii?Q?nk1LEIhhTcOEgcBkOZdH5/iNsEp9PwkwXy5koFcpTAt87vhJOb5v?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67f66039-cb38-46d6-a4ad-08df3fa21659
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:50.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m9PzVqVTrlhV4TNgK+wQj5fAPaGg2AU1tLQpV78jvrD4BtuVMd2v+gxmB9bbQ51OjV8yDtwxFObmhN1NeHTGwYM2+a+BZY8Mag6KMa2fVmNYMkdz0EXtlQwBCHqNtJS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

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
index 4e19847f240a..f7f5577c0f94 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -60,6 +60,27 @@ rsc_table: rsc-table@20000000 {
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
@@ -144,6 +165,15 @@ &cm33 {
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
@@ -320,6 +350,10 @@ &mu {
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

