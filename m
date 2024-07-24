Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF473440;
	Wed, 24 Jul 2024 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721858662; cv=fail; b=qG7DlPhJra3c/T40qQb/anIAwQKIALX/dr1zhQj4nJIl815Q5c81kK1iVrdEc4jvUGaNH45HaqO93hIU9mVcyVxh7ALCR+HK/qtX44ZOoyf8BW/T94fy0jPG8mA/yC/zCMlCbtyA+R2W+tVZTetrCY1FhzNZgkDFrtZuYEYa9wQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721858662; c=relaxed/simple;
	bh=64B3FlcdMU8cyzXpjZRQd5cbc6PGJUIwE+5Ck7s2qUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cy2tqUUGzUTx2OT7sJUIaWScW6SznVwOQQy5N6DQg5j429Bk5OBxORtrkteNYpVFHR0ULK+ht+pPjAHW+jVHKa/MjcruQNEm7SAB5ad7L+qii2J7M86EBW7piXy50meWq8kP/hXv9aO+CPKDr2Rrqe/5tIHq50Cq1resvsfk+WA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pEBzl1qu; arc=fail smtp.client-ip=40.107.223.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pEBzl1qu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccp/pRPye5h5nEiygWZ/ZrXtHTrhsEIEM0Zp9kwbe9dolpzbC7VXe0CQyQS3vVBtKkaV/IfUaHDyGRE8gZvzV4PXNAvbamKUjL1l3iPj+LROTWKDzclirto/LKyQBtS4QvvG8RQO3E4OGll7MQ4pVAWhnPg0FRnbTlhORMoj2kwlWFv0QGD519lXSmCCABrF1igWohBCvRQfv7+CTDn460/duEikCq7hEERJ/Of0xkrz0yZyHrKT/Kz6brl9i59hOMsADsPNJRZK4MPIkLcS9VJhrGvoSM3b7APXBOxxZSNg5OZlDvESxk6liHkudM48dAwOtzaNxJg4WERVE+PYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb8PANxtaBpDYnGfm60WV/6A9sRuTY/BVhIqbHsMrlA=;
 b=cd9UxlQhUxuizF28CPqqzjTrLqXNqbVz48z8nVC+azcg7sJbPxDq6+FgZgID0c81f6lwNQE04Xk14FPlJvjCtFxaTLEu5r0KIlYTJON+K0V0as3NNKneN7p2OtXKeKML88nT7/0sMXYrjXE9u+iniBRM+klbzyMojh7mGl4pb5SVshQVH4yEjm/GmaIY9DJkGsIp+scpD0z4bc3ElJC2On8Rlsw6ja+KhPi/F074gzfhVbRMjYDglfVxsdp8ngYJyaihFimFEqsFnTu/Bu6rgFYDeHAWDFT4yA3AmQKoxxabwskzLBiYGoC1kGJjng+xfS5x+em2IufQpUXs5SeRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb8PANxtaBpDYnGfm60WV/6A9sRuTY/BVhIqbHsMrlA=;
 b=pEBzl1quczGkEpgS/hYhezAIzoz4yxGtfnvfMyhtlGR+Gw5MjK9fAMt+i4P//z60QzOzFbJRRsVhGXv7nbxP9DgYWdttJXtIjhyeuHbBC2mYmAsee2qJTfo+ASbazhuHc/NCeWOUKNRzWuGwzuG5WzoyQOQ8IHYCIbpKGsqmOqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4956.namprd12.prod.outlook.com (2603:10b6:610:69::11)
 by PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Wed, 24 Jul
 2024 22:04:15 +0000
Received: from CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d]) by CH2PR12MB4956.namprd12.prod.outlook.com
 ([fe80::fa2c:c4d3:e069:248d%7]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 22:04:15 +0000
Message-ID: <db26a6c4-0529-4ff7-91fb-a4501b23185f@amd.com>
Date: Wed, 24 Jul 2024 17:04:12 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2] remoteproc: xlnx: add sram support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240716013953.1715134-1-tanmay.shah@amd.com>
 <Zp6LNyyuzskj+UBH@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <Zp6LNyyuzskj+UBH@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0025.namprd05.prod.outlook.com
 (2603:10b6:803:40::38) To CH2PR12MB4956.namprd12.prod.outlook.com
 (2603:10b6:610:69::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4956:EE_|PH7PR12MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8f29e7-3932-482d-a3fa-08dcac2c8ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czc4bm92V1ZpTUppSXJrOHB2MDNGNjN3dU42cXBKcllvdGcyK3ErNEc4dEJl?=
 =?utf-8?B?QURDa2FkRittaUN6a1haV3N5cmNWeVdLMDFNZGw3MnhTa0VpZ1ZMOWNwZHQ4?=
 =?utf-8?B?aEZMUVhtVlhCRWpZcWZDY3Bmb3g3aUhkd0JQQktlZFZsS2FMcFBPNTJ2emRr?=
 =?utf-8?B?WW51SWRaWU9ETFZobm1MY2V6R1pFSlVVdXVUcFY0M0JsQ1JYdW0rL2JlczVz?=
 =?utf-8?B?N2Q2TWhtdmQyMVRxbXN1MWVESEg0UysxZWVLSjJSN1RaRGNoSXN3Z092SGRO?=
 =?utf-8?B?Y1dHMW1md0RpZDdhUUJCZXN6U2RnUXB6UWdHL3pmNVBvSHBwUEYyUXJJT2tN?=
 =?utf-8?B?L2tNVEFBVVpLQmhlS2w2U2p0OFhOMDhlT3pXL1FnbHJHZCtQV3hGeDhUZmJi?=
 =?utf-8?B?d05ZWHRtRzhHTzA4c1IxL0pNcGJsT29yL2pMWCtNdk8xcitmQlphdUdQSTlV?=
 =?utf-8?B?cXZWU1AxWFgwalBUeWRJYUR0YkxURlc2NUV0cmd6K3hrNE41Y0tpOTllSUg3?=
 =?utf-8?B?NVNXTVdLSFVJUTR3OWxwS0pkNTRSY0VnTnRVNjRoWjNlSUJNZFE5cVd2MFNQ?=
 =?utf-8?B?SHBUcjZyZUViSGhQR0t0UE5scDZoV0NDRzc5ejBqanE1UlUwKzc2SWVOcGlw?=
 =?utf-8?B?WmRwQ3M1RzJGOUlQN2d0V0pVSjVZK1VrYWdlUFZTY3pWaUR6Nkt3WUNORENs?=
 =?utf-8?B?cEFaMVUrR0hkcmEvcFRsRjVsbjIzQ214YzhPQ1NXajROMi83RTZlcmZza1NU?=
 =?utf-8?B?REQ2VU5wYncrdHVWTGhCb1pUeDIxOXRmbVl4UG1qbTZJZDJINjd1WW5lSm1j?=
 =?utf-8?B?ZkRTa3IrTEZyZlQyWEFSNVNmOTFCQzJnWGIrVTI5ZUdWUDFQOVFKV0xtM2Ex?=
 =?utf-8?B?VGp4UU8vZ0h4RkxsL0xkZldtUnlxbTJaaDdOOXAxbzlYdGU5S25YbDJOWUh1?=
 =?utf-8?B?SE1ZQVpQQk1JcWhMZWpWTGRlYkdLL3pSUWV2T2FNZDNVcEkwcFlYR1ZweXpD?=
 =?utf-8?B?L1VyVkVJV1JlTXR2ZlpQQXJ2VTZRWTdzV09HVDVHL0wzdTk1TDBKTGlVbC9j?=
 =?utf-8?B?aVdob0tsWGpGMGZxRTJQMVhtU0dGcFB0aGxQZ2tzVlNTZHNzakFiWWtEZC9q?=
 =?utf-8?B?ZGZmRFJiM1NrMUNUN3cwT3NYSnVxQ3d2R1ZzYld3eGIrWWNyaldpTW4vVFpV?=
 =?utf-8?B?SWZUeU5GRzNnTUw3Z0hyeG1vRkhvUUxjakMwRWthajJwdEhjZm04cnVjMURD?=
 =?utf-8?B?d2duSlZOdmFZVjVhcGpGK3p5N1gxRnNXU3Q2bU5xZHFyS1lkeldETndFc3Zu?=
 =?utf-8?B?SnBnbHZKV0dyZWRGcUVBQ0pUb0daSVBQSjNIMDFaV1R5djg1eTFEZFRDNXVu?=
 =?utf-8?B?aXFiR3NkOXQ4RDBzK1lUMzEvdTd6US8vd2plOHVPa0NSaklOUEJKNm80cVZG?=
 =?utf-8?B?UHhRSnhIa3g1VmU3TDVEZTlwVTNRMW9lZDdsc25SQThlU2ZCQ1ZWZUZ3amg3?=
 =?utf-8?B?c3VkdUVVTGFpMTdZeU5UTnFBS3pjeVFyZVJPUS81aWJFK3NhQW4xMjB6aGtp?=
 =?utf-8?B?UkgzRWJXdit5WmRKWnh2blVGMnhraGVQVWJIMVpSSXpyZW8rNnBiSWNSZ2Ur?=
 =?utf-8?B?clIzbjg2QjRteHNGeis0VGNGTkthNkJVTk1KcFBTdDlZbGN1TWN6UFB4ajZO?=
 =?utf-8?B?bTUvL2Q0UEZBTVlrVm1XUmk3VWQxeFp5anJMMUpEWWwxZGRGN2VueTMvNmpt?=
 =?utf-8?B?K3ZWZW80WFNQWEZscnBBQ2RWeEdETUlvWlNqWGJReTNleE5EL3F6VTBaV1RB?=
 =?utf-8?B?Q3ZVdGtUWFNoRllxSEI4QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4956.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpEZ2QwWmJjUVhURm83QWdWVnoydi9Id3FGakpDUzVaRkxlZUhac3E3MHJ5?=
 =?utf-8?B?Z3hjRFJ5cklQcERncUtZNGtMK0RYbjFLblUzODR2UmtzWmNrU0szR051VlZM?=
 =?utf-8?B?ZVFjcUV3WmxYMHpKVk5CYkFoNC9aby8wVGFMYjd6Q1FoMGEySlZXa243V2lI?=
 =?utf-8?B?ZDM5NzR0Q09vQmVHSjZzNGNMYVNuSTBuUnZZM2Rvb2NWd0ZUS04xL3RNYVhN?=
 =?utf-8?B?RklzSDl2T21IOWk0VUxCSzQydzNlVVhvYVVBRmo4MWJIUXNDb2RqV2dTMWJ6?=
 =?utf-8?B?YzlRWU9ibzA2Tm9QNjg0M3MxMUZYeUlJei9rdm5tZHpFU21lcDNIUzNvWFRh?=
 =?utf-8?B?UCtnazhjNkJiODRYTndMSDF5YWd4anZRa0daWUhXZDZ2c3RXeXR6Z25SOG9o?=
 =?utf-8?B?eTlPUTBNLzVKaFhPSkg2ZUY1d3ZZMVg3TSs2V2QreDNRdjdsOXJITkkrdDNm?=
 =?utf-8?B?OVBMTHRMZXJmZFlpQkthZGlIeUx4eksvM3RKblptQzF3Y2NZQUR2UDdmNUF2?=
 =?utf-8?B?UWs0d29kNFpPU05qRDNKakZUcFlVNWw4UFFFZ3ZWOVozTkxkcDdMTXFNWm5T?=
 =?utf-8?B?M2hrVTREWjRGZGJKZWNDbklGS3VjWXJRVUR2YXhYdm9FSE1MSDZjdlExeEIw?=
 =?utf-8?B?NS9hUE9EZDhXdTJtVFlhODR4UmxmQ2t4aFA3VHdFTlk1TmtxbFNLVkw2aHdx?=
 =?utf-8?B?QXRFaytYK2pUNlBVNnFTcndLcUZya1dNdUZJaXJaVEZGR0dpQ2d3NEJzSk1P?=
 =?utf-8?B?eEZMVmRZc2lZMU5oNTZUdVY3TURoVGtGRzlLeTB1bHRSM3l0bExVTHRpNU1W?=
 =?utf-8?B?Nk9WeHJrbFR6WTFWUkduRTN3UzVyVFM3bnZLbjIxS242eDUzeVVxMldpWDNE?=
 =?utf-8?B?dzhRMTVodFdJbGxQYjUreTE3NC9ZUjllMUN3dkhaSWpFcmZ4Wm1aaXpBRmN3?=
 =?utf-8?B?eE9Fcmc5aUhyWDlBOWRVazFJWHV3OHlqRnBzNkVmRnh4SWFFVldJaXUvWVNu?=
 =?utf-8?B?a2lmUWx4ekxQbVJPejAya1I4MVQ3RFZqOERLT0FRVk14TGUzYlBJUWdPc1BI?=
 =?utf-8?B?d201ajVaQmFNM0grRDdoT0RVcnFONHJKa1U3U3hpU0ZWVUpLRXBtOTRYZDlU?=
 =?utf-8?B?TS80WldvRjJpNGpzSG5nUFA2Tkk4R1BJY0NTWlB4ajROa05LYXJPQ1Y0bGNt?=
 =?utf-8?B?WVFYa0Zhd1Uvb2Qzd2kzcDVySEZkR0NGOTFlWkZqZnVLTWRJUzJqZVJITE1F?=
 =?utf-8?B?M0d1UE0zTTM3NVc3YUpTa2YvcWxKOHJWczdRVnFmcjc2TzF1TmZ3WGVmT1Bw?=
 =?utf-8?B?MVl5emdVMjluam1yM1pHQVMzQjN0Z2U0ZThCdjlHZXloTnZNM0JYbWZBZUhw?=
 =?utf-8?B?cXJlNExqTS9leEJmaXJjeHRMdEtlanhpM2hiSkZYVS9yYVhRMXJCbEsrNTU4?=
 =?utf-8?B?Qk5XamM0WkxIUmJhQlBZMXAvcXUwdmJ6RlZCbWZWckVidnVkQkdxM1RPOE13?=
 =?utf-8?B?bnZYR3Q2SHQvN0lPTEx3Ly9HVDZXN0Q1RTQ4N0IrbGVHQzBBMHFPZzdkRm95?=
 =?utf-8?B?UkpCUDF0bnFqMHVTenZCQ05TQ0ZWc0cwcHNrUVJSclNrZjBWdUp1enRFOG1X?=
 =?utf-8?B?TzNiWW1iWGozUnd2VHBzTWdFcm5wT0NJWHhLdnRjM3VzRU5uclVGNXVlTEo5?=
 =?utf-8?B?V1Y0VW81dzlFUVh5SmRVV3Z6VnY5OVFjWWJjbzVDUW56R1dudzJYMjNyWHNY?=
 =?utf-8?B?NEY1czZDQUt0MkcwNmdOc09oRmVnS0o3TUI2NDhsL3NqU3IwZDRNbmd3U0h0?=
 =?utf-8?B?UERBaElzb3hLbUtQeExyeCtwZnNSaTB6aUhPUjR2clRlSE1tU1d2b1VKN20r?=
 =?utf-8?B?OWJGWloyY0lVdWZPMFp1NWcvZWpMM25wVDZROGlrUEUxWFVNNkErUURTcFdt?=
 =?utf-8?B?WUNGY1VQRm9sYjRBdzJpVHhyYXdZdlZGc1ExejhZUTRXcGxnVlZzRUhpVzJz?=
 =?utf-8?B?b3JGUklubFp6TTRTbysxNDc0VFl3V1hKQmY4SlZkYm1SWEduREhaRzNrZmpP?=
 =?utf-8?B?Lzd0ZWdRSFMyY0ZsZ0prdVFlMjVmd1M4Vkp4ZVFCRWhzb2JhOG53cVNsRDda?=
 =?utf-8?Q?elEezoXSuCq7H9DmERzmruwR4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8f29e7-3932-482d-a3fa-08dcac2c8ebd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4956.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 22:04:15.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTkXJdW5pWtOZTDoAqb58645nOwFHfIzzW+tIydn/dhTNkXwt+tKyFmeRvmTuokn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854

Hello Mathieu,

Thanks for reviews.

All the comments looks good, I will send next revision addressing them all.

On 7/22/24 11:39 AM, Mathieu Poirier wrote:
> Good morning,
> 
> On Mon, Jul 15, 2024 at 06:39:54PM -0700, Tanmay Shah wrote:
>> AMD-Xilinx zynqmp platform contains on-chip sram memory (OCM).
>> R5 cores can access OCM and access is faster than DDR memory but slower
>> than TCM memories available. Sram region can have optional multiple
>> power-domains. Platform management firmware is responsible
>> to operate these power-domains.
>> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> 
>> Changes in v2:
>>   - Expand commit message with power-domains related information.
>> 
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 131 ++++++++++++++++++++++++
>>  1 file changed, 131 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 596f3ffb8935..52ddd42b09e0 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -56,6 +56,17 @@ struct mem_bank_data {
>>  	char *bank_name;
>>  };
>>  
>> +/**
>> + * struct zynqmp_sram_bank - sram bank description
>> + *
>> + * @sram_res: sram address region information
>> + * @da: device address of sram
>> + */
>> +struct zynqmp_sram_bank {
>> +	struct resource sram_res;
>> +	u32 da;
>> +};
>> +
>>  /**
>>   * struct mbox_info
>>   *
>> @@ -120,6 +131,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   * struct zynqmp_r5_core
>>   *
>>   * @rsc_tbl_va: resource table virtual address
>> + * @sram: Array of sram memories assigned to this core
>> + * @num_sram: number of sram for this core
>>   * @dev: device of RPU instance
>>   * @np: device node of RPU instance
>>   * @tcm_bank_count: number TCM banks accessible to this RPU
>> @@ -131,6 +144,8 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   */
>>  struct zynqmp_r5_core {
>>  	void __iomem *rsc_tbl_va;
>> +	struct zynqmp_sram_bank **sram;
> 
> I suggest making @sram an array rather than an array of pointers - it would
> simplify function zynqmp_r5_get_sram_banks(). 
> 

Ack.

>> +	int num_sram;
>>  	struct device *dev;
>>  	struct device_node *np;
>>  	int tcm_bank_count;
>> @@ -494,6 +509,40 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>>  	return 0;
>>  }
>>  
>> +static int add_sram_carveouts(struct rproc *rproc)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	struct rproc_mem_entry *rproc_mem;
>> +	struct zynqmp_sram_bank *sram;
>> +	dma_addr_t dma_addr;
>> +	size_t len;
>> +	int da, i;
>> +
>> +	for (i = 0; i < r5_core->num_sram; i++) {
>> +		sram = r5_core->sram[i];
>> +
>> +		dma_addr = (dma_addr_t)sram->sram_res.start;
>> +		len = resource_size(&sram->sram_res);
>> +		da = sram->da;
>> +
>> +		/* Register associated reserved memory regions */
>> +		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>> +						 (dma_addr_t)dma_addr,
>> +						 len, da,
>> +						 zynqmp_r5_mem_region_map,
>> +						 zynqmp_r5_mem_region_unmap,
>> +						 sram->sram_res.name);
>> +
>> +		rproc_add_carveout(rproc, rproc_mem);
>> +		rproc_coredump_add_segment(rproc, da, len);
>> +
>> +		dev_dbg(&rproc->dev, "sram carveout %s addr=%llx, da=0x%x, size=0x%lx",
>> +			sram->sram_res.name, dma_addr, da, len);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>>   * tcm_mem_unmap()
>>   * @rproc: single R5 core's corresponding rproc instance
>> @@ -669,6 +718,12 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>>  		return ret;
>>  	}
>>  
>> +	ret = add_sram_carveouts(rproc);
>> +	if (ret) {
>> +		dev_err(&rproc->dev, "failed to get sram carveout %d\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> @@ -881,6 +936,78 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  	return ERR_PTR(ret);
>>  }
>>  
>> +static int zynqmp_r5_get_sram_banks(struct zynqmp_r5_core *r5_core)
>> +{
>> +	struct zynqmp_sram_bank **sram, *sram_data;
>> +	struct device_node *np = r5_core->np;
>> +	struct device *dev = r5_core->dev;
>> +	struct device_node *sram_np;
>> +	int num_sram, i, ret;
>> +	u64 abs_addr, size;
>> +
>> +	/* "sram" is optional proprty. Do not fail, if unavailable. */
> 
> s/proprty/property

Ack.

> 
>> +	if (!of_find_property(r5_core->np, "sram", NULL))
>> +		return 0;
>> +
>> +	num_sram = of_property_count_elems_of_size(np, "sram", sizeof(phandle));
>> +	if (num_sram <= 0) {
> 
> Any reason this is "<" rather than "<=" ?

I will make it < 1.

> 
>> +		dev_err(dev, "Invalid sram property, ret = %d\n",
>> +			num_sram);
>> +		return -EINVAL;
>> +	}
>> +
>> +	sram = devm_kcalloc(dev, num_sram,
>> +			    sizeof(struct zynqmp_sram_bank *), GFP_KERNEL);
>> +	if (!sram)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < num_sram; i++) {
>> +		sram_data = devm_kzalloc(dev, sizeof(struct zynqmp_sram_bank),
>> +					 GFP_KERNEL);
>> +		if (!sram_data)
>> +			return -ENOMEM;
>> +
>> +		sram_np = of_parse_phandle(np, "sram", i);
>> +		if (!sram_np) {
>> +			dev_err(dev, "failed to get sram %d phandle\n", i);
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (!of_device_is_available(sram_np)) {
>> +			of_node_put(sram_np);
>> +			dev_err(dev, "sram device not available\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		ret = of_address_to_resource(sram_np, 0, &sram_data->sram_res);
>> +		of_node_put(sram_np);
> 
> Why calling this here when sram_np is used below?
> 

Ack.
I wanted to keep of_node_put as close as of_node_get.
But, I think within same function I can move of_node_put after all use of sram_np.

I didn't face any runtime errors though, so I am wondering is it required ?

I will move it anyway as suggested.

>> +		if (ret) {
>> +			dev_err(dev, "addr to res failed\n");
>> +			return ret;
>> +		}
>> +
>> +		/* Get SRAM device address */
>> +		ret = of_property_read_reg(sram_np, i, &abs_addr, &size);
>> +		if (ret) {
>> +			dev_err(dev, "failed to get reg property\n");
>> +			return ret;
>> +		}
>> +
>> +		sram_data->da = (u32)abs_addr;
>> +
>> +		sram[i] = sram_data;
>> +
>> +		dev_dbg(dev, "sram %d: name=%s, addr=0x%llx, da=0x%x, size=0x%llx\n",
>> +			i, sram[i]->sram_res.name, sram[i]->sram_res.start,
>> +			sram[i]->da, resource_size(&sram[i]->sram_res));
>> +	}
>> +
>> +	r5_core->sram = sram;
>> +	r5_core->num_sram = num_sram;
>> +
>> +	return 0;
>> +}
>> +
>>  static int zynqmp_r5_get_tcm_node_from_dt(struct zynqmp_r5_cluster *cluster)
>>  {
>>  	int i, j, tcm_bank_count, ret, tcm_pd_idx, pd_count;
>> @@ -1095,6 +1222,10 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>>  				return ret;
>>  			}
>>  		}
>> +
>> +		ret = zynqmp_r5_get_sram_banks(r5_core);
>> +		if (ret)
>> +			return ret;
>>  	}
> 
> Thanks,
> Mathieu
> 
>>  
>>  	return 0;
>> 
>> base-commit: d87dbfd31796f810ed777aee4919f211b4a6c7fb
>> -- 
>> 2.25.1
>> 

