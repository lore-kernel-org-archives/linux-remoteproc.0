Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8673C267B17;
	Tue, 25 Feb 2025 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478789; cv=fail; b=Rh+h+KZMILqRwZE+DyQyDq4ovoEyXEMBWaMt081dcH6fDgtDAVx7icoqViw66zniUYJl40Clhd4UktsIlp4zo/2cjcU5TAc7CUxSX/3uWM5AXw5kLeoQrpi7p3/eEk/qDYhxqS0gcUsPdACNCYRxbGRI8tRySBDGlERv0xS3jf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478789; c=relaxed/simple;
	bh=xqC6NZOQnUdZ10rU9WX/F/1yZq2eAQXO6UBI2mAEGeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FPRg3/UwKNksheKfmWj3LZIMvLbRxHWSdg3CeHr5W7NYWPRkwZBojhnoEAeBSmfO3tdgSiQRsLDmvP9b6/rOz2IQPG/oJrdgO7759PC/GFyyyTa71HLW3Nz2wszfB8845gSNolBI7Ly+4v2p0ylggXv/A/vSGMCK9uym0mqEypg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LCGu4WRT; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LCGu4WRT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExVYrUhf8Fwb3HmBO4OZhJFmOpQGf+8WIuxIZk0K+LwJG+8KM9sgq0RaTHL4mO3cPCr8d1zB4FYKQPlfHVZVqSL3CzVZH2kp/5Z3xzp7/DKn1Md8a4S3LmVPjRvGPOLTSX2TnXuqA8j/c7Va/EuedYbxp+1cKcag9SnrswnaRJx6vaX+xU90l2ipkJrgLP9pbCFPAgYWAHUkGbxGsbT1KOSduOxUCGbLadm7u8fhab1L7wxeI5JifzGYmlZhxLhKFWQFEto9OkUi1WeMSPjFP2J+4p2EgjlPFSXSMVzboDPNwB5oBqcda3jF9m/oQt05otfud6l0MXgjUaPvFS6Sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c58t0E67SZGOFyL9PIX6IAr8cRWwQysN/Bt5VVJLrmc=;
 b=Syx2U3AOs3tq9rMyd3t8iHL3e/z2pwhCc4WLEOnCSPx5TTHMCbqwMBqa4U2sE647riYE7Baf4FxAgU/GyVn7K8K4/yGavEGlso2iaMReVYWWnKjbS9tbVN/CZAr5R6BEFt5qTceVa0x4otfQFN6N+/uyttSLMnJxkrhiEnb4T12TVDRsjWvosWnFnk4RDKLi7cJdr8yllOzdZ5P355nCPfbwU7HEUNoh7eYzUX/ucNeU8Mv8lI2HSjJAzOAkrwWmHFT2N74xbK8oJEvZlRl9Mqdsz5vYSg4HFMXte1iCsGoBh3zfztw7nlN1BAqhNA+eq5AQINGkwaISiMTTWwzijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c58t0E67SZGOFyL9PIX6IAr8cRWwQysN/Bt5VVJLrmc=;
 b=LCGu4WRTB/GIOh6pHeM8t63RvWlkUJKy+cc41xtdnpTvUZojXrhM3hn8HzVlEoJ+zMaEKm5yjq9pOhSBO7Kqwv5eixXkTWGqOX/Gk2NKE4ZpF1cPz0eXcFD2jy8FwiyGonRiwNYjrq1OKijPHKRpyRnw/oQUnYxoopBAfg+kAU0LdzT13izGxjxwSmOafsSkGN6BkkphSn5mof697IE8qs6vw9R+xyiBN/KMydumJkwaduD8TNBYxFsVjXRTE8NyvAdkdgOFpgP3ezIp+6sPHP3RlACy3gC3vBeCiVb9eRP2lgvSjzFY7kk+V7lXGTLuTQ7nrZhtgHDgS1elGN68sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS1PR04MB9504.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:19:44 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:44 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 7/8] reset: imx8mp-audiomix: Add support for DSP run/stall
Date: Tue, 25 Feb 2025 12:20:04 +0200
Message-ID: <20250225102005.408773-8-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250225102005.408773-1-daniel.baluta@nxp.com>
References: <20250225102005.408773-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS1PR04MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c7c89a-b947-4b80-61b8-08dd5585ec0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ky9leuOn43PE/cPPzZszN8wT5j3u1yP9aJl+JLMyO2b9Ov3RDjaSwxgeyTkG?=
 =?us-ascii?Q?xmxaZYQOjyQdNQNNADC1V7E2lqhcjGtxkMC5MYKX+9Y+y0gB/T+F/+MGMXz0?=
 =?us-ascii?Q?HzwAPF03zx1Zp+k2hXMjbH3r0OUEv8yRKu56HsUwUXxv0sfbjObV1+QJ3W7H?=
 =?us-ascii?Q?2DLrTnu/4t9N+jo2dcJvsnfpgPty0IW7cpEihtCRyLMq+ZGk20YlyCJ2++ih?=
 =?us-ascii?Q?eN4Tpb/luSE5WrHnACarES/NKUuJo+h1Ft95LIE0X52HVxGfdFlmWeuiGhbm?=
 =?us-ascii?Q?1UEF3W6rI67ouTN8qCqcFNiRPlGvO64+gbd+OQg2YYVZVwUN2IppRhKgwCns?=
 =?us-ascii?Q?yXY6vTjvpW0My6HIbdrZQzyD59L0WNk5qHYE6Qg/O6rY/BLaAwG0GItelU4Z?=
 =?us-ascii?Q?vOQ1jYTi6RERWaaNnnun5Rg2l64/v0d2aQdCelnW3QltIGWSuZB3Ipg/1pxn?=
 =?us-ascii?Q?63Nmr5ZKYO9NvkDmSP8T8W5TgvJrpW6EhndtuN+ByXVNytCjyFy+F7LPAqJD?=
 =?us-ascii?Q?UGB85xCjidljFO3Wccg2Am7f7PYW/B76Ik7LzBG8b2myR3WWADbAb9fY/UEJ?=
 =?us-ascii?Q?bnmbL5IgmJN+iqlIQpvKxoEBqW1px5pXQi/nqJyTY9/XTDdSyqaJRxPOeWeY?=
 =?us-ascii?Q?T4noAxj5c/8pwp10s/LT7HaINqk8j6YmKxUZkvbtAA47+yX0HBeoSLwcIrXN?=
 =?us-ascii?Q?WJUiT//W0c/tLK00x+UOU9WmP/iXSc4FbV84LmFbSbNVNe7Zcx2ABGXs3KJU?=
 =?us-ascii?Q?Q5y+N+5U7/GubS/3tv1nXyTkPCJ1vEvQPNmwj7/RIxWvp/QinkqCTvVytNeD?=
 =?us-ascii?Q?VE461r1AaGM2yzljrzRCMecG7aNhsRqneejsMG5KfYbcQHpqgirz17NLY1Fb?=
 =?us-ascii?Q?W51La0Orns9rcLoyFsOuzeT5tZEAdRDAHqxhHLD7vvc71HyeaVc2fkSiA6an?=
 =?us-ascii?Q?2BLeFVD1dQgBxAPqAj34F76QL2dkWwrWfxgRiU7T5bSgQsq83EqlDuWWBwPj?=
 =?us-ascii?Q?hJN74fJshOW7dP6FwPWyDkil7b+dzo47IvrnMTnPmjnHyUfPNS4DQ/V4pjAD?=
 =?us-ascii?Q?Vup2aqCApXtUZETgEvT6PF/vZ88AooTUfgufJOU7A7itT7nipL+wjPxA84D8?=
 =?us-ascii?Q?WycMmlvZH3d7GbaKkXK6N2G4+l7vLLMW3kYN8BGoWAiHtiCRDWa1emfcIGVB?=
 =?us-ascii?Q?Zq8MKJkwvQ5zCDwjIAlsmwtwlBtFIsfDi1bwj+u15eDCH7yfokrbq0+rm5Lv?=
 =?us-ascii?Q?vNymeiblxS+MicWXgKMq5PbC/wD99csOLDoVRYsvLAsSMDxJLzPo5qppsmIZ?=
 =?us-ascii?Q?9seUZJ2ALhrUDc0NTawaOcefJ3UnfC64xbaS5waoFiWLrYhTYGWStohU+e4C?=
 =?us-ascii?Q?12XfZeasW/hNGg36kcagcZ8uJowYPyWYNbd/kLb7Ccgvz4pC7O7ipUzHFr6x?=
 =?us-ascii?Q?P2CN0PUuddSbJC+HkhqNEXr7h3O1pQQ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t7L1Dmzd7gL4PYXDGrndn54+rAchJc0raAdn2EVNj0HtalQk02v+D/3v4oBp?=
 =?us-ascii?Q?j7UNinNPoo2ahPVxY4hkzYbIp6U1jwO+yL5+eAFPvVYNBB3St/boHYUsgvzF?=
 =?us-ascii?Q?lfZJWuc2JUECmnIgOe8QFd3dD+vwpenGvPPV8xokVUKNDQiVdDlTkoWXYIcM?=
 =?us-ascii?Q?GhoRSQJwTxWCjYt7KtPsY+/jxpjDb8wgn9bB1aj8oHx8H+khuwfcwtVjm1sO?=
 =?us-ascii?Q?JDvkuDz7Z58ifs28xscUT7iW/nke4lJ4rRAfxZuDDRwc/yAm8huy3G/S5/uu?=
 =?us-ascii?Q?jbPlQESyATCtC1mqCuqUg4JlXbp++mna/6IZnD+KgqJ1pwZl07MtN5mJTJsn?=
 =?us-ascii?Q?SrpzaP8U2B6FteibzW+pVOzeURNPIHAaMwwbpZPtjHrCfJ6YehJwrGcMWpdR?=
 =?us-ascii?Q?BHJFLsMxbIS64pZzJ/KW2wDTdQcoWQWDBXNdE+aHQljGtEA/rY2UZtg2rM6d?=
 =?us-ascii?Q?psU0m9kX3yzH9ht6JFbj/hYD7N7BzSKgYtObQ6Ut5BraXN5kYJPYatPgixBg?=
 =?us-ascii?Q?E6EuDV2Wf/6lhASVQpyIzcLFUWuzSKfuNG2cUjm6tBLLA3DSfWmejYgtp0aG?=
 =?us-ascii?Q?lrekx+gQqJlSpAfbP+oRuEInwk2d5sSllx4wpvfSF6A5vq354VRPX+MOgZRq?=
 =?us-ascii?Q?vp9JNCDdJO5ni19axawWOYxVIzTvb/xWnTaqi6qQOT2h2bXAC41fTZB0Z/t+?=
 =?us-ascii?Q?0pr/u2DU28weDxNjDp2TGwlriiY5wu0g1bBfQRZ/4RAOXM6Oc6PRQnAPg8yg?=
 =?us-ascii?Q?Ke+gVhjWRFXQHttfiEUA4pjA1Ua7XiCARCGZWs13gErTNPSE4/zw5IN25hla?=
 =?us-ascii?Q?NFCIea3niRaHoah5SJAdPe5n5SdJhff68i8qSHVOOFUfvTXm0ldIFuyBmzuz?=
 =?us-ascii?Q?F5m6vPqCL/hiBGqodJo3Ned0JV9PXXWkUN2DPzOHW+WVCoks1OvjZl3ALDPT?=
 =?us-ascii?Q?p90AtMUDESE/nBeI/oQn9QD+dsu7UWvsJuUEWSONCzRtgG47HHZVTzxy+AIX?=
 =?us-ascii?Q?XTn7k0supfGyH3Qd7Qb4FeT0GRj6meiCt+WpWBVxcdvWQ9tuPu8o7miG3x8A?=
 =?us-ascii?Q?RgtH/uKomeV1Fiyo0YG11HwlTnHWS1ShAPgl1hfCgqrOOWODPuI50AlcfU+E?=
 =?us-ascii?Q?symj5LHroRidbXlXYGeDs3HfCVMyb9xLH8RTP1e9emenkRWwYPu75GU+qNps?=
 =?us-ascii?Q?rzC3RX1EOYjaHxJOUOpqyDdIkItw2BSJ2iKoi94JtUHj64Yu2RlcnbTHU2CF?=
 =?us-ascii?Q?dtfLbiE3j+r/Za9BzsvC4kBxC9ywpK7ARZraEqUs39T22Y0W7x8dcz/cDEWJ?=
 =?us-ascii?Q?ezR3pth+Gtk6Cn8b5RgObzaigvf6ZgLYqH1A635nPKaYvHcYPJ8mfkJ5s+QS?=
 =?us-ascii?Q?rYzo09Dn3+CuRG6sFx5Lc9oIC5kfbFmfXhmnCSXT4iYNV4LpsdBbJEP6as75?=
 =?us-ascii?Q?u3fpSnGd91obnCvEenIRs0z+R4kx8CH8tJ7ynlXQQi2n5Edf0+VtIOS6nNCr?=
 =?us-ascii?Q?JzTiADk2I0Qq2Wtb8C85g1o8TOML0W9RVlEcok0CguL16p2Gpw9mNar3srfO?=
 =?us-ascii?Q?uPpkUUaV+Fyh/fgyMKkrh9NWvHQyvZhaQ1K3fcFG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c7c89a-b947-4b80-61b8-08dd5585ec0e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:43.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4JZZ0Qra3SXUMY3302zUiSfLOLl02omQKthoMLmLJoQzoFCPyDTsPjoyj9eDrspuYKZYoxLPY0wFrVypdZ4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9504

We can Run/Stall the DSP via audio block control bits found in audiomix.
Implement this functionality using the reset controller and use assert
for Stall and deassert for Run.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 558da232ed8e..6e0bc477778c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -17,6 +17,9 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
 #define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
 
+#define IMX8MP_AUDIOMIX_DSP_OFFSET		0x108
+#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -34,6 +37,11 @@ static const struct imx8mp_reset_map reset_map[] = {
 		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
 		.active_low = true,
 	},
+	[IMX8MP_AUDIOMIX_DSP] = {
+		.offset	= IMX8MP_AUDIOMIX_DSP_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.active_low = false,
+	},
 };
 
 struct imx8mp_audiomix_reset {
-- 
2.43.0

