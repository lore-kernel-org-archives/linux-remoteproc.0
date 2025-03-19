Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2051.outbound.protection.outlook.com [40.107.104.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C7254AE3;
	Wed, 19 Mar 2025 09:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377542; cv=fail; b=LSwdrb177fTft3nQFYHNrqvamv6F/Euz2ZTl6wJIqVq13ad0OJOLHHVYjnm3w2EhyIHmLfPpbfitRM38njM5fyVzt/2jBx4/s9FS7tG3kCBB7IxYP3PPpF3bTmQJ1RV2WF36n991elLCk198YVX3Jy8cyEyS801u49BGnCWTe4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377542; c=relaxed/simple;
	bh=DJoYtqLDR8ZJ4ELSdPoVB4YzF8rbq2t7XgULaAoN7DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwOsdfJ4eGxZqt2Plh2ZxfpK2S8cv1YmI1vGHLxq0YSOJ2MBmc6fF4kZ639xVjVYRT5OlV7vfAEs2zNLggp+DB/JnZtPIFcewFXotrgxrGUfdxNHgXRXz+5KzkwonQ6AS2ZIYVBASKsUIiE1bWjKZmz4Gx1k7cxxpqwZh2ePADU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CreRkCy3; arc=fail smtp.client-ip=40.107.104.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CreRkCy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ywf/Cd57Vl561vazgiI6/gj6fl3l4+4+o1wbq6XUU8e7IHq22smVxnkBTUfvQ/enuiuMNtVotVtDqXuRjlU2f1n8Jp+GichAgHpODEwkgVsp+cM37j/QmFZO1xz49g5t+OqJQ9wxrVVziWgMHDaeQE/UI7q/dREV5xwE42V8SrK3wjFSgX8upJ/olm62l/YNANQCvfmMD9XVxaUzmnFbFAdIclshrVHm6F3zB9OTbbrspDdVoTTNs6FK6MkT5UwFqSrHfrP/H0kAxiYbUjPmWnuX/psj0X2l4pXA5i4ERh0TynreUwU3jdJQYsBFC8pahmy7vy1MX8E5krJu9ap/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xed8YsT/EBMWZhoaHPJhl1vmxTCUUnjxFB839JI3Mo=;
 b=pwITypbbCDxrvs6oLBCmFhQnng8F+lnFPjZkTBpDtmHBXl2vtlEoko4L8EXXOvnSFb0NT8Ov75mNiW0x2FOaEPlMMS+GVGj6CR2v35JSniR8hy5kQjw73/z52nfPFGZyu0saB8K6OzzBwGPy+p6qqcEZstcXYJ7iPMNMmLMvwWKrrMob8Xl/rIaWWJ8qPDP+z9LsuTpZFB6KP0+WH0XDSqNn0RVLMg7kPvcs4JGHKxrwI80DO0XT6ZX7FzfmNpRgsPYXcnoU07IOiJ7m3kWsTe67mUVFxWPrL8+zcmU3Vu34A0oTN9uRdtclCRA2cAlsyG8NmnBgLnpQa8We+fuQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xed8YsT/EBMWZhoaHPJhl1vmxTCUUnjxFB839JI3Mo=;
 b=CreRkCy3pWPB/TlCehq70tFKPUCLva9MIfE+A6O9jGGiCKtJuc/H3CbPLS9IN1KWwMYhAevYKMPz7mKlz7N/GDH6khEz0HacNiZyZ1fNmRfAzOq5g8qAyL2NbZArQdxQPXi388PoBYniIPeeWNSftdgoDMgDmHN4Xa15LW2+MjjC7iADzKPqDKxpCrUDo1wk9iM5zlOpYeGVkBAx22RbbNIVaYeq+NYdqusIHWi1BB0KXhsCgduzSK8HQG7olsXKoSQ69C66Ye6TTYcDzXIhtNmZLVE7CAoeTBW85qIhAG5Zf0oqY2pOei7lr+cv1FzAXGpsi5/gKZClxpqsvQsjLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:37 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:37 +0000
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
Subject: [PATCH v6 5/5] arm64: dts: Add dsp rproc related mem regions
Date: Wed, 19 Mar 2025 11:46:21 +0200
Message-ID: <20250319094621.2353442-6-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7c1a674a-9f15-42ff-8f8a-08dd66cacda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kKGCYQ6v+v/eQeXCrmUOTsJhCnofCzqDKEknBKJi/V1rVMdggKY+l3cL9mSd?=
 =?us-ascii?Q?qnTup++enMGHj3WabKpinZNr/1Mf9zy2DbIgkLThESUDoPXhWuceiBxIS2+r?=
 =?us-ascii?Q?HTCoXbsWVJptm1u4JmFpMAqFO0XhQzTQbx+AH2ArXy5lM16ZjC1hqywOrHLC?=
 =?us-ascii?Q?ampEKSDv/tUFTU7852yCH+ttyYX+51u/U8OkrhHVH4hoLyoAyJENCj0Bv6Wy?=
 =?us-ascii?Q?11YTxPI1GkKB8EOg7jJ4Az0lpdLuptTg5QUxo94+SYN2kGRkdUYIZb3X+01/?=
 =?us-ascii?Q?kVTo/96lWtX0DQXfXOxgn9YfkMgmVXK7sHf8qUpy7RImxNj8rLHBcbWYy3kg?=
 =?us-ascii?Q?SRrbIXN9UEixv7I79S9gDvs/YhhFht5zyqm3ez/5I3IjB9GZFQzGG2ZZ9hxo?=
 =?us-ascii?Q?zQELGDU3E3va+PogIV5XAeUUf7LXxycVT7gaL+X4y4RZw2fLv3qzd/bNyaxt?=
 =?us-ascii?Q?TArThpXcXD8rdcdrf4rhpfw4Yp7lVZRItyVT4qTLVXBtJb4CboQgEF/9C9Ri?=
 =?us-ascii?Q?icCvYZMI7lo8XjavOFcopqqip0clWComRx4bD4vXbY1vFZeX1G1YU/tn36DQ?=
 =?us-ascii?Q?etKDn106gloGmaSzUkjfDE/Wev6QFdiiwDH7zxN/hukJyEtcRLxj9RbRNtoP?=
 =?us-ascii?Q?72qsgatqw1v4x6p5TtdupPyxjLpco++D3XmotNdjpSs7E5PuPMhSFcURDjxn?=
 =?us-ascii?Q?2W6QSo6u/eRI1MIOryNHcc+WEjPXEagav1z5M86zF6DFqB3vENhMnrkg/mO7?=
 =?us-ascii?Q?h1EXwUbKbAVjR9Wb0MWVc7B+MLzn2YZAjvTQX2svk1F66Z7vI7QSbHhW0rm6?=
 =?us-ascii?Q?h2Ax69hyQ0is1UeSEh/EFh0jJg/wEJzO51NyOTSATlPPRALycMOT/8a8m/Pf?=
 =?us-ascii?Q?3Wof2qfVgy2DtrJEgIF88mt1PujYKgX+SJ8Efdsvdosua9cHybY28VUHnSQa?=
 =?us-ascii?Q?Qg/EYMTVO9wAZQEQSNw3KJzkGSbtUx3L4tmdvW2T4fiOFAhffar+tFiX5Cp2?=
 =?us-ascii?Q?E+DjWB7FEo2WcuFLWz9Z9UmTJUeuDhZOc3Axpe9JNHOxsofOfRO0h0ehQ47L?=
 =?us-ascii?Q?KK8gWJvpnqInigHyPUuX7ptMrNM1Af/jLiHiCugBcYVG+8ms+1YMZZ+P0Lwt?=
 =?us-ascii?Q?kXXLAr7HtEEFQQlU7PsKgfHh5gISw9/rYf3YYeeEmHzx/NQW8uoPuMf8/cET?=
 =?us-ascii?Q?kU8W0c4IPb2Eegf5zhZPpujIxP/g/AZH/uDdzYXOEbnSMY2mAkRtCfDTd++V?=
 =?us-ascii?Q?MWiBolUZgiGVPRdf15GBgfzS5sgAOigiCiAokItPlyOSeL+Hjtv1voB3dIAq?=
 =?us-ascii?Q?VsmMsK05Tl5l2JvDnG1REhfMttbqCmjnxDLdSxjIMMbMZkBsWynbJUTVIJ5h?=
 =?us-ascii?Q?Btg5ZBdxh5STnxberSeCMRwqzymD94NDmNbFxCYQvIzt1xNp9trJsJ/0gMgg?=
 =?us-ascii?Q?UC68SYBIc/VrjiyqFK0yLNaBdDiRt3JG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EJxMgPcce7lDHpuld+KSjjhYvo82IlyOSPY98jdmximG77sf4DlpNru62s2/?=
 =?us-ascii?Q?sQSP+hzeTiF50N13s4nu/VyhJDOMjUaQHrKh32FYKaGC54rAsT9LMbN/qinq?=
 =?us-ascii?Q?0YBU0CfYqjoKhJbGWnxpm4bTVHCpTDj6/eUAUpxCF0cnu3RjM/vnslXdQ/C8?=
 =?us-ascii?Q?QKV76CC0Dhf6rAi95O/c9L97W92TuxQMup9VHvI5EbxMUMWLz4t3JCcKlcs3?=
 =?us-ascii?Q?CBg3YOzQFk2rVXB9+e2BMDVXOQHWu2AjYWo8TmDF7X9azmpBpwrU2GPOlCqX?=
 =?us-ascii?Q?brqyvzjxGOvlYffmAjZcTxdvJmprGKvh1cDwZ+BJYVdGZacApJ4fOJoSn749?=
 =?us-ascii?Q?C0patFJtIDuPAS0LuF6g7qFfGVcKwI9adk9iiblabMqAkeULgoDec/WFPnd+?=
 =?us-ascii?Q?QP8dT0FPWBzgFj/lP+QFnayOW4bQYLfS3UX0e+2NY11Dla3i2Q7rE7CQPUGH?=
 =?us-ascii?Q?ghFa+PRi5hckBzv9PePNneedrI5MAjoFifovDWmWTRq4ibkkwDaJU8E+H51P?=
 =?us-ascii?Q?b0AliFjVh7vTsTZpfv07DXFP2BMVs5/CpLKcKG+v3CbNPAIz/giGw5QXNcG1?=
 =?us-ascii?Q?MaE4EYs12o60o5CbLhKNakPCF1kpg1sc2Z97XrJ4wLoa0oZVBymLTht+sMoH?=
 =?us-ascii?Q?UOrvj8p5XrMa9fMVuIo4RVWKg4oe2skg4EP5WfrojkqTm1+l+cJhNbJ1dkbh?=
 =?us-ascii?Q?FgR+9z2i4AsSNHmNt3mFRIiFN53NMJVvMqFPFX6hs49UDJg/PgRrKTFQhUfg?=
 =?us-ascii?Q?XDKNP2gEYPZTfBIXYgOlQMVL8y4mU5V+1qtzH1E6Hy3mmhgIVB6oTg4g5VqV?=
 =?us-ascii?Q?Es+M/LJSj/XT8WmQDuaCqTwt/txSCiJ+8UdumQsqGlZ//V4rqspDBo2Pnpwr?=
 =?us-ascii?Q?S8zMsz3rw1IVBcxOCnvHRWZS5yOZQAYQ3CbbZx+MMr41b7NMQXfSbXmFVaRq?=
 =?us-ascii?Q?W4OimC9h7ZCu+vPe76w8vM/BddjL7tri0P6XpgwR2HGRcIhmWJAhum+2FZTB?=
 =?us-ascii?Q?q//10rp+4VDy1JXVFNN2eAmdfyy16xWKMD+rqVxdvRQYsmMcQv5DsdKXOeHb?=
 =?us-ascii?Q?PYit9GlmHEnDHiEaOYklZDEEpwso2mL7fTzQDZ/Jve0CxYfp+1Nigcmqj2Td?=
 =?us-ascii?Q?LaQfnIneS5kwHyEV5wBTBzVoVtAm3WHbB4vUEF+5vCl9GQrhDinVlGoeXApM?=
 =?us-ascii?Q?em1sciScLusn7aDSUg11kl2M1oyVFUAO90NT1MBq5to9p0ItQkpyBZGZs6CM?=
 =?us-ascii?Q?wdKX9yaVH4As4amPdJpWx0OmzMgLpwjij4idfgdJsy3EB1EQQ5PsOolXmsz9?=
 =?us-ascii?Q?p2ukrI+m+09bCGOVYkvBjF+mF1LQUUfbnVubTkxoOYWEsh0BVNeKQWxwSkaV?=
 =?us-ascii?Q?h6lrdLG0C1mC7qI+bysxm5IGH/TfzjOvDv34L5nPIe/JQv1tVRvo3lyEvsWw?=
 =?us-ascii?Q?Kg9oYM8L3FSfPXl89vU0LbGOd+hZQz0DbwobONLQZEhAFQvT3aZm9aKanHeH?=
 =?us-ascii?Q?M9SIg0ckBIDIV/UcC5dDjSOvIAAoTV7O3OLw3rqFEtmrAazsdaNptVYsZsfZ?=
 =?us-ascii?Q?O0OtBnjBlSI2xxjeZO5bVllrdG2QC/z7IMoaP+Tz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1a674a-9f15-42ff-8f8a-08dd66cacda5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:37.7762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSuomIXvxzgkcxAXHjGqPQik57D+ySO2h83F/hpnNAf1/oq2IO8IqV/9ov63cvPZvT/NY12BiVQhYyvReXEvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

With imx8mp-evk board we are now configuring 'dsp' node for rproc usage,
so add rproc specific memory regions.

Also, enable dsp node because it is ready to be used.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d2fdb420f2d3..9ab3ee93a35b 100644
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
-- 
2.43.0

