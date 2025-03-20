Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD4222591;
	Thu, 20 Mar 2025 12:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472539; cv=fail; b=d7J0LL9XwUJhlOK9HxZsYt6Qofez9jpnrmtjH49scxW2uXeRfZqg/KVg7dnpC5kxYSZL/RJkZwQbqR3oKUlhWOI99ekPa0uih4LISr0e2g1hBdMxR0oOtvJx10c0l4M0IAoDjLAhflC93sPUBh5j0d1AAINaeH9gFPWrNkZOu6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472539; c=relaxed/simple;
	bh=saYC4r7EXyVBwT7/6uikwlfKw/xl2A/eka2IMS1by1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cv/u6HGULI1YaWMzyE0aBHtOVpEywaFngSr6c2Ik85oILInZ3auQiGPgvWtLojpk1BJBbGDC5g83GpBCue0fu8aaPrFWK3TS2YxN9/pBW/VuDd4Ey/2Uv08er8C3OeAJ6S1x+YiZcHbZokyXS2Zor30Uf6TBRnEykxcMOOThoig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ncPMB0r5; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ncPMB0r5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDXLsV1SUKvq0xGEy2KWLp933riAo6iIAp6niBuG5p3n8aosA7XvBaC2JepreDuSu3prDfECEjPKnsdVow8pA8MMrUU+u9/kD+6SK6BMQ73qdKvoDmBjuX/8yH6KUm1hf1aMaGdBlx5SVuydHogNauvfmg55Hv7goZtiNScNLxram3gMUF/wYe8a07VSEb8trAXQd8k/Dld78LwxCEgICkuAR2ZCQAaL1S4+yO3wUY3ZcGw+MbtP+P+3KJSjxCLP9ZiextMGUCCY5qHeYvRZ8S43s915nbfnPV39Z7eDhybWrEbC4/iolVQVRTJQ6px+MWOyhG7aljTAakScvpLB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fws57N9Z0gD/z90fGfS6E/HYBDlwl3zjwCtZSYHoTQ4=;
 b=ERMj+w6D7/xAVVggEyOApREJcs/VKh7RXNNIEM4JBQm6EDb+l5Tj9/22zl51WFc1FJY5uEPUPgATJRO8J+PA7aWY2ag2xsNb3edh4MN/g/zmLlLzEEHnSMWRBxcKbCTDoGJwSS96fCgOhXhKYk5Vio/ozHGuM7jfGuL9xLjc4MrcBWpAr1B9ejWpGpQhG2FOSuLPmxeoHa2a+gChscQMfFeMihsf4WniNGf0kFJSqvUaDo2N5k51/JSGDed6BQkYdMUA8ul0X/V9KqreLB4V86Jp8mR68uK6Xb6WcMJpI3Sp39IZwz4LTQBZMcsb/mWmuyEniviE5AtzGARneKvC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fws57N9Z0gD/z90fGfS6E/HYBDlwl3zjwCtZSYHoTQ4=;
 b=ncPMB0r58OuuP7a8GqNUC2VKbY6W9vCFAmusz/JYBBptnUWryM4ZL+AzsibpMh8tmPSi0Xu6vaYOxBnLvJshwck1v6TSPdj6sVNt3BXFHnTHwE0qvf7rSQuUFLvRnpuKVRcFyfRV2sBqI+AX7EexWTi0tkfaaaPgK4QeiI2O/MRaoqJ2ESwYDeGNJ7xozGfLHQbAqkbHH76+2D/EocnKr91R+Y2coFVcsZe8VPJ/DP4SrYJcxQAXuQr5qeMOl878IfZbAJiOz+QAf3fn4IcfH4sDVcTxiFCu4qrPpkLUfNkYC2LRE7sXvPx3z1ok3XXOfxkKTjR+Tl/nw0ftYvK+Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:49 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:49 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v7 5/5] arm64: dts: Enable DSP node for remoteproc usage
Date: Thu, 20 Mar 2025 14:09:55 +0200
Message-ID: <20250320121004.2542314-6-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250320121004.2542314-1-daniel.baluta@nxp.com>
References: <20250320121004.2542314-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::44) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VE1PR04MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: f6655d36-addb-4b8b-644e-08dd67a7f8fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tkSY13PQdhEXYxGOCrjP4ffd3qJMLAPo67S3milPKDqJP5y/+SX+c1sBDrgG?=
 =?us-ascii?Q?0I7biaCXalIEIMQQ0wLB337NosYIWVEDfPGJBpE4l8VCotJIATrFmmdMLqrX?=
 =?us-ascii?Q?q8GpIbNOD6saiaXegBsdkT6jvQmC144a9isSsfCMLuEq79jtkkL08vDlemmS?=
 =?us-ascii?Q?Dx4Oz2nEPPAVTCbnRwxnNsfa5p9LVo0kfOhhs/EYWGg9pR9o94CvAb9q0jrw?=
 =?us-ascii?Q?UO106QPLykXUeqfB7Bq8U2fLp4RQfEFFImF3SgjD8tQBIAtOBhf2IFcGpB3b?=
 =?us-ascii?Q?xPZXQYn5+QpQiByEGhVJ59+xrmfdI5BDp4bSzJPVURoS2PO5DpA/SqP7Qmmd?=
 =?us-ascii?Q?wFESVIUPQuA5/vLrkEB84YDOEFkFJkKQQn9baCHHOqo1GaEHVmg03oaC14pT?=
 =?us-ascii?Q?iuB8WkTuuVCG2iOzUH33aIkBbSCsQ404yHju4Nq0UcNP1C5cUTKggmay2ayx?=
 =?us-ascii?Q?eLKKYPdLP1iRck83kuWMZ2od7O9MKFRlLwavLaOJ4h9Dfztu75oS8RJ2MprY?=
 =?us-ascii?Q?uhenJ5dflM7CMw0r7X7ixWme6NVjerbqO1KDJOdDiSm0Qpq4ZPLKSKIWJ/yz?=
 =?us-ascii?Q?nt6vuXlxpe+309wnp1CmVBzkxXPLxUIxLwrv3e5WWw2QKe89Hc4U4tTM4QRS?=
 =?us-ascii?Q?uXcVucLvNDAI/l2SGFit8N30lvjTc7pcbDxxg2tAGDi+0QQaXC1MiTweFogn?=
 =?us-ascii?Q?58ESPXmnvDjVXZukm230IMHVDpomHuNBVlPS0MKyaf0d5maXqPGYLXeNWeR1?=
 =?us-ascii?Q?wj2oOp3ibzzGo/+lITVvPe5y6rbow7j7wLf4dD3olNOqRCP/LXYxHE+6wrYW?=
 =?us-ascii?Q?vUJo592s4KVCTLiK45C5ckBKb7iZjU2I/VI0ukKdlyYoj31IVxMjy+zCKU0G?=
 =?us-ascii?Q?y5kClOOgBk2VHqZ3nUXdgMn/hbm//YITARHXerf3eU5h4/VLkQktHyu9FRnC?=
 =?us-ascii?Q?++kC8U+9hB6i4qDMtS/Te20iqkt91IIoPz4IvmLdaetrhj59c23S2OSOsy0n?=
 =?us-ascii?Q?yivTKfE1yDCsbf5cc1jnih/pJA7a5gb1XL19kYeyykftJgPfxuqpuOTCgIsM?=
 =?us-ascii?Q?VznjAfY6aULLZ5YUq/Ww0+jQWVUpgWXaA6GSeG8pI+7VlRXUHX0sJUm2fjpb?=
 =?us-ascii?Q?6Ap2xSO9yB9PPCSv7wzPEMfJSgQjrKxIHrIFL9H/vENidANxu0fu1y0/Sw6x?=
 =?us-ascii?Q?bRnezs+VHzph47ZKwa8FH2PiogLAEbbijiEkqyyJO2gcrCAbE18incUv8+y8?=
 =?us-ascii?Q?zREtYjDx/bxe8xSuIrngW9x0TikmL/ftkLUlY/48IHlE0nXjoBG8pWhLskbb?=
 =?us-ascii?Q?UVg0HFetCC20vAsfefkROagRGE91DX4q1gr+md/2B2dM1rLbixBc0rTs0X35?=
 =?us-ascii?Q?2v8dEKk6ffrccUDygSMEmRp9rQK5ug4zwe5dKi3oNZfhKo+K0G/B21WkYwGN?=
 =?us-ascii?Q?0EmeMswS/1N5Q9qoHQ9112i85NtDKEpT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AB3+CCUsJ/qt4dcECp4AUhNLXkIrqYrHJyS1aCzsf7acvBy7hBOnBuAYYQe1?=
 =?us-ascii?Q?OKUsJM0M7Ev27tlnwezBrePyTHv35/9GbeY5r2wzMnaxSQ1FxQT3pD4A22hW?=
 =?us-ascii?Q?MYJjNJnj6Aq7tp7ZNDY1oPXfKlriLV+J0jzjfTcPHdhRDiTgOeUo3QhkSETe?=
 =?us-ascii?Q?L3Vm3AphbzROg6OLJG8mDWBTSZm25u+j7NTNQNtKJEFQ3pmnE16L1cmLThfP?=
 =?us-ascii?Q?Zb7V7NIgJrXGbdGmwRBasLpOq3n17BZOpghds+X3U9xcTdTfnbmKrsdFeQJW?=
 =?us-ascii?Q?908bbE5mWvtJr4cm5Ztw1GpCXpKnuDVVjpC7QZHWhbkUEDinp6Q2+0GpgXzp?=
 =?us-ascii?Q?ht9znlEbI3H5KlMjQDZSAaifVihjFZHAbP9ZK/oiaKyZA+WXmeXwEaF0ANoe?=
 =?us-ascii?Q?ZycNeXvoZGlgSyf/215ngwcmr4qbB3HnVMoHUTTmuM1ZOMUszplrclN0SNSM?=
 =?us-ascii?Q?YaJiZIdFM9hAwmX2Lk425V98JU0r4sjOtVEZGdREwi7AE71Fjxy//L79PrKy?=
 =?us-ascii?Q?prfb6GWlcRR7uZqgGXhzOaylKeRfASkKBau0IosgnYqynS++O5y2Ogv784RK?=
 =?us-ascii?Q?RBkuw/QHg9zsBfFxhMFgY0Klp16GrPW3CXoT5lwB5gjI0tfwhmGhlW6EMhPJ?=
 =?us-ascii?Q?JACaocleyRKw13cM9USmDnoHjLzTHOw0XJxZzwZ0c7QDJXZ9mveU02e0oKsW?=
 =?us-ascii?Q?60xqI5s3duTXOCZwAFuJBnowxS5T5JujWKdEloa3C0bN2nvLB0TfJMa3fy52?=
 =?us-ascii?Q?qvq9ZxBZlpxuZQN9S4wZEELlESUMYiucHc52lhI8zufbq/IhkxPNgZcoNW50?=
 =?us-ascii?Q?BDmKy6LoiXa+RAjBlRto7ICxE6GP52oGqfvUPCOs2ua0Cu99e7dF8ffJndhW?=
 =?us-ascii?Q?GCx08c7aMBofLwob4hkOG8imSCBxNn/FZdY6MQZTtHzZAjq9zFqNKdStVxrJ?=
 =?us-ascii?Q?z+oSUsG9GDfeU2Yv/SeuP4ir5NjO5sKmPf12qNu4nnhnNPfTFDIMIg6c1/oV?=
 =?us-ascii?Q?zP0DagJy9BaFilG9/nqp+AhDWUvCEf4/otclD00shYCAn3uRQD6d+CgcgWFP?=
 =?us-ascii?Q?jSM8sRv5Oh/K30g57tCGeEMlpYSZyHhNRGPcv2/Zgmt5Sfeh86P7JsL4H4AS?=
 =?us-ascii?Q?EYeqezGzyMlmSNFN/Ak0mg1KlsbFUdbx4AgtxkJQzBAifurxavHPoHn3YfDj?=
 =?us-ascii?Q?G9GY04zPvfHl1KsxHfJOpsrmxsy0cqsquieW0RkoQh+T5+y/Qrc87UO9gJQW?=
 =?us-ascii?Q?EfVOOvpjvTAPXpHEXbo3CAfnjoBaRx+N143yPREU7KNupV2Ikfdlf317Pv1Y?=
 =?us-ascii?Q?qtCCDAHd6qVa/ZIQKewXeDzF88gWHEMsBx386ZJaTwMc2MIDiLT5O9oELdgp?=
 =?us-ascii?Q?mqxfr2ejdzix3K7i+Y+tdP2lPhyK2xMbq3jq1F3kMjZ3w4Wqr0I0E7J+ctY+?=
 =?us-ascii?Q?ggTAxzdjlXaJ+E0Wcqqgv6iLnQX2yU6LI/LjbKu7DRyw0es1QH0Ni6rcdJTL?=
 =?us-ascii?Q?F1VLS9wgtt5g+J+KbKBP0FDOHZg4FoTOhHrWq6lRU97Gi0GRA1rqY+or+noz?=
 =?us-ascii?Q?Ek1Y9dJpcCjgQzQ5e80sQUtZUUk/guyA/mo8Ay57?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6655d36-addb-4b8b-644e-08dd67a7f8fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:49.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6B2Q5t/ftqgNo0oyfRdHIvZK3Y+ElOsZqR2slazM0HBu/hib/2oE8oBiZSp39NC1OEBpJQjdgq62htvYfNxgag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

Enable all relevant nodes to support remoteproc with imx8mp-evk board.
	- add rproc specific memory regions
	- enable dsp_reserved node
	- enable mu2 node
	- enable dsp node

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c26954e5a605..9ab3ee93a35b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -309,6 +309,16 @@ &aud2htx {
 	status = "okay";
 };
 
+&dsp_reserved {
+	status = "okay";
+};
+
+&dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -690,6 +700,10 @@ dsi_out: endpoint {
 	};
 };
 
+&mu2 {
+	status = "okay";
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	clocks = <&pcie0_refclk>;
-- 
2.43.0

