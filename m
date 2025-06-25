Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2531A5BB1;
	Wed, 25 Jun 2025 02:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818333; cv=fail; b=cqy0X8vvROC6hbE8gP9q96tVR/zg7tJk57Tw2fCuv9LYl+fi9VmJS/ppjPGs2PwMdNTmtDwsLW1h6ROVn6XVtEoayQdPiY1+me+6GevlmjzvvOdCbouoTL3vaP2rEzYGauiSbj0igL60U+frMy3+abA/I0KUVmbXelTHj4lHnc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818333; c=relaxed/simple;
	bh=G6CQ3yLAkgX/U4aKcPMyhfXZ+bS+EpUERniI/g/9G3o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hzUQmAlzQkppmTy3XE3K3745tkGeDiNonXQiHv/nrsjO/PbMpjOLAIuVlvChigEpb/xbk6H9ugvDC9hDiJGsYqPlmANl6Dn6sUmTa+3ACRid2YPkmPsDiQDPjVd7KYj4vJcYJpDk01fIDbPEbplmYj3lfOy0qNWdSQ6UYSGVHXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v/zs7mlg; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v/zs7mlg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0mS0Nj5JZh6VQNUflvy3QjbU12/djxNsMJSBUrzfFcI7ecykD7TiLZS3G1tsWpf0kvs88lHmtUBFGSgdIfVpltH31l1HAkKkX7v6IuSArdRRupkt/tdx1vEcVRvCHoOpeSJpid69IYrksa1M0Xwl2nbEg4Y+7/rocVWn2FDx+DBfKXDjGrvKMWigKvh3Qyv/CNDiHQLjgB47G2nmS0oVoeo1KcuUZOCW8G2SJvIMV1Ha3sXamDLijIYevc3ByQGEY5MIacVo2VxILdeqwu6eghySHo2mCELxU0/aPYD8BAr/sZP/QTL4oIN6ZJqhawrpcSmdHYy3AjIPeJJmN19WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymw/hb2u3Uh+RSLfGCs9aV6NaL/1SS2YoAtU1/1Tc/4=;
 b=XFmvCcnMUnvi29XT2dV01UVx8F4ecFdsKEDalhwSXlhynD4BKZOZB9G+pprrF4gdUBfxpFD/MENeDWE/EkidJSbBRDixXGalhVfOkHLCtpBRsu+Xv9nJzvrSQedERqRcpUS65x1Qa3csXrFwjG8KLziAlz8O1A6YUR8vBEo9f40bvCtYU7y1m/NfvX/dPh9tshOh6gE1wFu4TlymbH9QR3srSW7Qs8oZyMq6h6CycBD8iAI6eHobWQGukc6tH3cJj5WTpe98y2zLoQ/d4xmvSFg3uA2NVlOo88VLkMu1xSP2zvtXayUkYQzXaB0YFeCw59NEUbsOLEg5pvMr9WgZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymw/hb2u3Uh+RSLfGCs9aV6NaL/1SS2YoAtU1/1Tc/4=;
 b=v/zs7mlg1im4ynvguHXH6CFL6prVUK+yV5xJwAmUHelFfoZv5duSTJVIbkXS+H7OT0IvzKRz18ku7yq1/k9orqqED1vBl8pKceKz+3kGgNqtcNsv0rUd2U8bdLw4vqS78isRNfu2BGz20pu2d48NYBCYMYkXYK+xrzAeCd5rgXoi7zSLoLIpOd2SY7LfqdlH/wx7osCB3rcmAdyTd8H7GCUE7CVg2RvILg6ao/3xvDHnmQ1EVfWyVNxRtCJUViNPwDuFxbnVEB6zOgBwwf4uwVEdwwxftBcHeJP0Xsa3n2JReT0+Tq9OeusGezHyjRjtK2FRxT2k4N6AXFgPdM4qXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Jun 2025 10:23:28 +0800
Subject: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=8969;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LeItXleQLP0b/sDmapcR2JgOboC2GGAv6wHZn/hdUKE=;
 b=x7k1ldcu45QD5PGm1l1pa6gJL0eQ3hVHXIIQRg8+tHLdpZSa0Qvn17fDJZWrq9IV46dFKyuoc
 TxrSXGL/vbHD6vnjFUywJjWGqaoSmvDEumqNmJ2r0fU0+X+wsIKhQMc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 68eae0bd-5c9e-4a81-2f19-08ddb38f8c87
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YzFWZ2NncWptV0pCTFNsQ25LMGJCQzBPTTVsQ1ZQeG5hV1hMUHVMOHRTZEZO?=
 =?utf-8?B?emcwSjBlbTRTWTJQcWE4VXlWM2R5Nmc3SnI3eHBWeXNWbkQ5M0RibCsvNUh6?=
 =?utf-8?B?MzA5WkZ4ZncwNVRGSlpOVktZaVJqVzM3TTdPVlphNXJ6ZSttL256WXNFMEdY?=
 =?utf-8?B?aG1pZGVNK3g2MHJIT2tCN1h3ckp3YWF1a2xjci8wZUxqNENVOUc5T0x6NFVR?=
 =?utf-8?B?aTN6cGh5RXhYaks5RXhRK2tOOWx4bFZnM1RkT2lzUmNsdkdCQjJaY3hYVlRh?=
 =?utf-8?B?OS80UEh3ZnlUdDRJNGxKNjFTcWdzYkhONlhSZXN1U3Nnb0pRbW5HdkpRbzhT?=
 =?utf-8?B?MjVHUUFSUkJaTnhNc1pYRHlSejR4RVpKKzBkN3ZPK2VDOG1HL2hYZXN1S3lv?=
 =?utf-8?B?VHFpVjQ3OUVoY0R3aGVUT2ZEMEFBT2JhT2dHUFZXemlrekdhdGpmdWdFSGFa?=
 =?utf-8?B?Z05mVEsvLytPdGloMzFPeWtPSUl4RnpuRVR6ZFpQbXpSTWdyUWNCZkV3MFNT?=
 =?utf-8?B?Q2NUcUdlaDBOQ0UwdUJybmtGYm1oMVJFdk1RZy9pMWljaWd3ZVROWnRjYy9v?=
 =?utf-8?B?Um80dy9aTEx0K2pvWGZ4aERxU0hJTWJ6ZTR5dnVoRlREZFVKL0dzOTNEQi9I?=
 =?utf-8?B?Y3dTL2FsTm15NVcrRWlCM2hyNENtY0ZQWXFwVTBDaDdITGtnMmVTay9jbFlI?=
 =?utf-8?B?YWxBLy9HRmptL1F3Vm9SOUV3d0REQmtrZVE0RTVGQUtNckx0QWkxakdYNFN3?=
 =?utf-8?B?RThRSlVrZjNHMGVYYitLQ0k0VlVQdGF5Q2l5dWd5Z2xKaGQ0a3FOYnFJOUdL?=
 =?utf-8?B?b1FkbHBlWmVnOUQydnF5VlA1cTJpdXNROEVNM3JLdElFR0hxa1hwSGJCenps?=
 =?utf-8?B?RTlSMVFGL3gyRGR0QnZ1Y1BiNGdNWEU4ZjF0UVlELysyM3lnbHpCeTlseDFl?=
 =?utf-8?B?NGlKNTkwdndocVV2QWREVmtlTFFmQUVKUjBUZkRBUEZwRVRvOHFCVFRtUEY5?=
 =?utf-8?B?RmtaSHJLME1HQnA2SnRSbmxpbzBybGJRR2FVZXFudjRMbnFPb1praEpIZFBx?=
 =?utf-8?B?bzRmbWo2QXZ2T2c2cHUwMUQxdnQyYzdPZHBFZTR3MWUyZHUzeFpWQUk4Z1Fh?=
 =?utf-8?B?dzBSaVRlQ2dqdmFpYjYzNmRyd2pBUmpUbkRwYmY5aEdlUlpMM0NuUk5aL0Q3?=
 =?utf-8?B?a29JeUJjT0dVQUZqVHY1enY1NlU1d3NUemFxcFY1dUZra0s1WE1ZY0gzS2Ft?=
 =?utf-8?B?L2cvQ1JkQ1ltTHZLSnlQWG05a2ZVK2FkOWUyT1N4dW1mS0xNa3hIZ3ArSXQ1?=
 =?utf-8?B?UU5SZGFGc1pyYVF2dGhMQnI5Z3RJNytCMmhaSE9pZjk0YXZsWHd4R0NHY3VD?=
 =?utf-8?B?WDQySkY4ZHJsYWVkWGY4MW55aHV0MDk0RjBTeDRMeFBDd3VjcXowemlZOGtm?=
 =?utf-8?B?cy9rZXhIQ1d4VTVLWlJUYkhJR1lNTDVxV1JwbVBQN1l2ZHp0ZW9Ec3A3Qkpx?=
 =?utf-8?B?OWg4eFVncy9aTmdFUFJHNC9DU0pDcTRpYm1SVkVvb1ROOXUvemd1OVdQOGZP?=
 =?utf-8?B?cWtTaVVnSzRsY3dqZmdvWURlcExka1N3S05pckhqR1JSSUZCTytma3pqSUxW?=
 =?utf-8?B?cTRuc0pBSHc3WmpYTkNuS1dVSTlXU1NEUTRoSG9ITUJBMnIxdEdnR0U2OTFq?=
 =?utf-8?B?aFpDdk0vbmVDQnJ5OTFuVjBlRTAxUDhreW5TVGx2S2N1cnR6cEJMSHRCNVgr?=
 =?utf-8?B?blllZDVCc2NIQ1pEMFRsRmRwd2QwVkNvdVc1UHUvYlFHVlk1L0ROdElCUitp?=
 =?utf-8?B?b2l4MDJDMisrb1dqRE5IY2UzOFNpbStsQ2thaG1uZ3Ntcng3WE1CRVR2bklG?=
 =?utf-8?B?NVgwZ09Tcy9ocGM4YllJa3FNQzBUOU5vNkg5VzZVbW14VG1ZYXpWeDE0ckxL?=
 =?utf-8?B?STdMSWlTY3pqeDhMNGlGRURkYjQzVlZVejVXcjNkenBMR1hIeXMwNHZoTTFV?=
 =?utf-8?Q?vaHFYEYk3nG2UStqAKfxDnyJ1TfZLA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHVqa21wdWNaQU9CNzk5N1AwVktITkxBeEV3WjR2V3hBbXJibXhRczA5S29V?=
 =?utf-8?B?WnR0SGthdFAzYW9SNnVnV0VZOFFocmZVR3pXMEVqQnh0UTc4cWJPcmNROEQr?=
 =?utf-8?B?Sko5a3IxaDVFYXo0T0E3NmE3ZStaUi8xVFZBeVVuZVA3UkZ3MmJWODlRQTlI?=
 =?utf-8?B?VlNuZzFrN3E5ejdzZUhIUHZ3WFM2dFdJTWNIUVZkMXFGVTlQU1BZdnB1SVp6?=
 =?utf-8?B?djdZcit3bUVRNmZpaGU1U2hZSit6UWlwbWZhV1E1c1Q1TG9KdTBGcFVYWFl0?=
 =?utf-8?B?ejdjRnZuam5TYnR6ZHZISnVZamJaVmVZY1Yxak8zd2lCZktmTEJSMlZoTnlC?=
 =?utf-8?B?MTFXbUhCYkhGKy9TczJIb040ditJWS9NSnRyc0MxMk1sWUl6eWJZSHAyTnJC?=
 =?utf-8?B?K2xVaHNJc0xNRXM0V0hjMmNsT3dlaXNtZkFXcVc4Q3dtaEN3RjhhSXFqZ1pI?=
 =?utf-8?B?c3dqTTNXTXpoU0t3V0NEYlBIUk5jMHRDODBnbWlPb1FUMi9CWVVWcnZBbGt6?=
 =?utf-8?B?UDV3LzYzQ3F1T24zT3puOXpRRHEwcENWbzhydjZabWs2c1FwU0tiaTh4Wk5l?=
 =?utf-8?B?MG1haFFrbDJ3VmF4cU9qRXNQOUdrc3VlZXVJdEtXSmRSNjlhdGJzRFl0QnJV?=
 =?utf-8?B?alZtbERwWlAvaXZPVVlrZ0ZCMklIOVdnaVhvL1ZCa2FFSkxyaytObFNQaW92?=
 =?utf-8?B?TnA1dHBKSm55NjlDMlRSREpZSVpGS2NaWjlhTDlsWGdSTjQ5UmlHZm9xeUkx?=
 =?utf-8?B?by9aZGtXbnNLU3lIODhxVkhlTTdJWU5Wd05EeVY4Ny9XdGFKNTNnYXk3L0t3?=
 =?utf-8?B?NVcrM25jRUZWM0paVFVybVZhSFlwZEV2RVJaTldUMVFoc201V0lUT3FQN1Ax?=
 =?utf-8?B?OFU3bUpMY0orOW1aS1ROdDE4RlVHZEZqemhSS01xTFY3L0ZIVm1oWjBrRFg3?=
 =?utf-8?B?S24wZmlmeWg5QUluUGJQbWt0N3lOQkxHY1FFVlJybTZ1VUZxd0hKWlVrelRy?=
 =?utf-8?B?MkRObzhvczZyNncxWkNpWEI3WDR4RmpqNUsyektVZmo3ZzRvOVZacGYraUVY?=
 =?utf-8?B?aTlhTDdkcjQxc3crazNnS3pFaDlzTUYvWlVEejRlVGYrcFc0Nlo1K1RVUVE1?=
 =?utf-8?B?S1ViV0ptKy9NWkVacEgwZitqdFdPQ1doSWEyZVdiZkhXTDNqYUVPK0E5WStC?=
 =?utf-8?B?RkVUSGNjbElvT0FiVHNHRytSYlVWVWNCczJMV3E0OVdzTU5NbVlvbUw3K1J2?=
 =?utf-8?B?N0VMd3RQRG00S0Z2WmRjUlFKWVV3cFAxMzQ2UkRhNmVjWk9HbHV4WDlJeXEr?=
 =?utf-8?B?TEY2a1UrdTVxVHFHbWlHbHJ4b3N0ZjRjQVlJWTZaM0FGckNFbFFtS3JYSkpi?=
 =?utf-8?B?R2ZjcWZuczZoYXdpSXg5TkFpNGFWdDVOcm4rdWZXKzJ3aEJkcGZ5eThtSHRP?=
 =?utf-8?B?ZG1SU2lESlhqbmtYWmsrSlJtNnNIbUxsNnBXS2Vka1FsUTErY1g2Q053VDN6?=
 =?utf-8?B?djV4UnBJaEs4OG5abHBZeWZhc1JqcEFXZ3htYnBVZzd4TU5iMXBxczFWVS9v?=
 =?utf-8?B?M1I0SWI4K0M1b0VTMlVsaGgwTm10clJycWVvMlZiUHpCdUphcWIyMEk1ODNW?=
 =?utf-8?B?VXVIL0FMZ25XNktCeDlHYUl1cHgzWHU5OFpuckk3YVI5TXhVcm9rOFBobjla?=
 =?utf-8?B?YWZmYVM0dHl0a3hxV2NHVHptWDViaEREK0JPRTJzbFp4elRUUlFtSzVxcmN2?=
 =?utf-8?B?NXlmbUlEeGxBL0tRMmxST0tFdTV4NEplcjdUMzRwaHB5L2ZIaVZUZ0VpZGJZ?=
 =?utf-8?B?ZE9oQTFEQjhLZzN1OE5SZDBOZWJKWmI2Vnh4NnM3YUtEbzVqcXRlcG8yWTR3?=
 =?utf-8?B?OUszM0Qrc0xLbk4vdWlubzVXY3prK1dKQW9oN2wyZEM2ZkFUaEI1WEU0QWdY?=
 =?utf-8?B?dDJiYjhWaUpXOHBSUFFJTGovaEFtVUpNaldOZWF1N2Y4dTF5dHVrRWVWb1U2?=
 =?utf-8?B?VS8rQ2YrR0hZYStkeWFiRTZwWDl6b2FtNXZHUHlMSCs1QlY1ZUVwcEc1cEJ5?=
 =?utf-8?B?UUZOSHJvTmNLOCszOXNMQjh4c21TU1BPVnRsSUM2OXlIZE0rVVNjL2sxK05C?=
 =?utf-8?Q?J8R6lsEWlXx+VBOjVw9czG7IQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eae0bd-5c9e-4a81-2f19-08ddb38f8c87
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:27.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqsxKI7MQfp+CiE1L/GUmfZ4kuNvO+vELpwgcnkJgDKiCZYnP0Xhm0bHHDpzf1eL0ge2WbAfyWikGmd+lNHmAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

There are three cases for M7:
 (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
 (2) M7 in a separate Logical Machine that Linux can control it using
     LMM protocol
 (3) M7 runs in same Logical Machine as A55, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
   has System Manager.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a seprate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.

Current setup relies on pre-Linux software(U-Boot) to do
M7 TCM ECC initialization. In future, we could add the support in Linux
to decouple U-Boot and Linux.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 113 ++++++++++++++++++++++++++++++++++++++++-
 drivers/remoteproc/imx_rproc.h |   5 ++
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f10a0db794de494c52304b2323b89f..b1a117ca5e5795554b67eb7092db2a25fc7de13b 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -21,6 +22,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -91,6 +93,11 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Logical Machine Operation */
+#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(struct rproc *rproc);
 
@@ -115,6 +122,8 @@ struct imx_rproc {
 	u32				entry;		/* cpu start address */
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
+	/* For i.MX System Manager based systems */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -393,6 +402,30 @@ static int imx_rproc_start(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+				return -EACCES;
+
+			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+					dcfg->lmid, dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+			if (ret)
+				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
+		} else {
+			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+			if (ret) {
+				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
+					dcfg->cpuid, ret);
+			}
+
+			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -435,6 +468,16 @@ static int imx_rproc_stop(struct rproc *rproc)
 	case IMX_RPROC_SCU_API:
 		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 		break;
+	case IMX_RPROC_SM:
+		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
+			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
+				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+			else
+				ret = -EACCES;
+		} else {
+			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
+		}
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -549,9 +592,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct of_phandle_iterator it;
 	struct rproc_mem_entry *mem;
 	struct reserved_mem *rmem;
+	int ret;
 	u32 da;
 
 	/* Register associated reserved memory regions */
@@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		rproc_add_carveout(rproc, mem);
 	}
 
+	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
+			break;
+		/*
+		 * Power on the Logical Machine to make sure TCM is available.
+		 * Also serve as permission check. If in different Logical
+		 * Machine, and linux has permission to handle the Logical
+		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+		 */
+		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+		if (ret == 0) {
+			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		} else if (ret == -EACCES) {
+			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			/*
+			 * If remote cores boots up in detached mode, continue;
+			 * else linux has no permission, return -EACCES.
+			 */
+			if (priv->rproc->state != RPROC_DETACHED)
+				return -EACCES;
+		} else if (ret) {
+			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
+			return ret;
+		}
+
+		break;
+	default:
+		break;
+	};
+
 	return  0;
 }
 
@@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
 	struct regmap_config config = { .name = "imx-rproc" };
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
 	struct regmap *regmap;
 	struct arm_smccc_res res;
+	bool started = false;
 	int ret;
 	u32 val;
 	u8 pt;
 
 	switch (dcfg->method) {
+	case IMX_RPROC_SM:
+		/* Get current Linux Logical Machine ID */
+		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+		if (ret) {
+			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+			return ret;
+		}
+
+		/*
+		 * Check whether remote processor is in same Logical Machine as Linux.
+		 * If no, need use Logical Machine API to manage remote processor, and
+		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
+		 * If yes, use CPU protocol API to manage remote processor.
+		 */
+		if (dcfg->lmid != info.lmid) {
+			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
+			dev_info(dev, "Using LMM Protocol OPS\n");
+		} else {
+			dev_info(dev, "Using CPU Protocol OPS\n");
+		}
+
+		scmi_imx_cpu_started(dcfg->cpuid, &started);
+		if (started)
+			priv->rproc->state = RPROC_DETACHED;
+
+		return 0;
 	case IMX_RPROC_NONE:
 		priv->rproc->state = RPROC_DETACHED;
 		return 0;
@@ -1029,8 +1134,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	struct device *dev = priv->dev;
 	int ret;
 
-	/* Remote core is not under control of Linux */
-	if (dcfg->method == IMX_RPROC_NONE)
+	/*
+	 * IMX_RPROC_NONE indicates not under control of Linux.
+	 * System Manager(SM) firmware automatically configures clock,
+	 * so bypass the clk settings for IMX_RPROC_SM.
+	 */
+	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
 		return 0;
 
 	priv->clk = devm_clk_get(dev, NULL);
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -26,6 +26,8 @@ enum imx_rproc_method {
 	IMX_RPROC_SCU_API,
 	/* Through Reset Controller API */
 	IMX_RPROC_RESET_CONTROLLER,
+	/* Through System Manager */
+	IMX_RPROC_SM,
 };
 
 /* dcfg flags */
@@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	enum imx_rproc_method		method;
 	u32				flags;
+	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
+	u32				cpuid;
+	u32				lmid;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

