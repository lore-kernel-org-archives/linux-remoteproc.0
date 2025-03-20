Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B5221DAC;
	Thu, 20 Mar 2025 12:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472535; cv=fail; b=sO0G4nFCyTXwe0Rk8HLpSPyule5ocU3j9LVoEztuYbgr93kB7k/xg9dUc7g4Sb2gIYWxdPFItWBIEJKqvzpLYLKmnKE70ftYqhwP14CXAP/iE3AJbZO7AB087nUHd8jq8NPbrUVEGwbD6n4Kto/MwnNMf1Qr/DrpN6JlYAI2t00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472535; c=relaxed/simple;
	bh=iC84Gy1NU8Zdy7dSkCIg4kB0hcJerlVCqT6HrzuFQCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rX5p6YbIMMLyemKkJ5c7xV6D1DcGmTkZ+QudP5uAplwoXoGTNvQvxcO4czdRppN9NFIinpyWZ1nD1VRV7rC/RnRpaGNPfm+0p0yTYeHrU4MdL+nYQkmblD0FoOtTSp2SM0eq0zGZOx83QwbyRR9TAOnmecSCFkVrS1UBKNkDz68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D5cL/A4m; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D5cL/A4m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNd3sO2SRe2chUV54FAiIbVFePVdft9cL9yQw0XYRCrFc7Fk1X4BmxpQQvqIj8bvHpB60KHLHa9GbBD4snUMYaTL2RsuSba4TaFmxw7TD5fkVFcB5ij8XY11OobLW4B+XzDctL0Lpd57Po5r0PbOPlcr7qV+MfIpysXyBKO/547gcP2n13SKJ9etS+BysbeuinjakMnz+HTT4hteiEMJjRGd5YPQT8gwG2wFhT19buE4j74s3gASI9+L7JE06lqtOPoq6rYnYmn7ktQZDHyrRWEsucz9SWx7hF/5Fl00npsRvWW3vtSzTpsr/krCWrDN1Ako+QhiNsgF6IP584Rdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfx44Y80xnC+mttMTqtvcCuZhbHk+NQrrc1zsffvauw=;
 b=AAF+Z8kIIlwuu0bkuwPap5+m+WZhkVT4NCGx+YfsVB/3vIhu/Ic15yCxvlF5gOry2gfTd8k88BuMoZlTNKZLFwqAZu8TQIWM7hAGATGr9Nw4YJtc71Dl6WdY74yoJWwI/8cUBGyJ53C4KQ9LH0MHIt64AGJ3JBj8a6jGh4poKjwZPgmmKJysijODuXabfocEV5GbKu/Dg+7tqcOfXbaW4AlC2CwN6KA+7fz6t0OXGnKu8g/6jPv5w8ivKqC0m7xJ5CZ+oQdvG2bp8YEoPqX++ghny8Jrt8vHZ0k0ldOitiYNychTMJN2VE8q3hCK9y2CtKFTnnoHB7vNz8TLdf+IqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfx44Y80xnC+mttMTqtvcCuZhbHk+NQrrc1zsffvauw=;
 b=D5cL/A4mDvEUAJuzgYXAW9bocN2kLmL8Whxh08e/2Tm3qJMTKB2imRFO4nK+p6kfGf4PlapDO6miC4EdkssWWVFfTe6MAeJD/KQzBZ+3h6+8MLgLu7nyAfwfOoSYeri5erQ+/cQ+jX3w3v/6ojBzRznK8Cf+Vl5f/BjTFaa45XN/fi2+JlEqxk408+GyKeBLlAg2+/7n8b99RsECYpMegMkHb6mE7Di1mJtBZXnzGKCwe7nWthDh9N1aULmoEFHlbRvEox/ACyOwaooykZdIUqiYbeFgTmmmVj2+TG4GfQs/I2wnw6+9AF7Rnl+2TycEv3T3QHiVO+Cya0eDPW9P3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:47 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:46 +0000
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
Subject: [PATCH v7 3/5] arm64: dts: imx8mp: Configure dsp node for rproc usage
Date: Thu, 20 Mar 2025 14:09:53 +0200
Message-ID: <20250320121004.2542314-4-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6331c44a-ec0e-4245-8ee5-08dd67a7f755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iAJZVHSUPhxD94CgL/mci6he43QQ6obn53RkcELQGqq0SP+m41WXDH5ZdFUQ?=
 =?us-ascii?Q?Yqo+2nZoA1LvbNdb/v90UbPYwgFaVCCXUfleCw/FtPLaw9m5bBOoh0BvcAkh?=
 =?us-ascii?Q?GoypZbwW5Q+vdH9VdgJP7/SU6H2f+blBIQO+CBJQhxvn7X7F99n/CWCoBTY8?=
 =?us-ascii?Q?UvLhPQRmfEe5pcFRkM0Ip/v99rx/HUKeWQBIG+x98q0nkocvJ+Hglw8q6jWG?=
 =?us-ascii?Q?Hf1hvO3Vp9GSzny0Ca8d1k03IKR7Y5mQfTnJnA4/KZeadtvcFn5weygdgYKw?=
 =?us-ascii?Q?xcIROD4ilLse8Zm3JM9TCnGha6LieHuyBCP1Xvr74w0qx7Ip25N8vLUFWY39?=
 =?us-ascii?Q?H5NdDFrxO1M4Hs8GH3R2Sw7m+LK3zHl6vXLB0qZL6qfSwVPNQbiWWElmPmyR?=
 =?us-ascii?Q?hCsUlZCMFNHe3Q045ZSXXa15K+3IRhjWscZPgzb24x0AB9/Ez/hVffEN6oJR?=
 =?us-ascii?Q?ds4HMa2FiuT218iOFACpRNei35Fysg5lp3yXiajdBvUQifenrxtWm0fXcT3R?=
 =?us-ascii?Q?wadhYzkh8KMO+2QqEmcFHhr+uUYYkf3H9QNhb/hMMGyc0joQhELZJ1uk02Bh?=
 =?us-ascii?Q?hyiVJzJvgPL8FRRNzCFqdYwHLdy0od6vbkJVXnvXpgWlP7ylS7e7NpuZaONn?=
 =?us-ascii?Q?N3hRkPKKt2pCTOpYg2edU3svkvrRKe/RsN3jSM/bS5/9G5n379EmA+FpuMJu?=
 =?us-ascii?Q?Jc/BO1eU2ps3Lr7b0tGXqGZ3rhoQm+bOkDoCob92QNeM2pA4hlmWymfVW7S3?=
 =?us-ascii?Q?QxERo4VeeQ0l2Q9UFrxxDOTQZUN4zIF5KLpFURJoLbluqpnnV5Mx2PY4D8kr?=
 =?us-ascii?Q?fUr+NdzTq92RLwmGS3IGoJ/MXQE4NNFrtUwEL9flxM2kqI1Jb22jWFE0Ekxm?=
 =?us-ascii?Q?5KYqCgdm9ijEvNPnMNVOoO62OWcaalrlCTVFCTCqQRXUteC8zPa/BajTyE2C?=
 =?us-ascii?Q?vBX+O9PQB4H/rzucY9moe7Kp5XN96wiP66CY2Q0E4EjyLG0c9TKHhqZLd4aN?=
 =?us-ascii?Q?uv+ODFZrTFtM9EtLb8OC5cQ8PxlMcqBTcA/l0iBsQ6HMbbe901kapTWKeAHr?=
 =?us-ascii?Q?xVjwkeETGsar6qHjrqKj3xmUDVTZ1ZINbi7Qdoao5TqnpTB6yIMu+ufPz+h4?=
 =?us-ascii?Q?apUfKX9JU7gC8W1FL56Bbbxqr61COQDwhDZlHWYoETL7V0epoCCPwX5oVOlc?=
 =?us-ascii?Q?NuLZwi1Bu5w8yQI8FoZVGYyEhrqdMQZ2zICmj2L6NYF34HOBWgdJXGNqAlQY?=
 =?us-ascii?Q?liYDLPhynN/epCfnduTFI6t+BIqT8Zv9HRixM5XY5tcvGwD5bBEhcQVIfsu0?=
 =?us-ascii?Q?rYfw3t00kwJFgA1EzxAap2S+LUONw0yPqeXjfbOXa1ekiJGhjc3SdUNwpj0s?=
 =?us-ascii?Q?gLV0cqXogu3gmn4Ch5DrHRqb4TRA/iV7McWWhQT9Ddc02DxC5gdyJY2y8+kC?=
 =?us-ascii?Q?Wf/Tt1AUTAzctP1ovAwHTuaWLTHJDXP2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rvJGkZ7HqTL/T5atBmEc3IIDG+r3hkRlRhzOS5jE4KC8FoqmQNOFcT0PJQHB?=
 =?us-ascii?Q?bxDuYpx1SQ+8Q3u4S5RLVFjUWzOmQ1NDrBt7LoA/UI6cQiEZjBWkAWD7Jq7g?=
 =?us-ascii?Q?AxRI6G8FQaeIp4BLzvlE19oGYj5U28NVaMO8PNfMZcAibgqdUgFBkbFTCKFf?=
 =?us-ascii?Q?T0iaoqh2suwH1mqIT/IvaaxGj6LknsZqU8ya7ga4RNh6V0UQQL1DpJPIC46n?=
 =?us-ascii?Q?tN8H/DP7suqKErHE/Ej6htPCdJFCdT3KeBBmA3eKBrI6ahMGxF5/vZtCyqTE?=
 =?us-ascii?Q?bxwgjtOu2shl59xvKVMdQ3iSYKPt/zLjPIdVE2+YteyE7l6ay9b8voVDZfI0?=
 =?us-ascii?Q?2D/FLf1+q/kVXFJwLfNpCrnmmfY1m2U4EB7qbIyGE4OBV2FFTLFzrxN3TDYx?=
 =?us-ascii?Q?8kvkDJ12z7slh3gQN/RzDgLNEshJD+8ZRD5vm9Nzav9ayBHCQOqbBM1ED9dX?=
 =?us-ascii?Q?qClCZZb7hIuGWGWKOBKi5cGt5lb8bNtEu6Lrqwda+9HTIYd50WHHQPXrbSCE?=
 =?us-ascii?Q?MCylQsm+npsLgPmH8zARHowjd0CbO6OEay6LPw7WFTZOamKC0fKe5nCfRbuy?=
 =?us-ascii?Q?769+mKf3qydeAZg20rpXFxi5UowzvZDI9yPxPqKvBPjhJFG+VGeLsFNl1xsF?=
 =?us-ascii?Q?o8bZYFpTM2HeZgsVldsx8Paymp/v4b3eJUGts9yuScM+f84DbgG52MPHrsvq?=
 =?us-ascii?Q?jVgoEmWO5EWDVq9h3nbUreJKsrPzuZf9Kl2vuYhCMUl/cB3ZBVUbKYdiQQPY?=
 =?us-ascii?Q?MAM5AepyeV7sowVaLGu8HL31O9DFl9946lhC6Oh7aNIdExYYXi4cjUz91v2z?=
 =?us-ascii?Q?MuTzPm5ugA+X4yHMVTl6yEMkLsbAyXRc7sACLN3LCqDIVufJkc38UzcyYPDp?=
 =?us-ascii?Q?LFGJOVDj+Ac/ZYmfVDEQRaaM+oyv72oQAQwFvU5HUndYhV2OAwt5WuQVqhiB?=
 =?us-ascii?Q?Ed4cSTbvn7h3iFFntij8+5CxRMf4UOyHFmCr5duMujOz+t2/ziFSJOHwO2vj?=
 =?us-ascii?Q?nN5oDR4LoSVm/D8kC5YZR+2etz/OxnIGCly43B5dQgRyzlSCDO5sMGTAv7ev?=
 =?us-ascii?Q?cJNIGUQKEMn/G42qHZwiRXHqWOPDgwBO5xYptHoAzbsCUMObLsGabXnoNapf?=
 =?us-ascii?Q?+akfazzmvHtuLHn/L+qwuR2DRxz+bGFk24pgXRQnCVb+ld8nPGnrAQJbsmud?=
 =?us-ascii?Q?qPxfsn72qEoUy/usd2iv6881VPaLCisjPu3T7qAwEV/FRw/z1VRPyifpPWgD?=
 =?us-ascii?Q?r8rpK/74KumvMC+tdQbj6HiWj7EF6PdPkEr00CDmjVOhghe3sI/DVy0YKclU?=
 =?us-ascii?Q?En5nWSVTSk61JZ+LbVJjhhD8PEgvTw8J58gUp3mUqcC514l5IlkPHwvyU7Ij?=
 =?us-ascii?Q?GKf8GYy44Y+w7iq6rAaR6SJjkbHFMpZG/XNKr9YrD0AUWV3QKY0ZqfHKSzNX?=
 =?us-ascii?Q?lFwqzRP+P5AqTSy7SEQbKS38vILgRTn+TaqSyj9lRsZNdUj+/q9sMX0mMLJh?=
 =?us-ascii?Q?xr4/X+j4JD5IZOKH8AQs3ni+/p14GQ8DKN93Cr2uXzTJJLtRLSj+xbseEMyo?=
 =?us-ascii?Q?46v9Pg3P8eHHErz/mRhPLvRHM6E/JHokD+Kpm5rk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6331c44a-ec0e-4245-8ee5-08dd67a7f755
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:46.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/nQxMHAzCKNFZHtfGMFKTKggHVN6fl1IqJs367XW3v/lcxO5nsens6IU5VCZO5ptblMbzyrqKGMXrQAdejmFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

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
index fc0d244cfd1e..708d3f61b4e1 100644
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

