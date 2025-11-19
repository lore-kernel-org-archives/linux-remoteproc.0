Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC094503B;
	Wed, 19 Nov 2025 04:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526146; cv=fail; b=TZ8B0K56khaJIKU7iuAFNu8+enttsmMx6vVzcnBgA4E6ZKAsuS0pUtfJEyXNWMR3WcPILCMAc6g0ElPsO9FL2ShN/wDzGR8jy/4ibpB/tCq1+vggmph/roGVWrfgTuDl4UYP+b6msNN2P/SzceRUVVG1XXaZ9lGlBPmcEO1xPaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526146; c=relaxed/simple;
	bh=Vqrh/03oImNJGbrVYfSWncHfRMjM3jNhUlrxDZUXCH8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LM2bFcU7OsKbmStsR0e8uNACTOxliMIOrSkAL65WjGmCSzd8H+ra25DHanW37+jck+WODv2XCROTim9Ywl8FTInxdtZQgy6KvfNh8BE80RqRDzLsQSU9ItbI/UaFKXmbWoCu08oMiqjJ1jCrOlUccAsaQAZaqgvDav0JlUKjENM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GjLXUrVw; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GjLXUrVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMVKa5QKhvDDNGc2TT8NBl0rSAvjeMOCG7KLfL9sAGtVSHHOtp7L8ErnH4/+BkGEpZW48e46yaKj9PmSSQBtXIbgRqir7Pu3U4YajKtDSlEagDTxS+JuD41RwALiMMAFdlwkpKVpDMnwvPVWkAoZ5lJtBkOBfcgLYW5qwY1IGYNZgq0CX0hxroyC++u4R3PxulUAoIAwtW7ZJXKJrn+qNkOdEPKH4jdsBo5xHwsQF7z5IZ5QjGzT5G5pMw4b2g+X8SEE4lVnBlkEItJUKi3KrL+pB9Vi+o73rthiCFJDOZeoUZqM0K0kvCGqA3FnD+ym5tRLLuPs/Pyuxv8UK6FyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FF9wzgzA5tls1xyRgt0klG+tb70lux6hYToUdgXJTb8=;
 b=k+UCJW2kuBiQ1R6urilWDaU/A90PNW5ZvgqoPaeELbBjY7WdScRRPK9MtMev0loRGGeu5zP4nS3yTVXOuH+Q/D4YYjXEEdgnhtoP52kVloXZtHtcEs7YTsDlbfzCvn8JsGzsRDu1GN2b9x3MGEunjCgg2Pu1XOCGVPUWCjUnUXwgENumxVXSmZ4mz5KJnie7Tan3BFWPWI3e0qwvRKBHa9WeZq8SSQfLYCZ8N5E/I7Bxe5DHXI5ViVwM4J32Q/hFJbmVX+h/2EhB+l51GAjy4RXYbjXEtfFJ8V9l37xIOJAR1SxHu1Z+LXcmRIbkWEaajA1KDZG0ikiEAdDwMsBb+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF9wzgzA5tls1xyRgt0klG+tb70lux6hYToUdgXJTb8=;
 b=GjLXUrVw3Rp9daGtWoqv544MlDSXl3M94znyndMGsnI1P8r043/6vFTtnUPiebkRkX8nyUIrRFrjiOiW/g80BKzhI0m6wxnA7CmDkOuVDqu0SF8AaxrDJH080SRJwiiaoaNqi8Go3lCnm7jWAZXTwKWaxLEYq+4jVw9tAwIz3xUsWQSisbaqcWjBK6wH0PMNJwLTDxEoOX1tUfkqFiVrYye2gYGh60F5/yjsrqnsLFI7yrqmNhf5jaayMTLmf/0DXog9lxekWFFOcY5XJDeEnMW8K5zRLB9JbackgCdcKM/483ZwkpFeYuo6/o269/ImIjTN/44G08Kce2ve5zzm+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:49 +0800
Subject: [PATCH v4 04/12] remoteproc: imx_dsp_rproc: Use dev_err_probe()
 for firmware and mode errors
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-4-adafd342d07b@nxp.com>
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8feccc-d5ca-4bf8-0ff5-08de27233ba2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkZZT1VTQmlMeUxmbnE5Qlh1eTRwd3lialR4REY2WVRhRDB5UTcyaWYybTJG?=
 =?utf-8?B?UDVmRWRhWHByWGRzMDBuTWM4RzlXQWJzenNWSzRFS2t0MUk2REFBREUyQ0dx?=
 =?utf-8?B?YmVGbnorNHRvMmVjRER1NE1nMEhZc04vaFFqN3ZCaGxiQWpQSmlOWFEwZG13?=
 =?utf-8?B?MWhaS2JmaVB4V3NuYk1XQnVIUzQyc2VRU3hUYWtMVlozMHNoRTdoMlRMZFNG?=
 =?utf-8?B?d0FoVnVSRzYxbHNWdXVlK2ZiRGpVcTNDTEVYcTNtNUk4SDJneElLUUJDeDVH?=
 =?utf-8?B?KzBUZjRDc0JDYkhhVnphSXBCTHBLaFpkNHNVQk1HcXNHWHpFTmNNRWlxS2VV?=
 =?utf-8?B?YWdwV3gvNWZmbkhKMmFFbGM1SXhSZUN3a3NDSmQ5c0xRRHpKNGpWN3FLbWZp?=
 =?utf-8?B?UDVWR2ZadVZkdVgwVVJiOTdQd1BNdnB5d21zYzZpRE9rNFprbGpoYTNuRDVu?=
 =?utf-8?B?UFVIUkw4TFVNckhQTGtTcUdxTGx0SWljWUJGWURGRVRXMkJvdGxSVUZyd0p1?=
 =?utf-8?B?aktQWjBaWmRVQzBMamljbXl1SGxtdXBDQzh5T3ZBSSttdmF2VWdQOFZFTDVn?=
 =?utf-8?B?Z0lScFFQVlR6d05hejR2ZFlWTlNDRzQ1emRvR1cwRmF4VTdqRHpiNTdPOU1O?=
 =?utf-8?B?L1BwMTdGTlMzOUlRRFJkeFEzOVd5cXUwWnVwNUpJd2M3MDZJUmV0MFpTYk9Q?=
 =?utf-8?B?NHVmUTBxUXl0dkQ5d0hWZC9zUm9QNHhSTDFYSS9pT01hWnhuK09ZVWNpcEx4?=
 =?utf-8?B?S0RHUVE5N3p6RVNwVDVFSDk5L2dLTG1UVWhOUjNHenByM3N5aE9JYnkyMkR6?=
 =?utf-8?B?UHMyT3lDZVZuaWh1djhjK0wxWnJlTGNMK2o0aXR0T0xLM3JFeWxXN3F3WHVK?=
 =?utf-8?B?SlpOUTJLYXdycTlLVXhETjRwQ2I2cjJzbFlNU1NYK3VsZGo2b3N2M2JWR283?=
 =?utf-8?B?UDVhZ3JlbjJlTExKdk8zWXBmM0NxRGRVOUFpOWVXK0l5OVlidzNtd2k4WE8y?=
 =?utf-8?B?NCtOWjduWEZKNTg4WW9SQ2s5ajI3N3JxVGliU2V1TERVZzdsU0hWSmNZOE5G?=
 =?utf-8?B?VUdjQTlEZ0dlS0F5eVdHeitqaHJDTnlwS2d3NCt5NnpMMWNQVEordGM0MHJh?=
 =?utf-8?B?bDFPbnRVT3JnaFRwdWFvbmp2cTVGVUZwcjJ3OWw3ZC9oelErL3JrdnRHNXhG?=
 =?utf-8?B?dkhVcm8yME05S3h4dyt2V1JZRUwzMUNKTlc1VEQwanBDaUhvNnNUNGRzV296?=
 =?utf-8?B?cUo5RkE5aEU1ZkVVSG5CY0JNN00xa0pGTUdnZDZ6YVRyL0ZUbzRTRXorYy83?=
 =?utf-8?B?KzBhSkY3eE90UGFNcXRtU2YrTWEzUWNBTFlYdnU0VXhGMk9QWHNCOFRJV1VN?=
 =?utf-8?B?dmhKSmxmWHRWVUpjMHFQZDhianU4YklnR0R6dWFaRUVkcXRKK1ZpWTNsUGdO?=
 =?utf-8?B?Q2hRd2dLUmpZUVFjZElCYnFoQTFvY293SW1WZkxyeDUwcDBsQngrVndFNFZQ?=
 =?utf-8?B?dTBQYjRWRFJ3UXAwTDVUVnNuQ3VMOUgvck0zZk5yQlZjbDNvRjZybUtPVy9h?=
 =?utf-8?B?OXVIZVNSazFTTGRiVHdpZEhkdm1OcXFXUDA1T2J0VGhnRVNKMHdnWENMV1BO?=
 =?utf-8?B?UUlYbVE2RUZZeEpIN01KcmNZdGNvcm9QbW5WZ3R6ZHRXZFU4Z2EwTFJNdHF1?=
 =?utf-8?B?Wno4SkRYUlIyaFljV2xzN1R0M0VCdFdJRkxFUXhPSzdKbDErdHhqckJhSU9q?=
 =?utf-8?B?VFRRTHJhN1k2WE1oUlBLRXgyOERrZnFuWFVpQUlyVVpyQWoveDVjK0NYamEy?=
 =?utf-8?B?blhUaXhDZVVkUGQ0RnZpUXZLQVBwYm91cWFlRFVjamhBS2dKS3FmUkxjbCtj?=
 =?utf-8?B?ZHNneCtsdytpNXdNcnBvL0xVVDk0U0hBSS94VktwR1M0UFErUG5zM2lZWTRY?=
 =?utf-8?B?U3pyeHpmRE01cTlTeWxzN2Z5NkNpMjlCWi9GQzB6NFBCWUdhaEJVZmJPSWw2?=
 =?utf-8?B?QlhzVks0WWhwbGNkZzdDaDJOdTJjbGpaUEdNUklueSttT3RiSEl6RVNrb09W?=
 =?utf-8?B?NithbVVQL3Q4T1NlNEtDWk8vMHJ1MzJuOTIwZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OE1sUkJSbGFUZGh0bnYweXdVMUd3TDhycG9CbUV5Y0hpb1plVHpYQXM4cGk4?=
 =?utf-8?B?SGZkWFdjck0zNDczNjhweS9WdkwyaDFBZUJmanJCZVR0VE8wZkppVkFKNnpZ?=
 =?utf-8?B?UWd6WHVJdXpOMEl5MEtPajM1eTJSaHpvNjMwVjlnZGU5S2Y1bE1xanppdFQ2?=
 =?utf-8?B?OUpxdFpDdlRGWUQyK3dxK3BNSDhqc0tqY3BKc1BPbWRIc2VmYlZ4dkVqRW5D?=
 =?utf-8?B?RlpWT1lMNTJiVTY5MXpESFRjNVJkRGhSYTA1S2ZKN3h4dlFuRzNRVU44VXBM?=
 =?utf-8?B?c2VOSUh4a1llWkp1TXB1UlV4T3N6VThrREQ3c0V1cjVlRFRlcEczRGZsTkZM?=
 =?utf-8?B?eEt2SDF5TWpvdkpGV05UaU8wc21Ec2JRSkNUcks0bXZjd2dnK1E4aDB0Umlx?=
 =?utf-8?B?N0V6NmFTUnFCNlhkUVczUGJ0V0MvTUtGOHRkRngrSXp4Tm01WUd6b3VoNWxn?=
 =?utf-8?B?ZWZIdEg4aUNiVDVNOThIRGYrQU5ieUxSciszZVR5cWoveGNQMS9FaktnSS9t?=
 =?utf-8?B?ODNvUXk2bzBPbzlIc242QUNjOGxrZ1NoSGVlMXNZaTc5TkMwUHFmZ0ExL2xq?=
 =?utf-8?B?b0FkOG1TbEVaRFpiK2U1WnBJUGJaNzRKcEE2S2VmVFFJU2E5YU50UEQ5d0Vv?=
 =?utf-8?B?U1phSmRaS3JZU2xlS1liVjA2bzFGZE9QZ3FFdjJMWVBMNW1tVVFmRXB0WDZY?=
 =?utf-8?B?dTFlV2ttbEtuc2ZXbDRrQURqai9RZTMwakt1bWdCaVR3WGRVdEhsOXhJZGw1?=
 =?utf-8?B?ZTk0ZFJRY1dlcU9lRTgvQ1JvaEgvNlBNeVg4Z0dXN0d4bUU5bCtRaE9KL21n?=
 =?utf-8?B?OVNZZWFDYXlWcmpLaGxlVzJjU0RjSjMvNDNFR0VjdkI1Y0pkc3gveVBJcVEv?=
 =?utf-8?B?VFlxZHZPUEI4ZStpTFUvRVBQSUh3WXBZbkgvNnZ2SzhCS3RteTFjOFl2a2FF?=
 =?utf-8?B?NFFlV0VQTGdkSHRGbHlFMVdLYWVlSDRtWm55bVlLeTg2a1krWjhQZG1pbHZt?=
 =?utf-8?B?WUg1OFlob2dYcGVWb1A5N2pFeERYL1YralZFSk5sLytZRng0dXExam5Ycmp2?=
 =?utf-8?B?QTZZVGlWdTVmYXVUcCs0RUJTbG5idjdXd09HYmgwanIvR0F6aUhiSDRsYlBR?=
 =?utf-8?B?RW9PaGdqTXRxNW03KzNob3k2OVQzV0dxeWlEZTdPandkcUlUWG5qdXpSeHdp?=
 =?utf-8?B?K3VVRUdvNGEwVENSSnhsZzdRRDJwYksvMGRtbXN1TXRLOWhjdDB1ZmlZOUtG?=
 =?utf-8?B?bjNTZWJpb2I0Vitna25URlM3eDdZblduRUNJb3REemp5SStYWHJvM3FQb2xm?=
 =?utf-8?B?Sm5yQ2J1RHJZeloxTW56R3huMGE0VEkrbmp5eklOcnN2SEptSEE0WVVnOHE2?=
 =?utf-8?B?bXFQUWxkWUowOHRYb2YyWkZYTzYvdWpkUlBMQ3dWYStlSE5PTFFXeW05QVA0?=
 =?utf-8?B?RlczUmhQTkpnSittbDJoNVJ4V0UrREtMakZFeHRjQ1pUcE1wdVFEN2NoVmRY?=
 =?utf-8?B?RDAwNGY4NldqODFxcVY3d2owQXl2UkM3YVVkSGxjbGxrV0IweHFUQ0d3OTBL?=
 =?utf-8?B?RW5yUGUrQitwbnpqai85V1lDLzV1M0ovckErSWJJZGZFN05NV2lnQXVHQ1Rt?=
 =?utf-8?B?R003aDRKNERudHdZcVdmYnZFeE5aRFZkVUZkSFdwdHNWZ1loUnhob2I5Z2Vi?=
 =?utf-8?B?d29lS3hmUHlwR2o5b3JqV1VKakZiRlBkMkwwUU9Kc3RkR3FURXJtWElUZjN5?=
 =?utf-8?B?QXNNNjR1M0M1V2R6MDBVakFpc25WQk9sb2xkMGdESk93cVJLZ3BEYVB1b3lz?=
 =?utf-8?B?WjJIcE5mT2pZWFlJaFFSaWkvaGs3UzZlYXlzWWM1UU15dkRjdmZIaXFQRlNX?=
 =?utf-8?B?eGQzanVMUmdlcEdEb0IzSVlDSllZN2ZZSEpHb2ZRUmNXcjRuMGJnNDZLUzlm?=
 =?utf-8?B?WHdlaHNqMWx5WmZ6RDlNeWhBaUxEWnp2NGI1eVZiTG81VFN1U2dhMSs0RXVm?=
 =?utf-8?B?b1lrRUdkNHFKUkRjRmtMZ1d4Z21RWmZrdHZ2bDF0bWY2a1RRTEp5dWMvaFRi?=
 =?utf-8?B?WEh1VWlMakkxNDRHeGVVUCs3a0xLVTBYV1dOd1JTVk8wdHo1V0F3MEZMMEw4?=
 =?utf-8?Q?J2ZlySqhhprNCC8SO2cSLpnZ3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8feccc-d5ca-4bf8-0ff5-08de27233ba2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:21.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSpE/E7UsIHNvpJMZgtJ4d04fCdNKiSVn/5mCHCZDJtstjaxfiKJZAI/J+6cV1VKf5wTbrXZD35p05CZJafo7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

From: Peng Fan <peng.fan@nxp.com>

Use dev_err_probe() to simplify the code. No functional change.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f5d0aec52c56664d6074272e276edb0c4175c9ea..87f4a026c05fbf1c9371058290b2d33cb94b9e54 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1150,11 +1150,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
-	if (ret) {
-		dev_err(dev, "failed to parse firmware-name property, ret = %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse firmware-name property\n");
 
 	rproc = devm_rproc_alloc(dev, "imx-dsp-rproc", &imx_dsp_rproc_ops,
 				 fw_name, sizeof(*priv));
@@ -1177,10 +1174,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	INIT_WORK(&priv->rproc_work, imx_dsp_rproc_vq_work);
 
 	ret = imx_dsp_rproc_detect_mode(priv);
-	if (ret) {
-		dev_err(dev, "failed on imx_dsp_rproc_detect_mode\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_detect_mode\n");
 
 	/* There are multiple power domains required by DSP on some platform */
 	ret = imx_dsp_attach_pm_domains(priv);

-- 
2.37.1

