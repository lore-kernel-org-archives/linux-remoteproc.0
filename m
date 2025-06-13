Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6162E11AE;
	Fri, 13 Jun 2025 18:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749838054; cv=fail; b=grS7dvbywVcAx/w/bSoeBbyEvmx0Wimhrb4Z8OHorv4vJXKfDQtsmh/gFtC9+zEfCx2kTwZSh9Zqb54AU9QJ5Pv7IRBU+NLUDLj+SIQ6jMDpL8AQ0JBGcjUIAPxYI2wHqPEFONWQDlsvH/rEuAKfnptz97O4lqPke8IVAFzLSqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749838054; c=relaxed/simple;
	bh=NHt3YGR9OY2ddqvs2c5SVLPUQef2efUUaoYW/f2rsNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oh565imODeYc2R0l1nWoA7yFpisem5hBiMTQkVX9aIx7Opm2iY+NBJCPr1MiHVHggYEDjja6SIdQ8A2VM99MpDeFVWHwkSNVsAxqlpTTJ/x9ak0MOZ1r/IszY9JMUNQJNEglR2/u67Td2SyuPe71eYMPqz4McbPU6LxBjzzkPp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eFXFJcwQ; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eFXFJcwQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIlTSqqLXh9AhfDdg63INuhFySrorElZIZQwsna27H+RxSnG8J0kspgdz9jodAsZL2Vxi1YUZe+YDFRrRkqFIDWhz08fDMhW0k6z9zCKc8vyIzrJP9OQUhdApVF7SCNjXhxSLEvBTnmyOd+fkjvc+DSCjbHKtTBbLNlOc111zpmIBtIgEwceu4ZoMqs4wY42wIam3o+UbEU221uB2LPsCit8Ex0sAuge9ul2VgTz8RH/WBZ/haYTiHuQFt3xHj6Yo+XVFu81PCsBM7OxL4aq98dUIVnGqho9d+6I/bBtGedQmaFLkBuwrWcYRqdPkvmu885Ua5YdFfFEJo9LtOgP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQh0SgtUPiLNJWwW+ahdOCkhtqbSbgyB1+T2GC4AenI=;
 b=qmtpqlppfwQEMjNC2yHM0daDrHJY7h0/AsQ2hizLLyYNH0p8Y4mGva9hPrbo1JIwW6jtU9RgkuyWSxH1XrctYlauNGhRlaUh8lT0b3vN8Dh5hj74MksvXtGbPNE2BkdOLBbDtUXZEPa1SIUppjwl359+CcFZdnmoVGri1yf2TAjyjM7OFGDJvxQ1BaZFJub2uFeER3X9/1aHIwWZ1URYVJJVPK6UIsHlWJxjxBb26UttsTnFYo9KoneFGb9gmnkAg3AUpzNn3pD4HhJwVeOpXM2K6eGESjGG128TGM2pLCb3ljMiDgwYi8CEwx1V5UAWJJGs4LFEU7o37TuIObOwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQh0SgtUPiLNJWwW+ahdOCkhtqbSbgyB1+T2GC4AenI=;
 b=eFXFJcwQ99KDvyvhm+qN03gB2JRqePmc2XRFd4t38DCLysjs3eljAvWB19jsiSuYH9BgbIVTySpgH8QNiVri079byZ3WCmLaCa9QkfsQ76xaw6ES/2rAk+lWMI/Uaa8j/Ln1jZ1VyeyiMxiM0Fbmdr9f4vRuNaIZ+KUZq3pmSzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Fri, 13 Jun
 2025 18:07:29 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 18:07:29 +0000
Message-ID: <bc42aa9c-2dc3-454e-800b-43928ac60a6d@amd.com>
Date: Fri, 13 Jun 2025 13:07:27 -0500
User-Agent: Mozilla Thunderbird
Reply-To: tanmay.shah@amd.com
Subject: Re: [PATCH v2] remoteproc: xlnx: allow single core use in split mode
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610192738.3095247-1-tanmay.shah@amd.com>
 <aExdUKf4JYjZt_nf@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aExdUKf4JYjZt_nf@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:5:14c::46) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: 28927054-6890-4ec9-27fc-08ddaaa52911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0tZZHpzbGVzb3poKy9Oc3FXOStvVUU0WHdzZ1JSelF3ZmtpU0FINkdoT2lk?=
 =?utf-8?B?MTIwMEVvSDQrTk12a1lZTDFXRlZUalZUUllmNlZ2akpMYkN3NHJHaFVGaEFQ?=
 =?utf-8?B?T1hPOUhSYWtaTEN5bnF4dit2TmtMNnlCR1BKTkRuNkF6QXdMNkIwOXY0SUVH?=
 =?utf-8?B?clFwWGNjNHNzTlFzT214bjgzRVpnektERFFmczQ5SWxacUgvQjZRUGhGNnNZ?=
 =?utf-8?B?SXNFczJKK0lXQnRsOW1yZlRGVzIxdmFCUEVqN0k1UEJpT3F4K3lCalYrd1My?=
 =?utf-8?B?NldicnVqNm5vZ0MvTnQ5YWFxK0FHLzlOK01NQVV5bHhKM3E0VWM4VFROMmpE?=
 =?utf-8?B?WXpvVHk0R2crZ2dtMHJCL2I3L2lCYTc2NFpCbnlUZjlJZVhEdVRZdjZPTVN2?=
 =?utf-8?B?Z0d4Yyt4bzdHS3pLRzRUL1lySVU3WkJMY2FvbW5vV3pwL2NDUkdScGthNHV4?=
 =?utf-8?B?QWs5dCtFQjNhUWkyRFVyTFVJM0J3djRDMVNJKys2ZU9nZWZGQjFBVnpHd0V5?=
 =?utf-8?B?SmJDbHYzbEg2QTVYQ3NlU3NKSnIwM0dhQzYvM05WSWpaUWd0WVlkbyt2QUdJ?=
 =?utf-8?B?S0VwM3A2SmhQU1RSaDI3UFhpVmgwWUJaRzFoR1NHbk9rSGhVOFZwdFFBdi9h?=
 =?utf-8?B?SUlMTldqdlVpbGlpcUw2TGxJOVhaRldEMHNieHoyTnl5eHZuamNha25yd2Jn?=
 =?utf-8?B?UXdwNldTRloxa2Z5MlRXdWdiWkxZOTN3emVTM0oxOGhFMzFoN0U3MXZtQXEw?=
 =?utf-8?B?NWU0NnNFbm1BeXlwZVd2cXdERHFYZTh0SVgzZE0rSmNZTTE1WFl2ZGxNazVV?=
 =?utf-8?B?UXVqZ0djRlpEQlMwZThncDZ2cEpFbTh2MlpsNWNHdHR4Vjg1TzBzY2lhT3k5?=
 =?utf-8?B?aU5PTVJMQ0ZXaVRiU0tkOU5TOE1ZOHR5UGZBWEdDY2F1UGxnenRzSGs4dGNy?=
 =?utf-8?B?d0YzdFFIV1ZIanpHQThMWjV0WmVVRVhhdWttUnN2OWRuSG53cldINFRTTHR6?=
 =?utf-8?B?QzNEQlY2VC9SZDRRcjlnUW1NMWFLa1J4SW5rUGg1a2tmL2NHbXI2eHVHRzFr?=
 =?utf-8?B?UVhjeW1wWUpKSUZ1NWFKRnRNSTBtZlp3WEVjdTNVYmZxWHhOVVpqSVRKZzhX?=
 =?utf-8?B?N0NZbEVqOHJ5U1RWamVKbDBNeDhkdFU1eDR4R1pPdUJnZ3ZNZExCREFLSHJ5?=
 =?utf-8?B?eitxRTRFanUxVFBuZEQzbVdLUGg2dDZseVJIS1ozVmpVamNJR1dCYTNGQVh1?=
 =?utf-8?B?Q2x5ajE3MytQTERUbys2MjVGWkRUS3ExM1N5K0w1eEEzclBzc1cvZy85OGpE?=
 =?utf-8?B?Qkl1T3lUMmxCelZHY1pNeUNLdnB5REtUMnljclgyM0NiY1B3Rk1yN3BCcmhF?=
 =?utf-8?B?bWhBdXZqRUtUb0VhTTNoRnlLRUR6cHFTZmZCSGR6L3NWYVZzZ0ZUNnJmdTAz?=
 =?utf-8?B?MnY3bUpkc0pVVzZLRE1aS1NXOUJQVmdWRXV4RVJwZ1Iza21wNFNMR25HbFdr?=
 =?utf-8?B?QmowNXVYUk04ZTVmWEJzZEs3MkFVU1lJUWVRVVk0QjZXcWV2aUZPbE4zdTIx?=
 =?utf-8?B?R3c0V2NxQVpEMmljZnVhTWRITHBlY3Q5dWVkTDMyNGtKV2FEYm5UZ1ZMMlF6?=
 =?utf-8?B?SzhBQ2VmWXcrcjRrai9FQ2NPcjhnekl5QTM3a1N6QUwwTXZ2cExzVjlqcncy?=
 =?utf-8?B?b1ZUdlh4TXY4TWMzc3dwTjFrVHFRQ21sL2hSNHA1RE4rM1g2eXZSWDRJd2NX?=
 =?utf-8?B?Qk8wOWJEZ0lYNGtHMzJieGpkQ01HbndZN0hVNnRwNDVaRlowSDdLcVRPbmJS?=
 =?utf-8?B?TGlBMmhoTFU1NGNuNk4rRUl1MWRITndZNXhYNGR2bDU1SnBVS3NyYUNHaUUv?=
 =?utf-8?B?K0lRNkxXOVVvOE52SnRJN0dzSlVaZnRtaFBvRE5EQlZGWkZLMFFuWEZnT2ty?=
 =?utf-8?Q?5FfbzzYbFEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU1CcmllM3VKNGpnVXU0d3lrZ0VweUFUak1yMTU5dloydjZMNUNkWEoveHN6?=
 =?utf-8?B?cWpjK2oxdDZxNTZyZ2h2QytrWEZYZTdZaFNxaXNCaExhWWpzdGYzZXFjZ2VB?=
 =?utf-8?B?VzEyUEgyR0xQZUZQSzQ3ejhhRlJHLzQrbm9NdzRvN1VQakhkU2VhRlpxRGNw?=
 =?utf-8?B?MnJ6N0VEc3pGeUxmQmV3ZmxpcEg2V1RjYU9sZXV4NFBhNmM4QnpzL2QxdGpR?=
 =?utf-8?B?SFgrL2RkR05Zb056Wi90KzZYZGRLQlRkdm1mbkllbUNwNTVMem9FYlcxTTB6?=
 =?utf-8?B?UnpPZVZGcmNmYWU0djM2YjlKRmcrZDM2eS9lYTRlN1lZZjRTTjRnUmJzOUh5?=
 =?utf-8?B?cnYyY3A3cVN4OC9jU1MzNWtaQnpMYlhqRnBlbjdVTW9PeHE0QlVnRW40VS80?=
 =?utf-8?B?ZTFFQ0p1M3h4QnRKaVFRUmxTMUs1UWVCVTBha2pWT1JkeU84RmN0ZzNOaVFq?=
 =?utf-8?B?YXA3Rk9HcXowN3JMc1JmUklDNVVUOHBCMFowUWZUbktzMHVKVzBuaDhrTnpR?=
 =?utf-8?B?d2VocG9zSDFEMVdRMXR5TWNKT1huZENvS3kwakNLVjhYaTlYVWlHMVpmM2ky?=
 =?utf-8?B?dFlTb0EwZ245THR4M05rTjh1b29hNWRpeXp5eVJzalVCQUJxVDJSbU9xeUp1?=
 =?utf-8?B?V1dleVVMZjJPUGFZYzRCOTZEaXYwNDdQWTVvaVRYSVZKZ1A1dGhMclI5aS9Y?=
 =?utf-8?B?eHkyKzYzMy80WDdnRWltYTFQMGdqbno2QlRZQkpEYStnNDc0ZkoySithcjN1?=
 =?utf-8?B?VHpiWmNXL0NGM0Z0SVk1ZUFQOVg4UDFZSTFPanFPemNOblFFdFpFRWcyM3ZT?=
 =?utf-8?B?Q1F6RGtvdkEvUGVPOXFXaGY5d0xhcHpjc2JVcVlTT09McHFydmwwdzhuYUJK?=
 =?utf-8?B?Tks4OU4ybHpQTkRFUFRpdmR5U0UvK1MyYzBWN1BkOE1McVRSUnJZaFdrS0xl?=
 =?utf-8?B?dDVNbFNXR3RadnhsZVlRMEpLSWtXaEpWY3I3TGM4SUgwbU9pUHVqWDV4QXZ0?=
 =?utf-8?B?cThvc0hhb2JQMTZBZTNoSitCUXJsamlubmpmb1JNdW5HNUNzbkpCSEwxVXdo?=
 =?utf-8?B?UjF1QTZBQ1JTUHdnK1M1NENuUmZlVWJySE5hT2tvZS9lS0VsVUYvMjFUY2hG?=
 =?utf-8?B?NzZTb2tlTkY2NnMxNm15YVd1WHM1ZUM0cFozZS84bmZ4MGJ2R2FsRHArVVJx?=
 =?utf-8?B?emxNSW9WT3dCbTRObzMxN2wyQlZ5UGVPa0RHS3N6eXB2Z1NHQVhVeFFwTHpS?=
 =?utf-8?B?MHpRbHlZMXlZYmtINkZzKy9rNCsvNjBHZU1NeXVMZkFzRVJnSHRJK0JoZ2x0?=
 =?utf-8?B?ME5lV3F0MmlVdFA0ck1sVm9pT2oxSElNNklHTkhacm5IZFREM0xWMWEvb3dy?=
 =?utf-8?B?dUNEdkNoclhkVUl1SXM3VEMrSEJ0Rm5SWDBPQXZ2bVVwRER2YnZBYW02QXda?=
 =?utf-8?B?TXNRT0g1eEFKaG1Rb1pGN2dWbGo2Qk1haGVkeW1FR1BkKzBDS2VBaE1wY1d1?=
 =?utf-8?B?QWx5Z3krVVRPcEpWckxNV3V3UE9NdmxTOEU2bkZ2clhNNXhGUXpiaVNLOWhh?=
 =?utf-8?B?UHJycS85cUswNUNnYldnakpXeEprVjN1UzhraXZIN1BDTzhmS0lKU1dFNEl0?=
 =?utf-8?B?TDlSQktrc2xwTUlBaTdBTTFxSUZYQTQyV3pWdFFSb1RLcDJHQjZtN203c2ps?=
 =?utf-8?B?VjEyL0Irc25oTEpOSDZaZ2JlbEJoaEV4NmFWUlNpU09QdWRrYzRmZ1ZPZm1M?=
 =?utf-8?B?OGZyQjhwbldKb1hNaXlJTG80ZEQ4Z1FjSk5JZkxBTjFnUGtDNlFQQkdWOHZO?=
 =?utf-8?B?aTZIaFg4aE5GWGswalNIZnVYZ2dNTjdLNVoxNW1nR1dBL3pQSEppTy91RC9t?=
 =?utf-8?B?UmZhTHpWVDhEbUtLNHJqbTNrSEMyNk9WcDAya3pBWWRxWi9JR1JLbHFtUFpR?=
 =?utf-8?B?ZGljOFBjV2ZpU1Z3YTZTVjJ3SjlubE16WDNVM1RBT29yd1Y3SStCVDdEYSs0?=
 =?utf-8?B?NjBIY0RPM0ZZUGYzNytoNHE3TUNNV0ppQUJ6QTgzdUFrUjJSRENrWUsrd1pm?=
 =?utf-8?B?aHByMXhOZ1lZa0Zicjl0YTloYkhOMWZSaUdVQmFMd3BLZ2hOZEVuckRpU0tR?=
 =?utf-8?Q?3KJ7pLIemcAeSHFBIyc2DR977?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28927054-6890-4ec9-27fc-08ddaaa52911
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 18:07:29.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMNjWEMbcW4TpqRnAIxB92R7Nt2zzqhPDFwcFZ3wy0kI3BpZoJNApYTKemF5IZuR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147



On 6/13/25 12:18 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Tue, Jun 10, 2025 at 12:27:38PM -0700, Tanmay Shah wrote:
>> It's a valid use case to have only one core enabled in cluster in split
>> mode. Remove exact core count expecatation from the driver.
> 
> I suggest:
> 
> "When operating in split mode, it is a valid usecase to have only one core
> enabled in the cluster. Remove..."
> 

Ack, will update commit message in next rev.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Change in v2:
>>    - limit core_count to max 2
>>
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 1af89782e116..a1beaa2acc96 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -1336,12 +1336,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>>   	 * and ignore core1 dt node.
>>   	 */
>>   	core_count = of_get_available_child_count(dev_node);
>> -	if (core_count == 0) {
>> +	if (core_count == 0 || core_count > 2) {
>>   		dev_err(dev, "Invalid number of r5 cores %d", core_count);
>>   		return -EINVAL;
>> -	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
>> -		dev_err(dev, "Invalid number of r5 cores for split mode\n");
>> -		return -EINVAL;
>>   	} else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
>>   		dev_warn(dev, "Only r5 core0 will be used\n");
>>   		core_count = 1;
> 
> When thinking about the specific usecase where, in split mode, a single core is
> enabled - can it be either core0 or core1 or does it have to be core0?
> 

Correct. It doesn't have to be core0.

> Is the code in the driver ready to handle this configuration?
> 

Yes, driver will handle all following cases correctly.

Case 1: core0 enabled, core1 disabled
Case 2: core0 disabled, core1 enabled
Case 3: core0 enabled, core 1 enabled

I will document all cases in the comment in the driver.

> The inline comments you already have to explain the possible configurations
> need to be update to address this new usecase.
> 
> Thanks,
> Mathieu
> 
>>
>> base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
>> -- 
>> 2.34.1
>>

