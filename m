Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013058.outbound.protection.outlook.com [52.101.67.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F5482E4;
	Fri, 19 Jul 2024 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371531; cv=fail; b=um8sjzo9m++86De7d5zL8ujrxPHNWrcXPTdQNAagpOinf9972ecayypJgxIfsj1gaJkH5OXEueRuykLDx07ycoKRnwlbOla9+Jep6aRDjoTksMP5gVJSdxONUkCCwCPGmuo3hhqQxlZSUft1gQbjuNVufbFtv/yDl8avLMQ2YNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371531; c=relaxed/simple;
	bh=Rz3bQf4WbN+s/Wnqq002p75Q3jJEeimgWLPfQvWhlw0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mbkue/Oppbvz7DxvnmKGLtmCPBjN3KKZ0wBEUehrkMQZ1QROiwOE/A66Dpx0rypWy++gGP3m1aG4xjp7WFhof2wNEXeiQlA+V+u2eR8x3pglbCv/l2MAkq9mh6KessZ1+J37VKsYV30wMgLtFPUA/hbKzONWZKESsVK09pzsldA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=F59GBSR4; arc=fail smtp.client-ip=52.101.67.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="F59GBSR4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZak++y0UPXUNwkhB4CK4uJrsiZmgkixPw5JBRCRROKDqIDtgjNPYt22Rj9b/O01LJPlBEOXB/KsI34WWqzYJC0cUu+67AvreqnYea9/LmiHt8XeDMJhXv52wktBnAbnRSCC6b1K2pcVA7BAB+mlfQZUgMiQu0zKLYlhuPj/ag1xn3HXgp5WahGTyFmtgLsDVy1ENolCedmZ1Fq/AiDx//3uALfGJhPcDbnT6yH1jIwtxjt4bcGOfMvvCIRNZRLL30I2IGeY6+CtZlSVbD2bDlObHDgzv4XoVk9DjDd0jxRHzHWpeTc4AKzOqF7yC6Mvh6sX/uw/GMTvIjbk3lRIOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwWa86T5rJm70oGgl0Ew9h1t1Ap+zBEH4N1ze2EUqh8=;
 b=a4hvOb13O7/95Me11cknNSf3ImHmHdcVXzjgh8KbxdwR5galGHpkoFyScQjmSVFb7yRZVv5ot3k/KJENkPYJ8MxmMS87080m9dc2y//467crk40u8pb9Bc3NQD5Fl70k5EnrB/UWxkwO6AxHmUbD43018yYNQI/Kt4bTY+BKQl8BOV4VeafFKxFhut1H3f8LVVCVs22rMPPfcnfmHcZnW3FHD/e5qkxNfX4/8XOqqEjijseuZbcsrhS/wX0Fb3x1+T3lCZnmRgY7g37/hxLmz4c+cuqyBOJDqVK/ccvc+fg09G1x8bkNerSXaglcbJd4cdGizylNHpNC7KnL2Rv7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwWa86T5rJm70oGgl0Ew9h1t1Ap+zBEH4N1ze2EUqh8=;
 b=F59GBSR4jEn54+J3WMob6M5EblGB2gtdW9bUwCJBlDkfZ7YpT5b9PvGHxORfPz+nZObvSInMCjPZs6Yu5wzNhY5khb2iljDcl0SyzDaCYEs93WF9w6TmlXG2hIHqKjtrktJteosxSfGAVkein5CKKEUfXY2NlwL8nwZ6yc5TFNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 06:45:26 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%3]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 06:45:26 +0000
Message-ID: <d0da1f60-6f74-4ac2-ba4a-9684cb6e8415@nxp.com>
Date: Fri, 19 Jul 2024 09:45:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: merge TCML/U
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20240712-imx_rproc-v1-0-7bcf6732d328@nxp.com>
 <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-4-7bcf6732d328@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::11) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b1a3d1-1f27-46ba-51c3-08dca7be5f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWZORTZiTmVGSmNiVXFxQlE2SWY4NHJpY0l0bG9LOUswQnVhYjlHdTVTMHJk?=
 =?utf-8?B?UlZxcXUvSlRwbDJnZ1E0YkNxeWUzWVdnS1dXZ0puSXU3VEFCNnlEU05NbzZi?=
 =?utf-8?B?bXd1ZFJRY1FBZ2NsajgwZ3hEQUhGOW9wZTZ4UVM0WkwrNG4ydWEwcGRocjlZ?=
 =?utf-8?B?UTFKUGh0YTVpVzY2K0ZuOWxQOVBRTU1VQWVZRXBHMVVQcVdVclFGd0FCZHlR?=
 =?utf-8?B?Z0c0bjhySnFmLzREWTFkQXV6cGViaEc2bFVwLzBqeldxaTN6S2UwSnJRcVNO?=
 =?utf-8?B?c2FtVTYyZTM0aEhkeXdLMjAzdFV0bWVBQXpGNTJ3eDlUcUtlUlRrYTdPMXVm?=
 =?utf-8?B?dlhsb2pjQWxLcTkwN25LeFlYdjJHNDY5d0N1UlRYWGEvOHpQOEFxdFBNMmxV?=
 =?utf-8?B?bWF6TFlSSXlLMHlwMUpCaUQxdUlmeFhPVUE3RlREdFVrZWt6YTluUVh3ZVBh?=
 =?utf-8?B?NnJoRm5TT1ZqR3RDdllXZjRzUis1akhqa09YekxYS2MxNER4Q0l5ZzZKNHJm?=
 =?utf-8?B?SUxRRW5FTzdTWUVDcWljQm1rV3p6UmFxV0ljUXE1RkowUHExQ3JHcU1pc3pY?=
 =?utf-8?B?NFd4YUUxWDh5L3NVNmNhYXVmSDY3Qksva2xrdXB3YXZTazNUSVp6L2VxRFVw?=
 =?utf-8?B?a1c4MFFWbVJCUnBLOXBqRmVtVGtZQkJiWEZOdEVHdXhHM25ZSloxS1orVHl2?=
 =?utf-8?B?di9Ub2JiR0o0YXJXWEk1RVE1dllJZllnR2MwTEVPQ2xoeGM5b3Rta2VwVjRp?=
 =?utf-8?B?SFVCTyt3eUhmR2NPalBrVFg4UzRDNkFtNDVBaVczeE5sS3pFbWRlN21CQUJU?=
 =?utf-8?B?QjducmYvS1ZzVHhjMkEveG5KV2ptS3ZML1pINmppSEtFYTc1RmRPdy9NRUdV?=
 =?utf-8?B?ZG1CcjhVSm5pekV0OXU0OUtsZVA1RGhDdVplMkJFcGtiUUxxUURxd0g0bW15?=
 =?utf-8?B?WTFCektBcC9taXFvZWFKbmxxcE04ZUtFMitqUUdXMUVaNCtkc2t4MzVITDUz?=
 =?utf-8?B?clNNUlpJWUpqQXdldUxzZVB5TGJkSlQ5ZG1USFFHeEpybThvK1ZNbEFmSm1M?=
 =?utf-8?B?TWNNWDNMRFFET2RsUGRIVjlvY2l4ZjVRRHNKei9PWWlQZ1Q4b2FLS1JmMXAx?=
 =?utf-8?B?V21LVFZZUlZEYUJjeGRCUk5wSGlPZjJTcE05VnQ2OTcxbmxtVzhRY2lUblVV?=
 =?utf-8?B?SGM0SDRSMmNlZ1N2WDk4VktlaXhqVlVadFVja2llRjhVMVJoSHNxcnA1U1B5?=
 =?utf-8?B?YUMvN0hseU14R1Z5dXFoTTNtQTFod2RGR0F5V28yZjljcmdBVWZsZ2JjUWJW?=
 =?utf-8?B?VEp2cHhUS2l4aGkwN3A5Mkh1MTBYU3dUT1Y2eFkrb3Y3dWN6Nmc0cVY5SVlW?=
 =?utf-8?B?YWZwaWppK0lhSEp6cFVlblZRSklLak9WU1ZRVDEvZUVHTWp3blR3ZE1uN29H?=
 =?utf-8?B?M09lMDFpSjU3elYzUHd3Tzd0WUJCejJlVzBtNGtqTUxRdWZyMGIwWDRvRHc2?=
 =?utf-8?B?RVNBVkJac3dvRzk3TDVHOE5DZHR1OW1yZGhFdlZLL000OGlLMWlQQnRrWEc0?=
 =?utf-8?B?U3l5UkloUFJiTXM5c0NjYmJibFNGM0FmZFVJY3prM3Q0YXNnR2Mza0xZQUdI?=
 =?utf-8?B?RHF2dGl3d2sycVE2N2VDdHREcG1yU0M3Q3VRQlhKRng3aWhsUW5ETTRNbVpy?=
 =?utf-8?B?R3pRbmhhNWVrS1R1dmM0bGtMMStVRmVlcjloZk4wNFNyZUd6NDNaejhNT2pY?=
 =?utf-8?B?bjUzUXNIZ0hnRDdwR1RIREZDcHZ4YThiL3JhSDVvQlBSNjExbFBvMzJJZ3hR?=
 =?utf-8?B?OGtXSlJsN1JmOHNLL1prUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdDVVk0d0pjcEJTRkhvYmtJZ2dGYlErM29YS1J6T0IyeUpiOTRGZWk2WGh0?=
 =?utf-8?B?aTNCL1hTQVhvSWx2YkhjTjJBTGtqYUxlQUphSmkvYVpiaEJhZ052SDhWLzRp?=
 =?utf-8?B?NGtmUGtiMnZUa1B1dUtVQ1diTXJhN29lZFNLdkhhaytyRE1yV2h6VG41U0pi?=
 =?utf-8?B?OTVGbTlnU1RxOFI0WWk0R2prT0dhYWs1OHRwRVdvSUMxN05vWXN2Qmo0UDE1?=
 =?utf-8?B?Z0kxN05Nbm9TRkN3ZS90anBiZ050N0QwUjlDM2loekt5S3pUdDFBTHhIK3Zt?=
 =?utf-8?B?MUZYbElnYnpRWFp5allMdGdTelV0V0c0NmlyM0RBdForRnE5QVU3dkJOdndl?=
 =?utf-8?B?NnEzTFJQVkh4RjR0NzVvNnVzTDY5Vmt3cnNwYjE1UTdlVWJyT3BURGltMHBZ?=
 =?utf-8?B?ZDBrTTU4MmZCU1FwNEV0aU1WUVdvVnNnZmthb2Y2QXU1NDl6SnhRMTFMdkds?=
 =?utf-8?B?Ylp2TDFuNTVPanZoL3BzYTRQVUtob0VMVzYvL0ljL0JCQTNxN2dRd1hUcWJ0?=
 =?utf-8?B?clhsUVpXTkV6N3l6dWRGaEM1dDVQV1hDMnN6d09MZ1ErclprQWg1VUNhL1U1?=
 =?utf-8?B?R1dwclJJWERXMnRJUS9HbWtNenA4YjRBa1RGNHJhdVM4ZjZzcGRKMENRT2Rj?=
 =?utf-8?B?MStsTFpxQ25jRnRvVlhLWTlZd3JKVStMaStlcVB5TlFsVlpMVU5GcWFybmow?=
 =?utf-8?B?bUQ5WkgyNlBtT2FGTFl2dDB2UU90MldMeWxaNGJQSmFWbTg5Y3FRUUlBU28x?=
 =?utf-8?B?YkVXR1NYeXdIZmo0aVZyZ0xuSytQN2JIMGF5cENOcFRVUWJWTHFERG8zbVBZ?=
 =?utf-8?B?TldGVCswaHByd3NrWTBweEVvalZnNCtQbUMzMFFiVzZ1U0V2RG5kMVZSUUdm?=
 =?utf-8?B?bTZVUXJXNEF4T3REaksxN1dWS0QyN1hmb2ZaWUljZHBoTUxVVXZFREk5UjJy?=
 =?utf-8?B?a1hhZU1jTXJJeVZkNzBraGc1Y005V1NiVjVUKzNNb3AxMkh3YUlhRXRFLzRu?=
 =?utf-8?B?TnpIR3NXVlBwNld2QkJJcHFEcUM5ZFgzalQ2TGQxbS8xNVd3U0x6U3NnbjAv?=
 =?utf-8?B?Vm1BTXZsSXI5dkloMjZBQ2xud3ZVVE1UcVVLMmdraFBMeHhnUDBDeC9ITkkr?=
 =?utf-8?B?UU9YS0hLSWNpQURjaHdBNGlxcXAxTTFiRmgvY25JMk9JQktqdmxzSk5HdkdM?=
 =?utf-8?B?d01neWNtdmdDMHUxbnFibExhYnI1NmU3cVJTZWZmVlhuN3RiNElIdHUrd0wx?=
 =?utf-8?B?Uy85NElOZWpjV3l4djRDMmowSlhVWGJSaUtINWc2ckNoYUREdlM1Mi9JMzYw?=
 =?utf-8?B?Q2JGYmNpNVJuQUJhYURWRTk1ZVBJTHNDL2s5WUw2MmNSSnd4cG5OeFdsU2xR?=
 =?utf-8?B?WUU4Z0RFOWVBeGM4RzAvUW9iWjBPdzhLM3l6OFh6VzVYYXA1T2lMejNDZUhn?=
 =?utf-8?B?UGpOTGZTYVo1K2R5YnFtVjZ4YmhrYWVIME80eDlhNkQxWGNoRk50ZWlHWWVt?=
 =?utf-8?B?UHVvTkd1MmpIeWo2K1c3eDdQMjhUcTBFd2JqSnZqVi8zSlZOVWc4NGdYbXFU?=
 =?utf-8?B?QXhjNWowMmxBNFFPVUN6RHhJdmdwRGl1c21lN0w0VlNWL2puSkxsYXZ0Z09u?=
 =?utf-8?B?REFUWmhENVlLTWdpL2VTTHdJNjdYQ0hPcFROVW9Ed1NEcHYwMnVPVVJ6eFoy?=
 =?utf-8?B?ZmNqS1dpOGZYMTd5bXZqb0YyUGliMmt0S0hGTlNkMTA2akQzVEYwbDJHdEhS?=
 =?utf-8?B?UVF5OUxVUVlEMDR5VDZXUVozejhUSUpQSGI4Y2wwTThKTStFbEVzMWZSdXg0?=
 =?utf-8?B?dXZQem1wQk1HaE1mbWFHdmNxRjlJNk51cnQrU2Q3OE9BcytLTnFSWkpXVEU2?=
 =?utf-8?B?SFNtWlNXTDhkNEEzTVJwd0JZL3BYSWxhQlRMOGRONjZsQTNEOUZFNlpSSkJT?=
 =?utf-8?B?ZEJZcUtHU1ZyQkN3OG8vMytjWHVNWHhDM2plT1prc1dSL1FRakdUNG1JMER4?=
 =?utf-8?B?bnRic0cxNlVYak93RHkzUlZhUXZwWUovalB2MFBneURNT1p4ekxPaXBGZC9R?=
 =?utf-8?B?SWNUV253Vk56QVovN0VEWVFwSGExeVJJVVdJWnE4VVVQYUZEV3pmQzBoSnJV?=
 =?utf-8?Q?OxhQ4RwROI5LyoftQo1N+d+ix?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b1a3d1-1f27-46ba-51c3-08dca7be5f5b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:45:26.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVtpMLFmh5+KPSllEVEOdfE2ooC8XW6LAT0VPFkSRb+3fL29qdqRqyVIDRA7umwm9L9a1wNPfscZqh5yTt/NaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938


On 7/12/2024 11:34 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Merge contiguous TCML/U regions into one to avoid load elf files which
> has large sections failure.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

>   drivers/remoteproc/imx_rproc.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 9e99bb27c033..552fccebf7e2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -119,20 +119,16 @@ struct imx_rproc {
>   static const struct imx_rproc_att imx_rproc_att_imx93[] = {
>   	/* dev addr , sys addr  , size	    , flags */
>   	/* TCM CODE NON-SECURE */
> -	{ 0x0FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x0FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x0FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>   
>   	/* TCM CODE SECURE */
> -	{ 0x1FFC0000, 0x201C0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x1FFE0000, 0x201E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x1FFC0000, 0x201C0000, 0x00040000, ATT_OWN | ATT_IOMEM },
>   
>   	/* TCM SYS NON-SECURE*/
> -	{ 0x20000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x20020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x20000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
>   
>   	/* TCM SYS SECURE*/
> -	{ 0x30000000, 0x20200000, 0x00020000, ATT_OWN | ATT_IOMEM },
> -	{ 0x30020000, 0x20220000, 0x00020000, ATT_OWN | ATT_IOMEM },
> +	{ 0x30000000, 0x20200000, 0x00040000, ATT_OWN | ATT_IOMEM },
>   
>   	/* DDR */
>   	{ 0x80000000, 0x80000000, 0x10000000, 0 },
> @@ -211,10 +207,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8mq[] = {
>   	{ 0x08000000, 0x08000000, 0x08000000, 0 },
>   	/* DDR (Code) - alias */
>   	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> -	/* TCML */
> -	{ 0x1FFE0000, 0x007E0000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> -	/* TCMU */
> -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN  | ATT_IOMEM},
> +	/* TCML/U */
> +	{ 0x1FFE0000, 0x007E0000, 0x00040000, ATT_OWN  | ATT_IOMEM},
>   	/* OCRAM_S */
>   	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
>   	/* OCRAM */
>
