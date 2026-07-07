Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC69331A5B;
	Tue,  7 Jul 2026 09:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783414809; cv=fail; b=iX+4JG+UpLciCWpz6QMk36IIPpKP1P1SbvaEgbNntAg3XrQid6exqxBagYB0u2cJqXMtJlpehaj+IZV7dpuM73glcczXwbXsUYldBwYyVK26bZemTFBd4piIz6+fiNgLFzLwHP7li2xssU01gnS7npHDrrftSYo5Scv1SCeYMas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783414809; c=relaxed/simple;
	bh=GuJVP0K4TmaBnfF917hC7CNnahRcseYXOsaqyQjFHi0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Js8gryBNJpdML9nZhrTp9btWOlyDokcHpEWeBmjwmePIFCccgQ2q34ctqlxNRnZeZYxklD/ny9X10Obw6RqQF5xLMwzevMScBvst2PMws8jpFEP+KNrxV2y716gF+uyzQvFO3tvKBzO2shJubcpVFebuUoPgzApLfcPzhRAK20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eUsdDkm2; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eUsdDkm2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlfUi6v1y+jfcO5kKwfYj4kyQGig/59D5xTvJFaeQGd0Vkyy8MyR80nix+U+MwBiBtHcO8VsCNH43JTlVJ8Fpb5jaHjrMerUGCc0vQU35vLCv2Cz3MClTkSwhM5ukJtKZ5sZGCPTJkADsEKMXlSIf6aGLnTMejnSXHRzFaIJanuvMC1jrAXb8ffA0BoaoCv9vruvvNMY543ut5TP/SiaiiWqUG6eSI6xK4eNSaav57JAKO7jZDIDO/RW5NcdrPfhE1gGCloJzioUIBdiveU4vNyctcVS/hr+2oXpzKnscee2Cu520lNGohj0boX8ya5pHXHsMSoeQQMeAXOqawmPuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjGVrMwXUcjVxj4pLSRMA/XNpSziNORsGhstpmV59eM=;
 b=pOSrErfvxn5ltODiBmoVwD2GvCWld/jWPnFqHrgNke1/6gsuts4QO5gWyio8zTIvpmOn5biniONI8NbSGfAWvbua6erIEHbg7+CK1FWn2G++TY/jUgGbvBcgznNWU8gwPzkqzis/uuQTNw48hA5YQk1xlKTeuu2W+ofjaCOBWW2XNF4WLleg2XserCmigvBc+7io9MMkNhaH4JYNrvBQyIi/ywRW6K6K6flXlbzLa8cedTyGVjDnTkS64SKwSzwKS8tX168igZ8GbrC/ArxuAH+CdQ4dLL0I+GoKAyHMu3S5qyFao9AuSfYc3eS8OPUno65ogm0t0WNUfk5JRlit4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjGVrMwXUcjVxj4pLSRMA/XNpSziNORsGhstpmV59eM=;
 b=eUsdDkm2mBY3pd1GwzOGhi2Lf8Eiv9XMBnkRc4XR6ONFu6YwYLB9f/ossvzfMMBuAZHzQUnI4xWz0NvATs4DX16ZwufNkRq3GFhzLnEVv5NC++w3lw+m2Jk94jHPRiItpsq/RhZjV18QN++bw9XaH10IghzDczDcaHpGHxOtW2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 09:00:01 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 09:00:01 +0000
Message-ID: <30c8d353-f0ec-4ee2-bbaa-0d21e2b985f1@amd.com>
Date: Tue, 7 Jul 2026 10:59:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
 <20260629164003.3940208-3-ben.levinsky@amd.com> <akfl1Uhn9QHRwE6n@p14s>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <akfl1Uhn9QHRwE6n@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 201042d6-629a-4982-ec73-08dedc0620c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|22082099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZSsU+8Zvx++HLezAWRgjPWuAPwdEczgHVOq0+2x6CVj0ypAiXjiFWJRDrpciszSDyM+74k0Ran763AqAl3TrBAl+YLQ9m01jeZiLqEBUrxBPkZaSTOsizCAtBGrasAWVPnDb1ZL6nAW/pqxx7JZPH76AGLI4jci08Qcm1eDtpfyl9hhqmtL9bXhp72JYVJvMG+bw6VQl7Jy6xwoKw98nmXp58tRJsMuuprX40xZry2osuJEvnDWRhhIgCAYiiuDcoZVnXA6m17Jbb/KXtm+scOdZyy6kQit05z7yU8d5g6csJgRQEirGQonmW20jQ1DBZqMSXZ4htpC+LKzQ3UsZBNaKAyZMPkG1PqodEnDP4HNOsUfuqdAxbh7pNG0JzrxoK8YF9p3Q0kRf34mf2fJBmpPxnBbHi6j6OblXGFCX1vP1A9cQMwLgWJh9HC746ypavCfmMnNjGiEaW2iTFbwtTzLtEaG3tSA7sYTebo2g1BGdU8i1eOMeAnP3Ba2DMw4D8TTBUMlxxxMfzOynk/F9iZ8+caqEq0IRZ1fdfwM54cWJaakeHNBCzquNfuIcY+cKnSMk5lE0BQI15cbtMCrcuEIpB99gfMYuGvrZXGORycNjt5JGx9YbILpiaZdkbDMOxdI044wQW2J0TuxQ3fjmk/UkhYcGjrjPTDjxrjxg144=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(22082099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlcxVHVBd0d2a0IyS3JFc3gvOThKSThsMnhlb1dIODhUMk43QmNjWUdpVW9j?=
 =?utf-8?B?R3g1TVhxSFRtMkdRb3A0b29iS1c1WnRONnBUTFVWQlo1V3BDTElSVU9oNEVN?=
 =?utf-8?B?VnNxMHBuTHZOMmNSNjFSTG9DVFYxL0RxeHlZcGhzQlZYSXUySTFoZmVMVTkr?=
 =?utf-8?B?MFVMcXpVaUl6RVA0SXduaFZIN2RMQ3BYbGYzY2MvTmxSdVFpbGJOOHpaT1Nq?=
 =?utf-8?B?YlNGcWhGeVpmbzhjNE5VdDc2L1NrTjFvaitsc2V6T21KM2d6T2tFTEY4UTRS?=
 =?utf-8?B?TkNVYUNvVExZUzB4OUYyN09raWt3K2JmTTNvSFVOdHFhSVZMTUpTelpmdWRn?=
 =?utf-8?B?bGsyR2VFanJJaklDMXA3eWw4WDdFTEhyY1llbnU4bXV0aG9RdVBRWDBMNzJo?=
 =?utf-8?B?b3d1eUxWWkVjVVlwYi9rdUZLS3UvTEZwLzJaMm14TkdoTkMyZDBKejZUZENa?=
 =?utf-8?B?YWp2ZzhUd1lPVzc5VzJhTkxDRlZ2K0ZIODh2MFVvMFc1bkRzSkk1YjZMcEVx?=
 =?utf-8?B?Z0tPancvTVdRcFo4aXFNMnJwUG9xV0psQjJpZFZNdFVWdjQ3MjdKVXFKcmJw?=
 =?utf-8?B?OVQ5OUg0dEZTT3NXaEpqdzlGNVUvRC9BclB2MEVTU1g4dkhrZ2pKRHR5WFpk?=
 =?utf-8?B?emlXVlRRcWVSMHJNZGI2TmZ0OU9FTXQ4ejd6dHROVXV2L3o5dVNDYXY0Qkky?=
 =?utf-8?B?TW9aazZ6RFJWZkN5TXRTZ3E3N05FQ2doaGx5THJvUlZ5MnNic2pvbDF1cElz?=
 =?utf-8?B?UlhtYlNRZ3ZYOTVMVDVXWkxKdkIzdlBPamhkTTRGRVYrMXV2TDlNeWJqZGxN?=
 =?utf-8?B?MjFLamd5R1BhT3lDaTlJNFYyVTZQSjlkZGQxbmVOU2cyWG51blRXT0VXd0Ru?=
 =?utf-8?B?SW5hY285TFowWWRVZHJsbk8rckNhM1FsbnN6WUxQbm9rOEpUQXNDN1hKQUE1?=
 =?utf-8?B?WjJob2M4WHRVelBJOWdkNGJyQ0I1dUtza3ZLTWhlM2xobDhLVEVxVDZPQmk2?=
 =?utf-8?B?ODFIUE9tSElvZ3NZcU9USjV3WjhyUWZnckdMWVNIOHNEaVM5S1lEaitTUnIz?=
 =?utf-8?B?M2E4Q0pMQ0pCTU4zUlhmaW42Vkt3VGxVYjZCRXZkZTd6cE56VzNkeFFNZFRu?=
 =?utf-8?B?aWlRNm1FLy9ScklIbG52MEo0bTlWeGpCVmF3SzNkQkVLY0VZM0FnTFdrNG1u?=
 =?utf-8?B?NnJGN0c0NlRFc2xqd1FPek44Q1VVWlFQKzRoWENyRUNFMWh5cVR5OHhOS04w?=
 =?utf-8?B?ZVlCRkZvV2xWNXVhMHFza0VhcGlOc1M0bVQrQ2dPQnNmQmxXRXV4ZFRCSmMy?=
 =?utf-8?B?VFRHNmgra002UVdHbWp2NFFxMkt0RjZtbTNIRksxMUI2UHpOeVBpRTdqRGl4?=
 =?utf-8?B?TUlkOEd6S3RoR0hlQ1VRNWR2NDFYNHAyR044NGFML0tzcFdKODlMWmpGdzQ5?=
 =?utf-8?B?amtGSkhlbTYvNElLZm41em1BSUVIMEpDYW5yYk93Tzc4dVZvYzZKSkRKQS93?=
 =?utf-8?B?Nmp6RktwR0Q2TTVPdllLbnltT0w4MStLOTdvelN5dk82S3hvTXJDWStUVldh?=
 =?utf-8?B?bHZPUFl6bUtQWE9VNmRQMmNiRTNvb3VOS0NaYnMra0tsaXp2b2dtNU1temIr?=
 =?utf-8?B?R1UwVXJEK0hoOU1LVXhSN09oNUJUV3JVWThyT2RhUVpXWC91cnlLeEp4cXhn?=
 =?utf-8?B?WWxDamRacmtWU0ZhSWNwSEltN1p3YlN4UjFydjBBb2lMRXV2LzVFZnBTZnFV?=
 =?utf-8?B?YzhLbW5NUzFMVEIrdG5qY3VzSDJreGhJS1FEazZNSlErNTZpemxsZnhaM2pL?=
 =?utf-8?B?NFF3Y2VCUERtVEw2SnV0KzR1K2kydWxOZjJGcW8zd2VYSG5sMEM0NnVFdG45?=
 =?utf-8?B?OEV6R1RCNWhXeC9uYnY2NFh1bisyQ3k1N0xOb3g1VVNPemZQSE9QVHk5L3ZW?=
 =?utf-8?B?djAzTDlWUW1DMHpETFBDZ1czNXFJZzJhNEpwQzhUU3BlRjYwbWN5dFBWMzha?=
 =?utf-8?B?V3UvdHI4dUZSTDREakhrRHM2U24rUDFGaE9PVDdidlRqelZ6WFBBQnV2bTI4?=
 =?utf-8?B?ZGpIbGxFSTNKdXdlUEg5MEZXN01tMzJMU2h6OHNRS3ZDMVFqdzZ2S1ZhLzU5?=
 =?utf-8?B?bzRYSkhSdGhMN29GVkVzRkxJa1dwZ3NGS2FlVk43Y2Zvekk1VTROd3hqL0R2?=
 =?utf-8?B?QlhJdmU1WUhySVJ1dERUNSttOWltUzd4MGNocEdjVHlPd0JHVnFiSUtVV3pD?=
 =?utf-8?B?Sm1DcTloMUt1em1FRGJ5Mjc3cmtRYVN4WTVpMDYxc3ZJTXJXQWZnWSt4S1JU?=
 =?utf-8?B?c3ozZEwxM2dlM25KZ2djd3k0WU1RemtZOE5lNU8yakZBQVROQUhiZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201042d6-629a-4982-ec73-08dedc0620c5
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 09:00:01.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EE7t1JsOKo0GvHRmPRvVk8d1qFZyZQ+tDnYtZAg5ozT0UB3IMMyw75G5LPPt2jlW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA



On 7/3/26 18:39, Mathieu Poirier wrote:
> Hi Ben,
> 
> On Mon, Jun 29, 2026 at 09:40:03AM -0700, Ben Levinsky wrote:
>> Add a remoteproc driver for AMD soft-core processor subsystems
>> instantiated in programmable logic and using dual-port BRAM for
>> firmware storage and execution.
>>
>> The driver parses the firmware memory window from the remoteproc device
>> node's reg property, interprets that address and size in the
>> processor-local address space, and then uses standard devicetree
>> address translation through the parent bus ranges property to obtain
>> the corresponding Linux-visible system physical address.
>>
>> The resulting translated region is registered as the executable
>> remoteproc carveout and coredump segment.
>>
>> The processor is controlled through an active-low reset GPIO and a
>> subsystem clock. The clock is enabled before reset is released, and the
>> processor is kept in reset until firmware loading completes.
>>
>> The firmware-name property is optional, allowing firmware to be
>> assigned later through the remoteproc framework. Firmware images
>> without a resource table are also accepted.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>   drivers/remoteproc/Kconfig          |  11 ++
>>   drivers/remoteproc/Makefile         |   1 +
>>   drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
>>   3 files changed, 225 insertions(+)
>>   create mode 100644 drivers/remoteproc/amd_bram_rproc.c
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index c521c744e7db..58fa566b609f 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -23,6 +23,17 @@ config REMOTEPROC_CDEV
>>   
>>   	  It's safe to say N if you don't want to use this interface.
>>   
>> +config AMD_BRAM_REMOTEPROC
>> +	tristate "AMD BRAM-based remoteproc support"
>> +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
>> +	help
>> +	  Say y or m here to support a BRAM-based remote processor managed
>> +	  through the remoteproc framework.
>> +
>> +	  The processor is controlled through a reset GPIO and clock.
>> +
> 
> This last sentence doesn't belong here - please remove.
> 
> Looking at the bindings and this Kconfig I wonder why the emphasis of the naming
> convention, i.e "BRAM-based remoteproc" is placed on the kind of memory the
> remote processor is connected to rather than the remote processor itself.
> 
> Wouldn't it be better to have something like "AMD MicroBlaze/V remote
> processor"?  What happens when we get another AMD softcore that is completely
> different than MicroBlaze/V that is also connected to the same type of memory?
> 
> I'm good with the implemenation, I just wonder about the name...

We started with very generic amd,bram-proc compatible string and then based on 
discussion
https://lore.kernel.org/all/20260427162703.1644103-2-ben.levinsky@amd.com/
we got recommendation to treat is as soc specific instead of generic.
Which give us back to origin point if driver should be more soc specific or not.

I think no issue with AMD prefix.

BRAM - that's technology used for access. And I see value in symbol to state it 
because access to different memory can be done differently too.

Shouldn't be there any soc string? This is for zynqmp, versal* SOCs that's why 
hard to choose which one.

The driver is written in very generic way that if there is arm, mips, ppc, 
different risc-v or others access will be the same. Our primary target is 
obviously MicroBlaze/V and I don't think it is a problem to change description 
to just reference them even it is technically possible to connect different cpus 
too.

Is this enough?

-	tristate "AMD BRAM-based remoteproc support"
+	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"

Are you fine with AMD_BRAM_REMOTEPROC symbol name?

Thanks,
Michal
