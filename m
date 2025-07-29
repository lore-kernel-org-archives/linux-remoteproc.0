Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013040.outbound.protection.outlook.com [52.101.83.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B631328C2A2;
	Tue, 29 Jul 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753792412; cv=fail; b=r0Y4kCih3QFDgb/DGh/QxgWYLo0irDQaZOJzZ5ZOMeoi3rkMbrLY4PpWZm4QLJd647i+a3coWE0sT/xEOInXlT5/MBM3MVV665HUVCvs42vQ8D9J/yWgwVUsGL/hkyGmesbbgYxHNfjwN9S5bWAYjm64DlXHEMT03boVt6cyDE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753792412; c=relaxed/simple;
	bh=W2tgCVSfP0mdExT9qM8QnuQ4MYZWtxNuv+p6xIVZXXQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKMU9Z2lImaGQ2XZsG6UKrF/VyfL3ML8Ktsq9lvvYMnyC1QnadDk4GUwAE0bMfxdo8MuwxE0PARCZ2FGPFl9dnmtP7cUA5eO8+q6jWrlGc8DzgjTSFIG08jAzV2UTgJ376v672JekKi3F2EkSqL5LjmHaOwa5nqXDub3dEjyYZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IS2fsXfS; arc=fail smtp.client-ip=52.101.83.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IS2fsXfS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDEQr/Wr7ZBYIT0HSR4vifzkPpSTmrTcszn6rTFfWKbwJq2npOuXiCSz6pETTUtsMlfKfyD+gSE2n515z7rDWQdGCo8qehVnzN9T/H6SBklUbIRQAUTw5gqmIT0eEYXhhSZEq/hMLJ5rJMIHZAjoFDvpwaTrzVHys7eNzYAYnRJYdUDnxVvVaXtnVo1mVFvC9LPfw/lpCg1dSgPbmW+5cTtg5F6pOSZhFZ34obVMehq9hUq0kibHNa/xTU5bukU1wZLwPvPbaFuKMgYYdFQdf2E5VYomntbSejgOhuaD+FaGwvKttBtGA9GMkdFZgSrIaTjlO2bS4gSbPyurCpTPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wt/xnQnPjmIqCnh5xiD1TBKEzXgOqxTg2KQa0uQcD8I=;
 b=xKvF5QSn7VQIBrtOq3+cZPlmh0+BxmUVCJVSfJUQHw4ycITwmiTT+805SlapfpZgpvmSjlRVac2ylM73CIRQtT/6Ie1PR7xsMSlCNqxMdRYexylbPWJq6HmBgPlp/F3hlyDVu3ykna5vTshmIHtlg6DKhXdyeSMfah6RpPHiXQ1OIV7qYJiTn1J/Q0wio0HMX5Svz9Juti5/hr3E+Tk0Cl7MsKP59AacNcobN31phE2rFvJVVp2A2u0fQW5DKbP8dexa2os6dfzO11ANtcl5hBksfrBtSqy5w7C9cW/Vvd4pxzxFyFel0r5Njh9j9YAQD4ixw7gYAvRVJH6uXtjszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt/xnQnPjmIqCnh5xiD1TBKEzXgOqxTg2KQa0uQcD8I=;
 b=IS2fsXfSzWgUGf6zvVvddwl3JmEysWdnurw3iskftIShxbjTn6YbugpW5zCy8dprZ/ophqLN+jWIN8wnODAs/UzzqUiD19OhW6gPiq2u7xT2FLaLdAhaZg2Ek8nhRvOqCn7Q3vvLwQ4ChPBmsNFgSGd9ihuAeXOhu5vnoD+w1u4OZSOHI3mSKrhZ2fJN7tjBBwqDHb+jhG/pEj5rl91wNAaguTSIBGeNcqmrzO/bHmnyJuagBTnyRw2iw850SBUOr8ilcO823R+gSEahE+fVK7JvDBWSqNDWsUhXLeNb9/RPn0DRe62tue3izuhzhvBbgZpd9/ONJe8jylZQhvgpVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM9PR04MB8619.eurprd04.prod.outlook.com (2603:10a6:20b:43a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 12:33:26 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%6]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 12:33:26 +0000
Message-ID: <926bdbca-09cc-4ce0-9855-c36f9a102210@nxp.com>
Date: Tue, 29 Jul 2025 15:33:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery and
 coredump process
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, andersson@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jassisinghbrar@gmail.com
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
 <aIeFqVUp2C6fh4PT@p14s> <12184ce7-e74b-48eb-abee-25f8a10a2423@nxp.com>
 <CAA+D8AMpF9Te1+V=o6WQCzHTkKpKvrhP+76fpCZoswOhPiKDjQ@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CAA+D8AMpF9Te1+V=o6WQCzHTkKpKvrhP+76fpCZoswOhPiKDjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::22) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM9PR04MB8619:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dc37c4-25f9-46b6-033c-08ddce9c1d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHU5YWRhbDlYM2kydDArM0JEVEl6ZDlVa0Q3ZENESldsbjdzVzV0bzlnTng1?=
 =?utf-8?B?aEpWS1QrZ0JxOGEvRXBGejhPY29FQUhjNmpGeXRkV0kvRlIwbGplUlRDaGVa?=
 =?utf-8?B?K1FHOHJuUFd1dHA2UTA1VUdCbkVWaS9HVTBzVW1XeFNLaTdlQ3FxMUlRemNr?=
 =?utf-8?B?aTdaT3JCTjJubDdsZlB4VnF5RWFMTlM4dzlzMVVjWWF5d3NyQWN0a2ROZWxr?=
 =?utf-8?B?SndEMGFlY3NrZTNBem84QkRIZWk0SXBiTUo0S3o2SVNWVUZobHdNaFQxSGdJ?=
 =?utf-8?B?aXhuNnY4WFRnbG44dWFZbHdOZ3poeU9USXdOVFpmV1Z0VzNXSEQ4SGYvREFx?=
 =?utf-8?B?SlJLcW5leDE3dEx6cDFJdmhaOFNzU3hDNFNxL1ovdld6dmhoSTcwL2pPY0E4?=
 =?utf-8?B?cUlOVjZDRTd6bDdaU2p5VTgwd3poeUlPN0dCYXh1Yy8rcnVnVFRicHE0eDBK?=
 =?utf-8?B?S1psNVZBYTVjVmloS0VDb0l3NmFJYnMxaTVxTEc3cVJyQXY5eU1JbGdBTUNs?=
 =?utf-8?B?dTU0MEhuRDgrdWZpZWtvUHByNlJ4UWlNamgxOEhPaUJ4M3N5UGxNK3RTb1Vr?=
 =?utf-8?B?c1BqWGkzMmhEcEVrZ1pEenlaaStOdDg1SjFxeWVMVXBxdjN2QTdBRGUybllq?=
 =?utf-8?B?Sm83NExHV0RrMS9RRXh1ZVRhZzhOb2ZJN2N5WkN3RnNEc2NGSE9aVkE2M1Zx?=
 =?utf-8?B?RHJobXJmbXQ1dFExTWZsS2huSXc1RDc4dm1pUDcrajJIdHVHM28wT2RLWHI0?=
 =?utf-8?B?dFh2NjFvYVdobG9IajJBUStkazZCUUNFZFI1OUVSYVkwNzd4TjdidHNEL29G?=
 =?utf-8?B?Ui9ud0h1VmpiY09XbnNLVlZ1ZFZnTzBGcU16M3BJaUp2ejlTbU41ekNEOGZU?=
 =?utf-8?B?N1Z6alMxYXV2ZHU2QWtETjZjOXovWGNIUmZNc2pldG54blpjWWFZWlU1T0Js?=
 =?utf-8?B?RDBERzY4S29PTmxIelB3RTF0ZERMWmhSTG12M1d1ckVnOWpUTUMwcmVrVC85?=
 =?utf-8?B?di9KL05aUjdPNmQxYWlkWjA3S2NBTTRKVWFkRW5WcnJJcjJOdmJQRzNVdUg5?=
 =?utf-8?B?dlhJNm1HdHpZdkNTZmFtaUo4T1pycnZyQTBwLzdrV0ZZZVhLVkJIZThqaFM5?=
 =?utf-8?B?WU11TDVja1RYbytFYk9JQkI2K1VEOWNpd0w3Z1lwenUxZnVNZmNxN0VMN3E1?=
 =?utf-8?B?QzdXaFZUZW1GNTRkM3V5dkVHWnF4c05zdFBDU1pHcG9BamtBWmxWV2lPSVMy?=
 =?utf-8?B?eGFYQWJ4Q2I0NUp1NkUzZldISHNBV3BVcndac1ZGOTJCZnZoVVBSZTNWc0Zq?=
 =?utf-8?B?Qkg3RTdiMzRTNG9mZ0EyT29VRWh4M3gwbktEY3NmUkJjME94WmhYenVXSGR6?=
 =?utf-8?B?czFUVUFvUStCMnZjZjl3dGFYMllSZlNkSXhWWTdsTWRHVHBkZ3dtTWNFZUFm?=
 =?utf-8?B?RmlHUVpqeURvZU93VzJiZTJBVTBkVUE0SUwzdFc3QlBFSUdldWxWUXEvR1Bs?=
 =?utf-8?B?SGY0eTVPZWxnalZORnJ5SWxLMkQ2RWFQVzVBTlB4amVENkZuaW56aWZoNWRl?=
 =?utf-8?B?bE9NMjE4L3B2SEhSTXMrZ1NsWHNnR0NZQWNLc2ZwSndseFdQU1YxWm05MXIx?=
 =?utf-8?B?b2hKS1M2STJPL1M3UGI2ZlRsUVJURk5xNkJrdGtwT2tVZXN6dlJBMmxjcENo?=
 =?utf-8?B?aHJEd0JIbVdITU1VRXBKQzg2dGVraERVMGx1NjlRZGtHbGRCbkFLNEx1anJH?=
 =?utf-8?B?dFoyTHhIVmxRVXN6UnlnNDFqbzZqdnIvb1RoYlRrTEJna0ZPc3JEaWppejFU?=
 =?utf-8?B?WGp1MFczdkJzNnJiZ3N3eGh4TDhlVHpjTWJKVXlKb0lWYWJ4TEk5UXJoNWVB?=
 =?utf-8?B?YlZQKzY1aXpidlZCVW9WMGdTUjRYV1VkaUVWdmY4MSt3eFBYRjNPRVEzZUd3?=
 =?utf-8?Q?jBTPpkSALno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjVkTWs4MTBwckZyVGVTYS9JdEdCZ3hYbEpOQVc5OU9POUs1WGFtelE1dW9V?=
 =?utf-8?B?L1BNTkNTZ1Jlbm1aNTU2NUdPQ0FKRkVHNi94Z3IvTnNjRVpYelFKZlNxVTVx?=
 =?utf-8?B?eW1kRTNmMlR6a0d5YlR6L1ZnZHVHWVVqVzh6dk9PdXJadm5hMW1IaDA0YytJ?=
 =?utf-8?B?bGhDZHMxSHhFcnY4bzYzQ3Y0bmdSdkZHVEtFTEtJYnhPVjgxWXN1ekRZVFZx?=
 =?utf-8?B?KzRGVlVuckhxMGdsWTVaelB3Z3NmK0cxZzA1WkhtanZsUHdhWjZ0TVdiZjFu?=
 =?utf-8?B?NUpOSjlWK0xkK0dicnN2dkQyQzJZTG92c09OdjhoMW5qZFY3NEQwdEtvSU0z?=
 =?utf-8?B?T3cyZkZBZXZCTzBpODd5bjdBSmJNcjhqb1h6S0o3dnN1RTZVM215WmFJcFdQ?=
 =?utf-8?B?L0ZqMzVzNlplMGZhdE9mNDBKbjhmTGEza3FxQmNzMEYyK0pMR2hKcFo2QW95?=
 =?utf-8?B?OG5IZ2dyOWVlaWFKdGpWd0Z3SEZTVm91U1VsZWRzUW85Q09DbHp6QWdNZ2My?=
 =?utf-8?B?SUZOdFdOc1ZnVkJVSXZYSXdCOWsrbG5PTW5pV2hQLzY4ci93dkQybnRDcENH?=
 =?utf-8?B?QzdkRXZ2Y0h0aDFMV1ByNHJnQ3ViYXRWRjRVUk5mczEzMnNzTmhjMnVCVkM0?=
 =?utf-8?B?RlFBeGRHc1JLMUg1dkJiY0pDMDJrMWNyVk9WNHFTR0FoK1A3Y2puZUQ0SEM3?=
 =?utf-8?B?Um5Ea25MZ1JWTTF3SGowOUNSOTFXQXp6OHN3OGZ0WDh4TjVvcUJVZXdlNDNW?=
 =?utf-8?B?OFdDWklXT1JHNXVNdkZUN3dJZWQ0bTRSaU4zN0UrSklQcnFLVGNwRnUvSVRH?=
 =?utf-8?B?WnFFZ1RzZ1FrRzhmNHVPQ3lhZVNmRlpiazlveE1tVXNhSUNzOGNVTXVrWXla?=
 =?utf-8?B?M0E5Vm1sQ2dieVl5M0FSelFDOXdha3lKV2lCdVZKZWNRbzI4bFc2bVFSdWZl?=
 =?utf-8?B?TXRSdEpBbGVkM2d6UnZlSG1pT00zSWUyajU5RC9mbkdVK2V0czdrMjROTTFJ?=
 =?utf-8?B?MmQwRUtxb052VEw4REpybGswTmQrc3QwM3lZZ0NtRGpUNXNXcDhaOHR4MCsr?=
 =?utf-8?B?NHZIS3lWc29MQnhoNitBMmpucnRqTm9KMGFTWlhsUlROK0dLeGNEQ0kzK204?=
 =?utf-8?B?dkt4WFYyQytHQzQzc1h2MGdKbGhMbVZsbFdVT09sSnBEaVBuVWE2eDJPbDc1?=
 =?utf-8?B?OEFDTlE3ZjZ0c2V1SWUzcGoxVENFRlVhdzg2VUJLMXRiZVAvendMM3JXTGxv?=
 =?utf-8?B?ZFVKRHBXTGNxZHl2cjIzOXFaeGRVdlRIcmJkQ2hBZEJzdktUTVZMZ09rM0xR?=
 =?utf-8?B?bFYwNEp1UERUSjVyTVR3eTRYcmdRbm8zMzNXTjNIR2M5ZzdjWUY1SXhKZk1v?=
 =?utf-8?B?L29RQit4VE9NTE53VUs4SC8yVG1DbGc2bU5jbXdOUGhTRGJZVThUVGdCcXY1?=
 =?utf-8?B?MDFvaUM5VHpucUxXNzFSVStLeG94T1JEakxHV0dydEtLVnZmUzh0S2R3Mmlk?=
 =?utf-8?B?RlQxY05aWDlhQng3YTNTaVphb2dUanlaYWtJUHRCcVZjS1VDQmVVM1p0dGlG?=
 =?utf-8?B?aUM0NW5UQmFVWC9GaU1PTzJpN2hEUGJpOG5zVml0emZDTzIwZk8xQUNSUVU5?=
 =?utf-8?B?L04vY0JaVnRycWtNN2tFRzF2RGlWbDRseXBLRnNVeTlwbk9CY01NdUpCWVEz?=
 =?utf-8?B?bGxkK2IxK0xxU2RGRmQvUmpZRUk5Z1VNUTJxMUsyNkt0MHpsQkg3RWV6bGxU?=
 =?utf-8?B?dTZrVFB4VEltQ1l3MHVKTDVvdkt5VzVTeTRYQ1NrSVYwTzlCU0NjeGh3cFR0?=
 =?utf-8?B?dWhtaUJoNEY1RFA3WlJnemJHckRsNjVrV1p6WGZjNjNGY1FrUGJJVWpubkVG?=
 =?utf-8?B?cUp1TmtNSE1DZ1JaZW9VZFRMdGMrc053NmdDT3FxNVVDYUE4MEQ2OEJnTzFx?=
 =?utf-8?B?c2lSYU9wcDRpMW5kZDYxMzQrSXIyTTFza09QV3c4WEhwV1RNM0lmTmVkVlZp?=
 =?utf-8?B?ZmVhSGROQ1dEdWlmR0tTMVUyUythTWQvY2JoMVdzQW5Yc0dWSmhFV3NmVHJw?=
 =?utf-8?B?ZlEyQ0FGMXpzdTVYeG93UHlLb3dqanR6TVIwOW94cXk1azN1RW9veGhyUXFj?=
 =?utf-8?B?a0lrMGdiU0VaMklnL0pkSWxJak1UaUpUTmpRNC9TWEZIYVRTWUVPR25WL0Ri?=
 =?utf-8?B?dWc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dc37c4-25f9-46b6-033c-08ddce9c1d5e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 12:33:26.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU8lzYNHh0F/NDDn4aWOKEmrQXtm14eGOpVA28zQhuank1PT6wkEcVPytbjROpeg4Lrt0RQDh8kGEYz3TXnWgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8619

On 7/29/2025 4:33 AM, Shengjiu Wang wrote:
> On Mon, Jul 28, 2025 at 11:09 PM Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>>
>> On 7/28/2025 5:14 PM, Mathieu Poirier wrote:
>>> On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
>>>> On Tue, Jul 22, 2025 at 11:16 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>>>>>
>>>>> When enabled FW recovery, but is broken because software reset is missed
>>>>> in this recovery flow. So move software reset from
>>>>> imx_dsp_runtime_resume() to .load() and clear memory before loading
>>>>> firmware to make recovery work.
>>>>>
>>>>> Add call rproc_coredump_set_elf_info() to initialize the elf info for
>>>>> coredump, otherwise coredump will report error "ELF class is not set".
>>>>>
>>>>> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
>>>>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>>>>
>>>> Changes looks good to me:
>>
>> I agree, but this is not enough.
>>
>>>>
>>>> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
>>>>
>>>> I've tested it with Zephyr synchronization samples inducing a crash
>>>> via debugfs interface. App
>>>> can recover correctly.
>>
>>
>> The synchronization sample does not utilize the Messaging Unit (MU) for
>> communication between the two cores, its behavior is similar to the
>> basic hello_world example (no fw_ready reply is expected by host).
>>
>> I’ve tested this patch with both the synchronization and hello_world
>> samples, as well as with the default firmware specified in the device
>> tree (imx/dsp/hifi4.bin), and everything works as expected.
>>
>> However, when testing with the openamp_rsc_table sample from Zephyr [1],
>> I encountered the following issue:
>> ```
>> [ 1500.964232] remoteproc remoteproc0: crash detected in imx-dsp-rproc:
>> type watchdog
>> [ 1500.964595] remoteproc remoteproc0: handling crash #1 in imx-dsp-rproc
>> [ 1500.964608] remoteproc remoteproc0: recovering imx-dsp-rproc
>> [ 1500.965959] remoteproc remoteproc0: stopped remote processor
>> imx-dsp-rproc
>> [ 1501.251897] remoteproc remoteproc0: can't start rproc imx-dsp-rproc: -110
>> ```
>> Upon debugging, I discovered that the issue stems from the imx-mailbox
>> driver not clearing the General Purpose Interrupt (GPI) bits. This leads
>> to the remote processor failing to restart properly.
>>
>> To ensure compatibility across all firmware variants, including those
>> using OpenAMP, the attached patch is required. Both the recovery and
>> mailbox patches have been successfully tested on the following
>> platforms: i.MX8MP, i.MX8ULP, i.MX8QM and i.MX8QXP.
>>
>> Shengjiu, do you want to send a new version with both patches?
> 
> No.  it is a different issue.
> You can send it to the mailbox maintainer for review.
> 

Ok, sure. I can send it separately.

Thanks,
Iulia

> Best regards
> Shengjiu Wang
> 
>>
>> Thanks,
>> Iulia
>>
>>>
>>> Very good - I will merge this around 6.17-rc2 when I get back from vacation.
>>>
>>> Mathieu
>>>
>>
>> [1]
>> https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/subsys/ipc/openamp_rsc_table

