Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C31B5A4;
	Wed, 22 May 2024 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716388595; cv=fail; b=BwYV8SrMpAcYr19dnQiviD7Q+HyRnsKGM4n/HDu5XiH46VFNI5AMgh0oiF1u3aDZaf3drgZM73B/Vfbu8OIQu80NTzhGfF+67PTbPgbQ/jj9+5CFqI3Ipvz6gyRlMxqFqZE25ElWgmNKfzxKI10tbc9BaP4c+w7HXL88p/nZxIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716388595; c=relaxed/simple;
	bh=5LN4lPhZW9+jjakJzVE7F9ckL5qdybcBmQsZCXM72lg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r9S7kaTFJxFoYDbqp3BOv+QcyepXnucW8PknG1ekCTM2aUJGj3KmH4wdS8CR7J7o6Go3XpH3xD98fTJtn9obGt92rV/bl+N71OcJXuKebapv4N4rdz/6Z90citERVFzAA91263u8Urv9TRk6jITjYTG1xyZlt89O0Wm0DK+b8HA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UxnSEN+b; arc=fail smtp.client-ip=40.107.92.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UxnSEN+b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfZsDMI+5nRtj7o80f0tW0Ml0t29ERvd2QfBRdIhqqc4EaWP0nrBSlAkU7EgkrZOKfKQvpe5sBjw8f4V4EfqORx6nnOM/NObDhiBTaA3jY40Lp0Ke4YXcAws9jMfDmvKNkfHTk5G/mdTSCGEuSV9UMoMEHWbR+3/3Rxh2lGVJWLAPbWsXIdxUvQfL5sVuZ4dsNcSl3BmEj2VFY6U3F35EreNEOt08mUy5vESi1W56G9d8qW8d714UKQEsZmMlzzWlwnZlqnLL1l3jeluO5Km63YEPNlSp3RJGKi4lpMeoWKHuBYrHWIr+ktpJYHt18SPbAROzu7lvyibtxxf9xRltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsxDGsLRFHPSJFWSuDeX4l6Gx7dntbk4th4jYSVtmlM=;
 b=RlYyS6L/gvLnS/SbOiWv6gpMV0o9NnjbFoe3u6TKdgvVlO4P46tC06841KkUjAXgqpl1pBmPOB7M08aApVpiURp6MJqnG3XSIY3M/NbHzgm7rWe0v6/n4nz9xb46lHduK8s/+J4723DlrtZKe/06y7P02J+EVmZU9iELbusmeYsj/a3DBYKroCEZvPsnvWzyI5UYJF5uxn0SmxXzE15jR/9348FdYbwSrpvcl0GlhDSQKprgeHDVyPZHSmYNws1SAbFL9HSS+8UtNwFTn39S1AbIRmP4TscPU0ohZ85O87UMZDJo6+XiINDL8xLL6MA38q5E9U/6IwbGxGDQLVYOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsxDGsLRFHPSJFWSuDeX4l6Gx7dntbk4th4jYSVtmlM=;
 b=UxnSEN+bf5sPM9oCFZnyr+G3F6G7GPtnGdCFosj6dW5Ae52cmTkD81gGSKAhMYGKVUdabHorpOCrKKLciz/3q/JW6OKbp12MHV0tP2/VcGYHjzncZoS1k3wF1Y2nB0fs4zSP1iW/DDNb8mjvR+H7PuHYYtfVB7z5VHlxzB/wB0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Wed, 22 May
 2024 14:36:28 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 14:36:28 +0000
Message-ID: <4046d7a9-7d6a-47d1-9435-90185e6d32af@amd.com>
Date: Wed, 22 May 2024 09:36:26 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 1/2] drivers: remoteproc: xlnx: add attach detach
 support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240511005126.1240430-1-tanmay.shah@amd.com>
 <20240511005126.1240430-2-tanmay.shah@amd.com> <ZkzgVn4+iTcrLEDT@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZkzgVn4+iTcrLEDT@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30)
 To BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a161059-d165-4f7a-12d9-08dc7a6c90c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2ZWZk9lM0RGaktkaCtMTWplZmZocHhrMUhNOG0rYzJFbDhRQXJiVU1HYWNZ?=
 =?utf-8?B?ZEZkZVNFN25yYy9Pa3Q2YlI2U2pOQVNJWjM5REgva3ozRDJvOE1yNjlvQi9W?=
 =?utf-8?B?WVFGRDd6VU94WmdnQmFxWEt0YmVvNllRVkpRVjFNQ2lmMGt6MWZBU25IQWdu?=
 =?utf-8?B?RXpWL0owaEs4dEVEa0hFUVV4dnNuWm9WN2x0ZUlBYnMrM0o1SVBLUkdUYkN1?=
 =?utf-8?B?cDYxN0ltZyt2aHVIdnZLZmt3Szh4U2swc2NYSkJWOHN1WFdPT1NlV0M3K1FW?=
 =?utf-8?B?Wklkb0FqZFdWQ3A4TUZvMmVPTnZpcEEraTZWTHZDYkFkdkd4c2s4VUJEb3p5?=
 =?utf-8?B?SzZGMUFVQXFnS2h1VUwvdnl0KzgyQTc0WFVYU3JSTWhZak1vSG1IY0dTZjFB?=
 =?utf-8?B?ckhrVGRNUndXdnN2dlE1eGpsT3RYUUJRQjExTTd0OFZTNFE3UGpYTUlYWXVz?=
 =?utf-8?B?L0ZFZ2laa2JMRC9aZjlLdkErenN0dm9IeGVEaDFtbW9KaEJMaGV5Z3pMMDV6?=
 =?utf-8?B?dU9TdldJZGtIUGVSOHNRTCt1MEp2eWVGMkJEdnk3a291QjZGQVBINlhDM01y?=
 =?utf-8?B?WGNJVEZDQWZjMXp1RTAvVHJ4VVR6UUJBM2tMamRQaWZhSURrSzY3d040bzBZ?=
 =?utf-8?B?MmRqWFA2azBCUnJ3elM3aHA5dU9YTUtBRHhQcCs5MVMwWFdrWWVGY1d3WS9q?=
 =?utf-8?B?d0FjaXk2ZFh5Vm1WNElrNldGK1lvdml1cVhLbkVMejhobGxDOHJmYzUwNXNy?=
 =?utf-8?B?WHE3QUZjZ2hLWE9hVHdTOHdVVVVNMXhjRndTUHNGQzBMdzVUMGYxcUFmTmtw?=
 =?utf-8?B?b1kvYkRQK3U5RkVnb2lTOGNqb3F3eWF1SFY4aENLSnhmYmF0TW1sMjF3N3J2?=
 =?utf-8?B?NEg1ZnVUbytqQ3hVTW9QQVlNRWxxaTNOTk5zNlQwUmxnZzdBNjlhNFlvRU14?=
 =?utf-8?B?bWQ0K1JJUmNpSGQyUkMxY1NpMG0vYTNRY05HNC90djk5Nmdkdy9jek1jdko1?=
 =?utf-8?B?Q1FnRVQyUHhJTU40UmtSVy8xZ1FJbEtEaWpBRnYwa1kzU0RCNWVPemRmV05E?=
 =?utf-8?B?N05zTjd5Y2kzVlVrM1c3TURvMGJmUGZ6N1BZdHlwR0RnSGVHWGZuSGs2RHBI?=
 =?utf-8?B?MXcyOUlZUkhnYW9VOURiSWcxVkJleWtUeFU4aEZqK01SYzVjWS8vQWlQMjN4?=
 =?utf-8?B?eEM1RmQvNWRMcFUvZjRPc2ZubEJoYlpRL0dYRHU4Z2dEYURnN05abm5ydTRI?=
 =?utf-8?B?bXh5SW1qQlhJZFc0cC9mTG44NGNmLzFoVXdPRjA3QjFzMHhuWmJMRTlpWXdD?=
 =?utf-8?B?L2ZPMklxUzQxSXViWXFiRWhTVXJxcHV6bDNBK3htYmtNZm5FNFlLSXF0NXZj?=
 =?utf-8?B?dkIwdXR3QTFEUEJ1MVRQWGxPQWRSY0JDYkxnVm1nbktWRUdySHl3VWZMOFJy?=
 =?utf-8?B?QXRaUWxmNlAwWkZMYVhibW5GOVUxT1lJVFhwTjU0L2htcHFoaTQyd2dwdUk2?=
 =?utf-8?B?Rml5VWc2aDhYVzVNQXRPNzNUbDh5ZFJERVZCQzlub2dyMXhJeFREeU1HUEtP?=
 =?utf-8?B?UlBMRUFMK2FPSnEwRnUwcEo2VDVsRVgzQnYzeVBqQzVkTUIzZmlVcVN3RXox?=
 =?utf-8?B?L2IwRUJkOXg3WEdKL0tQTENlczFETzh2ZFllMTgzKzE0WWhzRFNwbHQwS2ow?=
 =?utf-8?B?ZVdHMmtMeG93SW42bGlWYVB2aVJ1T1gwWGpsMGtBaHBhbjcrSE04dW9BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1R2WEZidklQN01ndTUrUVFwNHFLd09EZ0c3b0ttQ2JNRGxJWit1SGEzVnBn?=
 =?utf-8?B?cGJvcEIrK0NVZFNBWU1iTHBkY0kyRkpUbUFsUmdJNDBPSlBsV2dVQytVU2xU?=
 =?utf-8?B?UlpVa28zYXpBRjdtUXhLSCtMZWJ5SXNGQlcza3JoZVJ0QzFJdW05K3RUY2Rx?=
 =?utf-8?B?UmZwTG1JWXBNdmZzVk01aXhTVVlCRGZyODMwVU0ramY5OHovcTQ5dFNaOVNv?=
 =?utf-8?B?a1lham1xUHZ5bm42eDlFS1ZHWDJBeEhDSkN3UXdtRzByTVBrNGJjMVdlQkh1?=
 =?utf-8?B?anp6Qm9yVXRWc2l5aWkyM05ZL1pQOFBmcy80enBGVmtYcStIZ0FsN2xKaklZ?=
 =?utf-8?B?Z2RHcUdmVm9TdUZYS1RPM25XYmVMNzQxU2RuNzRpU2tvZlNmMFQ4a1FuTzRl?=
 =?utf-8?B?QUkzWEF4TEtHcndiQkUzWldLZGZJVnZna1dLcUpkVzFQMHBkZFRzSXhnZXdQ?=
 =?utf-8?B?YUJoQ0JJUjNnbzV0Nk1TenFKL1hETVV3WmFHcDJ1ZXR3Z2RBZjZ6cDY4dHV0?=
 =?utf-8?B?UXhGT1VLSkxSKzRCWndyZmlhd25yRFdTVmV0TlcwZ0NSSkpoekcxL3phYThn?=
 =?utf-8?B?QzFpd0pVbk9Ga2RRUlA3UUlZamJsZ1dUWDY3QUo4R1NldUJaeUtkVlR3RnNr?=
 =?utf-8?B?ZFQwUlg4WlJka01vWUw1c1p1NTB0dExSbkNqRUttd3dGaVFPUDI3dFc5YTRi?=
 =?utf-8?B?WlgvUzNmTUpXQkNqN2xZa05VUnJVSWsySXJ6cFRoaXNLVEkzODBya2JyakUy?=
 =?utf-8?B?MWQrYXhYREF0bmx3ZXpnRVZDczY2YVRoeXlSazlqZ2lybEFTRGRLYUpYSDVX?=
 =?utf-8?B?UTFjWGFQcFh4ZGdzTXJEY1prOUZMYU5OU3BjUnB5dDluNmY0WlBkdEZBeDln?=
 =?utf-8?B?WE1zNDNQYkhtN0xoSHp4UTRtQTJHTFE1K2haQTlld0lneSt5ZG9LNFFsVVNt?=
 =?utf-8?B?WWd5YXk2amw1QTJneEViQUQ3OVlhSGJSZVlQUEE4cHJzTVI2T1hNLzlHN2lr?=
 =?utf-8?B?cGtiTE1mS1FodEhXNEdrOVV6YXZqZzlKTEgvUFFDRHhqck4vTWE5WHR4dlVx?=
 =?utf-8?B?Y0o2SVp3ekJyOHpqS3ViYnZyaG1FV3RmallKbE51cEVOMnZSM2doZlhFa2Fy?=
 =?utf-8?B?SEJJSm9QNGRmQUNiLzVRNFlTZ21EZWRyKzBvaTdvbytyRUhTMDdyN1J5bFEr?=
 =?utf-8?B?VnRJVjc3NTVuZ2Z6Smp3d2hwQm9OVE9wUWhINFQwTFhTdjhaWTVPenkycDU0?=
 =?utf-8?B?TkdSaktnSWhPZFpsUUdXRUxTaGpoZHVGSWpYTTFZVkVJWnduSmxqaFRIM3Rs?=
 =?utf-8?B?SVlwbXpmcWI3ZVdkdGprMHcyR0hEeDdpUDdscW5UNllnS2hLOUZlbFFLNlZ4?=
 =?utf-8?B?TUR5U1grSHlYdEpocjB3aWJ0T2lVL2JraUhOaWFnTzhPb21KN2pYQkJ1L1Va?=
 =?utf-8?B?NXVlYkRKQU5uYkQ5ZW56T2M5OGtReEcwN1dqa25RWklOcC9aYVA3VEVoSjJ5?=
 =?utf-8?B?Y2FhcHBIUzFiaVdnd0MxYStiYXI1T0RpMnhiTWRWeUJUWHJiaVM4MzBwVHlP?=
 =?utf-8?B?cVpBaER2Z1ZSZUkxbjhwNldmYjluSERIR3NSb1NCekFXUnl3dlVWWVVrNk81?=
 =?utf-8?B?Z1ZVZjliTjRLWUlydkh3OWFpRm1ocHVoMEhSSG5wekdpYjYvaGVpb3RUKytS?=
 =?utf-8?B?NXdKejJiWVQvZFNFYXpxd2RScnU3aEJLMW5CbFN5cjk3eWlocFhnOGdKZlpt?=
 =?utf-8?B?dDlUOStIRmRHQWh4MjV3OWowWHlJclZBbmczZitsYkl0NWI0RE45SWZZcE54?=
 =?utf-8?B?Q2lwbVVjdHdmek14YUNMYmVQYW44Y0ZUdW1ETWFERXgxa2lnVXZ4OEFsOWlF?=
 =?utf-8?B?bDFTOEluWUQvdUdJajVsWmFzak1JWjdWbmhLOThKanJPbFhyYVRINGcyM3hk?=
 =?utf-8?B?ak9BOGp3MUpVUFZaQzhIZkVCUkljalJRakV0YzZxK29CZG93WUdmdmZ3U3dZ?=
 =?utf-8?B?dFRGdUNkbldBbGl4SDBmVmluNkhveVUvOVpSNk9janNmaWdlVkFkc3NLN2F1?=
 =?utf-8?B?K2lxRnZMYlpzcjE0OW56b002U1Z1d3FtVjhMSGptSEJiajIzOStQZ0paR3pj?=
 =?utf-8?Q?x3hsSwhFIwbMgMQ6lHbVY/Wrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a161059-d165-4f7a-12d9-08dc7a6c90c9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:36:28.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHVB/bEE8XKI/87V3NRtNaWWJ56Aj+XlgjqLxJWjRxRTEoVqMMUOSjn+8g95nxSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187



On 5/21/24 12:56 PM, Mathieu Poirier wrote:
> Hi Tanmay,
> 
> On Fri, May 10, 2024 at 05:51:25PM -0700, Tanmay Shah wrote:
>> It is possible that remote processor is already running before
>> linux boot or remoteproc platform driver probe. Implement required
>> remoteproc framework ops to provide resource table address and
>> connect or disconnect with remote processor in such case.
>> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> 
>> Changes in v2:
>>   - Fix following sparse warnings
>> 
>> drivers/remoteproc/xlnx_r5_remoteproc.c:827:21: sparse:    expected struct rsc_tbl_data *rsc_data_va
>> drivers/remoteproc/xlnx_r5_remoteproc.c:844:18: sparse:    expected struct resource_table *rsc_addr
>> drivers/remoteproc/xlnx_r5_remoteproc.c:898:24: sparse:    expected void volatile [noderef] __iomem *addr
>> 
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 164 +++++++++++++++++++++++-
>>  1 file changed, 160 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 84243d1dff9f..039370cffa32 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -25,6 +25,10 @@
>>  /* RX mailbox client buffer max length */
>>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
>>  				 sizeof(struct zynqmp_ipi_message))
>> +
>> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
>> +
>>  /*
>>   * settings for RPU cluster mode which
>>   * reflects possible values of xlnx,cluster-mode dt-property
>> @@ -73,6 +77,15 @@ struct mbox_info {
>>  	struct mbox_chan *rx_chan;
>>  };
>>  
>> +/* Xilinx Platform specific data structure */
>> +struct rsc_tbl_data {
>> +	const int version;
>> +	const u32 magic_num;
>> +	const u32 comp_magic_num;
> 
> Why is a complement magic number needed?

Actually magic number is 64-bit. There is good chance that
firmware can have 32-bit op-code or data same as magic number, but very less
chance of its complement in the next address. So, we can assume magic number
is 64-bit. 

> 
>> +	const u32 rsc_tbl_size;
>> +	const uintptr_t rsc_tbl;
>> +} __packed;
>> +
>>  /*
>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>   * compatibility with device-tree that does not have TCM information.
>> @@ -95,20 +108,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>  /**
>>   * struct zynqmp_r5_core
>>   *
>> + * @rsc_tbl_va: resource table virtual address
>>   * @dev: device of RPU instance
>>   * @np: device node of RPU instance
>>   * @tcm_bank_count: number TCM banks accessible to this RPU
>>   * @tcm_banks: array of each TCM bank data
>>   * @rproc: rproc handle
>> + * @rsc_tbl_size: resource table size retrieved from remote
>>   * @pm_domain_id: RPU CPU power domain id
>>   * @ipi: pointer to mailbox information
>>   */
>>  struct zynqmp_r5_core {
>> +	struct resource_table *rsc_tbl_va;
> 
> Shouldn't this be of type "void __iomem *"?  Did sparse give you trouble on that
> one?

I fixed sparse warnings with typecast below [1].

> 
>>  	struct device *dev;
>>  	struct device_node *np;
>>  	int tcm_bank_count;
>>  	struct mem_bank_data **tcm_banks;
>>  	struct rproc *rproc;
>> +	u32 rsc_tbl_size;
>>  	u32 pm_domain_id;
>>  	struct mbox_info *ipi;
>>  };
>> @@ -621,10 +638,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>>  {
>>  	int ret;
>>  
>> -	ret = add_tcm_banks(rproc);
>> -	if (ret) {
>> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> -		return ret;
>> +	/**
> 
> Using "/**" is for comments that will endup in the documentation, which I don't
> think is needed here.  Please correct throughout the patch.

Thanks. Ack, I will use only /* format.

> 
>> +	 * For attach/detach use case, Firmware is already loaded so
>> +	 * TCM isn't really needed at all. Also, for security TCM can be
>> +	 * locked in such case and linux may not have access at all.
>> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
>> +	 * callback.
>> +	 */
>> +	if (rproc->state != RPROC_DETACHED) {
>> +		ret = add_tcm_banks(rproc);
>> +		if (ret) {
>> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	ret = add_mem_regions_carveout(rproc);
>> @@ -662,6 +688,123 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
>> +							     size_t *size)
>> +{
>> +	struct zynqmp_r5_core *r5_core;
>> +
>> +	r5_core = rproc->priv;
>> +
>> +	*size = r5_core->rsc_tbl_size;
>> +
>> +	return r5_core->rsc_tbl_va;
>> +}
>> +
>> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>> +{
>> +	struct device *dev = r5_core->dev;
>> +	struct rsc_tbl_data *rsc_data_va;
>> +	struct resource_table *rsc_addr;
>> +	struct resource res_mem;
>> +	struct device_node *np;
>> +	int ret;
>> +
>> +	/**
>> +	 * It is expected from remote processor firmware to provide resource
>> +	 * table address via struct rsc_tbl_data data structure.
>> +	 * Start address of first entry under "memory-region" property list
>> +	 * contains that data structure which holds resource table address, size
>> +	 * and some magic number to validate correct resource table entry.
>> +	 */
>> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
>> +	if (!np) {
>> +		dev_err(dev, "failed to get memory region dev node\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = of_address_to_resource(np, 0, &res_mem);
>> +	if (ret) {
>> +		dev_err(dev, "failed to get memory-region resource addr\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rsc_data_va = (struct rsc_tbl_data *)devm_ioremap_wc(dev, res_mem.start,
>> +							     sizeof(struct rsc_tbl_data));
> 
> There is no point in holding memory until the driver is unloaded.  Please use
> ioremap_wc() and free at the end of the function.
> 

Ack.

>> +	if (!rsc_data_va) {
>> +		dev_err(dev, "failed to map resource table data address\n");
>> +		return -EIO;
>> +	}
>> +
>> +	/**
>> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
>> +	 * do not consider resource table address valid and don't attach
>> +	 */
>> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
>> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
>> +		dev_dbg(dev, "invalid magic number, won't attach\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rsc_addr = (struct resource_table *)ioremap_wc(rsc_data_va->rsc_tbl,
>> +						       rsc_data_va->rsc_tbl_size);

[1] Here typecast is done.

>> +	if (!rsc_addr) {
>> +		dev_err(dev, "failed to get rsc_addr\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/**
>> +	 * As of now resource table version 1 is expected. Don't fail to attach
>> +	 * but warn users about it.
>> +	 */
>> +	if (rsc_addr->ver != 1)
>> +		dev_warn(dev, "unexpected resource table version %d\n",
>> +			 rsc_addr->ver);
>> +
>> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
>> +	r5_core->rsc_tbl_va = rsc_addr;
>> +
>> +	return 0;
>> +}
>> +
>> +static int zynqmp_r5_attach(struct rproc *rproc)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	int i, pm_domain_id, ret;
>> +
>> +	/*
>> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
>> +	 * platform management controller that TCM is in use. This will be
>> +	 * released during unprepare callback.
>> +	 */
>> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>> +		ret = zynqmp_pm_request_node(pm_domain_id,
>> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>> +		if (ret < 0)
>> +			pr_warn("TCM %d can't be requested\n", i);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int zynqmp_r5_detach(struct rproc *rproc)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +
>> +	/*
>> +	 * Generate last notification to remote after clearing virtio flag.
>> +	 * Remote can avoid polling on virtio reset flag if kick is generated
>> +	 * during detach by host and check virtio reset flag on kick interrupt.
>> +	 */
>> +	zynqmp_r5_rproc_kick(rproc, 0);
>> +
>> +	iounmap((void __iomem *)r5_core->rsc_tbl_va);
>> +	r5_core->rsc_tbl_va = NULL;
> 
> This is puzzling...  What happens to ->tsc_tbl_va when the remote processor is
> re-attached? 

Actually I don't see re-attach in life cycle. I might be missing something.
Following is lifecycle I have tested:

1) During driver probe, if resource table is found in memory, then state is
   moved to detach.
2) Then user executes echo start > remoteproc* command, and state moved to attach.
3) After work is done with remote, user executes echo stop > remoteproc* command,
   and state is moved to offline.

From here, remote is offline state, and I can't re-attach to it without loading
firmware again. which is regular start/stop states. Please let me know if I am missing
something.

From here, load firmware, and executing echo start > remoteproc* moves
rproc state to running. Load firmware loads resource table from elf.

So, I believe attach is happening only during probe. And then, once r5 stops, user
needs to load firmware and start R5. I think this use case is good for now.
 
> 
> I will not look at the SRAM part.  Please re-submit when we are done with the
> attach/detach feature.
> 

Okay sounds good to me.
Reviews are still welcomed if anyone in the community decides to review it.

Thanks,
Tanmay
 > Thanks,
> Mathieu
> 
>> +
>> +	return 0;
>> +}
>> +
>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -673,6 +816,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.sanity_check	= rproc_elf_sanity_check,
>>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>>  	.kick		= zynqmp_r5_rproc_kick,
>> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>> +	.attach		= zynqmp_r5_attach,
>> +	.detach		= zynqmp_r5_detach,
>>  };
>>  
>>  /**
>> @@ -723,6 +869,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  		goto free_rproc;
>>  	}
>>  
>> +	/*
>> +	 * Move rproc state to DETACHED to give one time opportunity to attach
>> +	 * if firmware is already available in the memory. This can happen if
>> +	 * firmware is loaded via debugger or by any other agent in the system.
>> +	 * If firmware isn't available in the memory and resource table isn't found,
>> +	 * then rproc state stay OFFLINE.
>> +	 */
>> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
>> +		r5_rproc->state = RPROC_DETACHED;
>> +
>>  	r5_core->rproc = r5_rproc;
>>  	return r5_core;
>>  
>> -- 
>> 2.25.1
>> 

