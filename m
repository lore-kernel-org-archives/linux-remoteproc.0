Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9DB286D60;
	Fri, 31 Oct 2025 02:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877553; cv=fail; b=BN+jDgZ+DyhStQREmQqsllkPKQ636/yWVR0vox6CwkhdfXDswfA8xI9lojVgKDJKBH1TuIKWPSgDpIdck92QXnPfoa8PMrE2lim09yd6fAPAMAkz/QYMArCysOGFBtsfS2WEwSaOnGuVnKS6zbcoo71qPM0Zt0E+b2E5e45WK3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877553; c=relaxed/simple;
	bh=vSZ2S+GQw4q48cSjNlwt+Tp040vxMcLSmG4W/yZ0mx8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HnsaFqOZTPDu0v9FIoAFp9CqXKCrcVVVWdGOHGtar4hAc+czTDigWHz1SxTzUnLr8k/IIvSmGe9VXl0MvxDMrGuYHliI+csqMrLzkUJh/4Sg6w/fDgZvOpq+4iTXmsZrrukljvZC7GrDfCeiuHGrAaOi4xIezTv5D6J+ojgNNeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fyjIM9RT; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fyjIM9RT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gS+s3xYo6rUu+JUO2sBWcQ1ulH99EzPjCe7x2eBmPYLMR/R6AFFml51HX+koX62FTs3rFBAXbCh5522Rw7z5HdIGoMHqQYusC60ki7OtLI9/I+NV+XSGseEVSEiDHzEJMnPsUos4uAwr0VTVCO59LEqxHFQ0tFGz4hY7yf6xyeNiEQP19kjSrNfdGnQfwovkgTDvUhUMkLD7oBIyiux7h8kn6iW55WOqMadiCLnw+kH42tRAdlDzu4+Dkn5HuO7oW67pXDG7M/tHykeBiJSqGZ5cN5nKmzoOTEpOW4zoocRC1y89B9c1YVHmvW3iFjfu6HBaFxNVLCuSHhVrYHRvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtgLV7sXULTIgwKixWvCrANJgHU+giBvgjm0v4OPa+Q=;
 b=hmseYucT6Jz4PzqRTi/xXKvep9lxvJzXygleGtNTokeYjK9ZNOPS0IBW5OwXEJMmvcSgisEXpXbR03DGbetTcxwflJZVDVIvNRGtqkcSZv+jo70uqKKrc8aHjtRRe4LrCEECKyISNwvy4FcVaxxkIlWBYCKCGYge1R6v7bD2D0ISk/x2d9IvZGHjZgfiu/B3SZmcwWRi7yYZAmQaV+NRJWrJrJTH40zCHMlcDyEWiwLxS0RIMtnozs3hK88TxXJTsvbKsAUEHI6NMa+aQ8eyyyzaZp8OCC45qRfHBDSc1e/Ari52/sGHnXHsXTzhv3CMJyMtb25L/pfQGoVGRCQv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtgLV7sXULTIgwKixWvCrANJgHU+giBvgjm0v4OPa+Q=;
 b=fyjIM9RTGlzm6f4YExf6phaU9uIhf7IZ2T2JpxkwbSPLO60ggkBaHHiNJO/bYJJzne5DsWuoY4kf7/iIUaBTmVOikCBEvTnKPVDdTrPhv9O6+YffP7zDm7uhqWetr3fLV3sBqH881KSbQgPNdjaEEiWHkfKL+Z/Hr48kwk/b5jJe27tSjPjbXg8jjEuiVK1pKcKTRiqFLB7ibSDLYiLsGrEeHTk2rpa5LNDXH94rbAMKAKmipos2MllcGlY+Zcs/pMUkeA4o9DJXohWdjmbNwtPST8kKYwzMaL8i1eqx5zk/bqpgpa1W1cSOliXT7M+whlx7K+NjVdg88wT+sSnuMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11952.eurprd04.prod.outlook.com (2603:10a6:102:51b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 02:25:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 02:25:48 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 31 Oct 2025 10:24:55 +0800
Subject: [PATCH v2 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-imx95-rproc-2025-10-31-v2-4-758b2e547a55@nxp.com>
References: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
In-Reply-To: <20251031-imx95-rproc-2025-10-31-v2-0-758b2e547a55@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761877517; l=10728;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=vSZ2S+GQw4q48cSjNlwt+Tp040vxMcLSmG4W/yZ0mx8=;
 b=s640D7cPdkhIZQmHPCDE3BtGqKABQoazQrdxqT47Ob/uyv5wz9RT2HKT78P+gedoK3b9Wja59
 BJTzNA4WNmfCe3WGrTPJM4sUQQUZ/eZtWk3DoFzNDVL2Z/7v9/0xkTO
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11952:EE_
X-MS-Office365-Filtering-Correlation-Id: 6873d794-58ad-4d06-fd8c-08de1824cd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUZIb1B6aFFxektRNHY3UUpMSUxnc2lZRC9kL3ZmL1g4UUZPd2RqenkyUzAv?=
 =?utf-8?B?UGxrV1Z0VE1jTitNWmhSV2IycVV6aXY1T3pCSFIzUFRCQU80d2llWEJpNHA2?=
 =?utf-8?B?cjVJZDFQRVQ5Vkthbk4yY0xUbmQvU0VENVJ4NTZTYnpaYWNxekp1ZVVJWCts?=
 =?utf-8?B?bWFvRmdqa2tKRDFOM0kxaFFFYVlYZXhIMm1lY1hSZFQ3RVJtdFo4b1ZKVDA4?=
 =?utf-8?B?SkZGT041K2YrbTFsNUFxckEyRnBMWDNwWVUxcVNJcVYybmpCYk1QN09vSDhr?=
 =?utf-8?B?c0hkYlpJQVU3Z2NUd2NBdzF5c0Y2TjBDejhVd1BMQUwvelY1djdVU3JOYWNL?=
 =?utf-8?B?VlR5V2NGWDNtdnBvN2JiRzFCeEdZOG9xeDRxWUZiY2djbXYwenNHdUZIN2Nl?=
 =?utf-8?B?SjlZZFNNRHJqQ29GbGNIQ3hickQrTk1VdDNqNCtOQnpFUjdvQ3ZSd1d3R3oy?=
 =?utf-8?B?QW5Ka21OUDIrSkJ0SW5NZTBPRjRETWhkVHF2djZuYlRybmtPQldoU2x4OXBU?=
 =?utf-8?B?OC9wRldicVJKQzRQWG4xL3NjY3VldmtTRzlDQk1ZYWRRZnBZcCtqK2dRTnVw?=
 =?utf-8?B?TytBaDh3NVRTTnZHNlRYMFpwckpiYXBWVHZnSkxaM3QwODBibmJTd05jbFdy?=
 =?utf-8?B?NWNudnpFL0MzbUhKeG9zZnp0OEp2TS8wUWQxTDFkUzJuSUc5WXRWZytZNzlq?=
 =?utf-8?B?QjJrdGlScGFlM2pVQTRyUkovRUx4Q0RmT1BxUHlKYTZlSGUrQkM4cTFWRHhL?=
 =?utf-8?B?U1ZjeXIzVzh5SEVKWUV2VHVsdnplSk51aFFnSHZ0Q1lnNysrNnVreXEzOTQy?=
 =?utf-8?B?QlJnRWtOVFl6OHdFZjlyYVBUYWc2eW1vcStPV3UySGFReElFcGJINXVia2Z4?=
 =?utf-8?B?c3Fkeks3d3hJTmV4TndVbjNjY3FhTmRUVGhNTExPRzNXWU5Xb0t6Vzhib0c5?=
 =?utf-8?B?OUh3MjV1aUROSkw1VGR4ZzJRWDFHQTFEckg1NHZvdGFJaGRyMHNDNW55MjZL?=
 =?utf-8?B?dlhuMHpWYkl1K0M0Qi9kd0pzNVFsNi9wMXBrU0NFeXNMcldoNC9OaGZnZjRX?=
 =?utf-8?B?VEdaZVJ4QW5PVHdWTmhkSHpoSys1U2JjZzZFVkkyR1Erbk1aTXE0TkNkdkha?=
 =?utf-8?B?aE9oWXFrTjd5NDExTzZWSysxdUI1WnRscmZOakZ2SFlRUFVxQ0JSaEc2SEdX?=
 =?utf-8?B?c201YzduV2lMYzNhZmYxaTJLUHhhNGVTKzFBTSt4a00zYzNvblVpd2ZhQjd4?=
 =?utf-8?B?a2lBa3RUbzg5R1VWR1IwTE1tOERMbGIyaS9ibUlvUTNjaVZ4ekc2RmxwaWdW?=
 =?utf-8?B?Q2hJZDNGamFyek1udGJWWHZyQ0NwZ0NzbFA3dzNnb1llVXFKdWZqNFdOL3gw?=
 =?utf-8?B?OWFuWjN2bjZUVGNjN1gwUVgvb0hjVTg4Tm1lUnhKWlUxYzcxQ2FiMEI4R0Iw?=
 =?utf-8?B?bUFrWTNwYkFIQm12d1duS01NZUUwbnhXRWhuV1dVWk9qTlBjSU8vMTdvOHQv?=
 =?utf-8?B?cXNEMGZnaExPeWo4UnJxeTBUVzFKSlo3TktDWUhQR2JKQXJ4cmcrT1VYbXNz?=
 =?utf-8?B?dVJRRnRRLytIUWRwU2p6NllpbnNyTUdFSmswQXF0aVVjTEJ3blNndmpkK25V?=
 =?utf-8?B?OHlGRFlMOG5ieDdIcC8zTkEvR0Q0dW5LUXV2VXV6Y2FzTks0TVFHdDlUc1BF?=
 =?utf-8?B?S1Q1a0ozZmpybHVhZEYyNlZpT0V2VUJBbU9QSndKTVYyTHZ2VEV1TDlubEUv?=
 =?utf-8?B?WkpkRVo5TnVBR2VudUt1dmR1Q2VUZGNaazl5bkhvTzAvczRzbHhQenFkYTBr?=
 =?utf-8?B?TWF0NU1BZmFZTmFCbmJvdll3MDlTWmR6N3VvWXFhSlRSSFBoQTRUcDFMeU5Q?=
 =?utf-8?B?cEtRWU9IU2U3ZEtEdGk5d25GNUhoOW1iNVlOQ2VHUkx0U2hBd0NXT0FvYUtE?=
 =?utf-8?B?dFFzSThvSU9vYk5kOGs1Umd4TFF4d09BZjhXN25POUxKNkFlaFRtTktaM0Vh?=
 =?utf-8?B?VFA2ckNFaVNEemtpL0hoY0JTRU9Eb0t6ZmpLWENuVzlQMnEvcC9tL3VyUkNO?=
 =?utf-8?B?NDF2SEZlRmQ5SEt0Q00yZ2JKbDRISEdpZWVJUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFpCS003b3RDT0VsYUptanJoMlkrQ3JaelJKdGhUMlpnbnJsazFTZ0gyaVhl?=
 =?utf-8?B?S29aMmxlOHI0UUkvaGxLZDFZMFFyRkw4ZjlqRlpDOUYrczhBNkdkQmVsa1pz?=
 =?utf-8?B?dWhyRjlQcURjNENFUUw2ekNHS0p3ZmdqallEUWdoVnhWSWxObEZRUGszK1RZ?=
 =?utf-8?B?cnBnVDVHVmNIT21sQnFYNzJsd2RLZVpKREoyWG5mZUlaWUVDck04K1orUElL?=
 =?utf-8?B?ckVSWDZLaER6K1pvRk1jeDNvelFXb2pxVjVTWVg0NlUxaUp6UTNyRERrUzVI?=
 =?utf-8?B?bXFKOFRzM1hpTThPM2IvME84bXBMeVU1MXpHa25relFxNTBTN2NyTVZFME1h?=
 =?utf-8?B?RGJmRFdWQXFwZVFVQkhpbEd2cUUxeS9nbzl5WUI4STFkdkx3TGRDWGdDYU5I?=
 =?utf-8?B?ZzFRZ2pLRDZtQkFHRitnLytFS0FZaWR2OFRMTlVpT0tlSkVZSkg0K2o1ckl4?=
 =?utf-8?B?VFJhbWpQTlVpWFBCbUQ2UFlOczVZVmM0M2ZCV08rRms4anZCNVo0MzhlUGNY?=
 =?utf-8?B?L1JPQWU0cHRnS2tpQXFiQkh0bEh3clVPYWpBWHd3UEJDc2lZOVRISllHSVdk?=
 =?utf-8?B?cHo5dW1OZjM5V3VsWkRTUkFkRDI0ZFdvelVSMFNmL3d6cStRTGkwOVdEUnJI?=
 =?utf-8?B?MDRUOG1XSlBZUGlnYUliYzF4K1BJRFB3c1diNkZqUkQ3VHQ2NVVCV3BrdFBw?=
 =?utf-8?B?QXA5dE1PSUdGK2NZd1FpaXFQWFpodVNFU1lBOEszT1FSRWRHYWlrUXB3RUxj?=
 =?utf-8?B?Ri81T0RXeVNIWGdEb085b1pwTjRnUlhZZUpid0pldGs4YVdNUnhsNzF5SmdP?=
 =?utf-8?B?dXhBeEcxV3A3aHRwZVZYUTduVXhtTWo1Ky93ZG9LeWl0NGVvc3c4YUlqTUtY?=
 =?utf-8?B?WkQ4U1I0aDJIakdjTzgrWnJDd2RabDVGRWw1MUxQc1BFYmJtK3pmU3Z0aDdD?=
 =?utf-8?B?NlRWVE1PY3RRdVhsYnVsOGpqQS9FTXFXVFZEOFVQTjhHRk10M2Y2YjZXL0Ev?=
 =?utf-8?B?OEJqeXYzZytjeDVVb1J4WXRBOGpFTmgzYXZ6SFBsZVA1OXF6aXZWckRSMWdY?=
 =?utf-8?B?d3hOQ2o5R3hnUTREQ1B6bEFMeDlDZDdNVUp1MGN6eDE4dnpyRG5XcUdwbEpt?=
 =?utf-8?B?aXljeEY1UnZmTldWNXVPVml6VTFHcnZQNXRNOS9YbDNEakd0cnpQYWh5Sm9W?=
 =?utf-8?B?aTRWZ2M0WHd2TjRJL0U5WWNWQWxsU2I2RFJRcWxrVzFMbkxXMW5MdG9aRHNu?=
 =?utf-8?B?cW92ODJib0ZRWFgzYmtHb1BPMzA4QU9ldzd6VFNzKzRTK0lRZmExTjAzckdJ?=
 =?utf-8?B?RERTOVlITUs5Wld6bXEzOHpYN3ZBSW15SlFsRGFQbCtLdGFhaENzbSszdGhP?=
 =?utf-8?B?c3VuS1hGNkJpUk1Ca24vQ1J0R2RxQTU1Y04vdWhiUjJzRFV1OSs5SzNGZi94?=
 =?utf-8?B?aGZJbXlaMHFpMm5VdmVadlhGdlJZNS9CRkw4UmIxdXljQnZMOGx4eUtNNWY3?=
 =?utf-8?B?N1kranQzbEswUzZnYy9SeUJOQ3R3NGp1VmJJOXZkOHdzSkU2MkdpZEE5dHZx?=
 =?utf-8?B?NlFqWnJwMWt2UW5VZjBxTkhSY1Z5Nm9Zb1VmV01VMmx2L3RJZWZGRGw0b0o0?=
 =?utf-8?B?QUQ4RkRhQ25ZSGEwaUNKWGdGVzRiVnNQK2MzUkEwOTFiNXR6ZnBxWW13TTJq?=
 =?utf-8?B?cm9KVGpkaVZzbURaSVZJS2tLei9QUEdPWEFHVENjWHJHL3FSVnE5cnNWWmdV?=
 =?utf-8?B?K1BSMVo5WXRvckVyd3pVbndMSytLb09UY0dVYXBXV2lGVlJzWDMvbUFQWWhY?=
 =?utf-8?B?ZVo1UHJwbWxic3J5MDRRc2JoN0dhdENRNGM4NldTQ1dtNGo3NGZMM1ZWL2tJ?=
 =?utf-8?B?VEVpd1ozUlVLWHlRVGRvTU1uQ0JHVHZMN1BWQldTNm51UlkvaWtZdjgxVTJw?=
 =?utf-8?B?UFI4WEhjRXBCMTYwSHpGQ1IxQTI4djRzUnhZSitadGhxYWRsQ1RubkdTcDJP?=
 =?utf-8?B?RmQyKzVaMXZNek85eVBMRDBlWVF6aHduaVowTDh4ZjZGenQwdk00ekdPRlFF?=
 =?utf-8?B?R29MM2ZQdXdHcHZtR1VHZGY3V1BxUGVCVk1WWk1vOE1udVRVQTNGL1NsQ1lQ?=
 =?utf-8?Q?5GnHhQBCrTC0d7rsyrLTX05+5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6873d794-58ad-4d06-fd8c-08de1824cd6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:25:48.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2ecdwaPjgfMfX1oakrTbWv6LebHIsKLJ9lQos4ApzL0eWHMNUrU3gccCllLXCf/44sepqf/6Gng/jC+5ZWEqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11952

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
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a seprate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.
 - For above case , after using SCMI_IMX_LMM_POWER_ON to check
   permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
   the M7 LM to save power only when M7 LM is going to be started by
   remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
   M7 LM is started before booting Linux.

Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
initialization. In future, we could add the support in Linux to decouple
U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 192 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 197 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 232eb91e0b5dc2432131b1c140d6688b073fea1d..1fb17701964ca4ee4b73d343b5ec1be8e2ee5fda 100644
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
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,8 +94,12 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
+static int imx_rproc_sm_detect_mode(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -117,6 +123,8 @@ struct imx_rproc {
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For i.MX System Manager based systems */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -313,6 +321,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	return scmi_imx_cpu_start(dcfg->cpuid, true);
+}
+
+static int imx_rproc_sm_lmm_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	if (ret) {
+		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+			dcfg->lmid, dcfg->cpuid, ret);
+		return ret;
+	}
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+	if (ret) {
+		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,6 +415,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return scmi_imx_cpu_start(dcfg->cpuid, false);
+}
+
+static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return -EACCES;
+
+	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -485,6 +550,37 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	/*
+	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
+	 * to start/stop rproc LM, then if rproc is not in detached state,
+	 * prepare should fail. If in detached state, this is in rproc_attach()
+	 * path.
+	 */
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)) {
+		if (rproc->state != RPROC_DETACHED)
+			return -EACCES;
+
+		return 0;
+	}
+
+	/* Power on the Logical Machine to make sure TCM is available. */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
+
+	return 0;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -994,6 +1090,102 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.prepare	= imx_rproc_sm_lmm_prepare,
+	.start		= imx_rproc_sm_lmm_start,
+	.stop		= imx_rproc_sm_lmm_stop,
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.start		= imx_rproc_sm_cpu_start,
+	.stop		= imx_rproc_sm_cpu_stop,
+};
+
+static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/*
+	 * Use power on to do permission check. If rproc is in different LM,
+	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret != 0) {
+		if (ret == -EACCES) {
+			/* Not under Linux Control, so only do IPC between rproc and Linux */
+			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			return 0;
+		}
+
+		dev_info(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+
+	/* rproc was started before boot Linux and under control of Linux, directly return */
+	if (started)
+		return 0;
+
+	/* else shutdown the LM to save power */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+	if (ret) {
+		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_rproc_sm_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
+	bool started = false;
+	bool is_cpu_ops;
+	int ret;
+
+	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+	if (ret) {
+		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	if (started)
+		priv->rproc->state = RPROC_DETACHED;
+
+	/* Get current Linux Logical Machine ID */
+	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+	if (ret) {
+		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check whether remote processor is in same Logical Machine as Linux.
+	 * If yes, use CPU protocol API to manage remote processor.
+	 * If no, use Logical Machine API to manage remote processor.
+	 */
+	is_cpu_ops = dcfg->lmid == info.lmid;
+
+	if (is_cpu_ops) {
+		priv->ops = &imx_rproc_ops_sm_cpu;
+		dev_info(dev, "Using CPU Protocol OPS\n");
+		return 0;
+	}
+
+	dev_info(dev, "Using LMM Protocol OPS\n");
+
+	return imx_rproc_sm_lmm_check(rproc, started);
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index e4b9ede656506142b260aa7515823f489a168ba4..c05bfc4528f3b7518d4f2272d15fdeab1a68c2a3 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -52,6 +52,9 @@ struct imx_rproc_dcfg {
 	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
+	u32				cpuid;
+	u32				lmid;
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

