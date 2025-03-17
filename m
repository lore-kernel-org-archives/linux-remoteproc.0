Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2079.outbound.protection.outlook.com [40.107.247.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB33241690;
	Mon, 17 Mar 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218318; cv=fail; b=lrXLBRgK3BX89P/ZeHPCjIYesdMkdSfPTRFw4D1sElwzzgny9XeLg7AqBKaWkfvyjTpufABYKrPjQs28H8/IUR+y7ikM2AYa7eiuvreWctG/Ig7jed6aLWsy38NuCHuGp18gTehlowJ6mVe3qs6InUHwLRMTcUHYV9MHEbno9NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218318; c=relaxed/simple;
	bh=JM2UZ5m9JRuP+VUOkofof1G2CCM36mwVcLA2ON+bey0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sj57K00lOUMPoxWWr6bHDGoArpahyEHfrfgkA4szP1EJ/sNl4hmWjk53AYQ9MrAv7J4wyrABs+IPHkdzQXmLGO+lJQaWO3GrMwuC/qvyZ3ov9AYONDQWv6kSCsTheiv2QJ5318VJCxbnD49R0lZfzvfDhhfmphCepc9PLHdzPM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YzqKznsK; arc=fail smtp.client-ip=40.107.247.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YzqKznsK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmpyQ0TlnDJ+TVJle0Yt7qoGTrhPuhNlHeaFa57JmpengfR3KtkbrWbbnoKKR/l58G8a5pL5tw4zH+kaB+1/pIJqrsfWZZBixCi4EpkgcZpoVa0eTnXd7wRt4bkjjihNEkoZok0Ou55fCz35Vg0Oe3CJu/O4b/d0KdlGTnMssKyQqCCkbEoxHqDuww5lQhdTHn+Hxsd5SMK1oTV3qw7L0/jDGR/wlCgSfLWrHB4Yd20s565wwhdsgo+OddDvR/IjH4DOUKxuUgAwI54OWKBgYNIHDXvZjHJJLJexy1FtbHLt+HjVs2+LWQ1M/oWzkJq/XmkmrYhD6hPYYN1BmoYdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkQ9G022dQOErAS5lqdV52Luo0RY28maPkrXYkVLbhI=;
 b=VpAXrtAFF2NYix9BJczEyLsSpkhXL70TAXyqRs0U4dCoD3NPFE2a4IobOwNfrKSGTDNALMbUCRibKUR/pf4+1qoU0z8Q6m2c9vhn04RFHpCODxtPjlMVfYzpbdZOjH5eBRlCAuLs8OHn+q0YzmQpF875TYcqHs+KFb85jzVqTRa4qN0U8pIZOBt9oPa7ox+2/khALQJuNKWUtgohybHvvR/hIIgqZgs4NxelRByRbLRjkr7Tm0AlHQGgldxE42OIhSITxDI6HD7WcXMkIXkJfj6St4cRdSQiiC/JA7JZFATxL6i5W+lzl3yybEEwAavr4J14DC10hYkY9/w0oNaJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkQ9G022dQOErAS5lqdV52Luo0RY28maPkrXYkVLbhI=;
 b=YzqKznsKVH5MNKH15i28ICB8j/FSPBqlmmwMrWnxDhQqpdZGVARMhRaweq5oJfft+5Sq/87n+7/0yk3Juh6XqLO9Jxn0LZsm978Kxd1TcLYvPXu/DeAP017WFVA4UlItz1j+L12dH4ed8RIO7DdGYoJSC9o+Z7Z3J/ZgJu8NX9ML/IMhwdvVSaR6LkGJoSF/SOTsfRlwmrPSQdLk4Qk4p8r8Q9kmp2ruzpwpMnSLZeG3+xquUBB0hWas3F9U+P2v+/MoudOa7ouj3PUdhJ+neUkXLR2wnkY0kUkac9I9T+oMKXMnzeMCCRI7AiXpWO7WSjKKKppi3tsUamYbZNNcaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB9513.eurprd04.prod.outlook.com (2603:10a6:150:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:31:54 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:31:54 +0000
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
Subject: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Mon, 17 Mar 2025 15:33:03 +0200
Message-ID: <20250317133306.2003909-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317133306.2003909-1-daniel.baluta@nxp.com>
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0254.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:239::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: 70caa84e-a0bc-4e03-2410-08dd655814ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OrVsIDDzRcti5SD/5pydboaNDVT2lQBBqTYfVebBC/WnzpnxedpkQWH5FHnn?=
 =?us-ascii?Q?lbWWJJvOVb+IU137RjGeAoxgKlOjBoekqDLA+SOcIZ2HwPEw2uby4U1nVwOH?=
 =?us-ascii?Q?P8d5eeXj+I+NV/GK83KLT22/l6BffJMqyoqNmzDCkiTvG73FT590uMUSXUQs?=
 =?us-ascii?Q?GVbogNaqh4WxVCo1oB3+xzJsGHxoD6ze5QSWe+QaEJQCOQT41uUtEopVN4nP?=
 =?us-ascii?Q?pNs4bti8u7dofoEbHlY2F07Dl9V5q1lVNJpYM6KMuk5W9oMK6L26IYnc3RPR?=
 =?us-ascii?Q?tjG9Jnl6ksYgXUqbSdL0qn9dq8t+XIO6qXAJhv/ujHhOhgfudvCp9A7wHxk8?=
 =?us-ascii?Q?INFFNVbKFRaJN7Oavh93I+m6uODMovouvZ5O2ZcEeKG6rvqmIcEgTuX+DWwU?=
 =?us-ascii?Q?4LfbpyBczsW8p7tnQxTE7s4OgfbUlyUTGGYRcKEd1c14TuXifQqYgJTzX92x?=
 =?us-ascii?Q?pNSCZH1NdG4dgqMuqGK+Ne0R2v4oa7mDL9nmjN33+p08Q/PSBICW4Hmw/wCo?=
 =?us-ascii?Q?H/Sj7vfCe2BTsdhHm7HMM3Gl4dyA+IDCAwiU0JXxPpC9TkiBNbEuVrukasCs?=
 =?us-ascii?Q?8hD8dBjdhhLGTj6m1HLuU+L8fdU6Lg+sD6yP+iNEeewUWqDmdiRxTJphbptp?=
 =?us-ascii?Q?hdj/2xzcVjeXhvx6QX+FXKBJJhCTXaAYglUg7QMFfgmws11O/GwNunbHiA/W?=
 =?us-ascii?Q?j6vmJPPDInpvJID5VkCmQIpaKMtVYeNKhkhQWLpL3bo/RxBsXnPIOLebm8KC?=
 =?us-ascii?Q?NA+xwic9I4Nn3QO3x6PCn3vqW21S4UY+JcNIo7kuincmV/fpvKTjhJQVxZDf?=
 =?us-ascii?Q?kCWfWCvlAIrOrBror2B4Y5XHWVQxWuEtXFOJo7Dgck7+dW8MCSg780r7OgUU?=
 =?us-ascii?Q?LivAdWJej+MD705PLB8Fu1v4EaDfka32EeZqysyEGXnmsW6czeIyd/+dFk9K?=
 =?us-ascii?Q?EKHw+1AfhgRdLC8I52gt0IMxdw8hkvwy+1klplHe8T3cWguheIzY/jLAFYt5?=
 =?us-ascii?Q?C/rfAXWde7Ytzm7cj+Fw1ce+a/cIBFAxyS9EnLRtSmPmTp9iGdPckrQrhQxw?=
 =?us-ascii?Q?NPXnF4eDBTktTegLj8fACFcKBSwRux8POkIfI2d1VbJIzYsSiFzPudkPEdOo?=
 =?us-ascii?Q?6WULgw2LFc845iWwZ0irBDzlZpqIzLPXkDVUTiFffm9QNtJzx1YISvsPU9fK?=
 =?us-ascii?Q?ILpNVGodnt4LxRRfh0egp+21nMbLoqhZdk765x8yQsaazO9FaTVP8WLgvWWc?=
 =?us-ascii?Q?S+qURumkTBt/NL/3/ltMmL9yBu8r1iDbB0GWrsRoBNXCY4Efy7TEPh9jnuaG?=
 =?us-ascii?Q?0IH+fpjTutOev7D3Y8/OfFGqlV/99K0OUG2cindSZ3nX2zokUrdBRVsy5gE/?=
 =?us-ascii?Q?/GKCKHyxvgl6dledfEWAjqE8EN7Phhb6mBX4fEhA150vghXwA+Seub38HfmY?=
 =?us-ascii?Q?Xo7vfgVLn+qzozhfzvUmf2/kWLcafR+l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P2OepZN96atyhdyph/9X5sg+SfQTshWIvQRbKd5Y21XRaDPGjvA2+c8xbjac?=
 =?us-ascii?Q?p97dO5LYygnqgOzuINugj6Hbm8xYoJP7a/eHMTqI8cocIhmQF0Xk6TMiB7dU?=
 =?us-ascii?Q?mVsrj+PCzzyZz6Gw+ejcIBqK5xJgMH6OAe8j7pf9ptJKbIjBSYq8yfhh/yOW?=
 =?us-ascii?Q?KUs8xhnhJMGFq6sKunDIAi6FANmlLJS1wpDCUZQvCW+pAssTH3yzKit8uRyB?=
 =?us-ascii?Q?fgRLAzMggMWrEY8gYcozdWxzqLOxAwcdD7AwmHRF9vo77n64QXJeRglS4ukl?=
 =?us-ascii?Q?ms2Qokb1L/9SZdyzMoiCc5wP8njX83AVEB1EvWt0rR614w9l2NxVJZ+I0h80?=
 =?us-ascii?Q?529hpVAtHNTif0ZqZfKPVXaZBoZf4A5Xkd+m8J7JHHw7Up/aj/bWfEvbYz3P?=
 =?us-ascii?Q?mn+YqHIKH8Okx/AOnv8/cfRuwSpItZmqu38pFFddolarNuG3hH1VXNDY3hjj?=
 =?us-ascii?Q?5RRuRgJSgSiauqRas75zjSg2z6vQJ6/1iKEu8hWH7BIOS/VCoBxndoEw8kbs?=
 =?us-ascii?Q?yFbAxDaO/9+4uWiMTlqzu4ouNRC85xvyICogK0ptJ8KbTKtlVbz8KPMbhIfL?=
 =?us-ascii?Q?LLY+3vmHHz56k2UKg1Ps+nTIGiXXWW7L5d0zI0cHIR82kZmrwoRPD69k2sGn?=
 =?us-ascii?Q?Rh/PIx7B+FYR9HtDjsPssccullwnPe5k1lX7fPlVDowVPPIwf2Xrv5yF09Kw?=
 =?us-ascii?Q?hX2U9MJv8TAazZiLFS0Es911cZn2IkOfzW457oJvaCDIMUQT8QxgkN2dNvR/?=
 =?us-ascii?Q?OvAoH+NVJsHgDLzHXwg0FeIFQELVt1c/5+JYzehXmXlEgDrVlS/byW7nrIDm?=
 =?us-ascii?Q?Hw2LA7MyrJAjxia2CdQylKCir60QgUiqcakH0cVphEmjjSX6248dIuZg5hlW?=
 =?us-ascii?Q?gtW6ZCJHE0VW/Lwnago1u9e0a3pparDtXcmUeeFWrfEj1F9QBJLtZHRqWK5v?=
 =?us-ascii?Q?K/sI9dWvF1QILLn6FLYQmJAfYWLb26AI3fp4NpazHZAHyh51lTZIqTb9V13/?=
 =?us-ascii?Q?wlb6qAxody0YlpwZ+7YWgzl6MQ6GLTIcRPeJsecYR8xxn53ql78Ofyxwhd19?=
 =?us-ascii?Q?IbkPq1DT+PIV+lsFVyxt5TgljVQNZHmlpUFKugC3I9d+CZfiHwk09pdulDFz?=
 =?us-ascii?Q?QHr2xwX2Hsxrm3EUvg50mGECICyFDLj2G1yVqP7Vt6vTT3HPwYBLt3zKZDPv?=
 =?us-ascii?Q?sdBYsgt1nn/Ggg1dzcCONqzocBhxKeeHBQhAULNt4NFUM5mhETpSMjSiIrVs?=
 =?us-ascii?Q?Kh9CwmwSuUiRPmL2R8tXJ98f1GwmVQdF3HXvnWmvsievQihikkCgPdMF+juQ?=
 =?us-ascii?Q?VRkZMRhpF3vDnk/BEHuOjS2s8JjZZIKksUgBdS1YRV3iCumZxWBmNTHcxFe8?=
 =?us-ascii?Q?YOVMJat1ijVijHONd1sw9iikqj/zMXYDg5hfhCeKrMofyhoRE+30Nc4xCTCl?=
 =?us-ascii?Q?LIp0XTGkwcBj3x89mdm77jpeWQDCLCoYzC7xRJPoYFED2drTf7cSH7G9wvTo?=
 =?us-ascii?Q?efYzJt6miIrl5N+QIt1vwlJTaG8tF3oijTcARVa+VU3pVuGUp1rHxSpaZgh1?=
 =?us-ascii?Q?W2GQQX8jjV5otzJhesLVAAjYl0t+bAP0HOBEt01Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70caa84e-a0bc-4e03-2410-08dd655814ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:31:54.1843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGOhBQXIVRVMtakGSUfqIZ5u3rqM0TYFFPAhFdKLfLHBqCnSZS2efX0Y9LU5pzFnT81p3P6Di/PKat7jGMz20A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9513

Enable MU2 node and add mu2 root clock.
MU2 is used to communicate with DSP core.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3b725fe442d0..5b443fbeded8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
 				reg = <0x30e60000 0x10000>;
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				#mbox-cells = <2>;
-				status = "disabled";
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
 			};
 
 			i2c5: i2c@30ad0000 {
-- 
2.43.0

