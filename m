Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCED39282B;
	Wed, 15 Apr 2026 06:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236133; cv=fail; b=UJSZAGHHo5rqvBT+wNXfow5mhNRiLT46iJhEH9iuYkWCGH9OUKprJH6cNXRH22qwzEPOs1nmGqqcajGIAX2F/7ECSB1IpeaOu87hKN4t0cUCbmNwDfdNtpI3mYtWFz7GDGO4KRJK0Zc8yvGstIa3bQBQtakjEGmFgm+zBCLs3C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236133; c=relaxed/simple;
	bh=9z1rKpcZbL03jesJgZ/SQVTyvMYSIpKFnNDfp2rM1Ak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eMSOelb/NWTPl8LxmTb/9o1Kp2P6JeGUy7CaQhsGLs994qh2pOCIZDbf1WHu40923rXwZZl2rJ8DqhX9sKSF26xNRxkd2GnQgQQia384bGQgZmkiJi0Jb4TCIoQSicOlCqMKJJF9Aw9krqA8IREgPJa1cAch17OJnnbiHpm+8W8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dE8DXALH; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dE8DXALH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppia8NMsH9OBBaVfNGGlts9WMTSCx4GcVVUpe5m2wJ+E62ZZ3px1CVdJ4cqYLCipW712Gk2EHn/iSIm0f+E0/wnsQTdV0QAu8eVNfLqYVh6BLzNVTKajFmJlayn9pUnxKGHtkPEjxWAOAQYyrdLlTsxIxNpIct/lNfZeuNEifPhLooouTFpJVuTv8LTFNGe+lpCgj0WZ01X2yTKYR2NMQyHRppVs509kQP7uGBR/gyZcBp2kMoGa1+haWRDOeTnFCfQ7IYvb/Yl72GuOZBALTeLrqRda+hLdED4Ok/TatZlhYOdyZui95TWNe6XTUcRblfTwWNG8s7j9Lg+atT/JQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EldsP9DMvHXhiUvKmAyeeJ/ybbomiFTHlLYzTOHcPkk=;
 b=ng7sGD09oDDHwyyAdyIT3hdUedPayAtFtNmnfkIt8PAylbCvhl4XrvHtNdSgofU1qBOvvhI0HUzP1fKJ0e/gCNl0pOqsJ//S9nQ9KACTQBAfarc5mOd5wyeP8lqQ6wa3XlOfCCIqti57RknD0nJ2GmcVmK7DWh8K+QAsraK9LAZ4FTG88K8mTWMUtYgldDLCmk8olXKSXrq/NHbRHy24d5TWLAPRpzpJvjxm1nWReD/p+koQvN8eD9GDecKSGmHYWFzkZ2qZDizyvBgmSvqmzViVg59JnzOVQpn5tiu0pyrSkdrH8xbE5KDO10TtNsqKWsRniqs2wJmAhALTzj0JzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EldsP9DMvHXhiUvKmAyeeJ/ybbomiFTHlLYzTOHcPkk=;
 b=dE8DXALH6dii/TYlpdm1FYByEfwB4CC+dBiZK6TD9h0bOHCGkERMfviDYk/L9bQNVkMpOSpgpnIa5YSdoe+F04w8wzj2C22ndYUqnIg4QfgFryA1IlzBxvEVXjdur9dWDnQs7JbpIOxE4MOlQHk2cWYkaPRR1+Hq/QChJOGSwwg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH2PR12MB4197.namprd12.prod.outlook.com (2603:10b6:610:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 06:55:26 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 06:55:26 +0000
Message-ID: <01f58865-3a89-4adf-9411-0bf8b8c985f7@amd.com>
Date: Wed, 15 Apr 2026 08:55:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky
 <ben.levinsky@amd.com>, andersson@kernel.org, mathieu.poirier@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com>
 <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
 <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
 <bf54faab-fac5-4c5c-89ea-04e328986760@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <bf54faab-fac5-4c5c-89ea-04e328986760@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR15CA0007.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::10) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH2PR12MB4197:EE_
X-MS-Office365-Filtering-Correlation-Id: 388e7da8-b30f-4d9e-aa3f-08de9abbf904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|20046099003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D8T2/a99ihxgZfV3hm1914rX3VMMTXKnmkMVh1v5aiWgeXlqdpDpwSarH5QjQbMMf3Z1X9WLEPjHwdgovD+l+NBF3C8B+CYiuWPPLMx6+xZ7izHf8igudUcfiMDuJL9/1K3zNJm9J7eU8d5HjdupYHW9rhOOz24crF7ehLX/L/j9rlYajhZv5sz3ZKAoeyeeuVavZAU4+jxy6L/kWrJWyfWtrjVTGeqoYqPr3HRD/rc48IRcerQJfxAWHl0EvALSwsM+O91cv/MGehNO/fv6a7d36wPzgDqAM5cYXU1mXEDAlqKPPl6WahZpxKMbtRPeR340MfeZY56bm3qhXRbHC5GzEfy9FpBU0omwfV26lkYGCPMGdN8Wyd2Pt6sIMOcJnBmB38R+XSve2TnQPrN5+xALVVirb6IZsfk7FwQcrGYT+9uC3J8utLumV79kracNszoh6IM/4gmvRkXlcrXhctl/2fQQh/+bx/qx74vmJ4VN0rciGbGUqOVxzS2eBHN35DzKOU24EAAXloBBs19DzB6VEgOCAhjMuxKTbrYav0fqBHayLDZ/VQ+dHzcfAREir2G0w148gRHy183LDEroWG4ERG6PDSq11r1c+pvAjyOhB8aA7YURUFriEP/5UfGVKdGybMR2gGRIPMo5PMqFusxXGzheB7/X2jbByy7wwYAL+5LFFKQE5YSB84Ub6bxQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(20046099003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXJFMEo4bGFzWnB5OGFpdnFoaUJOdGs4MG56YzEweGxmaFk4NSszRjlYK1pE?=
 =?utf-8?B?L0ludWRUQUJKNUFoM2JNYUYvNHVES2llYXZQajlud0NJMy9SRzdOYXhaZDd3?=
 =?utf-8?B?OVJBWFJ1Q1JFNVFqSUFYUGVrV0pwYW9sdzNuaUNDV3ZHcGw0dTBnNURKUStm?=
 =?utf-8?B?VkZGeGV2RUQwNzg5ZFVxZk16WWVKekI4WlRJN1NGUXlFa1FHSFUwbDdkUXJz?=
 =?utf-8?B?ZlV6K1pQaldBckJjQUpBSGhsSzI4dmdrUm9lOHhoQ1ROb3dLVkZJT2RhU1N5?=
 =?utf-8?B?ZXJBckVTMnFXZ3dkTXgvNWp2OXJsdHJNSys0SWdWY0daNWNxcFBNZlA2aytE?=
 =?utf-8?B?UkZEb3NtZC9LS1dabjUwVE9PU1BSM2FCOUNSaElBQjUzZCtVSEdxRnFGTVBT?=
 =?utf-8?B?ak4zVG1aQm1ubEw3UFMvbGZRUmF4dWVsWU02Y3lLdnRzYndXTjhFRSt3NjJW?=
 =?utf-8?B?T2tLN0F6UGVDVkFFeGMrZlJ6cVh5NTY2RG8rQXViWmlTcDZJbnZ5NmUyRlh0?=
 =?utf-8?B?bE5XNlcvMnlSMEZWMVhjQUo2MFZsMG1vOTY5Z3JjMmwzZFNoRjBnS2twMUY2?=
 =?utf-8?B?cFZ0cHlrS1QzSjZyaC93Y2J6ZkhDandIZkFDeEVCWHQvMXBXR0EwVW8rR0hi?=
 =?utf-8?B?aUZobFBTSEhJVjljNWhnNHZyRE9oM3dnZEQzQmpmd1lERVE0VEpNTTdrODRh?=
 =?utf-8?B?aFpZSmtJY3I5MlRGa0M0Z2xCQ0NjcmxuVHFkdE5qMVcva21NTURVdnIzWEYr?=
 =?utf-8?B?V3Y1K1pNbGU1dDZuQjdTSHBzaXJhTmFlKzIzUXRQMlVDS0w2NVV3UnRqdWtM?=
 =?utf-8?B?cUxmZUdQYUIrV3hmSTEwSmwzc2E4UlhwaDdqb1Z1VWNFdldUdXFLSjlHWFVL?=
 =?utf-8?B?aUVLWDl0c3FZTnQyRTliRjV6TG42T3IyRFRJSXBPY1RLNVU3VjdGU1hCTGRL?=
 =?utf-8?B?SlpISjhEQW84bU8vZ2w1REEwRXFYU2gvYWJSc1JxSktvdVIxVU9WSXFabFBM?=
 =?utf-8?B?cnlUMzZLNG41d2w2Z1JPNWpyWlNUOTAwN0hjTjF4QTdUd2JGejB2Q0hRZVFn?=
 =?utf-8?B?MGloT01Pc2pMM3gwZXZRVG4xREc0MzlYbTE5YU1kS0g2M2dFbXQrQkJpOFVa?=
 =?utf-8?B?UVhQZktuRXRBWWF3cnU1KzBKOE1DV1dUN3lMenhTNjVPc0Y5czBQbGR5bG94?=
 =?utf-8?B?MElPSjQ3VGc2TDZxUzFIQjdJWHVTRlVCUzhTeU1DTlFMYVBLb0RVQm5UdWE0?=
 =?utf-8?B?a1ozT3daR3hFbHR2aW9kakY0WFdOK2tDYU44aUhjVUdPV1pJeHJGTHVvSTNP?=
 =?utf-8?B?SUJ6d3h1cWRyLzJPM1d6anZudDhkNmhmUmU4ZHdRd1o0RTExa2RHYlhOVnRy?=
 =?utf-8?B?RVkxV2luSTVvTFB4OWwrMktZVUFzdEZ0UmxLcGlsSGdSNjQ0YmpEMi8xdTRw?=
 =?utf-8?B?T1U0dnVYMzh6WmJHUDRpbEVPVU9yQkgvUW5POEFNQzU1N2xNbFdtVk5Ja2VB?=
 =?utf-8?B?NWxrRWVSWlQrem91NjBUQzc0NHRtaUpFUnppak81a0FmQTZHdmF3My9BSDg5?=
 =?utf-8?B?RklKZ3pWZ0hwU0dUWkxQZmtxTGJJcXNDdHNUd0w2RTFLM3ZJcFlXQ2htRzI2?=
 =?utf-8?B?MEk5RDRQM1FSa29UQmdBU0FDQzh5ZjhYN1daNFBXZTlROUlxM3JQRm5NY0dJ?=
 =?utf-8?B?bXhoZ3NMSXVZVnJnd0FtNDc3Z0JScnU5WGxoNUNZWGw2QVdXZmJIeDJ5czUr?=
 =?utf-8?B?NjRYUnhUTVRIaXVrUDRUTk01ZG9lUHU3YXpaWFNkdXFNRExwWFRzNkJFOHRX?=
 =?utf-8?B?cEE1VHhIdUROZzMzSVQyUXduaW9Za092T2dGRmRFdjJ1S0pJdFEzdnRRQW9Z?=
 =?utf-8?B?T2ltczRnOHhLR05SdzZOM1hnV2VEem9lRTY2VENKclhVZW5Cbjh3bzFsWHA4?=
 =?utf-8?B?OSt2YWUzamtLTmUzUW5vcGNGbzhlaEZ0T1lmaHlrSXlsM1lDc0lFTDhMNTQ4?=
 =?utf-8?B?ak1OUzBleFhKVDRjL2hERVplMnlWbXpabzZOcWtLQXJ3TlRxTnJJZDZXZEJN?=
 =?utf-8?B?K0lpYVVuOHVjaldkeVJxQ2lGNmNEekV1WUJpRDB5REZyZzh3dzVFUkxXUWw0?=
 =?utf-8?B?aU12ektrd2Y5bGJWZXZQVWE5R2I0U0ZNU2pOZ2FUMTJRZVhaZGdGa1NwOXBI?=
 =?utf-8?B?eUp0cWlkU3R6eVVsY0NjOGY5SXJUMVU3a3RHTjB5Yk9sVkdUM0ZIUlhLVGZt?=
 =?utf-8?B?Z0F2YVczSVRVUjR6UjRGMGhDUnlvZWNEUkd5MUMvOWUzY0Yxd2FqTElocXp3?=
 =?utf-8?B?aWRBVDlQRExreTVzWHh4WjZiMStCcXBYZ1dQc1B4WXNiankxRVFRQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388e7da8-b30f-4d9e-aa3f-08de9abbf904
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:55:26.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WttSrlgsneu0HmOQ9mS3xr9INcWlz0G1/FOInsVrLEH2s5ZOB1fwbIy1bOf0xnrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4197



On 4/15/26 08:50, Krzysztof Kozlowski wrote:
> On 15/04/2026 08:16, Michal Simek wrote:
>>
>>
>> On 4/14/26 19:53, Krzysztof Kozlowski wrote:
>>> On 14/04/2026 18:15, Ben Levinsky wrote:
>>>
>>> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
>>> prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>>>> +---
>>>> +$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: AMD MicroBlaze remote processor
>>>> +
>>>> +maintainers:
>>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>>> +
>>>> +description:
>>>> +  MicroBlaze remote processor controlled by Linux through the remoteproc
>>>> +  framework.
>>>
>>> Describe hardware, not Linux frameworks. IOW, Linux framework is here
>>> irrelevant.
>>>
>>>> +
>>>> +  The executable firmware memory window is described in the
>>>> +  MicroBlaze-local address space by the node's reg property and translated
>>>> +  to the system physical address space with standard devicetree address
>>>> +  translation provided by the parent bus node's ranges property.
>>>> +
>>>> +properties:
>>>> +  $nodename:
>>>> +    pattern: "^remoteproc@[0-9a-f]+$"
>>>> +
>>>> +  compatible:
>>>> +    const: amd,microblaze
>>>
>>> microblaze is architecture, so this feels way too generic. You need SoC
>>> specific compatibles and I suggest do not reference architecture, but
>>> name or the function of the processor, if there are such.
>>
>> I have been arguing internally that I think when you look at driver itself it
>> can be pretty much generic loader for any firmware and doesn't really matter if
> 
> Luckily I don't speak about driver :)

:-)

> 
>> target subsystem is Microblaze/Risc-V/whatever based. And I was suggesting them
>> to use more generic name.
> 
> So the binding is for drivers - generic loader? Then simply no. Not
> suitable for DT.
> 
>>
>> Because at the end of day reg property is pointing to location where firmware
>> should be loaded and gpio is a way how to start that subsystem and there is
>> nothing Microblaze specific.
>>
>> I can also imagine that the same driver could be extended with optional power
>> domain, power regulator and clock properties if there is a need to drive them
>> before subsystem gets out of reset.
>>
>> Does it make sense?
> 
> Yes, drop from DT. No need for generic stuff. Or describe the hardware.

You need to describe that connection to HW. GPIOs, memory location, etc.
It means there must be any description.

Thanks,
Michal






