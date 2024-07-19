Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFBE10E5;
	Fri, 19 Jul 2024 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721371460; cv=fail; b=TClBwkaOiMjVqJM3TxX8J5vjVfblOr/Z6A3JAhPdupEZWqTGG1Jf/ra7BMI+iKz+fzh+E6t4BifKqexwmiPTODMtsTwNwZt2sBltmkJncKX77489Dg2zWoLOXg+GQxwxRSmOH+Wj3UYsCfGv5NpsHHztk9NjLwXWyJ1a0y79B8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721371460; c=relaxed/simple;
	bh=ai9qjvBhcDzOSnWQYD+Wn1XfbL8ZmB9Mv9GgvSjEChs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LiWmJ9O1o5qnrn6DtL4nmNO+VWpuSa9cpNuGg0FAxqTIQMzGJtInYtW10kswWusjkTZGiT/4hN8Hj89OzwSp4CUBgymYkaLA+FEkzNTdveepyYUbB3dkWJnmxdSuRURRiBs0dAQ0Ar++aKnyu3ZTGxVEi32x4+BPjfTUmQVNpVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=CQ2PT9eK; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="CQ2PT9eK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyGpQg1np80a/YcRzN6GFQDmVYc/OFEB5ZdL9sFMfYsVO5m8zs8fiOV6gx9wiBsV9KyX9/qX6nb374fOiBVjse6i3XBH2vBiCdQCcuq9kXy1ht/j173RZfDhFEoxheVmoTk8gSOYZb4BMlXEDQSF5IlHC91+1/aMuCn/J3AXLLwoPG8nyhJRvaDXoDYb3uZXIU7erzttaFyfR6nyTokQABWOEqrxxY2XiqCr7SUzzd6kkgHZWq6UkJaBNBzxJPb2h9vBXPPznFQ6A1Y4LjLDtCmHVPIaOcYRYY3omS88OMFNP6xNEAgB8pLK73wJBbpJmnLKS1yUFV4TCPwvt4aIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GMgnc86qNVyF+TkwpUeGzhDb5D5bhutv5ULTsDo3dY=;
 b=WaiNIH8yegpkextbjPZ7RC3oREewqrb9mYEuPH7kBGZ0X9Q9/0pS3uTzCiSm74X+xUXhQT6TDdwEbydaUyCD9SSx9GwNn9Szz2m9Jd/FpythOzwiLFYpMUV2FiojMl9Dlox3ZZ4WeUHfRfotzu077uRqhxpAPGnB6mhMYhiLc6ttmHYpLPjTFEjKfueYuYI9Xo4bg8A1R4pohlgVV/7K/qcRyueTd7ruGJRWfVGzmZLDXcF1zZrUuEbMnivyorpiO1soMe1nXQRu+uvApUGzvQEShxVSF7+V1nKvbHRT8BpM3W1W0LK37YYZMECpyDG0yAAYceiNxIEeOq4uzGxBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GMgnc86qNVyF+TkwpUeGzhDb5D5bhutv5ULTsDo3dY=;
 b=CQ2PT9eKFT3zW2w73ne+cDUKd1fVcVOXU6CK3Rq9Kcnt6mmKQ/6iVezNak5W4ESc/Pt9HvXtYHUJMkR/rX1mtt6L+nItqJgi5g0mjagM+eyt2pUz7pBIuhkEnILUmT5gvp/Fk4n09qvYc4XmWQvNfpvJU3V5geARXyTO4b1oZj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 06:44:14 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%3]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 06:44:14 +0000
Message-ID: <81d8ca4a-5762-43eb-b0a2-ab62c1c93c62@nxp.com>
Date: Fri, 19 Jul 2024 09:44:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] remoteproc: imx_rproc: use imx specific hook for
 find_loaded_rsc_table
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
 <20240712-imx_rproc-v1-2-7bcf6732d328@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20240712-imx_rproc-v1-2-7bcf6732d328@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0039.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::20) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f204221-9a5d-483a-e054-08dca7be3475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVVqMGNFUnVHWlpYa01aNzUzbXZPbldldHBIR0ZSTmtOUURjN0UxMWRaa05V?=
 =?utf-8?B?S0pMWjlNckkwSEdiZDFka3JCeHY1aUFTa1FrWk81UWY0R0NFQzRvYTM5SDNN?=
 =?utf-8?B?U3c0dVcweHh1OWVkSHlXRHVWRWpSci95K1NCVHNwcGdudWZFMTduVWNBbXly?=
 =?utf-8?B?N2hWVnNVR2YzSzBoRFNzV2NZall2T01ROTRYRVdXR1ZZdjFiVm04aGR1Q2hx?=
 =?utf-8?B?SnFCcmhGL1dTVW00dkJEalB3Z0k0T0oxb2QxRUZOdEgrSExmK0xKc1ZwQ1RK?=
 =?utf-8?B?R2VmejYyNDlQOFZDWU1NN2RtKzJnbDYxcGFLUmFIYk9OS3dNL2k5ejZRUU0z?=
 =?utf-8?B?Y1N2QlhKNll6QWhQM25Xd2ZPa0NYZ0lwZnFrTzZTOXpyOU5NL3MxLzBZZHlX?=
 =?utf-8?B?Q0N3WmhRdVMrV1N4cXo1L0J6OEwzTjNYWUluRmI4NXhEVWhjcjQ0RHAwdXVD?=
 =?utf-8?B?VkVYVEJzbUsyMEtNRC9qWjVDZ0FjY2FCWFFMZUpsY0o2dVJZODdYNTgwNXN5?=
 =?utf-8?B?bFhtVzk5dytKSHcveUdIZFlJaFB3cndnOWlzWWV0VGdSRWsvZmVQOGdPNmxN?=
 =?utf-8?B?RW9HemtxZElXZHdiYW1pVDBiRVI2aGRJTnNPQm1GbTU0ci9aaDJuQXVTZU9Q?=
 =?utf-8?B?WlBCSTVyZVpBWkx3ZHBKN0tiUEdIRG1YeklnWVNZTmpWcFk1VDBJY3JHKzhh?=
 =?utf-8?B?UXFuK0JGTktPK1UyMDZnbS94UUdRbEpES3lCN0hZNEJGNThDUzdYQkplMjJG?=
 =?utf-8?B?UHloMmZremljYkM4V1g4MVU2UmFTYnlMdXErSGdzamZGZU1kdWlrNlJXM0JO?=
 =?utf-8?B?REpYdlF1eGhzN0lMNzJoOUVuUU0yVFJnRjg4dnpTZjFKanNQU0pXbGxEU3Bp?=
 =?utf-8?B?RkpIQlFURmh0S3hMQ0cxMXlwZmtJSTE5K1Y3NDVhQkhjRW1QN0dCL2lib1Ro?=
 =?utf-8?B?dWVYRkg4N2FPUFdTRzdZV01kZ3Y5bnF5TXg1bE5EMWVFWndnNWN4STArYmg4?=
 =?utf-8?B?aFhibkZRT3A0QXA5Y1FoeHR4NTZ4aWNLS2UzdzFqV0Q5eVdJMFFORnUvaDRV?=
 =?utf-8?B?VDdSaEszUnNGcFg3enVUdXpCL0M4RTU0a2kvK1ZJWkxoUHVZalphK2l1UU5H?=
 =?utf-8?B?VDlYMUsxUmFWZ3hmT1JQUHIwbVIxdGFYM0ZDZzczanoycjBNK0dGTkdMK1lL?=
 =?utf-8?B?VVRITmRCRFVIS0dmbHJPbmFIVlhxVFQ5TWNybG9aQjlHR0FJVlZ0NFdBaTRk?=
 =?utf-8?B?aGFKMEtzQUJNbXVqcVBpc3EzUjV0SFplMDF0WGpDUVlKQ3N6T2Q0aHhBR25v?=
 =?utf-8?B?eGFldHA2UnRJb0RNSFcyTE5wTTJhK1I3a2hSVjhaWDYyYmdlQTU1VmxmMjJL?=
 =?utf-8?B?QXRiWnZ2aG1RazQ1M3pubk4wK1ZwZmlTeGZPME5lTE5zUVVEVkhVcWtjeEtz?=
 =?utf-8?B?Um1QWjJPa0t6ZVF3UEZab1hxNW82QUNEUUJPTXU5SjdXYzBWTWJsaU5ERXhy?=
 =?utf-8?B?QjBLd1FpSjhwSEJUbWVvR3lYaEZUb3ZybGpIbzE1Z2hpdXhGbWh5Ty9WTnFI?=
 =?utf-8?B?N0l5RmlMVEFhOWFiY29jaTVVY0xSYXRHd2pFeGcyOTBlWlJqSWZrbktDZFVV?=
 =?utf-8?B?RktuT1JwUEcrMW42ekJ2YUdRdEtHanlwRmdTcTdZNjFxZENGRElSaWFLZWU5?=
 =?utf-8?B?T0szUEM1TEpwN3lYdWlsVmE0RUJHdHJycEVMckVyeVIvc2JjZTBFVlNkOUhm?=
 =?utf-8?B?UzZKR0QreXNhaXM5eDY2QU5sMzd1VXJGeU4yYWdnWkNwSU5BNEhoOHhMREJM?=
 =?utf-8?B?dnNoa3JuS1FhUzZWSWZ4UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExYOWpmTzd5d1Frb0tUblZhNlJYTEtPOXVVQXc1S0ZVbGxsWVo3UG1YZVRZ?=
 =?utf-8?B?YmRjSWtEa0pSdmdmYXkzQjhaUjNkYldFNlovSTZSNFY1ZklWTEdGTXVmaGky?=
 =?utf-8?B?UVZqVnV5ekR0RlJPLytJQWlNU0QxNGs1bVBqTUkvVlR6UFc4N09GZ0E1Nitz?=
 =?utf-8?B?R0ExdjMxa24yQ1gvWklodlQyWHFwWnZJSDFDR2ozRjkybUVDWncvK1pmaGww?=
 =?utf-8?B?MGJ5MW9VVUd6K0RIUDFyRklzMWNCdkI1Zm5RWGpwMytORFc2Wk11R3c3Qlk1?=
 =?utf-8?B?UWVseDhuUzdGS1dLK1MzQkZ3eUNRMlcyV0gySDRNYVUyRFFwcXRQdENUd1Jm?=
 =?utf-8?B?aFRjb2Qvb2ZoZGxBamxaWUpFTXFSSjUweGIrZW1MeCtScTBkRUl6Q21Femht?=
 =?utf-8?B?MFozYzgrYWFWekFvTktraEladW5JRGRpSDRhbm10VW9oUGRuTDRKQkZPTUhZ?=
 =?utf-8?B?Y0lJOGtJUE43d1AvSW5ibFphM2lnTzhzZXIxa25CQmRsTnZTWWVPTjZpRTBr?=
 =?utf-8?B?cFBDZ0xrL1JxRzhMMjNiTHRuaDYrQlV3TC9nMWdnc2dUSG9TV0tzcHp5b3NF?=
 =?utf-8?B?NnFzVVZaL0hra2VXaHI5bHdoQVMvT29Ya2NjOXpNVnZSOE1ScTg3UTFSeXNS?=
 =?utf-8?B?dWRYd29wYjY2cDhWNTBaSldMbWxadmE4ZkJMamg0RlQ1WnFOM29NQ3hSczFr?=
 =?utf-8?B?QXVTN0ZUVHMvMjZsY3QzTEhBbGIzd1d1NDRZdlZFK01LSTBIVTJFZjlrU3dS?=
 =?utf-8?B?Z2dJWGovR2wzaGdkSXd6U2M4Qno4NmtwTVFpcDcrTGZxQnNkRnhXZWNxYkFa?=
 =?utf-8?B?RjNReVpZTmRNRUIxRVEvRlFud3Z0R1BMQ25lOFkrNlpJNlZWYlJ6YXg2RHdq?=
 =?utf-8?B?WW1DU0tITTNjZ01ZaHM4dlNyeGI3WjlvcmNNZC9NdENiekZoVi9SUVlKSWc3?=
 =?utf-8?B?Yjl6bExzSXlhajEzSk1jamp0Y0FoMzk5clZxd21GMVoxVkpTVkpIdzdEZXVH?=
 =?utf-8?B?Kys4di9aUVY3M25zVkV2QWNyUkJvVGdSSTNyMmJuS0NBU0tVN2dxRml4bGJv?=
 =?utf-8?B?TlR3QUFQaDV0TktYVUJjYVlQU2FaT0NHUkloeGVYZ2VsYkNRekxqY3V4TlBW?=
 =?utf-8?B?aXV5NUVUU2J5bThCQ0VkWDJpSHZkNmZsbkZ0Vmk0U0FpeFJEeThqeWFyUU1R?=
 =?utf-8?B?NzJDOTFJbHZqNkZGalFwZy85TDVqNmNLT3pSRnZ2MGY1WDdwYm5SbHhOQ09X?=
 =?utf-8?B?UDJxeEhrNzNCN3ZBUWQwMy80SHdRaitVdlFKTTF1QjhlRm9xV3AxTzJQVThy?=
 =?utf-8?B?Vy8zMmJGL1BMQ3kydzFycmg5TklqbTVxa2xZQXF2MkY4cFNpbmpxYlpUWG5J?=
 =?utf-8?B?Z2UwVFJZa3RMc0dlNWRGdlRZUXplWWpzeGVYY1FpZFhYVURXbTh4ZWJvYjlm?=
 =?utf-8?B?WjVUUTBzd1JxWHpKaXNLQmNSTlVHci9WeGFZTW50aG9yMjBQeDdQUm1KWUZ5?=
 =?utf-8?B?ekFVV3JMbnp4S2lQTklTUmNoUnptWU9PQ0loRC9xS3FTV1ZiRlJRQVpET0pp?=
 =?utf-8?B?S0tVZnJNL2tIS0tiU3MvYUdERmJpc1ZDak9mNE1lNEdTMk1GaXZhSnBYdksv?=
 =?utf-8?B?L3E1bUxjUi92Y0M5UXJYVUoyUG5wZmdkQWFUMXFsWVRpOGh5ay9mSWxMVzZv?=
 =?utf-8?B?MzdINmZZQjBJUmJUOW02NzQzdC9vb2VNSGQ2VFMrSTVDWDJzc3NOZFQ5LzVH?=
 =?utf-8?B?b3JneTBIRU81Um14bU9aVGI3YUV3Y2RGR2lyZWdCanZpY1d4UFJXeTBkeVRR?=
 =?utf-8?B?OFo5TDlYaWVmcDY4NjRUUUZVY293Q3NRelpjcHg4OGpuMHRiQ2JBNUpNYnU3?=
 =?utf-8?B?SXZSWGhVSk1yeGRrc212VUYxTE5FQkZXMlFtTGsxTEdsd3FxV3pUelU4cDV0?=
 =?utf-8?B?bm1QRkhHVkEvOTNoTDBvbzNnL1FPcWNCck5KeE9nN1A5K2tzYUhVWDJvdmxK?=
 =?utf-8?B?U1hsM3NWUDhhSmk1OVRpbmEwcHY5U1Mzd3ZsZ3BFcGxDK1B4azBTU1FRWHAy?=
 =?utf-8?B?YXZBU1ZRcGZ1YjA3NXBTa1ZYZUl2MWt6K2hTTGFlS1l1L2plSVV2VVU1bnRY?=
 =?utf-8?Q?cRZRFNnW8yNrveoCGCJuTTuxB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f204221-9a5d-483a-e054-08dca7be3475
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:44:14.6734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZTFKwcSFbZpM3J1EmMrtBQEk0al6FB5D7zOWaDBF614UT0YfbQESE4WtlBwrxbaoS6Wq4yZOCB3oLtPn8Labw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938

On 7/12/2024 11:34 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> If there is a resource table device tree node, use the address as
> the resource table address, otherwise use the address(where
> .resource_table section loaded) inside the Cortex-M elf file.
>
> And there is an update in NXP SDK that Resource Domain Control(RDC)
> enabled to protect TCM, linux not able to write the TCM space when
> updating resource table status and cause kernel dump. So use the address
> from device tree could avoid kernel dump.
>
> Note: NXP M4 SDK not check resource table update, so it does not matter
> use whether resource table address specified in elf file or in device
> tree. But to reflect the fact that if people specific resource table
> address in device tree, it means people are aware and going to use it,
> not the address specified in elf file.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia


> ---
>   drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 3c8b64db8823..48c48b53a3aa 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -666,6 +666,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
>   	return (struct resource_table *)priv->rsc_table;
>   }
>   
> +static struct resource_table *
> +imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +
> +	if (priv->rsc_table)
> +		return (struct resource_table *)priv->rsc_table;
> +
> +	return rproc_elf_find_loaded_rsc_table(rproc, fw);
> +}
> +
>   static const struct rproc_ops imx_rproc_ops = {
>   	.prepare	= imx_rproc_prepare,
>   	.attach		= imx_rproc_attach,
> @@ -676,7 +687,7 @@ static const struct rproc_ops imx_rproc_ops = {
>   	.da_to_va       = imx_rproc_da_to_va,
>   	.load		= rproc_elf_load_segments,
>   	.parse_fw	= imx_rproc_parse_fw,
> -	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> +	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>   	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>   	.sanity_check	= rproc_elf_sanity_check,
>   	.get_boot_addr	= rproc_elf_get_boot_addr,
>
