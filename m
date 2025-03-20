Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC34221F35;
	Thu, 20 Mar 2025 12:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472537; cv=fail; b=sz1lYypdnjgX39LXNd7E/DzyOTqGi4Cq1WxmWUWKD9FCILLS6pXq0tm9uCn3EkzMSalJfdwq/jWvyL7tkJZg5r8qFl/D3xKN3WnWOdDqEi7ttWQ6KPZFGfHKmBwtmgReEFYboxq9yjwcozWh4f6aJSzTWFOSiRTRZYjFt8+7Qhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472537; c=relaxed/simple;
	bh=IHPk80OCMBo0vIlc3P1IcFtUtdM1Vt84XhVe+6+rpOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LZyaX27pYbczd8v6qdipGZs70RxBlcI23pUInxb84PCEuvbBlzcCb5E7iRdqSeozTbpj7PiQVNM3S8asIHku1MRxSxnVf4AbXGEV3ElUj8wOuEyM6UKziePTtRQuHKUsm/V2q+Og4NhFIzElc8F8Mvv9n6UBg9dhUdEWc1Pf9SE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C+PH9Y7y; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C+PH9Y7y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esmXgqOI8DI22eDOSQzOAcG6LJOp6dJKO/fXNTVXC4DU8ZGpllV1PGS9ypSz3dNKEsGtR/jF25Slq+pEGcItgHmdJyZcgkOYFC/EDpjdRxCbFd1d+tBxq0msOE3WMx1xXqdTsPQf2x8eNwMoAlY3BdopvQNgoq+jMzxoI2D9LnYpQ7E9agCpgpmPZi1tVWFv1Y363As7bsrwB9zB5N8FlMbOj1e4M+iFZNS8e2OjAwRVDJfOjATVv07OlsAPKtn5dhNzxxWyRf2zNFbeu0Wno0mlNtClGYg5neJI7yiRpHT6A9dCuLQzyQYET3HoMYnlA5JdFX0fY4QOY2fCML6V2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW6KQSi8NIdTPpCYSnQEGd8qlDHw8/8q8j/D5RL9piM=;
 b=tHfCCX7NDtwlmB8pnZCG1zh8lXmOPEFj52WvKNEsetBE5Iks+sS1NUDHUX3BCdejy5ObyV8YQr41c7kZLT9Ema03lmFDlyQJ8gj7+/BKZsF5f2BEPqP8J9bJARSTxHrv1hkhy3ncAp3Ku/2cfm7aHHvy6Q9UJqlVw38j/QW+BSYF2oLzwu3wZSovZGfRMvLzFzd59VW26sCektW9AmYsXawwyVb3dNkJBMcd4MPZjOdGxnssycZGDDH9IXGT8d7D+gZmUCUBnywiNq81dKcrawrMFeIoH2CHjx9TgB3vku33SSCcWlJaGUCk11TkgANg8HWKzJ4gps+cIn2C026dHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW6KQSi8NIdTPpCYSnQEGd8qlDHw8/8q8j/D5RL9piM=;
 b=C+PH9Y7y6x3SToFw/uP/5e/wTsDx3R7rr5p6al/lficWedLA5nKyb4p5/uEXiK9IDvRWWN9JiTpGATCzMpU44oPHYa1VVZJ5UUx80HiFa6yCj7AJc86dgXuqdNmb1G4lcLN+tUG0h1vJ0cfZVd46jmAQQYTiC7d4jrv9uX9Xnn7QakrddfD0m1sjwdbG4bJKbcn8v1vtXfFzUw1tX+hm71nqKZYKzeAHl3nlRx4nH4v++c3CDcT65t8yKPd8sgLol5ngMpX5cCoFGlYs/gHMBRK0cXgHmkhsLKKYOVjEC6roA0soc3Peme1FXImoVI2MRmi/jdTpDzkJ8+vPFK9CxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:48 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:48 +0000
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
Subject: [PATCH v7 4/5] arm64: dts: imx8mp: Add DSP clocks
Date: Thu, 20 Mar 2025 14:09:54 +0200
Message-ID: <20250320121004.2542314-5-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 34d41832-ad46-4275-45aa-08dd67a7f82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zPliusm7xbUy3yG4msh63g3PoFsCI6dAjv7IMWuAkx0H4GJ3ezLdWjBS7C3u?=
 =?us-ascii?Q?gxsGBu8u7w6vOPJ7CnnCL71KXCCuQT72FLI4pp+U+/TnKxPWv4TRe2cy17Uh?=
 =?us-ascii?Q?3qxw6dwIwNWgOAQ3+qpqp+fdILDnKKCSxMUi83G/BBwFg/3jKsgbbgIwA01E?=
 =?us-ascii?Q?95I5bpZvtdxZS4q8CFLqpCdrxoddP8Imx1I1oZV1TzWp26R5i4VbBy2+T6dq?=
 =?us-ascii?Q?2QkEIPmGChfxXDARH37lJZg+6GhDE0Zudev3PFJ7JR5w4biPJSGXWvBO5QWh?=
 =?us-ascii?Q?E5RISdggZUAvFsGFpRLs/sfiiMa7sqCm+Y0X7NZG05wA6zBN0gboDrBDI4Ph?=
 =?us-ascii?Q?rObc+LFt/Wnrdgy+1cRoS50cdkngVUz/6S+Bs6vVCVPbiLLJR/YdGftqzh8B?=
 =?us-ascii?Q?IX6gp4/t2dkUIZN/Luq9mKpn6tXW49HtbF98EuJF45HYRWRUcmYyLn89iPDF?=
 =?us-ascii?Q?OUiZloMRnS8dxS2jlxHYBUezlpEj+LL2nkPwW24Kt8SnZHq/PXVB5f+O3XWK?=
 =?us-ascii?Q?loPDb9EmxKpCKshBH7QS5/MAmevi2LZhC3PPZASTJeJ4c6vv+hBYXBdfsdgS?=
 =?us-ascii?Q?XClPWVeSf8dL/L1Pl0lI1SOqFcifi2TDh0rVWI91ySB/0fJN+Ay7UjEEEEVn?=
 =?us-ascii?Q?vGFteFR/rH/TRmYvrDir2S4V1SEhtWIAmkcHjTjsi7Hw1mXXR8aGsevIfjEP?=
 =?us-ascii?Q?fOGUr9T5TNxQvEVsR8q6s14/BZ8SAfWecN6jtJUkCrdE4Fu7BFlZRKGnK/yW?=
 =?us-ascii?Q?AzopWi80+iBrIJnrCXy+2oH+gkNTWch41VViMWMKG5ayjzSF2R/w3w1vhzhn?=
 =?us-ascii?Q?woEn2j5PAzCf+GOMKvGD4Pou89GZXiy6Rv/dU0C10Q7fV9sUMLV52SDN4akP?=
 =?us-ascii?Q?MeUjSWHkac57+QvxslaUx0PBv2J+NkEt0zPSoj6XuTpzb6GWwBIRmOPivAiW?=
 =?us-ascii?Q?ntArGY6D0l25vvs+voXN3iciCtGFUKdM+lVqgPtbcV1OrhNF2HDmMYLmbTVJ?=
 =?us-ascii?Q?wP9sLTREaOJ+5dJYG76Ia2zxqE0hPfZ8mPWJiU8zDg4nOJysCgs8f/0I0QoT?=
 =?us-ascii?Q?cVaYAWHJD4Dk49+5JYA3WqrmhN5aKJ+H7sasFipgAiurk+V8z1R4hzGFGRlt?=
 =?us-ascii?Q?AQSgyeUp/BWZeRmout7jXGYx0TyY0PwojnrE5OYOoKpzMpL9V8xdhooHza8q?=
 =?us-ascii?Q?5UmJ6KJpYQMY74hVTT0my7lbWjkMoLJkyTize14dxIqIYjAtM58g9Kz3/TE6?=
 =?us-ascii?Q?BDs/sQEOIWhKISK3E5NtgnqgCKBFNr62P2XH2h+QBlzf3Dzx9RXy0VzZTmTj?=
 =?us-ascii?Q?PZ0K5zw/HGxAy7YejE//1FbsmRI0Ja0e8LrOHwzOphq1IZiSMufO3LccLFkG?=
 =?us-ascii?Q?QE/leEVyaKcRKC8/wLKV997MvmjXk81G5B/J2+6zIpgwr6tXS/L03Wh8yXOI?=
 =?us-ascii?Q?Q5sZFmB7TUhnnht03/V8UX8MtAJ5+h7D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5domXxwCLLUimCc2Gh5vTGtPb8jzBBsLtc2eX4bF53d1J++4buN3Blk3wos2?=
 =?us-ascii?Q?WmLdsCrbwLXqQB0bFq7isr/oYEDcRtVHXj+hGKrSyGVWI6WRuimk4/FSkoB1?=
 =?us-ascii?Q?rGF/7WA+XNUPCbUjxr6pGgy5byCA3YJaiu/MJ6Tb0cGuszKoKpIKIhzBM4NW?=
 =?us-ascii?Q?0MRXvR9Kg3EPgSLpya6bsnOVvyVsu6QwvBkhaO+Q4acB2ZAQT/5e4vNq8nTG?=
 =?us-ascii?Q?tzrOnECZOfsooSMbq1LjjEjZUMqnRv0V4DEO+ISPwgVrHvSHAjovuUHtyL5j?=
 =?us-ascii?Q?c0h1DZ2sMp4T6Oax56phhhSRV/F9GZmrHlc5sPYD2D+hX6Fo4aCWzzqdV/gX?=
 =?us-ascii?Q?DhUQWSDNI97M+hUvanzf6gPyXxZR5WQkESqPZxhYHUjSet4dUpNgi/sOsh+z?=
 =?us-ascii?Q?vsFZFWO+fPsumcF8cTs1lNVityvNosFqefyS1bZ51bzDLqXg+uuo7o/nFnO9?=
 =?us-ascii?Q?5G0L8WItwTjcXfht/N2T8RuYCWSTghEBJBfZzloF5g//gTprjvsz/NJiV/Co?=
 =?us-ascii?Q?aKV7nKL6ro64CtqBfZF1fSgMEfGX5p4O9lbH9XkV0zuzQK+/uRMzY3YcFK1K?=
 =?us-ascii?Q?oG6gJ0YJFcXltS/if5JCNhDNDODG6kZmFYOFwbRQ6f7HPrzCk32U1msEx20g?=
 =?us-ascii?Q?VDNIuzFgzqSwAiTOfaIif9pIMiGehzG0f0c6r4t6uJ/ghL5E8t4/J62J7EI0?=
 =?us-ascii?Q?TWwaLxMFwj22i6KEKbdo1gR4croU2RUcfoxun05qRusrypAvrJsk7t25q7ek?=
 =?us-ascii?Q?UtwNWg/AUCcJ68VSpuI+EIY4+UGOeTuNVfMshNSadY4pz1oZE/1/0/jB//om?=
 =?us-ascii?Q?4RB5k+5+D6chq4UxK4FB0KcZOd7sj4eX0mI31q1yEWdsmKpf/vDvCFoiYAeR?=
 =?us-ascii?Q?h+27M7xPTp4n8Rm3DaFWEwuxErKG0L9FSLu5cWYVqefBOm5IO9oOGhSQG6z/?=
 =?us-ascii?Q?gdMzGPhsD2uDN6msfwtP4OAyvTbLCJhpNZzXue8ir1WxCEjn7DQDB9PFztNI?=
 =?us-ascii?Q?dmrtgR+EstCH0j/5m1STHhYkydR/B/aQCH4dnQLzTLcipHbT76zF+ivaNoyS?=
 =?us-ascii?Q?GSUHvZ9iAFvTJx/gUG8ZDYMlseaT9PNuHXYkdcNWhxYhHu/uTkJWfgFj1Mi9?=
 =?us-ascii?Q?B2DuJ/pQgwqrcHhhcCoX+RyTP64mnNUwCIb6akRAElGVNDuU26qEIyi7rmy2?=
 =?us-ascii?Q?/jQYaPh3aMNefLltbAIpOfkoxYvoK9KmfLCQTzS5LeVDS825cpv8Yue7nF1y?=
 =?us-ascii?Q?Y037n8nvHoLQh3LmcgSY/oW+ZDO8gkfPMLVHeB7e7yv5Bla3eYq9FqAYUhOR?=
 =?us-ascii?Q?35NlEAUjM+AUnrZEI95N0J56sQBZMXasMzggL33Gz9HgtAfGQTckpHb+pgAt?=
 =?us-ascii?Q?2yTZwnzdywDkd3CdLjq46lrHIqpD0E6JAJxr1BX1j3855muxvhuIy4YEONOn?=
 =?us-ascii?Q?3A4PBLnQLAgz+wGibCMp7hrf6eu3ApLAZ0dMpqpLFXVd8QBG9uXc/MtoBwRt?=
 =?us-ascii?Q?kvmpHn5J+QeyXQJU0Sbh4U/8Ylq9r0kgGKFJl+1hqeMu2XCEliVIhvUFKZOg?=
 =?us-ascii?Q?sgaq7uoFBiw9Nllb0zpKPqskLBgaHbQnqg2nRTZW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d41832-ad46-4275-45aa-08dd67a7f82e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:47.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFGcO9ALCkDU+6ah5UhJFtUEvstbxTmV8+hdkjMLlo4RatWvrKUtbqYCpXh8JQr5RozA7nSJXDjia85GClKz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

DSP core needs ocram, core and debug clocks.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 708d3f61b4e1..c017eb98c49d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2419,6 +2419,11 @@ usb_dwc3_1: usb@38200000 {
 		dsp: dsp@3b6e8000 {
 			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
+			clocks = <&audio_blk_ctrl  IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+			clock-names = "ipg", "ocram", "core", "debug";
 			power-domains = <&pgc_audio>;
 			mbox-names = "tx", "rx", "rxdb";
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
-- 
2.43.0

