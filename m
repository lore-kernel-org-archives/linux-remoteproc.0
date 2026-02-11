Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E835F2E22BA;
	Wed, 11 Feb 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805564; cv=fail; b=UEN6dnB8z3zAuCnYG19rOvAzIXmIaGymnOI5aCdo0LZFJGgDQ1KgUu2+H+S7LpkUsokGM2EohOzb1cmJj5kiaCN9oEFiSGwiUvhgQfGFOXnYzSP1xtWLb2PSagKd2rGCkFBbh4AVVstwVmVla9nZWrJwhZconOHKGTgRagZIiho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805564; c=relaxed/simple;
	bh=i/de2IRoRUouclvn30vBdNA7osmezE6oWIwhpD/80r8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mji9kmb8N3wLARbMsclEIvjkDRGZZ25OYvoTogd0VpSM0qnGFoCepfjQkZFCXOWxCwzd/tiFGpH1DRoyG9qK9+6+bIcKQjT4B4WTFv4+y3yTXVlngF1zQes1DjepEe9GmQgL9pDuePqe4t0RMz5RlShbSShK4vH3p66dH5d4AIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gtt2w+ik; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gtt2w+ik"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUPmblkUfigabZtMVTligx9+mUwEzsdEApgCE0X1YqycNyUoIjvnSBTN+Ahhd7GFwYPuo+ougJgwuOcvkT4A28vlAiRmO8kJ3T4kuJpVzjcyTb7vWGesUnVyXHH17qmFC2T2zoaB+L/RhA4rvfUU6siJR01vo3LyemueZHtL53TIoMwltEyI3os2tXswNkNVBS6K93vOQt0TeaDGkTbMGIlSp2st8VISfBdI1rcFR15KLNNpG8KwKJfRDQ1PqG/fczrJhjT7tFmAkk5T3ADJh5iSE2frMgK5Ig+89Ji8fEXM//hu387MCeaK/Yt+5QlcaH1eoWmBLVpJj9cY1sFcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/de2IRoRUouclvn30vBdNA7osmezE6oWIwhpD/80r8=;
 b=drZuZGZwd9ISq1AOd7vQO8ma+LLc7+MULIQpc3Dq8+zF3iajM6hkqKcPABv8hvyLt+4iYAAZeU1qzoQTMETCv3l0zBQc8OUsrlbwlkPdwXqZWVWKp/ULZAOId0L1WUnfdOMZJTTXxHNkzGwh8AAHq3+0lXNhldPnGRZmykqCiOcCZAkoVRwjF7mlnMhO+goHTL7/t/SFvaMLwtCgMYV+5mwMRP3gaY0TDOMxwMZpKaT64FqQh/SkPhTKPgnwIr/M7q0qPwd5o2LzQ/UeruehHsBBHFjkscoD8aK86KuAETR9MPyJ+6oe1t529aswcjwhMi0DNd3s53eD5pT/Sc+e3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i/de2IRoRUouclvn30vBdNA7osmezE6oWIwhpD/80r8=;
 b=gtt2w+ik2SdDepCqPB0eslB26xtdjcyUlvhTWTJnOMKZXgdKm4YuI9BKzQzU7EY3GvJQmzOSOLLPuJf5ONcAemyzlXZN+oduGhc7dx+bX3Vm06zdZn5mKmYsVVWi/Nib0d4cirz0IN1P9zEpoXR5FBxC8WAP8G+sxr7Z6vci9HofqHZa4VPSvDbtsAbZJS+on+vU2x/rd7Cn/HR/q8lH6w1+hofQVQriBwqe09RHhboqsu6Lry09tkfvQeSteCRdRyLLGMpWkwZRhGibYVAvksEn0Jb/+Xr+df8SMUjlluIQ561xSTusWGqDoxMHVm8g1lV9i76/hjOLob4S8qSFLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 10:25:58 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 10:25:58 +0000
Message-ID: <0c816b5a-4d42-4ddb-aa6f-1964acbe28dd@oss.nxp.com>
Date: Wed, 11 Feb 2026 12:28:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: imx_rproc: Fix unreachable platform
 prepare_ops
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260208-imx-rproc-fix-v1-1-ad74555eb9a4@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::10) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 586cb1f3-8ad1-4dd3-1b9d-08de6957f21f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enJLTUpVejRDZURVbjE5QTEyNHI1dmVSNkJqTDA4cmZTZmlKaFVwRzhXUGNs?=
 =?utf-8?B?bG5weGtDdjlEUVlISnJ2SUQ0SkV2ckVOL3dDMGtLWldzSzlJaXhROXZSUG5p?=
 =?utf-8?B?bzZ6UTkxekg5eDY3QWdkQ0N2TGd6ckZ5M1Jpb3hzOGFqR1BTc3hYUXFkUHRQ?=
 =?utf-8?B?enI0Z3c0dEtybUNYLzV5b2pjS2VvMHZESnpyYldYdE16eGttNmo5NFlFTThR?=
 =?utf-8?B?NXB0dFBGUW5zQUFhWUFjWmxScEFHV1lvTStqU3dUMGpPQWdKZGl2ekpVckxE?=
 =?utf-8?B?YUxkZ0t1cWp2RGRkMFFmVXR6VEgvcGlMV1I1NTJQSWUzem0rclpUb3VBVnRs?=
 =?utf-8?B?cDhZbEVFY0U4MCtLV0RKSkhsQXBUVk5wWVBpVGwvWWY1dWdzL2cxTTZBdE9Z?=
 =?utf-8?B?QnZxSkxrUXd6TmNqUXYvWC9scGpGQnhPbGd5YXZzSktnZEJ5QWNLNlp1ZFBR?=
 =?utf-8?B?UE9TdndYQkRRdTU1S0xTVmRKREV6U0tOc1J1UUtyejYzeHN1UEk4VXc2QWx1?=
 =?utf-8?B?QkhnMjA3WXZORzhwSWI1SGUwTnJrY2hlc3k4dnVLUW1McldGTDYxSkdVUzBH?=
 =?utf-8?B?Ly91bmd6NXpmYmhqRWFvN0pFUW9RYUVmM1NVd3hLUUVLaURIR0xTTXg1MGU3?=
 =?utf-8?B?b3VjQW5OazFhZEZuTzZMaW1YOElDUkduUytNUlBoZ2c0SnN1enM2WjJ5K2Rq?=
 =?utf-8?B?MFArNHJlWi9jU0cwRmV4S2dMandmemYyVXozSTdrb2NGSnRhY3I2Tk5WVFdE?=
 =?utf-8?B?bU5LTnNwZ1ZVN0JrQW1lZ2pDa3FkOHlBMDJ4TWNNWFBaLys3RGtManB5RVVk?=
 =?utf-8?B?d1p0dmpNbW9EbWFEdmlxZlYyRzhGY1Blci9vSWVVL2tuaDhiOWVZdEhmZExp?=
 =?utf-8?B?RmJUV2h1VnpJOHI2SHRmN0pHRXpHRDR6dDIzVHpxZUozdHhzaGgwUFZXMERz?=
 =?utf-8?B?NENCaSthTm5jY3Zxb1pCYWJhOTVaSURWWHhTU2FQeXpHc3IxbStZcjRsQ3BQ?=
 =?utf-8?B?ZVlPNlQ1MEYvOThiWHFtVVdxUXZ6S0FnUWYvK2lEV3hEWmQxcUpWenFnL0Uy?=
 =?utf-8?B?R2F0eXhvbVkrakRtemlibU95ZTFnbDNhaTZxSGJlUWRIYTg5bVpJb1Bic3hS?=
 =?utf-8?B?QkwycjJ0alp1OVl6S2NyMkRhYXdvblMzU3htbDMxTTVkSDRtazFPSElZSHRO?=
 =?utf-8?B?UHNmQzJLQXBsYU9LSXRnMlBhZjVJM0ZjZXpvM1JoN2V0YWwzT2pyOHNjR3ZD?=
 =?utf-8?B?ZGdSYy9WOEZtS1gxL2F4Lzk4RW5GL1Vqb3hJUUJ6NlJwYkV1b3YreDlBcHRD?=
 =?utf-8?B?WkxMUDRGK1plMGRPbE84djRvTzFUeFZKamsvZGk3emx6T0ZOY1lPS1Z6NFZz?=
 =?utf-8?B?MmE1a2lSekhxQUtUZEJLZW10VCtnS3EvM1MzM3B6UWM2aElLbmdtYjM2WDgx?=
 =?utf-8?B?ZEdWVUJZTGZkS0l1QlNUYlJUSUlHWElsZDZvQTNxZlRlaTRSbC9zdTdha3dt?=
 =?utf-8?B?ak0xdjJ6NjhMaG15eHFsNVRHdHRoazcrKzUzVytVc0c1TEZ2a05hcDdkN0ZM?=
 =?utf-8?B?OTF1ZXI5T2dEVW5SWFovL0xiVWlpSzFNbUxseHB5UnZTWFVVbnAxbVZYWHZ5?=
 =?utf-8?B?SHphbkZFVkFxRXY3djVlUjkvRUpGQWw2SmNMcENrZXhQeGpnSGoyRURLOGU0?=
 =?utf-8?B?aVE2TSt6WCtpRFN0T1hFMEs0ajgzbUFRcG9udnpuWm5yaG80TWhTc3dFRTFa?=
 =?utf-8?B?UkUzcW9NbklieTVYbUJUSDBFNCt3YzlKYkZuY1AzK0NHeXp4eFBBQ1BocnNG?=
 =?utf-8?B?NEtOak9tMlZRbmNicVgwanJPeWoxVW1oQW5nWGpIMWVTaVdvdzNrcmNHTDQx?=
 =?utf-8?B?RFFxV2NLcy9WS3Z3ZjhPOFRBTmpzOXplKzZtc2R1Y015MkZwcEVKeS9yaEJS?=
 =?utf-8?B?WndFZnV5TE1MM2JXR1F2MXRHUExqZ3hmcXNlYTFFYUtBcjFib082UkkvYmgy?=
 =?utf-8?B?b2NRVFlLVTgxK0xQajFwU0RjZ3N6dFRHMXpZV3VsTzZmanEvNjRtMHF3RXlj?=
 =?utf-8?B?TDBDeHhoSzZpd24zcTZDekluRkhCZXZtYk8yMjJ6YWFJSTZPOHZwTjJMa0Ri?=
 =?utf-8?Q?m6v8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3Rxa1pteUVpbmVwK0V2RXVsUmEwZDNEUnliNDJKVkY0V0NRNktuVE9kK2Jq?=
 =?utf-8?B?MG91QUlVc3oxd0ExSWZ5TmlFMjVENHo2T3A2ODJtaGVKdTlKbXZSanJkZWpJ?=
 =?utf-8?B?MHhPU1YxUml6MG9xMkpyeGNmY0VzejVxQTRDQ2dacUxvb1lhbzlQaWJFNUY3?=
 =?utf-8?B?YzlXc2FCNFVNL0FDa2NWcXVxTFQ2RmxPZXVNTWRKK1doNTZleHIvbDFpaHVJ?=
 =?utf-8?B?Y3R0ZklWUkdTNlBNTTB0aFRJZ1hqQlJ2OTVhTHBLYzlGa0d5bzhTZzgvTmNX?=
 =?utf-8?B?LzFJdXZldlAvWnRQem1icVNLVTRqT3hUdXpCc0N1NmptV3Z2YUlxVEwySGxJ?=
 =?utf-8?B?TUp6L1czUnlFaXZ2RDRGcXJ0K3VNam1jbTZqTEx3UGVIMTFoNkU3VThnbW5D?=
 =?utf-8?B?ZXhoNDhCV2FiVmdBb1lQMmxHYzdkZ3RaVUZUQmpsRHRSOGFabE5aQ3lJSmlM?=
 =?utf-8?B?M3pLNFU2Q1BVNFc5TXpVUnVKZ3VvY3BCOHAvZDBtVlZpUWFKQ01LYmZhR1Ir?=
 =?utf-8?B?K2RFdTMzQW1kc3pFRC93L2xLSFA3RFAxSlJyT1ErejY0YlJsVUZuU0lTZzZG?=
 =?utf-8?B?ZUFCTG40dzI5YzN2YXNSWXVBMUpGRW5jSlpQaEwrQTIwZWFRUElhYzJZanE2?=
 =?utf-8?B?cHdhbmlWSGplWkcxUE5zL0VPUjlYME8ycjBPREdmYXg4N1hidHZtQ3hLQnU2?=
 =?utf-8?B?bkFoVG9uUHYyN3JxNGJhK1NtOGo4VjBDb2pNOGhTZ2w4dTJHaG5IRmI5dWdk?=
 =?utf-8?B?WWYvQ1doQ0NjdG1YcGl3UDg1RkJpVW5YYmpVT0xRdXVtSkNZN0pEbEUySHBW?=
 =?utf-8?B?OUpRRFhVbWRlVUJ2UTdTdnJGdE9BY1I2c0lCSTVaQnovOTJpSkhlTUlEN1VH?=
 =?utf-8?B?U1drdFpkZ096emhLNTEwZWtLMHljcmxiZXNoT3BWWkJRaGhSTUhtREloL1hL?=
 =?utf-8?B?T0JVcWhZMm5XenhVdStnOWRFMERZRmU1ZGgza3ZNNElGdnlmUGlPSk0vZWJV?=
 =?utf-8?B?WC8vUWJFQy83aDRzU1duMnNGWFYzeUM4T3Q0SXNNQnVaYjd1YlNSZm1yLzRw?=
 =?utf-8?B?TWRoRFREc05VMHRCOFd5anNTbERBVXRMZ3Y1ZXpITXFPNFpwTEtTMHhjUHhk?=
 =?utf-8?B?RTlITGx2Q3ViNWpFOWtFS04vbTNmcm45QzRPWEUzblFoMGxpR0JjeTdIR21O?=
 =?utf-8?B?Vm5tZjh5N2k2WWxodzhzbXN6aThOK1dVTzVIMFFobGYxYUYrKzVodGsvLysz?=
 =?utf-8?B?Sk9BUWNOOE96S0hWTU11VE44bkg5eWhFUnVTTWJkbUI3SUxLSkhsQVA3THox?=
 =?utf-8?B?QVpheVRVS0NrUUNlb3lGdXlSWDN3WDJGams4c1o4dmhBWnlnaXB2Qk40ZStC?=
 =?utf-8?B?MGRDMlBYbnRXenFUeVYwVzV0d2JvL2Y4UStuckdkQUl6MitBMmJIR0xHOTdS?=
 =?utf-8?B?eXFRR3poaHlja1lXVmFMenNDeWpYeEtGNVA3ck5uYW1EbW1hNUxhTjhLNzBv?=
 =?utf-8?B?VFp4N2hFZlFwVWpLZFVNbjllWWlYYlBhcUdkbktsV0wyNlBOSmg2MGcwaTJG?=
 =?utf-8?B?TjlZWDIxVjRyUkcrY3lIMEY0cHBsTEY1TTFjb0hFNEpZMm0xeFE4YTRzTlUr?=
 =?utf-8?B?Mjl1Mmk3KzBNMlEyaDJHb3R3alpZaXMrazdCaytJRWd3djJ0NVFhZHp4UDlL?=
 =?utf-8?B?VjZRSVVYcHNuc1FlcHpTL0pQMHVaRzJGY0pnR3JMT2tRLytiUHR3cGw0aDA4?=
 =?utf-8?B?TVRhSHlrbm44cXNzNGJjVVVRbWRVbERNVndHcWw5dHhJbFZMWkxhRWlzdElq?=
 =?utf-8?B?YmlBeVdPOCt6QkNUQTIvMGJEMVNoQzBqVXZ4Q0grNGNETjF1UUNyeTkzcFVq?=
 =?utf-8?B?dmJ2SEhFTllOYjZFanFiQk5pVkZBdUFRaml2WnY5QUdmUzJzWHl4eFRIY1JN?=
 =?utf-8?B?d1htc1Zia2FEb1pjejQ4NVd2Q0pNUnZNQk80RHgxYUlBYkwvYUhIRHdUaDBG?=
 =?utf-8?B?dk9nbGhRUnJldlZtdkhEVzJRSWJyTHZUL3lwb3h1a1pzWXVtYWN1cCt6RlhD?=
 =?utf-8?B?ZEJPbWZIcGVVV2JKUmRkZVZvcjdLWHJ3My8rVHp1ZnZvcWFSNk1KS082NVFD?=
 =?utf-8?B?VHFISFF6LzVqQmNJRGFMeFh6S2ZENHUyVkdxd2Y3VVdEek93R1BrRWMwcnE4?=
 =?utf-8?B?TG5GY0hnbGQ0ZUk4cE5MZ0pMNnZzaTBoUE1SSnNsWllSbUNLcWE3emgvK05N?=
 =?utf-8?B?cUhzRy9qZWp5b1NzZnZZdG8xaGdPWnpkREROU3JUS1RyRCszck82anAwb0tq?=
 =?utf-8?B?ZE51VVJKb1poOHpVUWhxTVNLc3BxZE9XRWlpMU1PeDFCTDNVQXdDQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586cb1f3-8ad1-4dd3-1b9d-08de6957f21f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:25:58.2324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWs/6Fwcmm/44q0xwyPjoObqDVxdDQnyJ2GaAcN7BHgDSLdFfj+z7I/hV02e6xwSI9uCcSLmx+rucJvQRqaLDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369

On 2/8/26 13:30, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Smatch reports unreachable code in imx_rproc_prepare(), where an early
> return inside the reserved-memory parsing loop prevents platform
> prepare_ops from being executed.
>
> When of_reserved_mem_region_to_resource() fails, imx_rproc_prepare()
> returns immediately, so the platform-specific prepare callback is never
> called. As a result, prepare_ops such as imx_rproc_sm_lmm_prepare() on
> i.MX95 have no chance to run.
>
> This is problematic when Linux controls the M7 Logical Machine and is
> responsible for preparing resources such as TCM. Without running the
> platform prepare callback, loading the M7 ELF into TCM may fail if the
> bootloader did not power up and initialize TCM.
>
> Fix this by breaking out of the reserved-memory loop instead of
> returning, allowing the platform prepare_ops to be executed as intended.
>
> Fixes: edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops for imx_rproc_dcfg")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-remoteproc/aYYXAa2Fj36XG4yQ@p14s/T/#t
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


