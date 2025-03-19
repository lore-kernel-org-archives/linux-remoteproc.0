Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16A25486B;
	Wed, 19 Mar 2025 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377540; cv=fail; b=kNM1BxFf8+SucuIOFXSB0QUVz4J31Xdpc2x/4dp6bRV1httAu4dPJyRqNgIh7D1r2jvrEvrzrlIkFNjmAA8eaVLcogUXG+P04IMIs05RaUuNiqHifb5R3sInwzu61R60G57LF3JRAfMyKkDF6dQVeg2CYJNcLYrwxwge0AHtL6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377540; c=relaxed/simple;
	bh=Q6K6zuwfXDzIoyRPNxcjBrrYjKEJPINjQ8k5J7WYCZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ODGEhejhTaF4CVPjKRuscnv+wNQsYfHbXJTKkVvTiPRkIAj21fwYMkws0LtgMiqj+dX/TfiESvziD4kLiUyLWsjD5LQ5ag+NVdBj+zWK2Q6Ss5bvRLFg8k6h9CokwWxBX2JB3FXXplCqk7K1hB6GMKEQA6o6nSiJVuFX+cgQYNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QyWByZ0D; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QyWByZ0D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTwrCzNAjsr2huMeCQ3C/Bypmz/wNBxnuYsfD8ZwcEZsP0CTEx+gXmIEi8fJJoubAxg8UZvqq3UvrzweAV9cT/8eGor5bUYXfe/hkZRWbKFH2C3ifnKLz6DLpl/Jtd7aD+gwLSLAMmpd4/BtXyJC66atThPgpPKEqFsRLow4Jdw0llTosurEgwDxWn1pbrF+QJOUqVQ++jf7hMyVOr3PzzjshV2QeDRCoTchBJ8FFRn9TSDHYedt+7frDFgFYWtOxVC3r3AOadPpuS2eTn4CmuY9vbY2e5lEPwEAjsXIFavPYrDf24ShVgxwEdjA3nITlY5HoD5nl3JCLkHeGTcruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrxRGpTgaWApty/mfZkjbedxw3qa14CrE1gcgvgcKZ0=;
 b=hlpNSJv9j2dRxFoskoyvQYW/rTjQ+uWJZdFEJsW2EybxWm/CCB4EEqHg4sAGEPHxxE8ddPwa00mZdhk7+pALaUUh8dUaKGVLRnriIt7AsaafmfKL9hahuq/V4GrDH1PRTFCdb0ShRDRdUKqnbACf7zGbp7fBWlg/0LTsXYXj2rEHbOoEWGsCr5B9FtQcpIsQnvSNTxiVLmNyMOrpVSq5qyG13Sw8mLO4nBWR3wVnf+cCXHsI8Lh7LuA9INNTPP0+YCRileD3HjYUhtWampdQ1lBfKp++RAOah8bp2tmQXSTpX+9+nW2oOmmoI9bxmYGRWJPmcxONuIquq833VJ7FMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrxRGpTgaWApty/mfZkjbedxw3qa14CrE1gcgvgcKZ0=;
 b=QyWByZ0DuR9+72EPgTZR7XIsAgiTZAMRmLnoKXkBnEzUgcIBdaCJqcBLduTBFnDQc7qgnnf/NathZAGD8EAuMXuhDEqM7FUMdb2U15dYDuk4taIz26EchA7UEQM6c68Hu5TYg1aGWbgfSoliBOypkGMLDFAjUL93ZtJsZxg293HRXpX2nL2JpAWf3sCUN+4NDlIYAvVCJogoiWXPL2om5Y7o41T008xZBi7pCg65QBA+tQdthCrgmkv1v2zdJhqIw8qA6cinulhyqcDCvbnLz3AiWLMRtqHn34cvIQaTyrug73N3wUR41fQF284dtmzMnQbvmLVhVfPDalohsij0Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10553.eurprd04.prod.outlook.com (2603:10a6:102:485::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:35 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:34 +0000
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v6 3/5] arm64: dts: imx8mp: Configure dsp node for rproc usage
Date: Wed, 19 Mar 2025 11:46:19 +0200
Message-ID: <20250319094621.2353442-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319094621.2353442-1-daniel.baluta@nxp.com>
References: <20250319094621.2353442-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::22) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0082f8-50dc-49c8-9830-08dd66cacbe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kRfonBC+65VdC16rkyz4Uk9PVmpjDTl7qwBAd883f4PtCTEK5vvbvXh0AMLx?=
 =?us-ascii?Q?lNy2wFLWazkaqxvoOjo/gxFfpr3VD+WKKiIXrunxnpYf2W9OMRH4bdrmDJ4t?=
 =?us-ascii?Q?/3vXA86vtPC8bUnc5u7pL6smT7BZW+RJScytdRlwKPcg2eIrYM2F2sykbpZG?=
 =?us-ascii?Q?IGvcF1rChmFCaVWeOnCBFiqWHdodpBTv1uW3oiLOHMPgg1oekQkFPXDwy0JO?=
 =?us-ascii?Q?0xLQG0z8yyno/nVbBYw4ETI1pfAxtCmjudbKCk2MW7Ijg4k3YYWdAx60uVPv?=
 =?us-ascii?Q?lf3R+MqOFkO380hzMnFemY30WcT9UrVqYiDNYNYT79s2XJBlNJL6VlrnuedK?=
 =?us-ascii?Q?8fgEDNB/ivEkHdCUUEtXlqlpQZQ+wBasqmlbmeuoN21U7LKvhJt4AO6spNJq?=
 =?us-ascii?Q?DxU7cq3NQfrZ+vdoETxR+yHvE6elCO4eF6NAZYHsT6LC9qepQSBx/VXL0Ukp?=
 =?us-ascii?Q?AwEWSTvBLxFv+/yISdOLBbeYM2zD1RfaTCeBoLRlCcg7dYiGY897teow7GhJ?=
 =?us-ascii?Q?1m7H1xvD5okCbgTA/YL7X1V+HMTeUEHK79vVeZc2CKuk0hrVRFDuX6KjgFwp?=
 =?us-ascii?Q?dyArhBnfUf8d3jzuxvAFwXOEtgMMfz/S0asz3ugiT+MhSnJYsRZaOU4W/nXP?=
 =?us-ascii?Q?blY+1oNuMBziCnzZa8idXzypISpxmlF4tN+cmWcewAHAwCCD11K7m/sYvFTs?=
 =?us-ascii?Q?uoDgWJLzzaa4Mq2IHeW1dI3TjWINFZuPFpT8x/Sr/AV8PQOrDez8E9iK3zC/?=
 =?us-ascii?Q?BJv5yI8iNvnErv1pUUqvgjMZflJFHPf8UuiZJqqLRnGTpG8o+xODRbs14/Mu?=
 =?us-ascii?Q?YPCGEWY/vHyOecFHoqoAB2dQVb9eo3hHjylI3ZhpGTs5FtlxUa8VfaGorUk1?=
 =?us-ascii?Q?pj65Kf2VxLd9kTXqpJJ2ysS6w5XkblEtbBc8/xHhnTESUeyU8XPnoM6+w89W?=
 =?us-ascii?Q?93EVepx+eZcOK18L2GgcdesetvosBVdo8LdgZZsM8/Xg4Oe5WUmcDOTgoLbx?=
 =?us-ascii?Q?XMEQyIVti3F7WWbgj/H6On5iCSZAOWthIYwRpI6YDbpqs3xI6pKrz1x+5Tfv?=
 =?us-ascii?Q?xvVVLFoLvcIwA9zFnWIqkBc3gazQMqTuujRjjXMZMhll7Xc2he9NHKu2lM5T?=
 =?us-ascii?Q?c6LdBjAbqYyM3fsfoUTtnTLrnfwk8+kXFT2REShOq5WQ8wepHREN6MCLadzy?=
 =?us-ascii?Q?gaZ/P8ptc1STRb/U0cUBRteU6xsCK+VmYsHvBRUlFfUD5DwlMKossHVkuhcp?=
 =?us-ascii?Q?+79XqeX2mjN3YUnhOrO71QmzdkAjdodCAFipw7KmUPfz0UF506jQnO9C6eCY?=
 =?us-ascii?Q?GdZCnzRjVrBHQ36d2W8oqJCZVhBp0FW3cPssq++5vjrJYrK2a7k+FsN3R4/D?=
 =?us-ascii?Q?+6f0w5v0Pofji5GXlnMbJEz4zxg4ojtqX5opz6+XO5KX2GA4sw1YHquM2daJ?=
 =?us-ascii?Q?Zu5PvjAzXZuiVjrBo4YyiiITC5jVpJdx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W3vZ9hEO6N36BeOXUyROf09eTGg3ARL2e1mgkomg2wbJsHEqATc3omOanOpc?=
 =?us-ascii?Q?To5/CQu9eDx2QJQ/H/vyMDGXTJKpHvFWbDMcXNzHttLuO6gwmqtba7SeCIKT?=
 =?us-ascii?Q?fRK4GnpT7npDh3amYMMtfpcqJVgc4Cj6ihBCuOlQITSk+ZIyN+RJ+tDIjP2i?=
 =?us-ascii?Q?h0Ye0rO9I0+nn5N9kO0Ht4TxSFdzRy9DTxJ3ZeoW+bIRmlkWHFY7ZdTjOfbQ?=
 =?us-ascii?Q?fL48aN7s7RWv2spjX6kLfVub18OZwbkAAb1jRnWGXQybHL/6e8rG0mHD6qzt?=
 =?us-ascii?Q?GAIgpk2Umv4PqR3Wj84gVGCPAyMGrwoaRGSAzVLaK+LGKV15z5oq9Cd38KG/?=
 =?us-ascii?Q?lVuTRLYMK4Zm+4q5PGMPUlfIPe73QH35enfFcI7FI+g5N6PskeO1XKTa9TMh?=
 =?us-ascii?Q?uSvjpKbOlmPAK18swgCcNAG/PaHE5FVd6MvnJxIXq+dKgt7n404Sz8sNb0qr?=
 =?us-ascii?Q?rQKEyHNVqog2dI/SEMFFJi5WDsJGznbjvwGyyoHwKYG6UuC/sql8SWV1Ex3o?=
 =?us-ascii?Q?F3RTAYluy3EIBdydSAs9IGW4bXrlg8GsaQaFlW36T86iaQiY3yEiXjhFIORY?=
 =?us-ascii?Q?J0k4hQvrAspecQSv2rGj1YcSj4nKtZAN0yW2fvfELeYzqRZQYpEQIk27cZGk?=
 =?us-ascii?Q?MSA/31ppp/FeZhfp9akwgtNJOp9tzAqQ6wnG1+YMqW2qLE325ze/aeD/mSHT?=
 =?us-ascii?Q?PpGBRjSxU7EeAPzFcEp3AZ59k94ayk8/hLrxM2N/8qmH6ha+bKLSWyKyiMvU?=
 =?us-ascii?Q?RgOFFb2xKUaXb3c9mTx8ut7/71Q3QJ5temaUsH+rdbJtJSJ2s3iBs+Wqizcn?=
 =?us-ascii?Q?bhQgrP8ritReYCNOux/ZSy01TC/uqHD7KSmUIvHHwFpndQkEDovsnMYCzn3q?=
 =?us-ascii?Q?GZPIy5y7KkZBqTlYyV6QIUt6FXFAX/aVbpjN50TOBuRyE8TzL53k+gGuxaMp?=
 =?us-ascii?Q?83z1Qetd+xxCxNTDegpT1uoZxCVX9neTnVx055hYt7KfVYs5k+4/865xi/H5?=
 =?us-ascii?Q?N5TLo1Y54LzCaAnwAtBnfT5RMyAw0cOz+9SypvmE6WgPG8bMOUQ2dmPAaJl5?=
 =?us-ascii?Q?H9wd7S5QjaeB5pjrJr3Gb2FwC+fpaJPAM6emTFSII4NLlSv0DpVv2csl92LA?=
 =?us-ascii?Q?rPZXF63oFji9IgeIB7M8I0yFHYi5xYS+iE6D/gyWJoFH+02q1R4YA3nNxC7+?=
 =?us-ascii?Q?f4C5NUwnvjFCKfKeqAzUsEANDoNAf+8Z1eWiQwplazNccwVZfiHpQhMdYMXE?=
 =?us-ascii?Q?Vaj7AiVRB3Hmov5PTbvE1lA7jnIlgFKEIrzeXIh6rf3Pmc0K3r1ynif/igP9?=
 =?us-ascii?Q?nquVEhisQ1vlt7D1RtgdwpdaBecK4VrPNTP59jPfU8tk+zJAEOeOJMFRatTK?=
 =?us-ascii?Q?BWW5y9zccA3zF+C47yNCb2kHG79DxS3eRByyDdyDPnKdNQ0XH+rkwNRUgm7s?=
 =?us-ascii?Q?l4Bruu/QT6ODUi83lNXu607j4fMDGrZYmAk3WTNj63Pg5pAG3AdfNmpxYi7Q?=
 =?us-ascii?Q?3rOtUqbEm3Q+ae8cmMIRz9GJi8DYTntDKdDjPt1f65e+s1z/tJdhgC4cQ3Ry?=
 =?us-ascii?Q?azQmLRTh11Bsl1UCTR8fAGnUEAMe0SoDGl15pAFw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0082f8-50dc-49c8-9830-08dd66cacbe6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:34.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWKLijqwH02H1KcSO57zERVeNJNA5xOcDEJv665f5G0yP/iZ5/1l6LK5MTyqNz8fA5/a8mlSri1O+vw2WwOonA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

DSP can be used with various frameworks (e.g audio firmware, rproc).
Currently 'dsp' configuration is intended for audio firmware but it
doesn't work well with board level DTs (e.g imx8mp-evk) because
board level DT enables audio related IPs (e.g SAI) while audio firmware
needs this IPs disabled (because firmware will configure them).

So, configure 'dsp' node to be used with rproc. This way users will be
able to use board DT to use the DSP as long as they don't clash with
Audio IP configurations.

More comples usage of 'dsp' node (e.g by audio firmware) will need to
create a separate dts file (or an overlay).

This change follows the approach taken for other i.MX8 boards
in commit 391a319c81f6d7 ("arm64: dts: imx8-ss-audio: configure dsp node
for rproc usage")

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index deb98f03180a..5f9421316ecc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -281,7 +281,7 @@ reserved-memory {
 		ranges;
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
@@ -2417,13 +2417,12 @@ usb_dwc3_1: usb@38200000 {
 		};
 
 		dsp: dsp@3b6e8000 {
-			compatible = "fsl,imx8mp-dsp";
+			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
-			mbox-names = "txdb0", "txdb1",
-				"rxdb0", "rxdb1";
-			mboxes = <&mu2 2 0>, <&mu2 2 1>,
-				<&mu2 3 0>, <&mu2 3 1>;
-			memory-region = <&dsp_reserved>;
+			power-domains = <&pgc_audio>;
+			mbox-names = "tx", "rx", "rxdb";
+			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
+			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
 			status = "disabled";
-- 
2.43.0

