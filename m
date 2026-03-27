Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9921288C39;
	Fri, 27 Mar 2026 02:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579243; cv=fail; b=tJZx0UmnvEgkjvxHqWIl0k4+734HLx1XRM/MAqgQtebcYHPbUDKcsl/4tyAqEcCfR3w5nlmoz0Km6W4tCKxceilCxgHNp+EKmnm5yB0PfQjgeOTB7kxBxuA7yp7Yrb/+bfTh1ylDwDhd5O1BP67UuzS9JErADv4dUM08G96qRG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579243; c=relaxed/simple;
	bh=/m97GqdIwt29WMWJIH+hd3nn5R46OEafhherGRzLWPc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kpVqVDHU/86SnIvtcAV4vhQCCrt1k+DN0DNRZQa3/b7GQ1V3mG+SCckzY5jme0nbXkTfNUTK7dR1HAvb15hQkSKhMqlR+aqbgZNoyintaVluZkaLdREUoNGVlHK+VKelCVnJ77m0HMOf+6OhhLgLwMkWKLQ93go7GJ1C9KwEqNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K/i00kgb; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K/i00kgb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSItz1iOJw5o/d2EWigkKYkQAy6hbsbrB23KiB0rr0io/olur1REHMsQxP5VkRZarH0oGxe3HqvE9qgVuMCdKKDIl2bCJjUqulzQBeZhB+UV3F2YcrU4Q3Cy0WilMQlvVzXcUvlg1QJDzcNxX1Pik/zZ5POuCzENwTiheXizxlDI+ur+5B4bNyZFTcnlLctP9zTuDEfMU4jxewTrNr1VqafnaaehDYgjyZHsg3n6msaV8HckmOzUj9oLl8no5QInR671/8tVHgrgFj3/MvkFYrYMNwbmhn1eOy0cBKYqxz5yaEA2jxQ7+rsxNXdgq5aAeT9vNjCwyzoHu7NaPntp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=EgQXnVESBr1D3ysdNkAjvK3X+M+U5WxvIP7gqPbSZahQPovK18Xy+2DHI0C3gcQSwP1zEbIVB1GSVr06gfci1rBMAodOdVCCjJz6vWk5wWyItRqy8LMunTdxdcLnW9Fp2biHNBdoUHA7ceFqlpqTy2Slr4AQJvhXSnDoHaXXKHrWVo1fQ0xHh3ucpMbFDOSHZtZ991qyAu5uWg/YFq5WT3M/iM7r7uBobA1HAc5RqloAgCozMS1YnWQPwuUleg0ta2ZWfL57WEw4a7QoXjq81meHeUNj7O3UpeTOvC3JDwl8GC55Ocy1v0hlW9PcDWlg6bCqtnJrL0/4W1S9jdUBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJ0nuoIP6+q1zpHqviXArpNnedMN/7Gd1F+BYpJavnw=;
 b=K/i00kgb4cfMuWev6LHqpQKEjGIqD01izoOLdZhJ9Xk/GRaqYvS/flLuqO8rMQNUx05GsrP74whmQDggQj3BVXlKxCTWz+ZGFcLXpad4uc1R+WvzMLdpPQIY5GuoQdcgDHYn/JfuyJziMrCzvPGoPWG1ai1UJdMQo17EoIJPkRXiwnFFivjAiApSIW0K1E3ii9ekCtOcSHYyKPqckp4T7i2o4PictzqiprF3nLsZbH/PwSIsMq1NevKppYfKS0buQFaB3Qc1e8f465xlO1xfM34kvu3KQIB5TRlZSwcZNCbg8Imfd4sI9pFR/jUMgWRzplvp98qDgiTQ966V7FVe7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB11084.eurprd04.prod.outlook.com (2603:10a6:102:492::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 02:40:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 27 Mar 2026
 02:40:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 27 Mar 2026 10:42:02 +0800
Subject: [PATCH v2 1/3] dt-bindings: remoteproc: imx-rproc: Support i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-imx943-rproc-v2-1-a547a3588730@nxp.com>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
In-Reply-To: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0190.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB11084:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e588f90-732d-4d96-0094-08de8baa2c3e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rN3QufAatBrXrpgLXyDuDXvJbB5Vugk4BvkRHkvaq2YTAQpddSeC3B4qIfb2uWRbnz6kOX+fH0sXL83EXCgVDOgYuJFqQjphakuOyjJ9wZWf28SCOBzh98pV/FvPmMlH5Z/uzIEHeEvreHlQQjf+hS6ZsIV2IZ9nctxxNu0SPHI0AQZ2GZRY5f2HA8VzHykiFcT7ioeH+nHuOzZXi74tPmxS6Uc3DOXIjcX3LMpd1x+itnAtq+n0lupoS0V4iZoW9JD6weS2Af9V13g0jG1iT20VElKyc9CKUr+7wT9rnxPnnyIj9qvBIq1JtIX6Edex4W85xTU/DX93pqfPSdSVBMVjM09uqzL72og19vPLsWLBxqpyETMADdgFUAD7x505E/0UQ+k3lRtRmtuYvB7DjXWe2Zo6K3Sw6vDGpi25rlElJW+nMRtpLZclYVRC6n8xVTjCgvSWcMqWJXc3W7bg3iuj1akMgTQRdKJCWhScexyKIoQk5HbIR8YjeaGwWBTJiiJS+doNIDTpTBgLiHC8hjCbaM8vMUxe6USvLLLuVndp5oKlfGgSmp1DOZOD8hw6A5i4WKCLUJGzDA1YBPPpLq7wiR4TaXvJJUh+QUJeXSGlXAj6vgx59HKWTsAlODhRdkDVrN40GiEDTyAsP4AQTF5vJNR8qnK8sBro5VawJC2FkRd6aYgyY6qKchZetRm3QHLHwhy3Mr6gM2zdffLhM3jtXAOo461JZ6qrJpNgySFDC92ZmN23HauWeLSPjryyE5HmQAPrI728ZzXwrQRcIhllwFWzZiMZrN5tC95onJjiFPCoI6+XIWS3k1ytEClQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHphNjdpMExadXRCNFQrZW5sTHJlM1pFOG12ZUgzNTMvVVVGN0ZBZC90QTkv?=
 =?utf-8?B?QWcxS3owRGRlcTBxR1RwaWtnRktmY2JyTk5lOFlQM204aG80dk5lRzRqRkl4?=
 =?utf-8?B?TjZoYnF0NHZ0SHY1UkpXdUladjNIRExzK3pQSEFNamdTL1FrcmdVWUVESER5?=
 =?utf-8?B?aVppMG93RWV0dk80ZnVNLzFuaW1YcVZmQzhoV2VLdFBDOHRVSG95T2VKaXhT?=
 =?utf-8?B?SEpkWlRCKzRkZUZaK2k1MjRIbzRtYmY3VmhqVGE3RUhNZ0JjK2NGdHNWZGxj?=
 =?utf-8?B?bHFpdCtkS2JtV1FSUDBESmFacFZ4RklMMW1ldlZqK2NtaFZGOUU4WndBZFR1?=
 =?utf-8?B?NkxzQjAzZmVOaEliWko3NmRQNk1VTzhOSWhTZE5GZzEySXVDeGNPSnVoMEJs?=
 =?utf-8?B?VlAvTDhvKzlKejNWTFdLSmNwekNKZDl3QVI5VXV3Q3F6SnU3TnY3NWRUTlFY?=
 =?utf-8?B?WDJpZy8vVkdRT1AxU1pQVG1wMi9tWW5YMHdFdmtUMlN5SlF6NUhWa2RBd3F5?=
 =?utf-8?B?SWVuK0dwclNxTVBnVlY5UGN0aW5oM1pHMjBtdGhVaWc1UldRelJLODQrL3lC?=
 =?utf-8?B?aDJjbFhpR3JxT2xwYUUxNU5kbGJ1SmxOazFranFXTWVsQ2NET1hUN1pGOGdR?=
 =?utf-8?B?aXJHQ1hMY2NMdGR4V2xqUS83OFdyRjBlNUFxb3lWckZJZ2tQWFFwbVlJUzdn?=
 =?utf-8?B?VFdtVzFKUk92YVJjZFpWeWt6a21IbDJZN0FsNmZZeVpzY0ZRSnEwOEtnMWZS?=
 =?utf-8?B?WXV3VjJSVDFiRlJkUFduc1J1bEIzNUtLemFYTENkMlJsWFRYdTRoNjVTendQ?=
 =?utf-8?B?NEtpNlJzaG0rT21ranowNkNOYWFlM2hiVTVPUTJ0QU5NZUUwTHBJQWx6Z3Mr?=
 =?utf-8?B?U2F0ZGdNbXhJVndNM2J3Rld1YUhMdEw2US84NGVFRHlIekl1ZVpwbWpBUncz?=
 =?utf-8?B?NGk4V2h2bjJhTXphZmpQamxKUlpZZWkwUXR3TzE0M0kwbktrNTFkNy9BUUJC?=
 =?utf-8?B?VDBSMDV3OHB6cC9aelJ1TTM2V0R2UkN1akErK3BmMWpBUlJpdUI1eS8xRlR4?=
 =?utf-8?B?WWZvL3lteFdVcC9yTUY1RnlqdzM5bFNLalVSSDF1NmZEcFI1TFk1NGcrbm5P?=
 =?utf-8?B?dHoxOVlsS2RNYXZMNGlCcjVXQjhCeHhud3BndVM5R3pabWxyVTBmSTYwQVJv?=
 =?utf-8?B?dkx3eXZpaXZuZWdZVURDS1A5QnkzYXVsekFlTFNZYTRjVVowbmM5ZGFhL2Ji?=
 =?utf-8?B?bHRTWWhLZmM2UlZMaEYycXplWGg0WGVzdmNGMmswYWlIcmR1MEp0RE93d0pL?=
 =?utf-8?B?YXMvNFhjUGhNck9uTDIyc1Z6UWRReE9JUjg2a2IxejNBYy9mMmdObldXUkpH?=
 =?utf-8?B?VnBJenNacDc3MVhoUklFL251NGdaakRkSy9aWUdvTFVLNFcwY2Fabk1XNDNP?=
 =?utf-8?B?aUlmR25sTWlBckN3Mml0c1hoWXlpK0twRE5vRlo5ZERrVDF5VVQ4UHRvV1JP?=
 =?utf-8?B?ZitvSzZuZktSanlNaDErNkd0K3hJY3lvMW1QTEpEbDUycUVCSmNsR0s3WEl2?=
 =?utf-8?B?akVMVWd1bTFSMHVUbXI1Z1dMOEgzQzloYTdHdk9aODdKWHBGbXJVbEl6Z0I2?=
 =?utf-8?B?MGYrT3k1UTNua1BDNEtvdDRpNkhkOFk1T0tRelM4T1pXZG5Bak5NMW5RWG9R?=
 =?utf-8?B?NkFlVW9ERTdaSkdGdW9lN1pKR1luOXN4c25QNFlLQzBiWFJIQlJydzJOVncy?=
 =?utf-8?B?UUkwM3QwaXFRTHhKeWNmN3p0OVNuT3MwczNza2ZhQTNXRjZwMU9RZWlMQ3NK?=
 =?utf-8?B?S3J4N0VoNjZiaGgyMWl2bDBYeThDUUROZlVrUmZ1RTFBVXF1d1NnbE9iSFJF?=
 =?utf-8?B?aEFFemdTMVdvcDU2U284eFpBUWx4VXhXTEVuT1JJMTU1NWQwSnJIU3ZVdUU5?=
 =?utf-8?B?TFBVQmhMcERGSGxvRUlBbzY3UG54bHZaNGg2am53S29EVzVZMFlnWmJ6VEpt?=
 =?utf-8?B?VVg1RVZiVWpjb0t5eTlnSkk1OFpMRXc1UmZuSm92QWdUWU9ocmNHcGcvaEZu?=
 =?utf-8?B?aXByeTFrcEUrckdBREhyV1EvMDgrL1pHM0xNSC9DS21lN0M4NHFZdmp1eTQx?=
 =?utf-8?B?UUtNd1VFSnpQc3pXcmRoTHJZaDRLbWJDMC9HNXVDbVh0Q3lNTUdZM3UxSUt6?=
 =?utf-8?B?L3drRlkybUdId3B2MWZYV25vaXZyRm8vbmRQd0twc2xiaGlpNEJpZVYvSWJq?=
 =?utf-8?B?ODVkWEpMa1pRUnkxQmdDV2EwdkgvaXQ1UTY5RDRmYmFzcW16VzZrbGMrUVpG?=
 =?utf-8?B?VHNoTHVnc2R0bE5wYVRXYkJQSU92WGZ1V3hKQTZCdyt2YkZTVnJoUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e588f90-732d-4d96-0094-08de8baa2c3e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:40:13.9227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJzHo5ghWoXpnpacWoiG+5F1y57rn1plLrA5anym7q0tAi8C+203490x8J6XX/eHm9Of5nrYAd+55C2wkC8dYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11084

From: Peng Fan <peng.fan@nxp.com>

Add compatible string for:
 Cortex-M7 core[0,1] in i.MX94
 Cortex-M33 Sync core in i.MX94

To i.MX94, Cortex-M7 core0 and core1 have different memory view from
Cortex-A55 core, so different compatible string is used.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index ce8ec0119469c8fc0979a192b6e3d3a03108d7d2..c18f71b648890da9c25a2f3309d8dbec5bb8d226 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -28,6 +28,9 @@ properties:
       - fsl,imx8qxp-cm4
       - fsl,imx8ulp-cm33
       - fsl,imx93-cm33
+      - fsl,imx94-cm33s
+      - fsl,imx94-cm70
+      - fsl,imx94-cm71
       - fsl,imx95-cm7
 
   clocks:

-- 
2.37.1

