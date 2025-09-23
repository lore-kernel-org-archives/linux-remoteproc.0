Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562A30F943;
	Tue, 23 Sep 2025 05:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758604624; cv=fail; b=JLV6a4gMUpDM7D8z4PSLfP+nkT9uieeSAd1lruEu9K0kj9/p7fT9eXIht3HQ+dGCKEzA6mG0fahVMlO5+XafVWO0tfu2k8zGPLsUVawt3i3muaJMTwZgSemOZYIpfZBq5grQ0dazzJD1LC1QEE34Ly8XLy1X4vKQI7vkDE5V2vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758604624; c=relaxed/simple;
	bh=IieRmfK+zuKrH8a49WMtof7tsn07fMSp09DDmTnkJ6I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TUb3ik2yyGz7m+HND+G12xGRAmkFvHAF/AGwuIY/MvzqMPjqhXGw7vP5zuAaVmyQfVDuL+geJ0X/DCmYT1aoxWac1AHpfrb+bNVzKIehWDHCgrVA+2lojAQpg/88L3gvwg45x6e211gyodo+7bWBalipiQnr3lOZt3G9+HWziBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MekV8ho2; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MekV8ho2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ykmnyagy/nU3fRsRVtatuHvVZkSCgx9oxERfh41vKrpS444UKylGXQSWcmEtx3FgabIpz8ACyXB/RBXsPCVsqhBm4xMcwdlx/ePkUy6wb5mAe4uM7zePjy+8hkJ4daUQTivQzS4TmNVOpidesVH2bvID3kXkeUQEb/INa/5KyiRFL5iHFLFIBAdVDZa4KO9Res0DXb9pa5Qu81iC+okjDBtXl3+feKihrQY67e8zj7DCd5bki78vdFVP0bD3UE7TvBEfIs9u9k9TBcpS8lBb848gTs7OzatT7X5ESkTXUGtKh2fIPjh64G8JL7cBkF6IQEcLuQsO04NM3Du5KPFgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md4v4ApetAIsMRe4ytAG2PMqtQkaqAQrEN4JU3GuL9k=;
 b=G2WvKOvE5KkOpkqMNnYLxb0+uAvGX8PUAM+C6xcLxEhMjZYtSENky197plOl1WsPjQiVrM0IqL2eHbiFa+rnNBSTdVm4w9R0jZ9C1Ipxo08XkFZPDg1947336FLat67JykZoe5FdmaXOOm/JvXLJ2T0FmBcS+4lYxOf3JA1uEEmQr1NUs7964fotX2ECtWeVLSAbE3CHzh0iaREtzF2d4XAmO3XIkrqdaWDaxcQTCXvDaT0vJZvSuyM3xnjJdVogZlqa7PpRiHQyQtBzsAYHcdJKX1r1C33QtqerZMNTyUi6vnV32wvJTEljZw1Un0BL9/JQ8ifBResfe0bvBib92Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md4v4ApetAIsMRe4ytAG2PMqtQkaqAQrEN4JU3GuL9k=;
 b=MekV8ho2lTHohcHRr4Ky7vjYeC4c2p1okD1bgLOwoR+RUF/0Wz6JtHI0l3eDfO+ErkHF5kBdpnOI/gQSJnODrdz09mRsNNpJaEYlonOe/qKWigmtJCDDEFEtRyumeGYDnSRaOpWIWLViBobva25ODCLfTUJYoARzuxDi2kK9dXEXxWYFmMtVcQUNji7JPbufwyO7rSohNVOXfvA8XSrSL3Cwbvs4+PD7oob9OrsvMsH+i/lT6LWBAFtEn6or2JsvgmOBNtAJXZLu5LLQoJJGOJxPDE1HlEvwIvjf35Kx5k+dOs2HISO7HemaK+Wg09BBQNJbu5gMeUz9YJ6/OMW9iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 05:16:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 05:16:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Tue, 23 Sep 2025 13:16:33 +0800
Subject: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758604605; l=2869;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IieRmfK+zuKrH8a49WMtof7tsn07fMSp09DDmTnkJ6I=;
 b=/za5yGgJzzm2qX5acZoGTwautgjP+hTO6lhyxgd77Qk71l7NnhpA/ifG+OAR9S6SOm0k1vNIw
 9kxSuo04HUzAxogpw9hiZsOXcGUelTqZEfRpLIuRvQQYt3LuAM5CBQZ
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA0PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::15) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db90596-32a0-4655-e9e3-08ddfa606be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVQ1OTRLdGdFSTBZYXcvbytmUytDOEFRSXlyRHZSdVZyaWRGUlZpZDR4Q0xn?=
 =?utf-8?B?QlJHZ0dhR2dqNDliZ0VuTlJ0NE9xS2k0OEtqTkNqaVdTVFNFend2Qnh4RE02?=
 =?utf-8?B?WGIvVHRBU0VUb0FscU4vNzQvc0FlZzBhaHZtUFIwRHlOckpuUG9aZVYrbmFj?=
 =?utf-8?B?TnNLQ2lvNUhKZVJvWUI1bDluUThOMVpXRm1NQzJ2cDZEbFc5L29JMmF0dUNR?=
 =?utf-8?B?RCtjM0I3Vk5lTWxjRTR3Y0JYRWZ5d2ptUndyMnBJMDBCUElaYi8ybElIbXRl?=
 =?utf-8?B?dXFYQkMySVlZTXdyak5WU2JNaG55azNJU3lnaW9FMk81eHJFR1l0eUJrdW5Q?=
 =?utf-8?B?QWdQM1AwR2FvQllYMitBMkxKbHR5L0U4SE5FOFluanZFd0xqUG8wY1VmV0Va?=
 =?utf-8?B?Rmt6dDVQNHM4RTJOa3NLZjA4ZUpIVnh5cm9QNjBUUVYzeElYbEZVSmhNcm9H?=
 =?utf-8?B?dGd3UnA1ODZ6bml1UVZGZ3RvNmQ2d1o2cnBHSlZTSzlOcm50QTA5cFBGaEJw?=
 =?utf-8?B?OHNkK2pYbFFRbWpVbGNGcEZON2l4bEI3aTRudkRjK1U4YWozUUVoN3VKVDRF?=
 =?utf-8?B?aFFpdjdzV3M3TnJkMytxVngrSEhNQ0tzWUVNaUlpRzRoVUwrL1VKRWkzdk16?=
 =?utf-8?B?cmxSN09IOFdVQzNUWTBsZHBNTEgxV1F6dVZvOExHdjY3eGE3VnVGS1NoTUcx?=
 =?utf-8?B?Zmk4dmhZTzN6WFZ3NEZJQUpDTUQ1K2NJaFMrTXlQWTV3ayt1Ukx5SFYvaVFy?=
 =?utf-8?B?bzJVSnpDMkszM3U0NjdBM2hnS25RNitxa243cU0vNjRVOTdNOVF5c1o0azNY?=
 =?utf-8?B?S2dROHdjUHhNdHUySFlsSnJERE5Qb2lFZUVKQkhOYnM2Uyt4UmVvZTFxUlVU?=
 =?utf-8?B?YlJSMDRyRTlBaUV4QzJRY21WSjM4cHcwbzR1dEpIaWZ5NEIzQ3pPeStuaW1Q?=
 =?utf-8?B?Y1NsdUQrRk4rTlZuQVdoNFZtRWNuekpMZGkrTlcwQ2N1NXBod240eW1naUda?=
 =?utf-8?B?UC9PUElyTS95L0pCczRqaW9PVGdwZU1kQ1FJcVV1Qi91b2R2MUlqSy91dEZI?=
 =?utf-8?B?ZUc4c1NSdHowUjVkWEtZQmJMSnNka3J1TGtmUFI4VGt4OXI5LzdvalVsYmZT?=
 =?utf-8?B?M2ZJRTRVWjFlZ1ZiTFdlalJVNlJ5N0ZQb1pLamZLdGVReFRUOWY4Nk8vdlY5?=
 =?utf-8?B?L3R6cVR1Z0c1VXZiekQ2ZlRsQ21zSlp2cEZ3anJ5SHVoeGFWbFhnUXlJdnFi?=
 =?utf-8?B?MzlhVVBBa2REUkpQTmVmNGN4cW9SNm5ya0xic1BlaFNhS1ZVS2EwbHRDa2Nq?=
 =?utf-8?B?clVHaFRBQXYyMXdGdWVrV3FHZnVOWS9yYjJQWVpnS0Y3OVdYdXNJalBGN21l?=
 =?utf-8?B?RGxCQU5TMXl6cW9LVUtoV2tDZktTZEh3YmhFTjFVWVFQbDlPU0hOWEltMFVH?=
 =?utf-8?B?MlFpbVNEcU9ZOTh1MG1OTk82QjJIbjBMcWZmRHRGaUpvNStydks0T2svRWt6?=
 =?utf-8?B?aTRtczVMd1pjTG4rQk8zQVN5VHBhZ1dFQTREK0ltYUdjU1dxWnhuY21sL2lr?=
 =?utf-8?B?WWVEWWFIeDBJY0o4OW1sWlFlb25UdDF5UDR6V3Q3eEV5S2tIK2NyejVCVFNy?=
 =?utf-8?B?YlkvRGdRakFzQTB1bk5mMS9FQXlDZ01hYXk1bzFTY21naDhNSG00QlZJOFNM?=
 =?utf-8?B?M3VtK3hFMlVKV21xcnI0bFRtaTlRZDJDOWU4NTd3d3BVdjhPWVVDTy9pUXAz?=
 =?utf-8?B?dEFrZTBBeFNJcVYyNGNtU1pwSUI2N1BTOW8wMS9xNXpzMUZNczJKVERPTDBi?=
 =?utf-8?B?M1lISG9IR1M3SW5veHVEV3FvbFYvUHZYUTBESS9ZdXprT0pjTXFwVVZDSXFW?=
 =?utf-8?B?NHI3cDNhcE5hY1FVSk40WGExVEMvZy9LMUUxcm92Sy9NbEh2VXc2WnhEWU9r?=
 =?utf-8?B?b1p4czBNZHFPVkVjWmJjQlhJMkxpalRScFI2Tlg2WlhDUkdhZ21UcmVYcWRC?=
 =?utf-8?B?RGlQZ0pZZlJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2I0UDJ4T09SSm9VTlBSSy9PUnVaNGQyWTlCN2FDd2tTek9sTWp5L0lNTzNs?=
 =?utf-8?B?OW5wM3lEa2k0eG5adUpRVWk5T0MySHFCL2pLb1dwZFJJeFhiNXFOaUJiVXps?=
 =?utf-8?B?cGRPWW5Kd0FrUnZOWHRqYWtHd3lPRlFJaFVVcDBzNlRwelYxbFR0VGJheDRi?=
 =?utf-8?B?TEYvOEJMSHVXNmZzcGR0S3JlVXR2R0dFT3JXTVJBSmF3U1NKekRRSWRkcTg1?=
 =?utf-8?B?bjNIUjZONDhNMGdYWmxBdEdqK2hQL24rWFA1ZjdOL2Z1U0NtbTdKcTUxdU10?=
 =?utf-8?B?eXdVYUIxbDdQbWpaa1F4U2FHS1YwalJYK21IeXNWa2VlN3NaNDdyZmk0VHUx?=
 =?utf-8?B?bmxCUlpSNFl1eUN3YktvVHhpM1JuU1grTGZaVjVvWXhnSHl0ZkdjTnZkeWlr?=
 =?utf-8?B?OXN5b25ZbndkZWpIR0piMHk0eENrZmd2RGhSWnUxQjRJQWNZdDcvcVJqS0E1?=
 =?utf-8?B?NytGUkdKVDZPamVna3ozK1N4Z1JWa2lPYUwzMVFFOUVvQjBENk9yU1FCdEE5?=
 =?utf-8?B?Zk11M0hmYmJzRGtjOVVVTjhSd1VMeHlTczR1cTF2MllzWlhoRDdBTm9QYjNt?=
 =?utf-8?B?WGhnRVhJYW9ZNjY5Yit3YnlZTGoxN1FTaDFKeHJTRlZCT0dpRXZ4eHNMQVRG?=
 =?utf-8?B?ZVEvNkowbmRxdWQzVDNsd0Nob1R3ZVl3clV3aXpZZFlLa2RPWkxZaVlMMDV0?=
 =?utf-8?B?NFhKR3VKUXBHdlpwSVROamMxOVBJRWdUUldIRGNCcDVFYnVrL3lza2U1VTNy?=
 =?utf-8?B?ZjlIOHY5NUgrYVFQZjh2ZnUybGZYdHNrL1ZDSStudjFiR29ycnBmc1Y1Ky8v?=
 =?utf-8?B?ajl5SjczUmh6VURIVkdVcmE3d1dBYkZ2bERtVHc3dGpHVlNRNjlWYTJaVWVH?=
 =?utf-8?B?UU1Zb2U0SlYyZ1lsT3Y2RU1wdktoaWlTeldwY0xPeXNVUm1raElLV3Btd3Qz?=
 =?utf-8?B?Y21wanFZdnYySkd2UGlFK2R4bHRHNGdVaVFndWhJeUFlTGVhUnVFYUZmekN2?=
 =?utf-8?B?cDJpU0NCblpJem1ERXZFbVlSUFNYbWYzMGd3bVpoNUd4ZklzZ1ZDQnRPc2hG?=
 =?utf-8?B?VWMwMTltTitWYmpHQlMweW5YMVFLN0ZsSlNyUVpqYVdFYUptY3NYVzBNVE5m?=
 =?utf-8?B?OGt4eXdnNExiODhWRmlBeHZPek00ZkxEVkV6THRGWU5Ea3YyQUZuWW5DSjY3?=
 =?utf-8?B?aEtNK3JIVUxjVDNjRzNvZTFqaDBoMlNiUmwyQldUdEdnRTZWQXZ6Zy9McmhL?=
 =?utf-8?B?SDduRXdUZno2Ry9memFOcHE0VERURGE0d1MzR0pXTS9aNzhhak1DaU9VOHpS?=
 =?utf-8?B?Q05FejFsb0wyd0xFUkpDMGhlM3FEQUZZaVJxQjBPd002MWx6RnFCa1dCWHVX?=
 =?utf-8?B?L0c1V04vWitvZjBzZ0xJWGxFcmxEazNORHNrN1YwMTBMbUpGRFVkc1VQcWRV?=
 =?utf-8?B?dEY3WXZqWWNyZDVZSTU2alEwR0p5anVjMnZGc0pFeXR6d1RpY2g5VVBTbjk1?=
 =?utf-8?B?US9mQ29IRXQ0aFlFeWNxTTh4V1M1VGJlZStxMStjOTFOS1BOb1QxKzFvWTFO?=
 =?utf-8?B?b3BldnZZbHJyWkw0R2Q3c1JBajFheVVvWmhaTkRqalZDbGV0UGR2RENoWFZE?=
 =?utf-8?B?NmRhdGdyY004RU5EZ1pSU1RKQVpxdVJoN0VQbTlaeXhLYlNHeXpBQUV2NXIw?=
 =?utf-8?B?STZyblRSNENiWnErSFVub21GYUs0L1NOZXluaEwzUmVIaW83cXZoKzVObGtE?=
 =?utf-8?B?a1oydy81NkxZWFRWOEdIclByYnVzVTk4QkJhWDZrK2laOVRhWkxHQmdzTmI4?=
 =?utf-8?B?ZkJJMktKUC9ZeTlLUTBlakVSRGJFLzJabzZkYlVwRTgremFxQlorSmRyS0dy?=
 =?utf-8?B?ajBnUHhVV3krNEdpUExzQkNZekNOUnA2MkpaeW9naHZBY0RzVGU4MzJRYWNM?=
 =?utf-8?B?Vmo3azQ3N3VabkVlS01wV0RUSHJZS3JacEpRUnJWdGx1REg0Um9OZXZZcUFM?=
 =?utf-8?B?YlcyYjNURW51MnQxTlo2eUpkd2M1MVNFcHQ3dWFsQXA5aTgweXU4YlR3V1Y4?=
 =?utf-8?B?UUxwZ2Y1M1dCaU5aTFdZUGYydUh3dDdKZ1R6VkFEUG43dkdROVdIQkc2SjFX?=
 =?utf-8?Q?mcY2/KDUpauYJ6LnMq2C6Xvis?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db90596-32a0-4655-e9e3-08ddfa606be6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:16:59.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z/WNQrC1hlYo9rKsOoX9JEdB1VT6WxeEkRfoSgLv3kq7vSrSAoPkE8vhKULJHRmGR7RR8s987J1P4sAMxZ4zYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

The order of runtime PM API calls in the remove path is wrong.
pm_runtime_put() should be called before pm_runtime_disable(), per the
runtime PM guidelines. Calling pm_runtime_disable() prematurely can
lead to incorrect reference counting and improper device suspend behavior.

Additionally, proper cleanup should be done when rproc_add() fails by
invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
the device in an inconsistent power state.

With using devm_pm_runtime_enable() for automatic resource management and
introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
enforce correct PM API usage and simplify error paths, the upper two
issues could be fixed. Also print out error log in case of error.

Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static void imx_rproc_pm_runtime_put(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put(dev);
+}
+
 static int imx_rproc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
 	}
 
 	if (dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_enable(dev);
+		ret = devm_pm_runtime_enable(dev);
+		if (ret) {
+			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
+			goto err_put_clk;
+		}
+
 		ret = pm_runtime_resume_and_get(dev);
 		if (ret) {
 			dev_err(dev, "pm_runtime get failed: %d\n", ret);
 			goto err_put_clk;
 		}
+
+		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
+		if (ret) {
+			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
+			goto err_put_clk;
+		}
 	}
 
 	ret = rproc_add(rproc);
@@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
 	struct rproc *rproc = platform_get_drvdata(pdev);
 	struct imx_rproc *priv = rproc->priv;
 
-	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
-		pm_runtime_disable(priv->dev);
-		pm_runtime_put(priv->dev);
-	}
 	clk_disable_unprepare(priv->clk);
 	rproc_del(rproc);
 	imx_rproc_put_scu(rproc);

-- 
2.37.1

