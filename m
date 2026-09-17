Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F64E532B;
	Thu, 17 Sep 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669227; cv=fail; b=gpi/urOSy/AzaOCq/PXfp7V3JrAIBF5WoIAvOWtYQqkXqmRz/2qc4xk7HUOtF+83l1q5wIoAIWt5OTqnYSqG3xpxiP2KyWTiVnslq29rQ9Dtgv+qvXuGSweSvskTpT0kjNVhNOWTroN9vAp0pOC4ptT9/AIUbUMChhcvotBh2M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669227; c=relaxed/simple;
	bh=mlAeVJTeIeWRtOOTAJ+4mWc3ynDxKYUamr2Q9C/kZvs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ubgnvHeObtcrxlyjAy7ajxeNjV1tRvKyHwUn+XCyz7z6fWNCUvdeZazFhZkTpUdM1IUlxN5/K/mE+39pRavThG0IqBmaCIpQLhxkzjrunIOYKQtSFtofvRVbd0cuqbazMhFWfs7jEyS/wLaNpS1WSlQcNeGzOqRj7ZCj7ESONm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K+ChhvG+; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K+ChhvG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBpS3WWMCZklvO9w5KXxHCpergIlLPFIk/vGtGtz4/OtOoeGCfie3PjNd014HfEmS/GAscOBtrPxLuYDZ09eirSOOt39HEC3Rxc3EFyKYZchJfaYEYpystHZwoElvpc5UPp/7+gDvk3/ws53ePZUj69sM/RhUaYqOW7nFgy4IhYOBPNOg/zKripn+pp6Ha5DE/z6Db5s7ugt9lm34dDhjRp7zxMG2+lPr6GU0XJtozzKlByRDgo14sO4zFuBRSAs//O/lj1VozgmoMSC/RSz3JK22luau6C3HEwDaxPmRW3uc4L193l5fYxshmxV90QKdBXpFgyCsptuDWKoAB9d9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2SMcLyde5nF4hDCQjDcThDcbNYAW4u48eOcqbMaYsk=;
 b=K9mSH8TX8OB7fSE6ywuZmpmJdKplRxgczHnZCjK21708rca383OLx2JmSp9Lqp+9JVzVYJapwFgVqAy52Kt3Nei5FbI66LgeiX/A6yv2imNFk+j7iyxUqHBOUuyXcsBjB9S3q3MggZQI6EMdRpRrA9lKk8OMjQQ1C/4Eh0b4O/a18lVmi3mPGG6jE3tEL/QUovfTm6CaCAoTUeS94EsizEL7Ei/PObUAlMEFbWiPFyLNJLqfxcMwEK2o03fx4w8dfGayZv9lNxRJE8G2BAyygPY6EE+EKBkJ+kBD2bjt1ZiK5MUxGkXkQkbqZUzPLilnU2GwzFbk6XEpwdoxWRrCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2SMcLyde5nF4hDCQjDcThDcbNYAW4u48eOcqbMaYsk=;
 b=K+ChhvG+HlIhGQZcIKF1qli3/ws+JIJqFGE6CnVnE/fFtMmCbB+cO0dEET5YNvisMfAsLK2vTp9GL40KTlg54QFwZttidt4UMfcq7nXq1kK/icNFWubvuvrGHvuTVuoNzdQwXqPIxqtC4FPMv62jCMPRlmYjDxFVQFoEriKXcwAECq2mxJZ/PxZrqUJ8ybu3S0br4jpjzTnqfLyN9gk8iE/l4TXKfQ0InFEebZRzhBXO+SiVbzCamtcLwIGeql0j1hN4YnjuQhENkUeCOP5ygZ5lojI3stEFIcPksFjlBOqUFKs1Mpe3uToJrXelHjq6u9f2V+9I8U9CZ5wgTQUfZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11648.eurprd04.prod.outlook.com (2603:10a6:102:50e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:20:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 18:20:23 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 17 Sep 2026 14:19:45 -0400
Subject: [PATCH v4 4/4] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-memory-region-name-v4-4-260755920ebf@nxp.com>
References: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
In-Reply-To: <20260917-memory-region-name-v4-0-260755920ebf@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789669196; l=3242;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ETgz48caw3aLrzk8Etx1Fcdum+t4tdcuDXkBGTUl3lM=;
 b=1/UW5wijxkH5LCBC/nsCCg9RM6y5vxDAh1hQxZ7Xq64ACal/wcZtnRzCiSqdLA4hGjKVSXaG4
 aVJ+bMRKtt2BBEpLuGqsNy+5TZHdigrUSELCqG8RxbeC13FhcxakLLP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY5PR15CA0191.namprd15.prod.outlook.com
 (2603:10b6:930:82::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11648:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6b83f0-1921-4a50-e968-08df14e856a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|6133799003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Hx+qBZghJPT2btlWIyz+yRd4nJKEvGcd/EPS2IJgsoUv6FhW3bdBTlZ7wHDri3McWhTfHVSPc/qmBCHqew1acvAJwUOIp6+jAtq5fQPPoDlTq39sc44AKrWNIgY1Na2ACpqayM5JSqIwZaVaVc3uqW5g8B/38QK7fcwIRKwGGCbV0JyioB8ChnDUT8c42axO5AQn6c0ObMIQYQ7vTSdbjUjWNYjl0hyg7GWscj9hUjAaUKUR0wrhrAiTLb4jT96XVsZVoXT0he7eqqw4kEpdqlAeK90Sp2pTCdtWqC/Ukdpqow13LoeXv508QdCCegqmphf76kWayOEcBLeyE0NfZYh/YndikIo5CQ5fdB8R5nKmu/AAylDdHuK1Iz8KXM+Y4zA+ovC7wlSMmHBlC5UDQe+k6dWJIchJx2FjXFe6okyYqKZVW1kPMcirTL9v40TLyFbjipwG2kyClD1ppPX8rrmIAU3/hBxPFifXnvj+3rnfFm8prb/DZTGGHCzr+1D9EWvcUAGw/fd+eQzjFZERYCuw4mD8yfmKZU5QOxwZNsXg5JYgBBAdGdoLRJkgwxq9vPo+eDRt3iyQG2z1RuEG5PFyWZsf1qIbcodshFh16EP+Dq31fcst42NdNEqC6a13DPl5DL3lCMJv53s78jP5k1Cr3Y0v8IuehWkoHbJSCJY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUs4c2ZjMHF0UzdjY1dUeTdlS09IK1d0VE80M01TSG1DQ0pwTmN1TExTSVo4?=
 =?utf-8?B?TmZNdEJ2d0paM0h2WnBZem16a3BrRmZUZE4vNVp4TEZKYnE3OWlMOG02TXpp?=
 =?utf-8?B?ZE9xUWphUVlIVWtrQlZxQjFHeTNrSXZrZ2Z2WW4xRWRZd3hVdDBNYm93eWQ1?=
 =?utf-8?B?QXhYWHd0YTlKbEw3THVid0ZNVnFoZTF2cHNWU29GWWY4OFdZbkhPR3h3V2ZF?=
 =?utf-8?B?NWFudVJBUFJKN0ppT1ZySFF2QkZyRHR3UW9JMXN2NW1TYUF3Rk1KL09wdDVW?=
 =?utf-8?B?Qlk5RElYS2RQUGdOZVdzU2xKc0g5bEdmc0s1TlhSVFloZ3cvUlpvTE53Qkw5?=
 =?utf-8?B?TFdJRUMxaUpmMWZtaVNHcnJUSndHVWx2Q09uNmZXZmFibUY2UHlGaFJHZkNJ?=
 =?utf-8?B?RjVyakMySXBkUFUxZHFVeFRwU2tka2dLZ0g4eGd4TjM3bUlrb3c1N1E2WGpN?=
 =?utf-8?B?V0N0ZE1LNGl4VkJuSGE1MUlHY21XWmtzcXc2S1RCdDlEdG5OYUJsMDdqdlBI?=
 =?utf-8?B?RUR1Y3NjUVhqcFNwM1hRSGZPenJaTS9MRFVIaWpzQnUwZ1EzbkpmdDQvdytp?=
 =?utf-8?B?cUxweWxveUFYUnRGTk5yUm9reVQzTko2djZJWXc3N3JSd2RpUHZiNWc4Y2tq?=
 =?utf-8?B?Zk03TEovWFNYT250aVVBK0t6YlRtUlZyZzZuRlpYcmY2cno0RFJNblhLRnNU?=
 =?utf-8?B?MTFxQWZnaXJLcXVtMDJXdm5IOG1uTUpHazhraGsyaFNOZ3M0aWVGd2FJeElh?=
 =?utf-8?B?S1d4Y1dORk9aV2JjMEFUamhCdnN1WEpwOWltTmkvQytXcGRZd3doYjNNSHJ3?=
 =?utf-8?B?TEl5RDFvMlMwY0p0U2tGWE5GdWVtMmxjTHZxNTUwRzAvb1R2OXJaQmgzZXhi?=
 =?utf-8?B?OVRkTTVQenY3eEZ4WDFnb094NGZiaVRXWmxuT2grd3dUc2NQa1JtMi9JbDk3?=
 =?utf-8?B?THNCWGs0TFI3VmlFZkkwOWtscmtzeWE4djdoMCt2ZVFTdFJmRXNrTlIvbnpw?=
 =?utf-8?B?UkZpd09CV3M0cXhUbDlQQ1JpQjBYbmhtZEhxM2wrWkFVZ2ZlbGJCdnBKMy9Y?=
 =?utf-8?B?OTF1RXZQS2xTMkZ5bGNDYjNvNFZnNmwrYWR1UzV6bnRRZ3MrRmI2aXVZL1Y3?=
 =?utf-8?B?c2hzV1RNZDNqQTRLMyt4d0VVM2JDTVBUd0trMlVROG1PdUdaMDVVTysyNEh5?=
 =?utf-8?B?TDNweGJKaUxPbFFIallZUk5Ha29WT0NXUFhLMXFDMzNGVTV1cElEWjJVN0Fk?=
 =?utf-8?B?TzhRSElTUnNteUZOQWkvRm1mcVlWa3p2ZWowam9YaW5RWURjNWxldnhWTDd6?=
 =?utf-8?B?OHoxM21vWXBPNUZMdG1FRkRseXRSRWxxSnBHNmZGUGxaVHRHTWVWbGZkL1Y3?=
 =?utf-8?B?R0ZldytNR3JrRW52dGd6ZWR1OFFlL3RuVjZRT0tCeTFsSU81cmNvQXl1UE1o?=
 =?utf-8?B?aHRpUXpJbHppVTdwSG4vSmU5Qmg4anpnL0l3N005NWZXK3F0TFBBcVM0RHdH?=
 =?utf-8?B?cXhmeEJ5aXVuUjBJaWYzZzBiYmpjSWV4N2NLbklzaW02S3FNYUVkZDZ1Z3VM?=
 =?utf-8?B?Ym9veTJJWDlsMVJRbnY4VDFtOWVlN3dSQUU0M2RqNkQ1SkR0WFFGRk1tUWZJ?=
 =?utf-8?B?VzRTRVY4MFdRdmVNRFVQa2VlQTJuOEtLdTRMZHg5amt2YTBXY2JxVjczeXpP?=
 =?utf-8?B?NSt5SlFDcm03WWpyb3JodE9qcFdCdk5SRk1ueThJWWVNbGxvQWd2Q3RhNVBG?=
 =?utf-8?B?MVoxTTVzMlZRWmJkTERxSjZGN1IxZ0tzWWNOZXA2dUExTmlvY0QvSDd1cCtJ?=
 =?utf-8?B?RzgreU9rL1lWRG5Qd2J2NmlqWExPdk56cEYyN2NQblpEVTR0c1phZkh6cHJQ?=
 =?utf-8?B?TGEyOGtOekNIV2gyc3lnU2FyU1ltUjllVGdiOHhMOTI5b0FYbUtOaWNzcTRE?=
 =?utf-8?B?QzBvcmpHTFkyd21hQXBPOU9iL0djcXYrUnJTN1psZUNnT2pVNlJHU3JkNi84?=
 =?utf-8?B?ZVp0VS9WeG1XanlENmZQTDhGOWJSeTlWMHYxS09YT2lqQUpaZDFRRTh3aTNH?=
 =?utf-8?B?cjc3c0ZEdlV1dWtlRmg0VVRZdnhaY3NZUjFSbFc1RGY0UVUvT0QycDlURUxF?=
 =?utf-8?B?Y3ZjUm9WS1hyNHdjdDhpSlBtdldERW9WcXFRV0kxcnRvdmt3bUpqK1ZWTmVh?=
 =?utf-8?B?aCt0M3JtYWt3NWI1SmhXRC8rUVBMZWlaWUV0d1JSZWMxYWtCeTBGd0Z1S1h5?=
 =?utf-8?B?REtQdGR0c1o5c3lLVEhyQStndVFneHZVNXVwT3F3UnJ3ckRYMnV2VHpMMU9Y?=
 =?utf-8?B?NTV6dE1tZHhyRXdHbkp0L1pweGFjWG5CbnpQREZEZ0I5L0hkSzR5L3NJWU16?=
 =?utf-8?Q?3yj5Bt5DF+5d67C8S/WJZG2pmn3IBesTEWPGL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6b83f0-1921-4a50-e968-08df14e856a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:20:23.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyPZ0gHAPyRuyrGNMuSI4W4Ctn9+ZZyUPB/NKV0NTJNdPmJZKtp9+yStQnwJTA0gbMWcNkEFewI5IGs2ZQ/MVGrK0mvemao+C6Lounqqn6T1uEzOSqGzxAYbDHomMxhO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11648

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 ++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf5..3f98132f5a32f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 0000000000000..bc02864c6f88e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
+				<&vdev0vring1>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0",
+				      "vdev0vring1", "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};

-- 
2.43.0

