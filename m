Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22BE3BFAE7;
	Wed, 24 Jun 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310889; cv=fail; b=NvWMaRzlm8RI52Lofdhbq9rtWvjekXlN7ABW0HFUAjnZm3cV17urUGu9Izoww5nZztwpBaG7v+f1WLhQIrO/IvcEybDAk7mqXY4NL5v6ONUqqGJjIV9l7yIAMmiI+lCUOnSjkLnwCXXcxFVC2LM+EenoNcPMqf6Cj04Du/RPX3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310889; c=relaxed/simple;
	bh=H1ZcFWMsfDMSlDLrX4z+Pc04jKErCac4wuF3SXq3hVE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzU2oWkza7OGm9AO1wdTspQj0Ls4VfWZeLympH1jTg0ZRWqMRs4ZEEdXfSFyxgbM/xLOqjHci1CjelgfkRGNr85S3MAENSNDS/AzzAw//H2fnS4cRA5dVnb4zYPqNd+GoGOxlX3damPvFz9Tki8SzeVPB7e5l51jdDGI184f1i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RbUJ3P4F; arc=fail smtp.client-ip=52.101.61.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RbUJ3P4F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0d7fsyNc+XfyDOkOMCJ7FwE3MTT299nD5EUCprQDYPofuNCvjU6/aZ0IPDZ5eUlZ4rFU9z6htH/KbIFmrP1or2hgSfxVuJfK6k7KIrNq+X57i2sS88rV4jV/tHigYlMbpFNzP/AbQmWMHVR6ZtFlw2oLGmkFrd9rYA1KXnSIZcvgziXrUhfYmeV+OKdPKob0LNSP8bVy0NQ7YWErIco52XXEjer+3s7OnssZsX2otylQ5vvs+zsH/rNfFpz1RDg1b/uqMuc5sEl+w3B8d/FiLspZ6ZLeTHOKcBZZURIyNLJC+LtDzaFS+P3AYkep3YGyPwWGi4ZPknsreMPhxjhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK+RayprdMKkQIYC+kY7WXcttDNXMGZACFDCKPf8mEk=;
 b=fyFTRo8o6nmdGsDJ4Fj90WhjDVoybnsUb5r29PIMIdmM9vMMjhGCPB9zEEu4wbekyLnz5TbfTul9brU8iP+XZcX5KM3R+g74Ql9xR7d8uFQ4kpkhsXIi8Q5O1TqkKa7S1AlwTtkz6U+9k9FwZiIwZ5+saf1gP6B8IqNt6+ir4KoaNKDJaECvuPsz11i9Wao4ug7bYzfAJ+PZWaBMTNzYqvZvaRKk48hTTy5Bp6kQKfR5JAe3F+BsT4epNuMX8MtHuoCF4CXBTbkfu24Y3mrlakbvhURx5aKupWisI7M8yLgJbf8SsXAsalf6uwY8b/2r9It31UPvIyHcO+OH+7wVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK+RayprdMKkQIYC+kY7WXcttDNXMGZACFDCKPf8mEk=;
 b=RbUJ3P4FEQS2fQsFdgfGHsmaZ/RHtwE0dfocapVBKV+0GqVxOJbYPcV6Iprmikg5vnJZFVLLldgKt64uWIAXTSgcJfvMy7hWEx13TEBJTwa+HFg0XwsAyD7yvytX6C9/UERpDdxLTHO04r5aAFMkwODwol0dgfYKLMyPXiqL4Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 14:21:24 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 14:21:23 +0000
Message-ID: <3260c1a6-6de7-4053-b480-a8244d33ae5c@amd.com>
Date: Wed, 24 Jun 2026 16:21:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: tanmay.shah@amd.com, andersson@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260619163854.410392-1-tanmay.shah@amd.com>
 <4a4e518a-61e6-4beb-aaeb-5056fbe2a07a@amd.com>
 <a9baf2c9-d4d9-4152-9188-c33fce2daf15@amd.com>
 <59d9a4c9-1f12-4de9-a0d6-613d2f5e9852@amd.com>
 <CANLsYkyChucfAY1wKvxAt9-tCX=2B5L9=4bbBA6XvnpBnLZD5Q@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CANLsYkyChucfAY1wKvxAt9-tCX=2B5L9=4bbBA6XvnpBnLZD5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0132.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::18) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 892d94d9-ae70-40f8-0641-08ded1fbde92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|5023799004|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MAmkcObDuFjhU5BXZGZRUA7/vw1/IWt0+9kSuZ87IexanLDWmn+cjgmil7fEe3BmkWW1YTuGcLxdkEeT26NcLFyHHFTF4TtUonUXp5U1o1jcm1mz7qZFGlP2PnZDSdHspljAClKTtqyuLEH0HvZepPZecvI/lx6mEv/yj7Fwr5SkT7C2rrkjs0xcxgYisUD6s5hPuK/JjRUZeRyoWw+HHrGMkgzKiXVJRSW4I0c9AvG6XEJ6hwNcCRydZSOGJNZ2mZY+a2nSyoHc7Xc5JV1XV/oLv9YBKJmYqvXOi259jdKxxQOvCaNGIW0/HKIfKDng/JJ0saCAb/SazW+zds+5wxs1bMk+8BWvzO4E2twOaLOPns6WH9TPp4OULsz3/AwDUOuPHr8dzKgIwk9JQUAaUdS/1Ob/tnnXGyNiQxu4oHXov12XbCziq0A5n2PJLtU/ahgkBRFkT1e8VdGk9pOKKw7LuJ2z2nPLaYZh5vtVkyh7UsOo3PkuXxhti8siuW8ss8yDgBzgPw230Q3ai245nxlII3F+5V4jqhd/HRYqncUg6ygDR5DgUXhZG7qTGQud8YLIegniOdRfEfqVRv2DpIKdNUbEWLUx/vq1fcF6uvtlEXfvnnLKU7p3lw7yk055zMSL3k4Z4fCoOv9GrB1ltIDbDzB7J2EPikTmJrb4SJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(5023799004)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUsrM2ZYZHBJSEgyRW9aQTJ5ODZ1eHQ4TDdNNUdYRy9NU0FLeHdFTU1HSUtP?=
 =?utf-8?B?Y0dCR1J5cC81TkdmaFRjTkx3ZTdLN0pRMTlwdE53NjdsaFlHOGd3aFhmM1lx?=
 =?utf-8?B?MnlOMEV3dVZMYkI1SDZJUFJ2My95aGYza0FwMElUTkUyWEFyVDJGSnFJRTZF?=
 =?utf-8?B?YmNlTVB4SUtTUTBSQ2hIVndHaWlnVTVVeEZKWnUrcWZGQ1hkVWRCM2ZyRVI5?=
 =?utf-8?B?UjhHUVU5S3lxNmUyZ1VtZHdRdnY1Q2RKYllPNnVzQXdZV21COUxtd0d1UURp?=
 =?utf-8?B?RzdwalhhM2l6SkxLZXBsYTBrckU2ZWEzSVg4bVFJOXRCdjI5b2xGc3BaeEJi?=
 =?utf-8?B?M0RYQ0kzUGRMcGpBUUlHNG9JeVRMbjJzbmtCbFFrVnlkZE03TERZSUo4OVEy?=
 =?utf-8?B?a1FJSlIvU294SFllRkJSTWJHaXdmem5ESVd5a1FWcml6cWJ5bXZzRTNHY2M3?=
 =?utf-8?B?cm1jYW8zK28rKzFmUVVtUXRqQzgyeTd2a1J5YVBLL3VSTUF2djdPdVpNcE8v?=
 =?utf-8?B?RVppYmMrNUlLM20rSjBFT0tuRU5QQU1JVXFXUHdqVzdvL3JodjZHNHc4ejRI?=
 =?utf-8?B?UDJsaXpkd01qSmJMZGQzSW00eE1pbjBJS3FUWUJXM2ZoektaZUtLODFtbmtY?=
 =?utf-8?B?Tm0rb1BkMWZPWDZsck1ZR0N4T3VWQ3VjZUFoeHBnS3lGWVh1SVdEdW1uY3VI?=
 =?utf-8?B?eWwyQ2UzR0hBVkUySFpuL1dkcThwSXNDUDI5bGZ3cm1qQ1lTdmkwMUZnbGEr?=
 =?utf-8?B?MnhKZS9hN1ZNUHlWMC9NUU5kYTdTSW5QT3FYeVRrNm1ublBvTlpraDhTVmd0?=
 =?utf-8?B?anQ4TnhFa05tajErRW9hVmlqOVhMSE16VkwvNUg2aVp4c2k4Ri9nYnErVjRB?=
 =?utf-8?B?c1plb3cwLzZYaUczbDRxZjZGWm01KzZmQmRMV1VCVWZvdEpJR2Uxdk9RS2lk?=
 =?utf-8?B?VkUvbUNEd1p4S0Y0M1ordDRtVDE3TUsvR3o2cFR3VzBxbkVveHQvaWkvTE9B?=
 =?utf-8?B?Y2xVU0dCLytkVU1INnE4dlpKV3NreWtZRGZVQkZYTGJ0eFhQOEhqbzJOdXFN?=
 =?utf-8?B?RmJuSG40U2hVa1hkY1JjRk9ZTUR3Vnl4cjBtTlBERnNrNzJPU1RNaXdPbEpQ?=
 =?utf-8?B?ekR4aUlGN1hSSUU4M1gvckwwVmo5RjdZWmNFTGtBam5kVllDMVoyY1Q0R2Rs?=
 =?utf-8?B?SklXZEc4NEZXc3BpOFBRTjdxSlhPc1krd2RWTzVORkJ6c29iYy8xbDV6UnBm?=
 =?utf-8?B?bnFJTTV0K0ppcFlhOHI5QmdjOFZrZzhURkdEb1JjN25odEU0NUl4YkRzNlls?=
 =?utf-8?B?NG5aWXRlTmhJT1QzdEFaSDU5UVZXK0krcEJvRXp0Y0kzdGVHMFNmNkNXODlB?=
 =?utf-8?B?NllSRldlbDVSdHJLNENqcjNKcURvV1RZQlJSWldjUVhKQjVkWE10QmVUUFV6?=
 =?utf-8?B?L0hmNzFBR0VYWi8ydFNWMkNIUVI5b3pKTmFzejlDc1Zmc3NBMmdGc0gyTExO?=
 =?utf-8?B?Qkk4ZFZwTEZRcE85ODVHMDBsalQzRmpIU2VqRTZqTlVtUThnb3AyeGIyL3lw?=
 =?utf-8?B?bTZpY1JsRFc1d1p6TWlhV1NweCttRHluaFBEbWxxMjdXbmRCOXR4b1pLYWZR?=
 =?utf-8?B?OGFCYTdHNkdOMHFkdFlGdnYzQkpQeTc1WCtxeVNxcHJnNHVrd09ndXVkc292?=
 =?utf-8?B?QkJDcmk3Qnc5aTdJWW40WGh5OXhEMVNBNFN0aGJJYmZ5VkdwMHAzL3FQTTAr?=
 =?utf-8?B?UVV1VmxDQXVTSDhGeHNyZ0QvbmMzQWhDSEJuSXNxcVZaNDlwSVhiZG8wYUhF?=
 =?utf-8?B?ZWdsSHdIaHBGeS9TTVFsWTczMlF3Tm5TVVNsNzlSUklBaEZLcnNsbVpBempY?=
 =?utf-8?B?WWdERzFRYkhZb2dmdzBhVDBraHlIRGlBcnI2RWdLVzEwNDhvZi9KN1VPSWls?=
 =?utf-8?B?MTJ2ekl1dnpYT0dYQUthSW1yc3hzcHFyMTQ4TzhZM2l3S3o1c3UrWnRlUW1z?=
 =?utf-8?B?WlF0THBuNVVxbkdkVis4RFpqaStOVThBaFJRR3NQdWJSVEVDY1MyYjVvempZ?=
 =?utf-8?B?ZFBoN0dGY0FqUGJKdTZHaVh0QVFQVXRibndocThnb2lzaDl5c1o3a0lneDdr?=
 =?utf-8?B?czdPem0xWXc2WGN1TU43R0d6MUhoMnBvWS9jNnFleEhJZHo1K01LR1FWVkY2?=
 =?utf-8?B?YVIxVEpoQUVUT0hna010bHVoeloxcldUSlpheHNZcE40dkI1OGcyZ3phaDhP?=
 =?utf-8?B?ZU1MYkxxcWg0dFFwdmhlZjBNcE5rNEQ3anVQaEJhYnlUaUM3QzU1Um5ncHBM?=
 =?utf-8?B?MEpIZW1GbWJBY3NFQnI5dzBpWC9LNk9QZXUzSEoyb2hMdVBXbGVYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892d94d9-ae70-40f8-0641-08ded1fbde92
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 14:21:23.5885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaBrP9wAvnQZwXX2dWrp7ds116CAbpEUwPExhOutOK6ML7DkTJYZ7S/2kggQCVYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806



On 6/24/26 16:02, Mathieu Poirier wrote:
> On Wed, 24 Jun 2026 at 00:12, Michal Simek <michal.simek@amd.com> wrote:
>>
>>
>>
>> On 6/23/26 00:29, Shah, Tanmay wrote:
>>> Hello,
>>>
>>>
>>> On 6/22/2026 7:25 AM, Michal Simek wrote:
>>>>
>>>>
>>>> On 6/19/26 18:38, Tanmay Shah wrote:
>>>>> Current _start and _stop ops are implemented using various APIs from the
>>>>> platform management firmware driver. Instead provide respective RPU
>>>>> start and stop API in the firmware driver and move the logic to interact
>>>>> with the PM firmware in the firmware driver. The remoteproc driver
>>>>> doesn't
>>>>> need to know actual logic, but only the final result i.e. RPU start/stop
>>>>> was success or not. This refactor keeps the remoteproc driver simple and
>>>>> moves firmware interaction logic to the firmware driver.
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>     drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>>>>>     drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------
>>>>>     include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>>>>>     3 files changed, 110 insertions(+), 63 deletions(-)
>>>>>
>>>>> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/
>>>>> xilinx/zynqmp.c
>>>>> index af838b2dc327..f9a3a95b0638 100644
>>>>> --- a/drivers/firmware/xilinx/zynqmp.c
>>>>> +++ b/drivers/firmware/xilinx/zynqmp.c
>>>>> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>>>>>     +/**
>>>>> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on
>>>>> SoC
>>>>> + *
>>>>> + * @node: power-domains id of the core
>>>>> + * @bootaddr: Boot address of elf
>>>>> + *
>>>>> + * Return: status, either success or error+reason
>>>>> + */
>>>>> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
>>>>> +{
>>>>> +    enum rpu_boot_mem bootmem;
>>>>> +    int ret;
>>>>> +
>>>>> +    /*
>>>>> +     * The exception vector pointers (EVP) refer to the base-address of
>>>>> +     * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
>>>>> +     * starts at the base-address and subsequent vectors are on 4-byte
>>>>> +     * boundaries.
>>>>> +     *
>>>>> +     * Exception vectors can start either from 0x0000_0000 (LOVEC) or
>>>>> +     * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip
>>>>> Memory)
>>>>
>>>> here
>>>>
>>>>> +     *
>>>>> +     * Usually firmware will put Exception vectors at LOVEC.
>>>>> +     *
>>>>> +     * It is not recommend that you change the exception vector.
>>>>> +     * Changing the EVP to HIVEC will result in increased interrupt
>>>>> latency
>>>>> +     * and jitter. Also, if the OCM is secured and the Cortex-R5F
>>>>> processor
>>>>> +     * is non-secured, then the Cortex-R5F processor cannot access the
>>>>> +     * HIVEC exception vectors in the OCM.
>>>>> +     */
>>>>> +    bootmem = (bootaddr >= 0xFFFC0000) ?
>>>>
>>>> and here you have different values without any explanation why.
>>>>
>>>
>>> The value in the comment is correct, but the check is done for all of
>>> OCM address range. This is just refactoring of the interfaces and not
>>> the actual logic. There is a separate patch which actually refactors the
>>> logic, I will send it later. I would like to keep this as it is because
>>> this was originally there, and the intent of the commit is not to modify it.
>>
>> ok.
>>
>> Acked-by: Michal Simek <michal.simek@amd.com>
>>
> 
> Michal - do you prefer that I pick this patch on the remoteproc side?

yes please.

Thanks,
Michal
