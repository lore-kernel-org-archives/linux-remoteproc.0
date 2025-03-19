Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2051.outbound.protection.outlook.com [40.107.104.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71861253B74;
	Wed, 19 Mar 2025 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377538; cv=fail; b=j7xpsB7VeB6adCXTARoxqcn1RrrfANkPkHWk9jkdnbzbXr9zpSHEgmbVYK/mKYsRt/0f/NPrCk2UiORr7b2AxMQsyJpW2KZmhxeIqMCZedsg6b3vbu75dcMpcCuWbZURiq3zadnl6Nc8aSENfvI9r1tX4cPBpNZqt5JiuRHTAJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377538; c=relaxed/simple;
	bh=7JTqWleqVcwGDJKYZYDDaRq2dcXv1YIgF9ObclJASjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ia3V/uV4IxrWj2ErZkf8Yx5Q6eKd0ohTfWZbD8DaAog4pTN9N6oXhi2W3A74QiaeQwc3sXDMQtG4T1Zk/WHJCyuD1VUpW1ZzswAbqrpYGtQBeN8F8pVN16JNwsZQAMiCSDogSfTmQPRqLFS8GrqEUsLxjK0r2PD26DcYISLpzaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D0KnN9pm; arc=fail smtp.client-ip=40.107.104.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D0KnN9pm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PhHT8BqkEcUUZZ891j+4Y/OZivg6gtpMZAYOSdgrHHS5EqYM6XG6kaTkQtIrMdM9zDK0E7877PDq9IKxiTwwR33rzEgApfW7nNMXpadp8iGfLvXDV2uyFwyioaGfrHn064v45NBmE/y/WKiVUbVoyYs6JdZdtM/H5uUqoBAh9MYW+K2FORgEndpysuigq8+rz2NBnUgoFEAg8BDP3obSHRE3JGBKvQB7xJ5hp7q660gmrXJScGuvj4MbZ25vg7+eNcJ4UiEIJQh8nlWp56LQo/hOT2pGtKyoFbm3ot4DWdlOU7JRJuFS3s8SFq0T3KHd5ezrGo8ngjSnzmSlrz4jAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTwxm8Lqs82Y4mF6P8gKIWYJNFJaz7PLN1bJ1jPUx28=;
 b=l+koGqN5vPlCofu2burpHC+A4d5WBy7mN4fLQty6U8WI4UtSp1i2vTtFfaKv/inYdnG+nakPToTbRhPRuiuuMLsQMdN1h8WXK4g5pLhGZz6qTfD0+W2lO6DqLhBGVg2JsDgWvSK6Hnqiht/qpYWWSOdIk7n+GYYJzOWsFQ9UDJl59EF4Meykk5unFvt7th/F9UFdflEpcFmyOWSRlFnnM3JY0ntWmqjWYKrAY+opoBxgk2C/9OgRMzWJiJY0qapI3Nznsp+FQ2kKST28S6DMVLFV4p8QOIvYUKgWqwpJjBMZ5h3eV0KgCXBGYl5iYqlD2K+Q8WL21EFg7Jetq7Fqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTwxm8Lqs82Y4mF6P8gKIWYJNFJaz7PLN1bJ1jPUx28=;
 b=D0KnN9pmdDnjugYZrCVGiEjAjOb/iOIrh3g7USWRGY9nbIIWJv4IFDPtudMdwryBcyNisx8JbHM2dmNCm0Mi/DRxkLtt8YpfsRF5chiu+vY47ykk+l4AgIOFx4hnixcDBUom74t+EsJcEEmV5K3/hUJ8ytYkBf6SBd9ab9o2ZBWIdttZoymWgptrPeQJ6nAq+c61K5qte8L2/GP1OVlX4DXTi3f/689sjZcjzyuvCY6gOcXFTfgNbR9bhSipKIMXD8BixxiQ0d+Dy7dX+LB0PfUQmXljchM1GvFK1L3/zJmyX6gR2kgcOwfAwgRArXyQgC7sTsY5d/fgOjOTJLblwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:33 +0000
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
Subject: [PATCH v6 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Wed, 19 Mar 2025 11:46:18 +0200
Message-ID: <20250319094621.2353442-3-daniel.baluta@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 768bcb22-895d-4f27-10b4-08dd66cacaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8cE/Df7TLuLHTJl5u/SqGpAgapbzl/X9/XudkANjVLkSWb4/W716wcQKIEJ?=
 =?us-ascii?Q?Tgw9QhUbUxfaP/5apvzixyrCdrpEwvzxEPX97MMDh09g0v4zcyGjkO+ZDgQv?=
 =?us-ascii?Q?Nd08yo/DeYMjxRJubIWKuZZ31VIZYI3t2aseInXqedHIgWxAISd9zEPjFOJ+?=
 =?us-ascii?Q?Pwc0Sd2/YLtYluXKosUPBokjw3gHbzevSyeZDCmw0TUrwRAjFzSG2EwtnlEo?=
 =?us-ascii?Q?eNi3e6TYm4Na/csLwR+uCVVTgKZupLy7/J9RmIH0FAf55vDxylTKX30UWacr?=
 =?us-ascii?Q?IWFLn8VA2nHQYznw1gTtBkjks6pefjr2xm/FevvAiGsGitLQHbiVO6u943UH?=
 =?us-ascii?Q?s9825/yAYasvl7ZCDKTrNu6z95rP1GnMjAmBU5BLbd0yhr5gIdgtBZFxw9OD?=
 =?us-ascii?Q?ox/oQVDK58cjltIoZoDLLiPaDArH/A1DhWUChQuPzK8689xV4HyXduu3yMFJ?=
 =?us-ascii?Q?znPPuH2ftNUSnDCL7xIJRM3saQmKkq7UkYQAuX1BJfR1b61R/8JZmNvDlqLP?=
 =?us-ascii?Q?2H61oQ8rrHdKASBXfIs+VCyCZcklvmlfY3UfxA51AAbF0MlTQ90X9K4fvaTQ?=
 =?us-ascii?Q?Xh72rqe866RHJyR3q8RQhknjs8tXmbnkT+KUa/GqixrLNSiR8M/uHXMk6DLL?=
 =?us-ascii?Q?fzbQMEqZjuauG+/PiobO+hwkjk2L51hBCBmxvXXS8hXRamEn1UzVU9ZGiFGL?=
 =?us-ascii?Q?x6yLiyQjqGKpH7DFxD7cg/sMZYUabe2yUnLHmwXm0SImUVQDfQ9fAM0JIeuX?=
 =?us-ascii?Q?1RF0JkqDRSmreMcnSjflUpm9/0gTT4nsS0UbFIJlOuTBtWdumotYkYNm8DbA?=
 =?us-ascii?Q?KkdiJLxbMpNsiys01ay8TFCW6UzacCyq5Y3EYd0g1/KV8TteyCRJawDFCRiU?=
 =?us-ascii?Q?uZAhIGT3H73wXpSNjVWAgAFflQuaG0B/8fy/mcwKlvbl0Na0KIpLsItLkV4y?=
 =?us-ascii?Q?WFOJBqY2PrbvC4Nys06hszxJc9AemIhzx7vFjZ9VrS4kAx+GLDgv/5Ag1d6j?=
 =?us-ascii?Q?WPFtruqzQMaIQTwrQHiosSrcM+lZnBnwzj2/3en6G5E9HfBvMj6Jl4DzA878?=
 =?us-ascii?Q?g4ncNP2X16MU6O7PVR0PWlve8a6a9KVN4eUfpVQere+kSTNNKbk1Zs9s0cRK?=
 =?us-ascii?Q?BLIM3fYw5xnTmj48/glsUTjhRKxNGMvOp2N5e3UiQrR8ZvWu91bMnx+uJTVw?=
 =?us-ascii?Q?3pk+VW5MAKKnian3fkRX/R93ExusCwr7xVtbfLGhxCMBcHlYXbGUYvBEyNfh?=
 =?us-ascii?Q?YFSsW2X0ssQBZlySAxyR8Zr36sq6iu6zhQMrx6t2hn3lglVW/ZMw6Euu3ypH?=
 =?us-ascii?Q?A9v2Hv7xoRpDk58IabeabtiVLFQi2S3QE9KyJrSGO+vkkPx3sAvpbaZLz7Yy?=
 =?us-ascii?Q?aK9EJo1S+/N3DlD2Mo0auIZJc7LGL24fEMDIlbzom5ZXPSezh3M0LnaTU55x?=
 =?us-ascii?Q?IDWWnxgEANnJUHKZFCpETfyyddTmSKVh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XxlOlOryoJP9tm2tWNlFUKBGWTdCLds8toVlaD4NdoZyVYTKK2cJTtXVHGGd?=
 =?us-ascii?Q?gCRc9pGrVgZODHsmxP7suxrshe1LLnz/uBR5+adwtC24uK4R6MSPqHfI4DcF?=
 =?us-ascii?Q?FDNWR/xGgZO87IHloaGZVEh0gfY0KazcV/KKp3h+xJNDs75nuwXF7qAXb/MZ?=
 =?us-ascii?Q?sK4j/x2negKT4mKfKLxn5aD7zC8N+1TpDRJ6X7AGG4CqVNSlyc3d1E5OOqN2?=
 =?us-ascii?Q?LjRrWC3Q8y4A6LJlKiIRAvU7yEXjsAjfEal7h4ANEbbIEEMtlmo5G77/M58X?=
 =?us-ascii?Q?qFPLZvSSq/ZZzHFhsxaCLtSebWkOzV0AZWoYDc1C6c8b/3GK0a/U+Eo5xfrL?=
 =?us-ascii?Q?TLLgI8OItTkIjCFck7kR4ZVdDN+IrkcxNaYglnF1GZxMrcJD49QyBWVeChxr?=
 =?us-ascii?Q?sESOD2iP8+6SfeWUaQgXT/MM7JWTEpSf+O4u96ujAloyDmR2l18xNQQypGUO?=
 =?us-ascii?Q?dNaM2G5C04Qw0TXlHKSCGzCw+ecRVQH0Tlg5jxiZkmJ/pjEZa4SU0DmJt/OR?=
 =?us-ascii?Q?w7FZr5WpeoP7mKm7tFfeAamMIDafGib89hebnh07UFQ4YJ/WppYYbGGbXuWG?=
 =?us-ascii?Q?vTnqtPHywbWTyWwMoYoHRSkDsoSnMbiYyP9sFl5CyDEVp0BhqofhFcwX8sUo?=
 =?us-ascii?Q?DqE1f4luuFJJAaClrPN/lBw06fIzg7jguBRXiNMhGjNPeGfKtpMxfHiekhDw?=
 =?us-ascii?Q?/1a+Ox4zQVpXC6p5TsDfuZ7AvMhrFgI24UIlS+4b2qu4sscxK+EsCVkFaEtK?=
 =?us-ascii?Q?v8IpvjtWBLozEJOit5E9M7yBAT0Klr6j/d2bSavY9yM6EPEwFwa2ooGyAFLA?=
 =?us-ascii?Q?k6Jn2G9f4n8eiOGkpWbFQqG7YxG7/gR2cboy2k0YYgjqnsIIGM6wL3t5HMOd?=
 =?us-ascii?Q?m8XDZEwO0ZNAKwjVOVJzVGFCi72K2g6LW66mfLM5/AbYcY9LgS0b+1dx6bus?=
 =?us-ascii?Q?Zemj6r30jjmV/LFx9sv91E6eeGOsytgfiIzXHCSs4OKSWaFLjQyZ4nytXMRU?=
 =?us-ascii?Q?MKvUUPhTtwBa1HZfDir63Yd9uG6dCKKDcciuIoi7Xn8kfs8TolWsHR5MuY4c?=
 =?us-ascii?Q?2QSSmZXJThB6WfKjdHX/lv61qc+Qm3Q/bHlVQ+IhXRmKNJsocf07NMhsaaSd?=
 =?us-ascii?Q?mNE8bK1hLDUw4FMG2RxZ9HhAaKWaPBwbr9TM7hlPEJspVOecpuyQc427wgyD?=
 =?us-ascii?Q?qZdu4Xz+bL9Xspd3XJIIQsspnlq/R1i5nPC9vSirlQiuWQMd466kfk/nInD5?=
 =?us-ascii?Q?vq//K1pPFYXTUD8AHe5qvAxcMIH/KUegzVZQWfCBzxXAKsZ/8KeHtLrSyF4v?=
 =?us-ascii?Q?uQ+atd//o+QZ6IrHSJfYx0eRpmrtEoRkBo4QNdEpfEPBau6ronz6F7vO7nhp?=
 =?us-ascii?Q?+AUSZLixFP/Tx4DHLNZ+k1qslZ0jYbGcGexYiIhdhTbCrD7sIWiKRWhY6kI8?=
 =?us-ascii?Q?WpmHKZJ25j+V6GvKnKvJDkITLvb/dk9Ur4oekp+bmlmsY7s6FThXn454q2pp?=
 =?us-ascii?Q?N72orE51RP0MttBLxBVglsVcROthRvNgBiXu2TXDavFgaYGoUP94mtTLBEZ7?=
 =?us-ascii?Q?PquPn89ytfMhdhzXDMkpUnMB2uB5mgfbn1whoaLu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768bcb22-895d-4f27-10b4-08dd66cacaf8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:33.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rgoweUTnXDzzrZpF0z7zwrSf27mH3cwsgWjFcu2mwtrdB3KE+OGyxiY0fjDfu59D7I6N6xFB16xwejAQ1xDtIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

Enable MU2 node and add mu2 root clock.
MU2 is used to communicate with DSP core.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c26954e5a605..d2fdb420f2d3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -690,6 +690,10 @@ dsi_out: endpoint {
 	};
 };
 
+&mu2 {
+	status = "okay";
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	clocks = <&pcie0_refclk>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3b725fe442d0..deb98f03180a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1254,6 +1254,7 @@ mu2: mailbox@30e60000 {
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				#mbox-cells = <2>;
 				status = "disabled";
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
 			};
 
 			i2c5: i2c@30ad0000 {
-- 
2.43.0

