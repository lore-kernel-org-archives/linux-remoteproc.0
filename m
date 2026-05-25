Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBBB21A447;
	Mon, 25 May 2026 02:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779675156; cv=fail; b=RoqrOt6INB+eu7T/XFlLSvIyb5UBLJ/wRjZ7nG4s5osBrg614zoVwSMg1Uy7f48hViunIUylKv0StA9gitYuY0ylOdAOtXwjRF1JNQqB/sENU8PxhvErAB/+xpSNJkX/NTokbGqKG/r+KIr0rVbBAB+wOzEpWLsci29iLzSWh8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779675156; c=relaxed/simple;
	bh=W7SfsgxegXJYqz0NWM0dw5iaoExXeqgaMCfZmr+BvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aRi2VXHBcmR2YsWXQTPkPWycqWYLELJhPpUN/VuQGP/ujkx5oZYw8lHX+RnENIQ8lHQt06eE9gd0ghACndFyHY3lApCoGLw2oN+T6i2iHgHafLgU5Uht7+1Dow0brHhpShT+SVlMJXrHTaKgUM17a/Hvhxm1bJPf906cjMw8vdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sZfbVXYy; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sZfbVXYy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NU3RlA3Vs7/mT4H3/Mro+Yp4Y1H1bmWB2Au3o6k5qoTnsj8soazb+GiKLt6tXgjjZdU8ak0L1PcYgjCqz2YK7YN6lFQ+YxTgddBIaqMShlT6cQMIjVmu7PxlTWLObx5GF50Q3nLQmpz1WErE8x43+cPHFGFFX6RHDB8hsQwSVul9JcQED+xC/76V1Hj4NX7RxezpW1942M9IBPKkPe/Qhu7AbzIvDdaGwqxdSdxkbwyYBw7y9LvjCxps+13d2Le5S7Ip6vbDRx7Sk7BndbE+FjXL24KBO11jNF3usDpJKrdoIQdL2lnzOZhMAqflZv6+M6CHN87ZWXtd5cvABFsnrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Kip8bot6MM0Q6UbOLzWyO0TX3EjIvoDaU9oNZgqXXY=;
 b=fUmgY2VrawE30BCG6DgbE/RIrl/97TvDgwdRGRpL43l+6oL3wdCVsi1oN/x+ik/hu+WQmJ2OGjb+Sh8k/zX6Mli1B8GEz0GIxvB8Og/iVu4Od0Nm1M+DPGqrJBoebMhPWlvEgP/+lxDIyP0JOb+hbo3yQ3OwijcNlLcOSsInjmQT5UhUg7zRQ9j3220pLQp6sh7Do9Pf9pEhIxZki9EnUrMnhGATXMbAt/B2I5Bqy/let2XAJDdluAWn/41F2K7mSXVOi5Eaih5vG+nxVZfmmbaypM0ZwjWi/WyaMvEj+xIKlYjfbuukL9lu+sKscNekC3bZYVTWmVmaxAAmMIjtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Kip8bot6MM0Q6UbOLzWyO0TX3EjIvoDaU9oNZgqXXY=;
 b=sZfbVXYyO2hc7CUPX0esIFK0NminM/G1GXOjd0c1lZWIb6LN6XK0oXeyvVqhQ4pmwqLIiCob6CWbz7Ui89IPQAhEwVBFHgJ8l9G5rmkZIHmWHC/iVtYbQCV0HFws2S4P0PFd2GSEZOdQrhCQ/HwTjT4fsPFUKI0qtKRo9V2o7trJX2kMhQD5VSkhmoN+pgdlw7kN19K3ovRiKHnK7uASGI4670tVLFPFhGqrdjxgMiSENA82W+uBEq7T+iDI0k0VK+5+oOYYXYjesi3TGm1o2JvLv6K1hkX/KurSg9FHipPEVWCl8uKzFh7cbbX5mDCfxL+Uy551RQ0JmGsi09onlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 02:12:30 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 02:12:30 +0000
Date: Mon, 25 May 2026 10:15:26 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
Message-ID: <ahOwvnij7Fwxh3La@shlinux89>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522111849.783-4-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 66afeaca-6673-4dbe-4180-08deba031366
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|52116014|366016|6133799003|4143699003|11063799006|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	nRXqdGeac9K4zeqD+VV4NE1qJJOjzGte10FKs//TlpB3yraZdOGdcbauPFg4qYbRjHvrD+yLTm6M57lEtK87xoAHQzQJgjmUOHsBRdGM+vwK/o/UmzCM3/Nf6Xgo44wTNu9wMhfvDAeGlZY5OKYD0YwFCBIp1Wq3t+3m4ASaOsI8jm6Slanhwv9W0ctz0b5zmgwxbBjy1nS/3ATMhEhx9VWY8gdPCpJF8D9MkZhm065FCGIXroD9j3i6aC82iAM5DGRqVQWwxTUNfUVz68WieCGeVTQl+mK1QRANIRhLY1PuCDj4G78g2Tf93YLoNUNKncuuphpoumFFcFlas187lrcJEIeLzDsoOwmA+WZTECKU+xs0pRJPCouJHj8iotaZTO5hq1dNSrwH1zheh/EG4OXDK12TRa8tjiVkoULcVWeQu+nVSNawUJhlqNtTwmep3KDZhvzn6cIDDRUoGy2A3OqNBHo+acD+nYaQoTmWnvz3qqFhxkAyZ2zAMiIkdg4iQleoRdVdIWl5iXYheMMu77hJlucEyXviUFXF7mj+xPncMI0iabMYlsQYRxe82m8fnyPn8QsULl687T02u6HxMUh1wUgU2qqmXFztXcxb6VfjfVRnasc3nKUzgYZ+xEZtYoOVYuCCJaeoU4R7q6UZ7DdG/Us0rgJyNT9piFoLxDE9DoODz3sl9qrqHbGmuLgTxNOrTyuNvslH2QqKTjiy72bfGZXRmkuUNgybIbSd9OAfiXcn0p5lhvy2tQnmIPaf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(52116014)(366016)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2hFcJcyLPtgZjpdkrfpCR7uBKC5h4HyoNcsWi0t+Ak4ZF89vSWKHSS/QwJ4w?=
 =?us-ascii?Q?YVokgKLLvOUwr9xotrStJgSX5Y5VS2Y8X+eDE097nu803dvohEPq/0FPm9KK?=
 =?us-ascii?Q?d8MRx0aRtLT/gU46jaReFhGyDjKAC6Ong91ciuQaIpAKx4zu7HHlZUBOaWoQ?=
 =?us-ascii?Q?/txtkvH7N1T3YiKixV5cmJtBM9Q4C9QNa0DCdknqm8VGJuFW7ypogQNGOMCx?=
 =?us-ascii?Q?gu1F9FVBnw9UM20Kp/8IV9esdaS6ut79wzBtCvVSi5cVGECl4zF9tO2XUT+R?=
 =?us-ascii?Q?aOoDZr3PRqYCdhf8TwNbIopfeaSbp/2xWtCRiHuXavkmPalAFaC+GBASuvRI?=
 =?us-ascii?Q?Ya5QBadd4UMfr01YQoxAFCDYZ7QCoD6rZi3Xl/wFcM0fh6Fb3NTqmzSDja0D?=
 =?us-ascii?Q?3+TPJ9A9V3IkFX5Kh5IZbjBtKew+9A+yG5Oyavz66xGnupR3+Mh83dyrcbwu?=
 =?us-ascii?Q?WTODAGuKWHw5BW8YIyreymQAbLtqEjaK9LpOqB1/ZqqrsPmwLfdZguzobigc?=
 =?us-ascii?Q?997MqLhj2F1NMn8LwoXb8NuJIkijtIk3Fxe1bH2n7a0wQZWkRU15te5OPIOX?=
 =?us-ascii?Q?hzxdpSf6S6lsVqsU/L/0eDq1jnbhS5lT+XVs2j1t4L9KcX4ZqcuKQVZEW70z?=
 =?us-ascii?Q?mYqfaFn3RrimVQvTo5ECyc62v00KMuyNttcLqfB1/EumVscJUoTRW9lg76NP?=
 =?us-ascii?Q?WICc0Wfg/r+maNDPqwEC+vDivHZbVbmwZZ9j0o1foS7cloyYnWBmSErqYhgD?=
 =?us-ascii?Q?/xMTS9WfgD4HqYVp4YxWD65OgGPyIqbQaPANEUwUKsQVCgl3RUo/FFNn0WJG?=
 =?us-ascii?Q?SCS6r6Txf3ebD5DFRVedSouPPW8eIo9W0f0QEffUujcDywawM2daJwhrxFAp?=
 =?us-ascii?Q?85gAlRUIlLBIyT032ZfCQ8ps7rphKVipTBMkmYXI87J2HbSegZkhktSY7nSI?=
 =?us-ascii?Q?KTOdRE+TYdmNKbJGSExm3TWztCy1MqXnaiSyC2pjaZ6y4BVg9I8ATD64RfC9?=
 =?us-ascii?Q?UQFXl9F+WukQbBh2Rzs0OlzC2yf50kw3zUGkHOTeoDAIB5ZKaVG3axXJhLjd?=
 =?us-ascii?Q?T5BXCU1/AEWoz+tUgGXdOxiZuDTNSLuk3L4rBhB1739SzBDSFc7tifFZIZX/?=
 =?us-ascii?Q?MySJthrJI8XyBvBuqrGgPZcAasEflTqsSHUKTWvwqWSxZHrZmUPtVJrkip7q?=
 =?us-ascii?Q?w9fz/jB6QQhppvLCrL1i4feWrRvlNp66/wgsE4rVGgaqCC25RIPQdS+b0L/S?=
 =?us-ascii?Q?aiAKVncPJi6KlPClvTZ2Fhe8KkOu/MApuz8KRtbJd6/bjxTb/QyZpyt9F946?=
 =?us-ascii?Q?3yks5WOFJ4xLGRpuxYjIiITvx5FFOdX+vJun/J6TO77CiE54KFn4+YkzjTFh?=
 =?us-ascii?Q?+4b46jX8oSnZulpjqnfB5vG9qRSw4awUC3BXE085iTnSzc1mvqGwgCZGcSiH?=
 =?us-ascii?Q?qX7sL3OjEqhXbzKQ4pENlswwVZHL0oNiE69rgjOX/Z2Dk0IAgg0lRNIHydac?=
 =?us-ascii?Q?FDRDveZFqGRmoDg6Rqc2NC7EwTqi6eY7jEBiXiTDK3XZGlmGs2bMzEdEM0su?=
 =?us-ascii?Q?cue6ifeqmFJr6H5N8Fc4TbiTMnh3VlmZ1iRy/vCHLKBJgg8Xe6UWk0tuWtIC?=
 =?us-ascii?Q?LkHBH1BMVLkDi07EA5pZrNOaoQSY1yhz1OKiRJG743TJ7bYl0vi4tS3k8YRr?=
 =?us-ascii?Q?aAujgrYNwPe2X94ePX5OAvnxD9Vd7tKQrPHGNg5CiULAXHPooES6Aa7wgC+x?=
 =?us-ascii?Q?1xVQdzR+0A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66afeaca-6673-4dbe-4180-08deba031366
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 02:12:30.8512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hj8i7ouxnbavjyYRPO4j2nnpeQjDLSsQWPAi0vLhQA9XM/ZUjLuf24lHOqCc9TkTfjJ6PIjmjXrd++/GxA8lFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
>From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
>The CM7 remoteproc configuration is common to multiple MX95-based
>platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
>Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
>channels using <>.
>
>Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>---
> .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
> arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
> 2 files changed, 13 insertions(+), 8 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>index 7d760470201f..c94a63a3bf8f 100644
>--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>@@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
> 		startup-delay-us = <2000>;
> 	};
> 
>-	remoteproc-cm7 {
>-		compatible = "fsl,imx95-cm7";
>-		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
>-		mbox-names = "tx", "rx", "rxdb";
>-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>-				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>-	};
>-
> 	reserved-memory {
> 		#address-cells = <2>;
> 		#size-cells = <2>;
>@@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
> 	};
> };
> 
>+&cm7 {
>+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>+	status = "okay";
>+};
>+
> /* SMARC GBE0 */
> &enetc_port0 {
> 	pinctrl-names = "default";
>diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>index 3e35c956a4d7..f8760ac067fa 100644
>--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>@@ -272,6 +272,13 @@ opp-1000000000 {
> 		};
> 	};
> 
>+	cm7: remoteproc-cm7 {
>+		compatible = "fsl,imx95-cm7";
>+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>+		mbox-names = "tx", "rx", "rxdb";

Please not put mboxes and mbox-names in dtsi. Some demos may not
require them and boards may use different MUs.

Regards
Peng

>+		status = "disabled";
>+	};
>+
> 	clk_ext1: clock-ext1 {
> 		compatible = "fixed-clock";
> 		#clock-cells = <0>;
>-- 
>2.43.0
>
