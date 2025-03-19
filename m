Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2051.outbound.protection.outlook.com [40.107.104.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF94254875;
	Wed, 19 Mar 2025 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377540; cv=fail; b=QSuk1rj0PKk/+0QxF4oCq1k2ESz5z86+zKFSoONNPzqYeBLBkQDKBc39wxJf2bFb3QXdMhxm2HVEo9s4PLFw8OHqVt5cPuu1Ld7yynxIm4dWUNJsc+EA9axUvMmO+eXUaIFUNiKVSZLfrtMgVsiAJQezH/TyqXjsnCU4Xo4UNMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377540; c=relaxed/simple;
	bh=JRHwFet0p4Aj+W+QifoHYdxwHypHqxhpXKlNp95514Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yp8RgjlNNVpfTmPmo8jt9HJi3DZNz57O7Ng3MqAoXF+iS8FxP4XiOvwYG5bsn3Rou+3PmdgUndnPCY7kjltVFeCoT5EPP39oj+cPv1q42Va/4+34KBvSXgCltTxe4tlEQwa1gu9eHjXeXxFcpyCE7pG8p6OEqg+3PsT+jAezzPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BJOFek3v; arc=fail smtp.client-ip=40.107.104.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BJOFek3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kqq0twWWH4rDYGWUNmv6h/eRrMPQ+Ei42G/gLmwvZfnB/JzNrgB8ZSjHYARwCjzmUBYqJZgCeUad8n3nPldKhMfVMkVtv6FcSRU9Aq0XCmYdkUvYaMT6ahZ88+8cesgh7yiIs8/Soh+CUo5jDn8XzmsicTIa5IjDTDJGglvYIEixCrGAtQ2KL8XGDkRVbd5odB/6eGFquW2/EX17Q6gonOFMadImLfvh3n+tEdbAmjRSLiKz9eh5XLqg6F2I9Z0K10JKqkZ8gS92Wn/FvLtXH4BrbyB50aL/7jqfzviiMkpJf7FXjqJGhwlpMcg4KZ7ppy7SJOrr2eDWMcCQbYCD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmOdwUmHL/u99yl/LvHDQsQ+BnuVvVBZ6KmZZ66tfE4=;
 b=vPM4JsNwaIHqKA4BQEXBpSoinZm10USk4Ze8CA+lB6x3vcRAI26w11FkFa6Z9nfgH3Dg+Q0D91W8ZPgOKnrynhGsdaUqGVwGPJ6bU22ASW0Nq8MiHWa7LJ4cAfc5BFj7eCY5C1a5avkh0yg3XTmh1sRaQgEMpupceSJMnV4fZHSJSmY6LbBHbipH10/yiBIqzvIbuQRjE2ZLQAjdYtyrwXx1He7KUMK8QjUpVU9+v3AsWCuE9yexZ3LAr3edLotKhY1Aw7C3hQD5JyphzJ9YeQoiradzq2RiSP0/p8jrZ5l1YinALGYMCn/3Wb0u81UsPa+RyIIIi/SCuNJcyoCUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmOdwUmHL/u99yl/LvHDQsQ+BnuVvVBZ6KmZZ66tfE4=;
 b=BJOFek3vCHt+IXjvKD42UY7D95W8rWT8hfdDHb9N1ThuBC7JCL17cuxgBJyOeqZnXa8y37DTbkBh+zqC3tvzLUofJA5xSyJ+ini/OjdyeDC4376a4PcuRhtiBBZfFF+RCO+yucaD2ZO8Vt04brebrlJkWDSwZjTj/CNDdSr3435UWuK7lQL4jvO2BKpPsCdRV/nLQlwRWE1V7OSAZ7sCjJXiEG20xKT+C+Cvww1f2vpCoaw+K36RIzyuzSqxcBpHBtkk7I5Jkkn3c7g7f3lKYcPREA+GlogZDY2rfqMSjfHPsKwb+g1eJsZBS66QqZyvDKbpvaUcwTjjQ4CCQD3GAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:36 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:36 +0000
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
Subject: [PATCH v6 4/5] arm64: dts: imx8mp: Add DSP clocks
Date: Wed, 19 Mar 2025 11:46:20 +0200
Message-ID: <20250319094621.2353442-5-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2bfd71fa-6f1c-4b05-b12e-08dd66caccc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hghSMKqaP3nGRD2ex4xtTcsijxqVLdslvCqn0TVaaORacIrHhyz+g44dZNGp?=
 =?us-ascii?Q?MwyRR+oA5BWeXTSIkZtGX6w4TCaOjT6a8dMuiaf860cZjfjKkO6AAIfzUloJ?=
 =?us-ascii?Q?28116/iWwDfrJnXrimgOQ1j7f/F5ApPJODMBIvl1kWlsYtORBiZWzZnPjnUc?=
 =?us-ascii?Q?BHOYxH02X0iNRmVaE+eFHyD+Z4ZbpAKpQBC5nNey/ziIhpcaCybeZacf1Bei?=
 =?us-ascii?Q?tEEZ2f7ubE8RuMEfK5PWLC6ctX3YFTzzKh3DJd539VaUtyN2LVABO1iRyT/Z?=
 =?us-ascii?Q?1yo8oS3QR3g63e2v8SdgV3uLgCF0+6rnrVYwUSlWwEdKyBjIP4QAhb0EEK++?=
 =?us-ascii?Q?Bv8kfH3jIXCesIL0RcVSeDOJZwbxdEu/+aYJ5ne+sC+vQF4fIZJjEB4NKZeq?=
 =?us-ascii?Q?CBXghznfRRckFvsmYo5sDvm7BB9NxyoQdFr/TfJi0Op3Z8pg4X5s8msrqUar?=
 =?us-ascii?Q?TRKnF7gsPUCKPiNjnhn9pnMgnyguGd6IBZXCfcMlg+HR0vUvATEEWYKcFvy4?=
 =?us-ascii?Q?FjHWbOuQmCElpV3rPrPCqTqarq7Rl3S8HP6cAGHd1KoyI2/MtCldhEyX8w/C?=
 =?us-ascii?Q?gd8cS/7h+kXo+YL5eGDiPBceqWLn86xLZi0zGXiuFtXV7a18pwFvDqlDUm8s?=
 =?us-ascii?Q?iNRmNWvHLJI6nq5Rf9jj2E5mRkjB25yt15zOOUXSMpmZ46tZY/1TH5TdRug1?=
 =?us-ascii?Q?lphhv/kImdrWsOa8NsczqyA+usXKlIjEsxpFY/TVV275xlohj4rXfdUNj1Lx?=
 =?us-ascii?Q?knxk0oTb6brEg4+syxuacEucLVX8m0g5xp74GvhDe/4QorRWsn8eDS2zFvEA?=
 =?us-ascii?Q?jUtRgp/SfI+w9JXE8fseu129DIurCbdJFax44BB4IsAhcs7iEN771VZwW3vM?=
 =?us-ascii?Q?pGaAnKMjOnB492uq2Cxb5QCjM7bjAnA2yQgpS4ZUFHxWV9+Z1UZNf0Yyqulo?=
 =?us-ascii?Q?HRFTr/WmM+SItbnTopeTWA1hXkpwOrHvfZiKjcGCcjk4qqk3PrQNufwNi4aT?=
 =?us-ascii?Q?pBNHhgVAbTi7L6+IgIiT0CBunTysCuIAHMiWL/A4pX2EJCmdmq1PRcvxubNI?=
 =?us-ascii?Q?x36o2zVpq5M4tBfKGIkaj7Vzgmjp37Rgh8NhzNHnDvWx7Y0IwKfgDFF/Osec?=
 =?us-ascii?Q?53g25flNSpyFLicHhRNcFKsFUVGO/+Nj1eEH3MvNe7kYnJdh6o/WeL8gSZBs?=
 =?us-ascii?Q?adDPc2vtFAFbkWebap5ZOxmSQ9wVMXrA0mUjOa4BUwua7crev/iP/VTMZstR?=
 =?us-ascii?Q?dieJKRSCgujhQWFej51RHhVe+aU9MnZvyI56UySDT1jeBRUt+ts1RhYdB8ab?=
 =?us-ascii?Q?gOA6y1mDRSU1G9u/CUkHQU0ZvOK+DMPZT4gsBlxapBcHYbzvGJuQyumOl1TK?=
 =?us-ascii?Q?XZFM8ryOFiiQOm/iSybUw/vfpdcpk24ANSsPcfCyOPwPGYxDdbFfOOFOeraU?=
 =?us-ascii?Q?rIJ3BOxdW6CsgwOZQfunMwNOAvB2KY8T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7N0L9tcISwA9NW2xw1EujCP5ZE09KRLTjbo+mpQrNlu3GKXMCpNsemfrfGPE?=
 =?us-ascii?Q?CgTBjo/MTKIjIrQxaH5dIKcU3UzCSOgpHStNQvEnjknNHIybWd9RHH+GfAds?=
 =?us-ascii?Q?9/+YyBq3nsS8OXddltcQEe1W3hXsVe49KUA1D/p0mdBoGn4llr9HOz4qqEqP?=
 =?us-ascii?Q?c3Z6x14BEH+VxL8ecRfKbJ/3Od6MdAbEt3TrBhxQPQq/8DBSZ2KMYFYUbM1O?=
 =?us-ascii?Q?9d3w/f5xVmeLruGfSJkJC6RR9n0Vc1J2P8UWUObwTfp+cL7GBSFaMAJ1Fkcv?=
 =?us-ascii?Q?eEDi0roYiqc9oL4aP6pfKKcwQpE23t5YAEj0nhhq3FoxJ7+tzJzmOohF6Wbg?=
 =?us-ascii?Q?8T6nD03TkALBhDnD7hPHm+84uE6r76VCqiJ6UkZNQWJGs6QWIzQ8mpoOquM7?=
 =?us-ascii?Q?TSEvs2P5G9jzRXbTzCJJzIJ0T0rwnZ/8kzlmqB88piAbyka8EZdgFbtV2iqP?=
 =?us-ascii?Q?2CpadnmTxPQ7vICCuvWh24aRSqF7ZSgzg0B28TSq3kBeSI5C7xYvajDB2WZ8?=
 =?us-ascii?Q?L5qHJ1tL5RZRR6MsUrAtVzKnxPDLJJ2s5SxSkH4otUc4gHmJkrgdHfVPTpT/?=
 =?us-ascii?Q?gp8I9oVdg3f+b9qEsUKuwANOZmnsmIAOOy9bpz1D0534yjcwu26fEbrlKNFJ?=
 =?us-ascii?Q?OH3egQJgPasM75ou1BdFZmNSZhTFO9VjOQNpqHeqoiNip7QarQ2iJKujC5Ps?=
 =?us-ascii?Q?bqpKeyvkdNlN1Yl6yljBW/VqsjUwVEDSjkGa3DrUe9dK0oD2SWm28X2WGpb3?=
 =?us-ascii?Q?HW7tiXgm7pGmu68CjyYbMxCnxJgM+A4zMTVwZnVaHIwwf7ch9VZB6nItMWNn?=
 =?us-ascii?Q?+QQFfOxV+7rac3g5myzHrI+5OSsKKNcrzSLP9r7nBS24LBhVAkzsKgVv9Hhq?=
 =?us-ascii?Q?yNIs48llD/IbXaNaD2QJ9Qw0A6AahLloFkSqKa7d9uNlPBfXMKPfhRDVuREd?=
 =?us-ascii?Q?VK7NNANH2f1Nj+r326DJV5hKM+9ZeWRxMWsSj0VzRffeAWuMKAh8MfaVX854?=
 =?us-ascii?Q?uIxPSAYauif1/zd19yUAw/P23+XQ7HbYvQh1n6acdZNIpp3lo1h2lHGd9aHi?=
 =?us-ascii?Q?VB8lFhYNJHrHy/T2rWxZulugBX8QXYvzpMhPMgLgpKPqn/xfH4JyR3BCVTzi?=
 =?us-ascii?Q?GwUgadZ0TrCr0OZ7h3e9GTPnGLGR9QqFtqUgiTi9VsK2oaPhNx/CC0t9gNcc?=
 =?us-ascii?Q?K7+s+jFsyZr7Anthq91r2g2U4IukUldgZ5t7+r3YNT7Un7ZiTMnrXju4J2CN?=
 =?us-ascii?Q?EjDT3wb+JUkZ/Egzg4imzvln4T/gMLmkMprexduT1/1RQO56ZQdVIS9B1CjR?=
 =?us-ascii?Q?o/pUNkgl9B0EXW2TuwTVkWhlddJxN+h4XNaSnp816lKFM2Jq1Vw7QHoFwuvQ?=
 =?us-ascii?Q?k+ItHnXuSRDeMt+Iv5SGezLV9E7Z995u7Tg3O7WbmP7JJjmYcRKKQ03cE1mC?=
 =?us-ascii?Q?KS4AXbrvEeTZ4iIlfZZNjS5IfsQh8n6YDgxGrlKcLhryecv6AOHpEj5q82f4?=
 =?us-ascii?Q?T46cMjZ7tpmg2T4MoFGQu/cmsD7gUJSeF/CoKcPO6tFtLNyFkHFxx2zBy04l?=
 =?us-ascii?Q?h1uy0ir9yCyLYiPU7qhQX8bMss2gCoJP6G613cjE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfd71fa-6f1c-4b05-b12e-08dd66caccc1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:36.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgJOFxLTvIZb6gqDtEpib2r0Pkqq+ksXzREpdjZw+FDDZr2iXfoAbEG1ciOz5Iv6rFFWx5h/nP7YwBgZtTcVUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

DSP core needs ocram, core and debug clocks.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5f9421316ecc..5e5cbad9a98a 100644
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

