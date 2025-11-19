Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C612FFFAD;
	Wed, 19 Nov 2025 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526178; cv=fail; b=coPVZ888tAgcdG4bADrPBMrcbe95F8eiZw+OQBM+aif4rpjug+2GOK2LxW9+CefhcxheoIdEJD2Df5C6LbW46Bu+l/oVzl+H7CKoBeB5+Gz00nk6cJh6O4o87Q4PCgAmcVEJUQrlv0qU1jgiJE4Z+E1BwCS2BBxlZ51ditzVO6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526178; c=relaxed/simple;
	bh=4ldojY5cbA5QTgMwmZhrQ2AkuXq2EsuQ+u386sZaC7k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ibHG5tEqu/mM99E0FOv8NDC6dEHZevB9Uz3mGtMrIU5LlL+CbqzkckprPP+xOSUlMbBXuiqBTybP5vGyBBC8QxG8KLFQTBtiTa91pu3C6LjTdkffN/rFZ9kdJMC13GKCUb9uzDFgZ6ZB3Znqpvl088zIvNsvoWezvF8+cGMULpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lMCVPuTe; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lMCVPuTe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkK3x2Ai85qnYixKIgfuNCiVkyH8IAQF/ZZH8hx4+rA933ZXcR0wB9tUPrYQFSJpkVAENiHhSy+8hH+YKHY5A17Angz/mFIfaC2acTNCSq8ch8svt7vOdsi4Pil/e6HoKYMda5QqKaql2Ig/oaanCr+o1NUpJP1t/RChS4LdrR+bKAQx57DR0FMFrb2QZFED1JkeLfXywUG69XZCfbVjLYEe+MQPumoUSXvA7oi/kfJ5nnxyMKLAYUWMK+CpUqYqN6PicwmZ8DhYmU+HnAZDyGIsPT5YYlaYjBbZGV2vwK63Ta6R77ULk3rfcU5NO6G8yCQsQV6d97Zm4eH7byWcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kb+SY690DYKf0CLrvSE0AwsB4nvBKz6s5cvUli4Vkfs=;
 b=uuL3l5EwTCnoLYQf1e0Gi0KKj24aJ0aHNmiYtAkZ0Wr+xnD/uA8qOXs6MWXSGxRoCGrMoKXJXoXTx3uxRYyIQwubJrrJFFX9qvzyfHyZmXru/qXX+pD7HrCcAKRh1t3tayXvb8ZVcQ78sNGLuXo4374dgPC1qZq+WUp28V5tlGIeHtofkajxHF/VawtgfuM/g7TJpPxt4A++K3vG6COPLipbHxCc+pA8Nt7k/xYUplRAcgd/JFlO0EGcB3biNkN41YSBu5KV4Xproathe4FH/l+7mUTOeqFZBqpbnv6cgZ0IBsn91CtJQvnSA7xHFTB9V1rllq1NRDkVWesi8H3WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kb+SY690DYKf0CLrvSE0AwsB4nvBKz6s5cvUli4Vkfs=;
 b=lMCVPuTe0RDbDWctVqc7vIyVX9nKbyPRTtpo77gM4Qt9eHFY3sRulBEuYR97BJh1M1FmtRBdsOMYBXOu1t2MUgDLk4OSECMISEuh60ryihM0xxGvMVJKyUbKhYh9WgRhc8A+Lbnaj4nkWehfcl5D/UUYpWWLD+BpPM65b5mf4xYjlGfg1v+/SQVrcPhLIBcfxC4qK6fkxU/xZvpdRFIO3M4F9rt+lr2+lWKPn+Kuf8b5n6uxy4bMMwozOUFa9Hf4FcuKzA1EONRCKJcDffmXIewZRSjd/TULK4mjbZsBpizCWiDNmK9uXIZAwsSdHFKUU60GE5+2thUgXwTdH5S8ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11949.eurprd04.prod.outlook.com (2603:10a6:102:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 04:22:54 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9320.013; Wed, 19 Nov 2025
 04:22:54 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 19 Nov 2025 12:21:56 +0800
Subject: [PATCH v4 11/12] remoteproc: imx_rproc: Remove enum
 imx_rproc_method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-imx-dsp-2025-11-19-v4-11-adafd342d07b@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11949:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c0a162-2a01-4848-d8b3-08de27234f09
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnFIRk5pSENqUm1raDNlNE4weWoxc2tMK0pDVjhaRjZpUWVNS0llSG4xaFdw?=
 =?utf-8?B?TDQ1NHVVVm1CU0laYTNGSVNyVGFESXUzMnJrOHRQckxBNGNnUEdaMlVhOTE4?=
 =?utf-8?B?Qi9ibjJBZWp5UUU2ZlhCN0VRL0R3dUZyZWZkVU43dHN5My9FcDlkMVRhYk01?=
 =?utf-8?B?cEl5YTYxSzEraW1hNC9TL2hYaXRZdG5FNTRONXdKdG10VTgyQmtWMVBoN3FF?=
 =?utf-8?B?NHVHNndKR2JkYUFGYlVFa3lqTjVqTHgwTzNRZ2FkeTJ0MG95eXVGNzB4OXg4?=
 =?utf-8?B?OHlqWExnRjJTaW1PdXVQR2xUTDErdTU0aWR6YWlsTkFDSjFCTGY5OXd2WCtH?=
 =?utf-8?B?TlNPY2cyblZXT3lIdnZhUFE5OWJkVzZQSDFPSnNMdFFuam5iVm9zejBWRVZL?=
 =?utf-8?B?TWVFRWtxMDZITjR3dVVUd0JOQXhPT3d0d1ZHa2U0c3Izb1RGb3VnUkhZR0U1?=
 =?utf-8?B?Vi96YWczdzRxcFYvQmF1Ujl6Snhtc1RSUFhXT1ZaSmpva2hWQnhubDBuRGtt?=
 =?utf-8?B?Q2lVYU80SkFLWHpQamJ4NXlMS0FyclFDMWFDZ0h0ZGZNdVRabGd1UWNDZDNZ?=
 =?utf-8?B?NjJNa3hxd2ljY3ZrdVhwR0k3S3lBek15VUtsUlFISDVsTGowUURpb01nSXJO?=
 =?utf-8?B?NTVxR01VcStCWmVUblB6eTR4QnJaemVjenBnU2ZPRGFkSHY5WHRseWV3aUZV?=
 =?utf-8?B?QTFPN1NZOEprbDM0RHM1K2ttT1Y3RTIzc1UxT2gyMDVQSzVkY1I3SDNzWEs5?=
 =?utf-8?B?Z0ZKOEhIUW5YUzYrKzM4WHhBUWt4clpFYTB1eWVaeVFmRjFIb1U0K243OVVu?=
 =?utf-8?B?U1l1MWRpc1VjTmdMV1czSWdIWmt0RGliUFdTN2Zici84TzR4RmZNQmZQWTRT?=
 =?utf-8?B?THNpZUpkaWpvbEd4VTlxTEdBbU1KUUhCeEtjUGZDNHJHVUNQdmRrZ2tCaERF?=
 =?utf-8?B?WW9BSytJeUtLS1BuS2U0ckJHUmoyMWNJVm1JeWF4V2dDK281ZncvVGJYaDBU?=
 =?utf-8?B?WkFJSkxacGpPZ2xZdHA2NjBScnpxRVQxS3ZsbDBtMGJEQ1RsOVlBdHdwUzEv?=
 =?utf-8?B?T1Q2cUJGZU50VkNFcHZkZ1JGVTgycVZwN3cyTy9ka3FRWkxGZGVWL0RQQ1pF?=
 =?utf-8?B?aHd1QVVWTlJEMU00QkNIRUFnTTkwMFJ1ZUx5b3dLelJITmFHMGpkZ3A3TmZl?=
 =?utf-8?B?S2JrZS8rbWx3dTljK2NBVnNWdDMwVGJZMTZvZk9FRVkvODZtUThDMXgvNjAz?=
 =?utf-8?B?eFlMaXczdWN0eHBIVUcvRFUwbTNSMWNPSVFwN2VUVXEyMWgyUDRWcHlxdmFn?=
 =?utf-8?B?TENNMkV1RmtlMnRINGJDbVVWZDVQT1pjNXVrUW5WWjJGdUt4Q3AxeGhNNXlV?=
 =?utf-8?B?TmtFSXdEbTNRNHJCaXdjTkkwU3JJZ3B3Zi9UZ1pNcFVMQUl2K2hoMm05ZUV0?=
 =?utf-8?B?c1prRUEvMFRwWkRwZGxFclgxUDN3djcxcjJNa093ejhYSHlhUGpzakxNU3Nu?=
 =?utf-8?B?NGh3OG9MbGE3ZW1PTEtZcTRKTkMvVC9zZC9Za215aTB6WjNuMmNIT3JKdG5T?=
 =?utf-8?B?WExYbS9CY1BpUTR3S1ZIbEhqNmtiV1pRSkdJVmhKZEdWOEFqOUxnR1crRXZZ?=
 =?utf-8?B?M3gvcEpUQ1dYQTdWeGU1Q3FyZG0wSEF2dTd5L08velZrb04xaG13L2xFcDVV?=
 =?utf-8?B?NS9sNkwvdUJMZi9lUWdRK29tQUNnQVJVUFplZjZESyt5NVhWSXpvYUNGcE0r?=
 =?utf-8?B?T1Q4TktqWk5CcUs4VktFbEtSN3VaalpUbzdlWTg3TmNMWVEzem42ZW1reG1P?=
 =?utf-8?B?UFdNbE4xSVdxNlY3dVB5RlAvblZibEkxOW1ydTZDU0U3V2puRVVjbElvaW1l?=
 =?utf-8?B?cWN2RXowenF4MEZTVDR5dnJTQnh5ZVQzUENmTHRJRWV3bmM2S3pSQmMzRWxv?=
 =?utf-8?B?ZG5PRytCV3c4S3dDOUJxcUpMOXFuUzdiS1FVSlFrL3ZKTkVSc1dhbzNXcG5U?=
 =?utf-8?B?WFJBRDl5bjJLOXowWXlmcCtLVW5NU25ibys5elFmN3hUUURjRThQa1oza010?=
 =?utf-8?B?SGZzZ05RY0ZFbm52ZTNjM2l4ektzaVZ4YXVCdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWd1RkV2WlZRVjcwMkRnOWNxZmN4azJtaWtHVkl2WFl3eDA2TGNnN2hjdnI0?=
 =?utf-8?B?SkFXTzhuVFdQWnJ5alJMOEtPcmJjUFM1MFdmUnBwWGhYaHkyVG5KYkFwZWlZ?=
 =?utf-8?B?YWxBaWlQck11anNsQkp6MEhWZXk3dGp6dnNBaVNpQXBoYWo5RHBOMlYvU3lZ?=
 =?utf-8?B?cnpnbEl5MUlmUUlZays4bEJwV0N2ZmpJSGhtU1I4aW9DalJtc0RMNzRjRDAr?=
 =?utf-8?B?aTlLc3krVmk3eVlCQWRjMFA5Skp3cEhLZytrUWIzdnR0VFhhQzZsd1lSc1RS?=
 =?utf-8?B?QmJ4YmdtcjUvbDFDcW1jcDhUTldSYjh5d1lzcXhXRnJSTzVObEtEMGMvZk9w?=
 =?utf-8?B?cUp5cEpyZ3htUTk1bnF3MWFBZFd5N2RMSmhtZ3Vtdis4YjhoOVZGOUFFMWdQ?=
 =?utf-8?B?MXQwWU9kZ0dHN2RWcWNHZ3pFYjBDUU5pNmwwYWJCTU1jZHhiRTBJSXlVdEdm?=
 =?utf-8?B?TU9CbERWSVpYRHFhRWcyZjZ0bm1CWGRIUGhObzJ0b2I1c1ZUVVlRMTNwRmVM?=
 =?utf-8?B?cWY1aDhpaG5vbDdkR2NudlQyc29WdTJEZnBzNERDdEVDSjBYQmNuOWFQTk5a?=
 =?utf-8?B?WkF4Tk9wOXdIN2VOUXdIUFdiTUoyVENIMmJMdVV4czlHVlAvZEpxTlFjTXpJ?=
 =?utf-8?B?c2Z4ZXhaRFE4eWdUZzZLYmNlZmZKMlFtdmY5Zlk1bXZzbC9QMlp6WGJKaE1v?=
 =?utf-8?B?a2xuVTA2MnFxME5mMGg5S2Niczh1bVRtRnpZeFk3RE12VlBpajNOSDRQZi9E?=
 =?utf-8?B?aVFoZlQveE9rRzNEOGdrdU5ab0tVNWxuYmltU01VQzcvUnVzTUQrbmp3NFk3?=
 =?utf-8?B?a2FtMmU4QVp5T0UvMjdlbzdVemR0RkxsMjNjQkFOcVBiUzdxdDRtdUtzRU5X?=
 =?utf-8?B?TzJtWDlna05rckVvTmg5K1pDb0poSm1kVmhQSHdhSGoyeHlzelBsWWcxbFFZ?=
 =?utf-8?B?Y0FUeksvNUsrMnRab3JvQlBLRUo4RzF0eTAyS2hKQkxJL3dpOWdMZEREakRn?=
 =?utf-8?B?WGNnS0lKenB4QXdMRHhjMHRPZ0p3ejRMVnl5S0NOVjRBZ25HMldNQldRaW1C?=
 =?utf-8?B?a2lBbGxDYzYya2ZmNmFqeXN5VUNsMmIxR1NRZWNSTTVzRm1wcXlwdkRlSEUx?=
 =?utf-8?B?bWRxQnkwN1NDNGlVTmk1TWlhUjVxWVczNVNNbG9yOHF3RHUyYmdhMDZFTCtX?=
 =?utf-8?B?VGdmbm5UMDh6eTJpSWJBT3pmbWUyYk9HYUcyR3pvMGI5T2lFRXZTWFNsSTUw?=
 =?utf-8?B?S0Jpd1ovQUo2dms2anEzT3RRRFhQTzQ0YnhuaU1QVEY2L0s1UFN2ZjJMZGpM?=
 =?utf-8?B?S0hHb0lNSUdKQ2FyMDhHM3poNnZEVzQ4SmVrT0NueWJNdWxzSmFBYUJ0WHNx?=
 =?utf-8?B?cmdrT2hNamhOYjBXcE1LZEFTQWlONmJVNVQ1QjFxM0U4WlVMWjVKTjdiSlZi?=
 =?utf-8?B?Zzh5M25wODJicXpEZTFnYnZyNDg5OVpjZXJPRDFzeEUyRnhWV1IweGd2bisr?=
 =?utf-8?B?TVhLc3JhQWJUaDZKQzNWazM4VWRzM3FHYjJvcDFVamdLdmFmRmowL0R5aW1x?=
 =?utf-8?B?bHI0K0pSMUNxUmhxVHdEQStyWGpUYUVjSHlyV3BpeGEzejF1ZXhSQWFPWm5m?=
 =?utf-8?B?YnFCTFNwN1N5czhzZTRTdUk4dEVXMTNIQXVwM0ZNMElGZkNZcklML05QL3hS?=
 =?utf-8?B?a0xmeksvV2cyMnNtLzdDZTN5NU1ZdEtGSFNqOWpLVjdpcEtKa1EySUlwai9G?=
 =?utf-8?B?dk9ZZEZkazlEU2N0cTRZbFlXbDhHZGFMN282SXEydmdqdG9qVzBIY1hiYmsx?=
 =?utf-8?B?S0x3QUVQSFo0SmhUQ1l3L1B1SURob3MyRXVxV3RpWlVVamJDTFdtVVlqK0xQ?=
 =?utf-8?B?RTA5T2MyUXFHK3gvZSt0OTNLenBWQzVzbHRRdXZ3K3gzNmREMmdtS3ExYXBl?=
 =?utf-8?B?YjArYWJvM0hMVktIY0YrMFAvRVdLK3lYVENYaTVXTG9KNGs1UG1GODV1ZFJq?=
 =?utf-8?B?N1E4Q09FemErYkdkdG04bHRMTzF2OWFJcVpZWFg4SzYvZTc1aTJrbDJJeW56?=
 =?utf-8?B?R29ieTI3cEdPTnNDWEZvN3ZYWEdpaDFzTlNzZ2lTQm5vRmhtNjVqTURzVVh1?=
 =?utf-8?Q?OAHP8ljbHjyscEcwokSVw67cA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c0a162-2a01-4848-d8b3-08de27234f09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 04:22:54.0467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H6URVXC057H7GqOn2HMlC8on9kWi0z17b4KqYkO/XyFJ23Kz2HEzPo3AgSsuvumxNgA7E8n/w8MO23SKxtJdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11949

From: Peng Fan <peng.fan@nxp.com>

There is no user of enum imx_rproc_method after moved to ops based
method. Remove it.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 6a7359f05178a937d02b027fe4166319068bd65c..1b2d9f4d6d19dcdc215be97f7e2ab3488281916a 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -15,13 +15,6 @@ struct imx_rproc_att {
 	int flags;
 };
 
-/* Remote core start/stop method */
-enum imx_rproc_method {
-	IMX_RPROC_NONE,
-	/* Through ARM SMCCC */
-	IMX_RPROC_SMC,
-};
-
 /* dcfg flags */
 #define IMX_RPROC_NEED_SYSTEM_OFF	BIT(0)
 #define IMX_RPROC_NEED_CLKS		BIT(1)
@@ -42,7 +35,6 @@ struct imx_rproc_dcfg {
 	u32				gpr_wait;
 	const struct imx_rproc_att	*att;
 	size_t				att_size;
-	enum imx_rproc_method		method;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
 };

-- 
2.37.1

