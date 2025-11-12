Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011031.outbound.protection.outlook.com [40.107.130.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD32C026D;
	Wed, 12 Nov 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937801; cv=fail; b=IjLFkV+Dxx9odZlEi0mdjphDGQSIyLqdkAGgha+XMlbQkfJ6gHCUzEscMlGz+NoP3bkCjC/vBnWLnjVMKDpyppiBPUSZv7H2PjrMOAbgAfddeSDqdmVhU6E36gcquayFweBVL43bvIOIHj33rAmaSLT/jOw4olGphUhdrXLqsGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937801; c=relaxed/simple;
	bh=Qg/Hw6rBAi1DY9wRrHnh6lNlw7dn1MHe5rg/vABGYQc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TSOdx+0ajmz3MoRkdo+AQNWEoGRHuF8tJ6NblZsMbwr8wwg7L4Ud59CCzpUp753goWCm/H9byxmpXk2POvou24kh2SHY5UvUmu9Zb9YEMMHlxgMRXnMUcO18JalX7vRRLPMowBUalJPuEO+ykYq3389HdUYL2E3HFuswuDE+qgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I4Ok/SEz; arc=fail smtp.client-ip=40.107.130.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I4Ok/SEz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub/voJiyM+/r99nx7LMCYEDVM5C2I67cIJfG2r4SL/A5y8stv3JiqrPUjgmshCLyUrzkuJthJo0XlEno7kx9PUJqWd1CHhlvJmmpywWYmk13lfRZsPjZ69QUAOtBRHMvADT0taFEkzsQZUD8znLfjc/ngCixJxhBwYbEDjYiT9GkbqQpiIiz2XIeAjPNMtSEqw9Dy+nwD9Ds1qFPfasKJjeZf/70Rziasm3WMhxkkClU3t2PcLdX+58CWB+epUn4QJ/l9jUo6L+Ew4XfKW+gR9mhXm8feQdVXqGfGBAGW9fWJ4U3AQtPkkUPYMZJZ7PaxmisoMe0/+ImUjr5HVILuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvi2VSSizRYNqZOwgMdIPJPeXEEmhmw76nkz2HRBmgI=;
 b=Gvo7eUlwGVqdB5Oc24KYezAs7Vw1UpoO79MMwgbrMUg/pCVQCxsOFKO0FYJ69jHudiE5JvkJ7zBQmce0N4JVNaHn7p+BmhWipbWzDRJ+ChqgWIAIaLsG78RELXIEvRWhE1LxZHoh6LlCmvzXjD0ejw9nTo1qHY/1hOC3AedzsrIJ299xAnbS7OJyO/bZi2f+ht+eVBm0HO4cUqgpy9daFavGpd0iw4Db1k2rQZUh35GFicpvVjLvAoPAQhyfAAy3sxwOf//NxRmb/YZYx7jOAeUpeFxz9dPRzvKdoecW/2ElR/jK6hw8A3U2sWH6z5MWtWLFSLHfzIqwyaLzzYaxfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvi2VSSizRYNqZOwgMdIPJPeXEEmhmw76nkz2HRBmgI=;
 b=I4Ok/SEzNB0xN+COPBbtR0UQixOV/o0n6UFTCQEWQr0nYfqNqPhataUL9U2ynHy6EplJafJAu339bAAxizvJdlJ6lVLCRsLEGkFFc2L+6X6lNYPIS3pxG4ig4MvV3+CwnSH0VSKquJEfqzrzCUx0W1RzGXCdL3o8OQgzFLCnXmn/cTV8Mt9/V1loSzpyMAXpHJu25wXCwsHrTw/Nla7emNk7PIIReze8gfFqJRRwjKTsyuqFC1NP2uRp1uZRZ4PkK/4PwMoN6QoYLOMifXmEqR7V5WX619f57d3rvOB0Y4LOArNdc1Tha6qvClZAdSU9GGjzhHi/QQg3tVHlxUVjMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by AS1PR04MB9408.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 08:56:32 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:56:32 +0000
Message-ID: <1c141b75-3b08-4e4f-91f1-696551043c2e@nxp.com>
Date: Wed, 12 Nov 2025 10:56:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] remoteproc: imx_dsp_rproc: Refactor to use new
 ops and remove switch-case logic
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0026.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::36) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|AS1PR04MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: 488f2cc5-570a-4e2a-114b-08de21c96047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmliSUZ1OXdwVjNSZDJ5N3pOUkRYK24weHBZOTRMQnh2aDlGRDN4UVpIUHFn?=
 =?utf-8?B?dlVRTmFxWUJSVm5YQ05KQTJIWDMyNHVoTDhkQWsySFlzZkxGWCtZOGtXd3pl?=
 =?utf-8?B?MmhpeVRnWnpsNmJFVGwxQmxaQVhHelpSOU9rN3JRbWZnUFhNNDlkd0hsK1V3?=
 =?utf-8?B?OTJ5Wm0rb1Evd1ZXSXJwZmN6MVJCejRSSWNJbGh4WkZtTjU0bSs1TUJnRU94?=
 =?utf-8?B?WmdlRis2aXVYR09EbEpha1hKU3E3d1VYMUl1NXZMKzBORDl6Tm5velJMTTR3?=
 =?utf-8?B?WWxoemxwRDcrczVNdkJOOHp1b3MxUHd3dkZBVUZhUjJ4Q0l5S3BzNWd0bzFF?=
 =?utf-8?B?TnNZakJ6Vkt6cGt6NjZFeDJPT05uY205cWhxYUQvVkp1NndNcFFyS0FPeENk?=
 =?utf-8?B?aTk3eWx6ekN4K2tEOEE1T2NBWGlNbGlOSGxCUWxoSGVxdnRxdTlTU1FSSDV2?=
 =?utf-8?B?V3dTYmMzNFVyM1Nrck5TUERYRXZXaG9sSVoveTAvV1NJdkYzQ2MyeFBhejlt?=
 =?utf-8?B?ZWk2bTUwbXlSbDJNRzlqVzAzeTNnR2FWSkk3NHNBS3ZNSVBnem5ra0VkZlRW?=
 =?utf-8?B?TE5nc3k4aE91TXdDSWU5TVZmdFNQYkRFWThxVkpLYUdMZGNlL1lWM0JhNkxX?=
 =?utf-8?B?c0RMODE1R21iM1prWk9hYi8vOHVtaGNCT1ZNU0ZpZjdXaTBESGI2czdUaElk?=
 =?utf-8?B?ckN5Qmh0cEIyRFMrZTRiVDhhT011d283QkttRXBPWHJxM1ZWbktLd3YvZnRB?=
 =?utf-8?B?MGZOb0VPQzhiaS8xYWFKYnkwbUVyL1RSNTUraUgvbE1WVmFKaUwrZVFNam9x?=
 =?utf-8?B?VzFZOHREVElXRGtBQkhjOHkxMEY2L3ROaTgwd0J0TTMyQ2pMYVoxR2V0cE8r?=
 =?utf-8?B?bzZKSDhpbWFFQ2J3cWttY2JicVFJT2pRbU1INGp6RjRkMGRuMUdGeTJFZWdT?=
 =?utf-8?B?MkxGWFdhbkZqSVcvUXBRWk1mdEtnQVN4YzM2WlZqWU4rNXdOMGVvRThEZUUr?=
 =?utf-8?B?a2NkVlhwMUJnZ3UyemUzWVB5ajhaVTZpTTNUTDE5WkpMNXR5aHorL1pHWjVF?=
 =?utf-8?B?cWZ6NDdFQVVQcEJDT3phdWxtN1FpcE1KQWg2cVluVTF5WkhlSUhOdy9FVzRl?=
 =?utf-8?B?UXNoSkhJTEtWRkVOMXFyNHY3aHJ3cGpEQUwyQ2Q4SnNvcSsyTjBZUzJ6Q0cx?=
 =?utf-8?B?ek9rTlc2eVNDYkVTS1NNRjI4SWVJdThVK1ZmYTJIbVN5YnRIMEJlRlpyeHBT?=
 =?utf-8?B?YSsrd3ZQTCtOekJzY1lmVUZEU2c1ekhZVFdSeGVqVGZZdjNCcVBZMDJKaWxU?=
 =?utf-8?B?QVhWbTBsMHdnb2hsMURxWjdSSXl3SHBlb2lhYlovalJyalRVaUM0eGtHbmZK?=
 =?utf-8?B?eHZaN0grTGRnQnhVajBISjdaWE9oRjFGRGtjWTdIN1ZTVCs0MTh6WjZnT2JD?=
 =?utf-8?B?bXZlQjFWN0hieUMwZTh0bmRGMmJyWHhZc3lWaS8xTk5xaUx1YlFwaE44V3pv?=
 =?utf-8?B?VmNFSnYzQ3ZOelNpMkg5UEwzS2NSczdTRk5YVCtDNGdReDA3K3IxNDNvUC9U?=
 =?utf-8?B?T0lncCtaQ3NuTUhMb1kyYlphTGNIeGxUalYvRGhTWTNEWmV5UGFZdEVuQUdj?=
 =?utf-8?B?cC9jZDIwVDMzZGF0NWJCMTFTVlE1Yng2dzRNNHRzSzVwbUx2Uzlia0lCWjM0?=
 =?utf-8?B?VzB5Z2FXRDhmSFBjVVVKTmI1UzJPWFpTMkovaXhNbDlsK2dyZXI0SkJkTTNl?=
 =?utf-8?B?dVVMNDRZYWhtbUQva0F5KzhVVmVQNkUydnE3RENXOTlEeFYwUC9GUUhPa05B?=
 =?utf-8?B?UzFLYXkzMjZwTDBaM0s1NlNnL0ZyYnVsSTA1bUhZRUVUU3o3OWlUYUdwNXVs?=
 =?utf-8?B?WGZ4eWNDUGRsNkVycE8wYmdVQko2VGVkR2JXcElhRGEyOTdpUlBmdExlN3NE?=
 =?utf-8?B?bTdnWTdEWFd6SldQQnJQck5FTmhUK09nZlYvTmw5RWU1RUlDcXlHWDY4ZEkr?=
 =?utf-8?B?OVB6OWVSY1dnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q014WjFBamJiNEx6TUt1TmZJYm9oS3dtcU9pLzM3bkE3S0NQN1RoNklJV20w?=
 =?utf-8?B?d1pHL3pGVUUzNnZTWjB4QTRESGU3NCtleHF0VWxkMlNuRTY0eHFLZitaQ3R5?=
 =?utf-8?B?YjdlaWdONEtxQ21FWldkMmNIOVMreWJ1Kzc3MjZkeW82cllqbXdxc3VsdnJB?=
 =?utf-8?B?THF6NlFvV3NHMHlZdWpzbHREcjliS2lFTUFIQkx1Wk9XRVB6bk1icXo1TDB0?=
 =?utf-8?B?NmViZExJYTZyTVVQeC8ydjQvckhiR0FJbHBzNlRmNFpOenJ4Z29tQ0ZsVE5K?=
 =?utf-8?B?ejJtQlk5eWE4RjhXeGNLMlZ5RFdvQVNCd3pMMWVyUnM5RW9HS2VKZHFUK1F4?=
 =?utf-8?B?aEtyaHhQenBYbTN3V1VZUGdsNU4rblF1R05ZVFFFaWw2cjhnTE5XTk9uTzBv?=
 =?utf-8?B?RWdTWXNZREV5WmZvcDUrYy9MY3hNa2VzSFUxWTB1L3BjWk1QVDFQQ2kwNk1F?=
 =?utf-8?B?VkFUNGE1WnNvRDg2Q1krV1FBeVF6MnRzQzJlTnMzN2RhQ1NyS01jZ2k2UjBv?=
 =?utf-8?B?NGtTeHhPMlpDZHdHRW83UTFnMW1kWmJhWDczSE1rMFR1WDY2b3loUkxydUw3?=
 =?utf-8?B?alZuTUpPMDNHZEVBNVZHeFpJYXR4RUc4Y0dwekNzM1J6K0VyT1hxbmNORTd3?=
 =?utf-8?B?Q1o4cnVRL1BSM1o5ZUVrTjdza3hLWm1pSzkvMHBNV01Pako5blQ2YUVFQXVY?=
 =?utf-8?B?RHJwU1dlYTQ4eXlvVmR1VE1WTE56QkY3OVdrU1N6b3hLcUJkeWptdHJnVlBB?=
 =?utf-8?B?eHc3QjYyZ3lkUndNNzBCdWdvWUJaWGZsMzkySXV6U1lzOGowRENhSTUrWCtw?=
 =?utf-8?B?U1lOUVlPMmVyRURYUUxYSHlkbnhuaTlPRzN2Q1l0L0pQc25mTEtERnU2RTNT?=
 =?utf-8?B?M3RBbWZmSXo3dGtCQlJ3TTlvaE0wMWkrblJTNmlPSUpONU1pTlMwblFnVnls?=
 =?utf-8?B?MllyV1NBaVRvUVl5QnRWVllFaFoySW5hOS82L2FoaDVGalR5ci9YM0cyVkVm?=
 =?utf-8?B?VGYwZ1ZhbjhFNkEwVDIyenpBMWZrZCtiSzJNamZHUU91V2MrTUF2Mit4RDY1?=
 =?utf-8?B?MTU1R1cyVFR1YTc0bW10OEgveVF5RXpUQTVid00xdUZjYjlDZ3pzc0V5TlZw?=
 =?utf-8?B?VjhFUDIzSU9Bd1BtRlRINDl4RzMxWk9LV0ZpcGVSMTZPNmFvSTVua2d6aEN6?=
 =?utf-8?B?UGxSRThvNUp2RFR0enBIVnNCbWFLYnVLOXJJVGd3MEZ6SnVOd25JNm5WTWVU?=
 =?utf-8?B?MGRGbktaclJCTVV4VFpMOFFzcXQrNnJzMC9McUZyTkppaW4yWEpjUUFrTWtM?=
 =?utf-8?B?YUFHYW9iQ2lFdDA5T254dXhQMVQ0ZmwyT25TV2pFcjExWG04emVDeWgxdnlI?=
 =?utf-8?B?Mjd4VmpDelBMUnBIL2phc1I3ZTRIT202b2h0bkZFK2JTRk1ydmM0bmkzQ1N3?=
 =?utf-8?B?VittV3V4dXZPMlZ3bCtkZ2tiSWd4SVlaanRHRzBweng4M0F0OCtYR3NrZkJN?=
 =?utf-8?B?dzVJeTVSM3ZtQjU4UnMxM2s4cHNYeE0rV3ZhNnY0Y0NjU0hWdEx3TWxDSFov?=
 =?utf-8?B?YWZnYW1BYUVKSTZPUlB1RzFUR3pDd0tHODVqWmJNWmZMamI4aXdLRWUrRkRv?=
 =?utf-8?B?dld1cGsxZWxnYzNqZWxpVFZMaEpOcnluSTBpeVlIaUl4MlJiSTA4WXlOMktP?=
 =?utf-8?B?VE5PODh3ZWIwTkZOTUJpcVBuWXNTcXJzNW8rdHhiU1R6M29Ra2hjMkNOdi81?=
 =?utf-8?B?VTNVZmI3eVZKVHpFQkhLWlF2UnBCbkRPRmo0RlNhTXNVQlNoeGJodWlnVzJ5?=
 =?utf-8?B?MUdOVkg4WWZpMDBScXl2TitBdWZKNm1vQmx5dTVOcGFjMkZlckhYN0ZueUdw?=
 =?utf-8?B?Q0R6eWd0SmhLaWNvditFL2pxekhyVkZQSHBVV2V5T3NDMmtSOGNwTm01S0xx?=
 =?utf-8?B?aEUzMGwyL3NjQ05vQUQwZHVtQlVZU0hQTlErQXhmNThkYXB1UlVyS2szYUZK?=
 =?utf-8?B?Nm1iQ2xRb0lOeGxjRUVLYmxwY0FGOUoyUmRWckprdDlCSjA4MjhnZ0piTENU?=
 =?utf-8?B?RU9DeVg2bmhxVEl5aTZpVS8zbDRjL3VhZlY3OUlsRThUOWYraU56Qjh3YlB6?=
 =?utf-8?B?TDZwWTdFUnNCTzhsOFA2eUN5TlVVTVc4Zkt3TVJwVmt2dVJqS05mdnl0ZDRC?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488f2cc5-570a-4e2a-114b-08de21c96047
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:56:32.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Qhc8Zh4l2ozoWU4JBa9q6LfJa9SGp84H4EFBnTOSWmh1oYs/0pnsWOFayfFU9aPZYmOKfys9kGSx+8IZ2qaWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9408

On 11/11/2025 3:41 AM, Peng Fan (OSS) wrote:
> This patchset aligns imx_dsp_rproc with the cleanup and modernization
> previously applied to imx_rproc.c. The goal is to simplify the driver by
> transitioning to the new ops-based method, eliminating the legacy
> switch-case logic for a cleaner and more maintainable design.
> 
> Patches 1–5: General cleanup, including code simplification and adoption
>               of the devres API.
> Patches 6–10: Transition to the new ops-based approach, removing the
>                switch-case structure.
> Patch 11: Remove the obsolete enum imx_rproc_method.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

For the series:

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Tested-by: Iuliana Prodan <iuliana.prodan@nxp.com>
on i.MX8M Plus, i.MX8ULP, i.MX8QM, i.MX8QXP

Iulia

> ---
> Changes in v3:
> - Collected R-b
> - Simplify commit log for patch 4 per Frank.
> - Link to V2: https://lore.kernel.org/all/20251106-imx-dsp-2025-11-06-v1-0-46028bc3459a@nxp.com/
> 
> Changes in v2:
> - Collected R-b
> - Patch 3: Update commit per Frank/Daniel
> - patch 8: Use priv->dsp_dcfg->dcfg to avoid adding "const struct imx_rproc_dsp_dcfg *dsp_dcfg"
> - Link to v1: https://lore.kernel.org/linux-remoteproc/CAEnQRZAOTFw=sBppHTYQAdfDBuNqkqk6gVO4FyP0EBsva3Oi+Q@mail.gmail.com/T/#m27c93af9fb1e7fdeb0766bdbffbaae39d79eefab
> 
> ---
> Peng Fan (11):
>        remoteproc: imx_dsp_rproc: simplify power domain attach and error handling
>        remoteproc: imx_dsp_rproc: Use devm_rproc_add() helper
>        remoteproc: imx_dsp_rproc: Use devm_pm_runtime_enable() helper
>        remoteproc: imx_dsp_rproc: Use dev_err_probe() for firmware and mode errors
>        remoteproc: imx_dsp_rproc: Drop extra space
>        remoteproc: imx_dsp_rproc: Use start/stop/detect_mode ops from imx_rproc_dcfg
>        remoteproc: imx_dsp_rproc: Move imx_dsp_rproc_dcfg closer to imx_dsp_rproc_of_match
>        remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_MMIO switch case
>        remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_SCU_API switch case
>        remoteproc: imx_dsp_rproc: Simplify IMX_RPROC_RESET_CONTROLLER switch case
>        remoteproc: imx_rproc: Remove enum imx_rproc_method
> 
>   drivers/remoteproc/imx_dsp_rproc.c | 342 ++++++++++++++++++++-----------------
>   drivers/remoteproc/imx_rproc.h     |  14 --
>   2 files changed, 182 insertions(+), 174 deletions(-)
> ---
> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
> change-id: 20251111-imx-dsp-2025-11-11-1b0957e4cf5c
> 
> Best regards,

