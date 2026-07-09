Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D14332AAC6;
	Thu,  9 Jul 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605100; cv=fail; b=s9mobyeuIADBSrNpoRq7hU6VBjdlNEAOUUZOs+FuAnJUoZJ+K/Vn/37chvJpbkTnEc+/NI+ieIOxOLYV6zOLi9iYovyz6kgY3HE7vxxaXNCLaaZgMo8Gc6+wrWrs3VVQju1eClUNhEREKHbsgFeEitdwEuekNqzslSO1nujVsRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605100; c=relaxed/simple;
	bh=TWDEGpUphryd4rGCztX/jpgp0IN3KrRqi2vHehmH9Ug=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IrALQlMugQ1tmzg4m+KkzoD2ssH8+7PjXBYhqdcdYy4cJ8cyl8RVmhvgeC+4SeMykRv/KeETXMO4kiUY2OH7dkYi57vY7aBjRSnoRx3SpcFOObCdBJdfcesy0xWz3UtKHUtF2hicd2RjKJaqYzx9W+GlkQY8K+/MZnn68Rr70yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o25jgKGP; arc=fail smtp.client-ip=40.107.208.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o25jgKGP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uh8JKinh0CmaG7p615zQlw/i7DFL3RAtUAxXI4HvDSeC2/DfiA9gK52sMyFNp/CWJjWtXJMc2xjrdZHbsYF4q2zW/OwCQjHLbQlVGo+6ZFOhGhR8BbF8MV6K43W0PT2Et509P1OtdfSg/DpiK3/lKXOmm4PnQLwCESNVovPDAW0b44hvzLjsFY0ndPJ1NSpivuV1E4m1AYQaLQfQkwTsGL8DyEE0Gaux6LukrG4NEdsQCt7ZBCO4iLUS7pwvSYgmHoMJamSZlwpb1JCNa7q1eCEjVbKlxoN4gTkn2lJWSYkhVCcg9lawT0Xmn7I7D7tMWVkxn/3MzhoSAFoP2wHyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2ve1YfxoeNbQgzehGKDOk4KBKtPqlDm+rn25pVaLRA=;
 b=pspe4pGwW5vDLr7ikTgMxVa9bMgYLziazMRUL6naYozI6lCY+9FehAZozK9FKl5+Fx7SmLSaYS8CTDdq2qt4szvYyqdUH5jEv1RB0TZDpNIwxQ0Ox8tCKNlFbtq1OExYW93ZF8owuV+a3lTbadQDdPqnV1dHUoe7mowUjzJDwMqbp96D+umSeHfoawMYXNJbg6ie6JHy6HHqP4rJcGb1Y5lyYD25pkR0e5+K+WCl/mKk/jLX1NNOPOVNIKgRT31c0TAU1utdfEIXsIltM2IdJf0XNI8tiwOX58KK3SoPW0oBaQ+Q86oEj0Xgvq9fGhApj2a0xyVDyoncXdHidXk2Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2ve1YfxoeNbQgzehGKDOk4KBKtPqlDm+rn25pVaLRA=;
 b=o25jgKGPWF0Q9ChD9mev//oDrHhsFS90DANDcmc1r4lrIU5S8DH1LexlzpuhtKvvZphoBdLiZ5OWSFgLtf3r9KH3lOggJ76pNQWfkqXItOmgG+w3mSqYipylY+o5kWcg+99f/PHSkrG/lQFnHuVlrzLe6m+JNROPOdfAUDJWzQc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 13:51:34 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 13:51:34 +0000
Message-ID: <a7a67da7-cf10-43cb-823f-90bb06709667@amd.com>
Date: Thu, 9 Jul 2026 06:51:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] remoteproc: add AMD BRAM-based remote processor
 driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Michal Simek <michal.simek@amd.com>
Cc: Ben Levinsky <ben.levinsky@amd.com>, andersson@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260629164003.3940208-1-ben.levinsky@amd.com>
 <20260629164003.3940208-3-ben.levinsky@amd.com> <akfl1Uhn9QHRwE6n@p14s>
 <30c8d353-f0ec-4ee2-bbaa-0d21e2b985f1@amd.com> <ak55jBBfQMJ71Afj@p14s>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <ak55jBBfQMJ71Afj@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:610:b1::18) To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a96338f-e34c-4bf8-9daf-08deddc13016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	V2kn5Vjf52aU9CUQFhfmSJmMADFMQCDqzDoQYUHSrOj+UxxrD0XgV0kXykh4rjHSpoF55+2F1eI/Li8LOyQS9KhYIYq4z6nD9bFsp1DQ1h0m8tSTa1K2rL4gY2FUVhwuXiWgcideiX/xNmOjLDQqoe3bYt2dQTTblwnwEHZRyGlwlya9TsIURzXUfMM0qE2uQ9fetaoDY9h8HeFFINL/qaJvkd8Mw6Ol1Tpl3wEBZBCfBCOGLWq6o5+W7MumgX/DmwbtFnUA/sSScBunRUBRZ9B9y0Hdj77vhkmDhc0cr3CDq+woVZzhDpUgKAMWv7wg9ko4Iel+AaGrMRbMwiq+yxXm0/IZLiPKju7mCG1fnt6hVynGA3jr6y2LK9+UcBJdYIQEbDwcKEaLEZxDWpLnCGmXiETrCNSma0IwfkTxP/PXTlUzWdDnM8Ghf0VzSDeVW3fcyWKU6OyaZ/JdJikYHvEhTdYLISFFq0vMCQO23/xZcdxSCdM0ky6dY5oqoNhrk3SzegoebVyaAwP2YdySwdVjcJL9z+Le2vu7SpzcbnnIk4YQ1KQfLHXnHVEfcmdp5cs2NoJNjxC4imdy7RMtd+B94gBSYwR4pd8LAWlT83z2JyM3icmdbs7EU/OWshm8EENG6S25luZPPjl8SFgvByPhqPWaY3fP/5wFy77pF2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6448.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW85OHhES3RmN0cyR0NwV2JPVkwySHY2b1ZkcjJTMjdpWDgvSEJNRHV0Q3RQ?=
 =?utf-8?B?VUpZNCtScmJWMlNtd3FoampjY2s3RzlGK2lVQ0Jna2dwOU9ndDlxZFc5Z2Ey?=
 =?utf-8?B?Ykl4UzlSUW16eEd6cnUrQjg3ODhoUFU0R2lEdWpzV3BxZGNzUGQrdXArSmZV?=
 =?utf-8?B?NE1qSStSY0FDVzJjMzR2NjNvMkNOM0N4UWkwVkU0eElCK0xESVdXWHRvTWM0?=
 =?utf-8?B?Q1Y3YWc0aUF5RkJQMW4vS1pCU0sydkJrTml6RWo0M2pES085OFRaekYycjVG?=
 =?utf-8?B?STZYcHhhTE9oY24xb1NPTUMxVFVmR2w0ZXBoazZtVTFTcTJpbXVCMnU4aS84?=
 =?utf-8?B?NzQ1aTRtbjBCek53OHBUc2QvcEZTTDBidFVuN2daWlo0dEp2cFJKdTZOYVVp?=
 =?utf-8?B?Q2hoMkd6bS9sR1pGOERHcUtIM2MrWjRHQ09DNXBYYjd6UGVuM3dzK3VsZlBS?=
 =?utf-8?B?Vy80UnRaY0grV0V3MHJITFBmUlFOVS80dFl3U0Q0U3BCS0RDa0ZqbDNWQkxB?=
 =?utf-8?B?eTNMVVFPRUJDcUZnNzExR2F1dHFDd1JINFFidnZNMnNDTGNBeDMwOXh2RmNF?=
 =?utf-8?B?d1N1azlHTUMvaTd6SFNCeTVoaEdpQ2pPS3crMTJscWlqZFRWUjhrNFAveGZs?=
 =?utf-8?B?ODVSMXZDK0Y3UmNOOUZZdHlXTThYUng3SnkzUFJsZTZsVUVlR0tVaEVTdlpW?=
 =?utf-8?B?V29vWVJwK3EzOHkzRWlTVWkzeDZvZjlnMS90bWpGMVp1UnpWZ2lOampvdU43?=
 =?utf-8?B?NUsrRGY0UmE5aStReFhwdGp2SG5aMnh1YkZPZTh4YXl4OVgvcmd5bHlTS2t2?=
 =?utf-8?B?RmtlQWp2WG43cHpUWmVSRVNwcG0rUXNQZTZ2SFJJNURnV01oM0JXdE1pSmdF?=
 =?utf-8?B?OUNicExKZ04raVA1UDdtRnlUS0dPZnlQTGw4VFBXa2Z5bmM0dkhhb0ZSallq?=
 =?utf-8?B?dW1XUFdkQWNQcHNVMGRqTzVmUE9kRHR4Ym1qSG1iNGt6aWsrR0FqZ0ZhaTRj?=
 =?utf-8?B?MTRxd0hhUFlwcjJYaWhoV0k5KzNabkQ3Z2RLTWpMbGpqeUhmd1FrN0Z0ZWNy?=
 =?utf-8?B?VTFDbU4xRTgxOUE2R3VGb2s0T043emoybDduRU0xV2tNdGNKMWZWZXRLa0Ry?=
 =?utf-8?B?cWl5bjg0SGdzT1N2ODg2djVTMitYTGJScFdwV3V2bC9xTzlRWmFETExQVURs?=
 =?utf-8?B?ZHpMMTNreFZqZmVkQ29PSzdTMzBmeWV5QlA4WnZ4UmN1TmxxcklPUnZ6NTVW?=
 =?utf-8?B?YUd6dGU3TDdFTndwclpjcmlpZk1ncm1URGU1K1BWb3grVUQ0SVlWMlZZTEhp?=
 =?utf-8?B?MTZMWDlaazFaTGJNbmNEbFlqQ1RQNmd4STNPUW1UR3ZJcW9qYWVDVnZCNzRr?=
 =?utf-8?B?Q2lxWGg4czVlazd3MnAxOGQwREdHT01ZWXh2dDJMWjdsa2ptRWgvTGRMemNT?=
 =?utf-8?B?anl5MzY0UG92Q3R1ZlFCbGRaT3ZDT041VVdxQ2NFZ05tYkdxbW12RGRjZlVL?=
 =?utf-8?B?M2lXQWpPL0ZMQU9MQ3NteXYrN21lTnYvaHVjcHZ0T2ovN0NEcmlTemVTaGEr?=
 =?utf-8?B?QWhaUjU2Qk9sSm1SY0k1VU1Hb2tqaklXVGtPdWpYcVpqcVdYMng5ZzNUbTRR?=
 =?utf-8?B?SVZjSGpNZmd5YVpGcW5FQ2NicXhYQmZhclZqN3VBcWd6SlZSNkhPaDVJYWVG?=
 =?utf-8?B?dXViMGRCbFpQMlRMUU1BRDQweEVEZE1ZTTdnd2ltVHNmc3JXZjBDZThiVmVs?=
 =?utf-8?B?UTJybVV1NVlvMmZpNm52RTFyODRMOTZ4cGpzU2xTVk0rMFRYS0hXSUdxLzJr?=
 =?utf-8?B?aHQ5NTczWnF4SHl0QSt5YlNROG1vazkzSDRnKzFISWdSVmdpUVlxMTYzTGdo?=
 =?utf-8?B?ODNIaDhxR1VIam9wUmNiSjVMVEE3QTVOVEZ6cTl0NVpzOGZGcHNwYkZuZzY1?=
 =?utf-8?B?SGtUVVlHQWNxWnJoRm92MGtvajlMTWNxN0VPeGJ1SVNnNkk5QnlxdHVWOHRV?=
 =?utf-8?B?VlVkZEZ6K1NmRVNBUVpvTUMrbUxSVDFlVjZVYWZUSGxXWmdaVmVHWm5VVlVl?=
 =?utf-8?B?NjBCS1I2NEljVld4czRLTDFIUUFtQ2Z4dnZzeTkwcTZ0YVVPeFh5Z01nWmZi?=
 =?utf-8?B?aEUzc01VcWhoZkJMOEtHM0VQMEJtZm9MeWEybFZlTk9lWURydmNwdVdGdllK?=
 =?utf-8?B?WVF4RExOZXBEYXEvOTQwNERja0t0T3VJZk5hbzNBMEhyQ2lTYWU3Y054aENT?=
 =?utf-8?B?OUFJUGJDUXlrWDdJVHVOT0RBK2wwUnAxOUxRcG8vbDBpRStxQysvZ3hlaERp?=
 =?utf-8?B?Y1FVeGZwcExRWU1QcmJiNnIreUliUms1WEpTaGFkYjYvWUtOUSs5QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a96338f-e34c-4bf8-9daf-08deddc13016
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 13:51:33.9984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yIQn9v1lbpPmjTIjnMA6/s6zz9JgYiZNL2+Qeyc8BMJE6E6GDuSOe2uJBeaQPWRaZfuVj2bD6nloz+Ze/mwtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187

Hi Mathieu,

On 7/8/26 9:23 AM, Mathieu Poirier wrote:
> On Tue, Jul 07, 2026 at 10:59:55AM +0200, Michal Simek wrote:
>>
>>
>> On 7/3/26 18:39, Mathieu Poirier wrote:
>>> Hi Ben,
>>>
>>> On Mon, Jun 29, 2026 at 09:40:03AM -0700, Ben Levinsky wrote:
>>>> Add a remoteproc driver for AMD soft-core processor subsystems
>>>> instantiated in programmable logic and using dual-port BRAM for
>>>> firmware storage and execution.
>>>>
>>>> The driver parses the firmware memory window from the remoteproc device
>>>> node's reg property, interprets that address and size in the
>>>> processor-local address space, and then uses standard devicetree
>>>> address translation through the parent bus ranges property to obtain
>>>> the corresponding Linux-visible system physical address.
>>>>
>>>> The resulting translated region is registered as the executable
>>>> remoteproc carveout and coredump segment.
>>>>
>>>> The processor is controlled through an active-low reset GPIO and a
>>>> subsystem clock. The clock is enabled before reset is released, and the
>>>> processor is kept in reset until firmware loading completes.
>>>>
>>>> The firmware-name property is optional, allowing firmware to be
>>>> assigned later through the remoteproc framework. Firmware images
>>>> without a resource table are also accepted.
>>>>
>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>> ---
>>>>   drivers/remoteproc/Kconfig          |  11 ++
>>>>   drivers/remoteproc/Makefile         |   1 +
>>>>   drivers/remoteproc/amd_bram_rproc.c | 213 ++++++++++++++++++++++++++++
>>>>   3 files changed, 225 insertions(+)
>>>>   create mode 100644 drivers/remoteproc/amd_bram_rproc.c
>>>>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index c521c744e7db..58fa566b609f 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -23,6 +23,17 @@ config REMOTEPROC_CDEV
>>>>   	  It's safe to say N if you don't want to use this interface.
>>>> +config AMD_BRAM_REMOTEPROC
>>>> +	tristate "AMD BRAM-based remoteproc support"
>>>> +	depends on OF && COMMON_CLK && (GPIOLIB || COMPILE_TEST)
>>>> +	help
>>>> +	  Say y or m here to support a BRAM-based remote processor managed
>>>> +	  through the remoteproc framework.
>>>> +
>>>> +	  The processor is controlled through a reset GPIO and clock.
>>>> +
>>>
>>> This last sentence doesn't belong here - please remove.
Sure will do.
>>>
>>> Looking at the bindings and this Kconfig I wonder why the emphasis of the naming
>>> convention, i.e "BRAM-based remoteproc" is placed on the kind of memory the
>>> remote processor is connected to rather than the remote processor itself.
>>>
>>> Wouldn't it be better to have something like "AMD MicroBlaze/V remote
>>> processor"?  What happens when we get another AMD softcore that is completely
>>> different than MicroBlaze/V that is also connected to the same type of memory?
>>>
>>> I'm good with the implemenation, I just wonder about the name...
>>
>> We started with very generic amd,bram-proc compatible string and then based
>> on discussion
>> https://lore.kernel.org/all/20260427162703.1644103-2-ben.levinsky@amd.com/
> 
> Thanks for the link, it provides useful context.
> 
>> we got recommendation to treat is as soc specific instead of generic.
>> Which give us back to origin point if driver should be more soc specific or not.
>>
>> I think no issue with AMD prefix.
> 
> Agreed.
> 
>>
>> BRAM - that's technology used for access. And I see value in symbol to state
>> it because access to different memory can be done differently too.
>>
> 
> Agreed.
> 
>> Shouldn't be there any soc string? This is for zynqmp, versal* SOCs that's
>> why hard to choose which one.
>>
> 
> Why not just adding a Zynqmp somewhere in there?  But admittedly, the relation
> between Zynqmp and MicroBlaze/V is unknown to me.
> 
>> The driver is written in very generic way that if there is arm, mips, ppc,
>> different risc-v or others access will be the same. Our primary target is
>> obviously MicroBlaze/V and I don't think it is a problem to change
>> description to just reference them even it is technically possible to
>> connect different cpus too.
>>
>> Is this enough?
>>
>> -	tristate "AMD BRAM-based remoteproc support"
>> +	tristate "AMD MicroBlaze/V BRAM-based remoteproc support"
> 
> Yes, that would be just fine. "AMD Zynqmp BRAM-based remoteproc support" would
> also work.
> 
>>
>> Are you fine with AMD_BRAM_REMOTEPROC symbol name?
> 
> AMD_MBV_BRAM_REMOTEPROC or AMD_ZQ_BRAM_REMOTEPROC
Ok will use AMD_MBV_BRAM_REMOTEPROC 

Thank you
Ben
> 
> I'm good with anything that is slightly more descriptive, just pick the one that
> makes the most sense.  
> 
>>
>> Thanks,
>> Michal

