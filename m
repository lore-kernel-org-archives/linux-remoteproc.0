Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2075.outbound.protection.outlook.com [40.107.249.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF63221735;
	Thu, 20 Mar 2025 12:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742472533; cv=fail; b=FGbcoilEuZcEswnEF0JTddcnbXxRLn2lPIYKfZNbxXM8MMrREc9hdWwRH9wid0gfAshybIuBpYv32TYCVTk4HUDu+xVFIuz7JZl1x5Cy1o04nMY0heHw0z1PwN8AHF1kdAlAceA9w5AshwwRiV92F68gDEZQAYYdQDD0cdEz8Tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742472533; c=relaxed/simple;
	bh=VLPBhiKAco0m5g8/cj6KQqA92O9JySPsAwhbBqRcsf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M/y7o/hmLg2KDLsdQpzJY7kD+SHGWnikTKhB9ad3sCCYvEjF8OYLl6c7I4VcOXPqaNlrAV3YAgNt4vDodvEUfBnNgoXKOcoaLgsODhJqX1fclT2mWFIjgWUK5NdR4QwpW6t0Vvo/AXeQJVCvhfHSXkh1oPHJNt0OBGl6emz1uDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oJVEqSlw; arc=fail smtp.client-ip=40.107.249.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oJVEqSlw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Nr0+8ep/QvnR5uvYSMpSiY5K6+/lKfgVUpqjq+54Zi3bzmS00plTpZ2NpsiTu8vFZR/krN43dR4GP0jpsNQ7K2L8451jvCOZbIV0kGgdMTtysW6V7wBQSRCje5cFtL5zYg4bJtxNmvUac2d7mtPr4y8iXRmRtFYY4/+sIk2lLfrJiwvjiizn2eaNWic7yFcTFWjKImQFn3r4J1RyHUm/J9HX5geuPOKTwSaeDbbefKX0S7IldcG29j58GAKyr37Z/H32UFGQ9fjMKcQFIeFnRr3gFdRkadSSVSOsgYbGwJPIxRmx7Afk1m8fY9+qcr/kX7Qd7wcWweKUF8Timw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ciWZXa6/A99U2tQtYOylB8RPWOqzvPnaaxMvHSntRq4=;
 b=KZ0vfrOWq5PrfU6hEuz1edPUHYnNJAdvKs+XfjVqr7NzXHGdYfAh82vQITTHldOEEPGnfyz8xcIsDLdMHyAlzfvL8/Dl9QeAR/SWCviLsj6wqKnzeauzy9zini4JUh6kI//8FL2TxMIaWyqjK79KYZSGOH7w1vcrGBGUjLIAhnsurLFFhjrOM/+JhdcmxhNskjjDzIu14huExlP3Iw+3WtNPe/IoEInWXFoidrtVtOk5hAJthd4p87iyqFHlztK7aLYL8lBYCqp2lfTk+Qms/0o/Sqm5e3PscwOwS00FXG9fUjz48m1oMYes78ufdG94p4h8X2RE4tStS3U6w8/r9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ciWZXa6/A99U2tQtYOylB8RPWOqzvPnaaxMvHSntRq4=;
 b=oJVEqSlwZk87iAyJ4enLGFWrxgje1/kFI5PmCEExb5Dej11VwOwYv7XF+GI1EEYAyAXz1ahCxTe7NMu7pxGyfxkDaoIDSiZnoaNMO01GQNtixBw1Y9Q8qoBOiFqFUT+/G2vg5Zn/1xNGOZ5y3gou4882yHUHnzApt4QGyI2qbcDAhEornMJGNmwsL4ETsllit5rq1+9ir7hqslGGFUcfxx10BVmR0clFj4vZraa4iyGebrS7GzV711AStTl5Uezohj/Uy/l1BVdm1Asc2N2C7MlHE4GFbRUk9nTC6i+2712+9J6FGEsT/LfPpYudRX8HQYZajkYSozDX8qAoczalcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VE1PR04MB7247.eurprd04.prod.outlook.com (2603:10a6:800:1a2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 12:08:45 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 12:08:45 +0000
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
Subject: [PATCH v7 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Thu, 20 Mar 2025 14:09:52 +0200
Message-ID: <20250320121004.2542314-3-daniel.baluta@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0a29a7ce-0fc3-4915-e090-08dd67a7f673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rsp0WgL7Q7WuCxczQtQLha8F1go/kmUQEoQda+s55LZ7XTVevuV9+dd9piFH?=
 =?us-ascii?Q?dI5Xe8QquYGaefrPpqND0RhZV01WgNeJoLkVE6Tlb3EuSlqrH16lIvX2H1bE?=
 =?us-ascii?Q?aV8FP0/XvyM5wKVjSdNnO1IUgRqdM1wrFXmJnQTGmFk7VojNjWjtwkEmZZyL?=
 =?us-ascii?Q?q7VvAAbOGPlI9dJTLsgJlFoVwVl3Smt1nxtZUuXOLPj7z6JDoJVmJ01i+ULu?=
 =?us-ascii?Q?dRED2XMeqEBCUf4YastpiEMYellrZniwW/u8j5k1BfxLbielFlAqVdacW1Ra?=
 =?us-ascii?Q?nIyG3KyDCc1xKox4C39SAD5CBLUDhA31vg7x2A3C5zDz8ZAT9XaqxosmFsV2?=
 =?us-ascii?Q?eU2sYMwUta5yXPihwkB/Tuppsmz4mlShC9Sdof2rtgVYTp7ewtcaXbvSzivZ?=
 =?us-ascii?Q?Pb81jIQCBhQ2Kcm3KtnFOShsuV8Xwq380LX3ufJCtxdcooMXcfw0nbPIHRbN?=
 =?us-ascii?Q?+AhIkswC/XMM4u8snXjySZxil7rQTEOAvF/vdsVpRIyqMsmgeWfdsqSmRT5D?=
 =?us-ascii?Q?lMgXqbUwUn1iiSTpGukd7a5UniCnGrc5jSY7DksO7tjYk1hbdZbgGjq6Eqfm?=
 =?us-ascii?Q?De9IpW+pQR531vgEmtIPq2rC0Ml0reZNZWm151L+/iwBj01pFV5DhLKyzU+c?=
 =?us-ascii?Q?6wdph98UxKzeq8x+W2GthVb6fHsa380ng+E70uz9TJjc4reRWnZB6NiIABZb?=
 =?us-ascii?Q?gT+rTmqktmw5u044IB7zQLF7rJxJNh2XKMks8AXmfaQuTN7NTVHWSjk9boiw?=
 =?us-ascii?Q?KkSxQ35Cgmm/rEZzX2LhcazraFG3wbIVJrdd/s7e/rxBK6QSuV6hYGpqDFWF?=
 =?us-ascii?Q?RXEvG9tBRD5SdmZIghVx7klRojttaZ7edkl3IjwDL/b59h2jPbMNMbUwCQbJ?=
 =?us-ascii?Q?uq2m9zKBPF2HWSSuweLGs6nva2fFwOJ8Tie0m5ToIXabhEMPbeZfLZTP7DEx?=
 =?us-ascii?Q?R5qJ1lwlQBtQtp5eLrzVFH/VZ9+YJyl2NjZSVEAItA44vQrflnLKQDrMm3pn?=
 =?us-ascii?Q?oqhYxXqdU6af0mCHsm8g/gzBRzdCH04zGRFXi/M9zlO0QX+L7hKs3jRF4wxh?=
 =?us-ascii?Q?RflOMstBipCwPridUgyW7mgvhchHLRzTbwZe2IDa4ICbEbng3DKYj9hXPN8c?=
 =?us-ascii?Q?I2JOSG3xvPCnS/IxBMlYomTOrJyQZRuKFJnu2MDK8/78+loH3sJ7sp/5BnIy?=
 =?us-ascii?Q?NKkZk0n0QodnpcDbzY+s+HDdCfNG7wXd/Wn/3UJ4F77nCEInvwIZScHabPSY?=
 =?us-ascii?Q?r1fwhQuP2Y6hHble8y4h3viSb0NE4PMLi8Mxa+KVeXcRqYVEz8ci8FVoWbjH?=
 =?us-ascii?Q?Z0bX1gq4JbCBOCBsztM7wc5/lQhnYtl8gA6t9q2mEdgNmjcUXV94aQqbnPcy?=
 =?us-ascii?Q?ArhV3ZeCIvzFWoIYSQjmAV1W8r9AxuzM586bL1zDSRW28MM6g3Zqa1ILlWLj?=
 =?us-ascii?Q?0uP9QiudYY/iJt9swW00CzmI9lqxQX/G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5VIpl6ezmX9UCEs77VF0pFT5Cx1EPbIxGi1lD+oNCUZAX6Rd+jWebgcqYTu?=
 =?us-ascii?Q?2FEaz1aXv6dbnwPjOHlaLm7OiT66mP+l5d3rsnWGw0kbGDz2zp/7vqw6luQR?=
 =?us-ascii?Q?D62BmrthwsgMwVKk0/5JTMW8nXsz2WmVG2kg00JZ760+Ey3HADhBi8k9MlV4?=
 =?us-ascii?Q?OjwBHk3wrKRQUxf4f+ZJH8WtzkjE9qk3pLekMlSR+YKnsNYbhmWxcWGtWK9p?=
 =?us-ascii?Q?gEg2VWx03pBDarfJOnfuPh475L9PFWyYOOP8LGHv2dNtCsa0EmTwOaVe6Mpt?=
 =?us-ascii?Q?MWosM06rwJGXU+dLEdfHOcIjDEJ0kLXiKtWOveKaesRl8SY5y8+miD/lh65F?=
 =?us-ascii?Q?SadBCaCRxq0Z6gw0wpcloM5qV5qRRlmcz2DA+OMXizziR5TVNLgzLE82XDJq?=
 =?us-ascii?Q?MxHYIe84OD/uMW5Qm7lMSAe6hWOVMgmangDclrF2wu6KWFXd9kGx8usoip0A?=
 =?us-ascii?Q?OT/cUwT+w64Lls/M/rGCyGEn/J05JRtt+UhL85182V+UpajyZ8NDVPEoWclf?=
 =?us-ascii?Q?fCqIuyNGstBZeJHoDalUjtnoclOf6sRHzbRMdZvpi0qoJo2h4SBCXKKBLkuk?=
 =?us-ascii?Q?q15sxMpCNif8lhgKyZFMyhiUzaPG9DxIMcLPjYoypFeNKB6vc/YQcNJjzrmV?=
 =?us-ascii?Q?Kxwl20kyVCQiaNs9bqYBBs83nhw4tTVqzMYqjxYOUTffuERypQ+nLigoW5Ss?=
 =?us-ascii?Q?2zW2udmefTCDaUdsjYhL6GMXOQ9jgPunxTx3DyaCYLajkuix1x9Zq03yQsUr?=
 =?us-ascii?Q?ekSW+sOyuLMj1KcCzQMwZ8J62+7ZT9+qCU0clIgjTg/SEGURbkHpOjvQcqgT?=
 =?us-ascii?Q?vLxYPzXjTHGVXFmr+ZagcenCjwwse0TKCn4gJguVpJ5KMBPg8BDGZm4Iosqb?=
 =?us-ascii?Q?KLPoE2raqEp1KDKQdaeCMdDu/iceYQtRyKXy/iQfLQE7uudgGldmCN8v1Phb?=
 =?us-ascii?Q?ePjbpt5YqLDBqvMQQuGd1/Rpd9mb1ujkmqaGFON+Ro66qwOQdwm9OwXOKnTq?=
 =?us-ascii?Q?yLm96FJrRMADMdcKJXbmmflkQdLmktZKQNyWs+KkvAwUFEODJP9RdB/JeRXD?=
 =?us-ascii?Q?auLIY+NvEHZ3fQW1uoCAexSgugUJA2nhJZnTz4RnWKezpBPyFtKoJyhUOV+3?=
 =?us-ascii?Q?wjmcUyM37cy2AISl3k0duibFGqqLUQ5QylB/t1JFylt2LjnvkMDeoAcdhtI0?=
 =?us-ascii?Q?/6u3SXh4c7BuhTjP/JRV9++E/iP07LRIURA3Hwte5IHQAkcw7/DEkNladfQA?=
 =?us-ascii?Q?DXl46UAjEhYMiEH9t19zARkZRI8vlIA+ir+FpRPXeHAOTjQnhaI3Zaev5MLF?=
 =?us-ascii?Q?/yCHR8ehwGLc9z2aCzsYBIQkeQSih7dEpwCjJ9D05f56wv2sv9bhopzQmbXY?=
 =?us-ascii?Q?cSIIh+qrOMegnNUgrF+aV4Bwme7MSytefWqmoqihSy7KVVLbsmv0E9GzrBhe?=
 =?us-ascii?Q?2bHczbGZl5UYOGeT0ppE1uM55eOKHAauTdP96sFESZWuf2A0d/UJ3Qngsm8F?=
 =?us-ascii?Q?HEIb5tD4UF6QNAm5PUXhZOtFfrV5DGjyZRq8t4L1GHkiFOJZte6Xa7QToKuB?=
 =?us-ascii?Q?73FNNDwee9lBraZ+oQ5igOkJ5u+qUOv9wSlKuDN8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a29a7ce-0fc3-4915-e090-08dd67a7f673
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 12:08:45.0785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Dx9Ze2MJ0xd9fUTdLEiqx+3OoXRQsf9akyE872k59UUxsGQ+fiQY/i7SIJmy1PKLtCgjVmYQvsWodygGMxmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7247

Enable MU2 node and add mu2 root clock.
MU2 is used to communicate with DSP core.

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3b725fe442d0..fc0d244cfd1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1253,6 +1253,7 @@ mu2: mailbox@30e60000 {
 				reg = <0x30e60000 0x10000>;
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				#mbox-cells = <2>;
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
 				status = "disabled";
 			};
 
-- 
2.43.0

