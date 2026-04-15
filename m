Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C728334751E;
	Wed, 15 Apr 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240402; cv=fail; b=vGMKGW870RKCzjiv4VH0KnevcOw0cFqUpegrvevjsnzlhbT5j7hgsX91KDb5KAMPlSlu0zfIhy+nGRQ9kIcobq2Pk2VeTLb+3+XVV8YdQ4uDLdVMdUC82UaU04KyspOJezVfAl6U90sVBlge13Y3zMA6/7nTO0qpGX+cEhr350Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240402; c=relaxed/simple;
	bh=jjjCZqHqDKkfJwV0ZoqzI5DBXBoyp/Ky7z+iHmHD6bk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fl/Zg6wLQN7sCcaoSJl+0lo4fvZcsfBgx3w52twrZ8aSiH+vVKINswKLMMAIYhYmVZweqJFTVtqdRtU9r/D5GYk1y9UV74aH5vJYoCAfp6qA7lAYwSBSjoSRGoB5ktWPBLvmHt/BLA5Rr8mgBAdu0wlgqcCbMI2CjL7g4AQ3VXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g+Xj1a6F; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g+Xj1a6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sn7KVWxPoXqjLZwKu5I3veHCTdn2PmGTBhfTANMGbugsPifqx43MB0iZLqr557OWkzavg7Jt8LvL493pc4IIA8JLyKaN59qmnO3NpFqwuOLkIIg0KDixxDQTQo2LofnG3s5sM6RrnncKlIx9mgAHA0s2heK1ERG2ab7XuzXqNbElGQjXNOIYyN7rGtnlyQtxMQtsbTncPfOkNJ8ikxOlh2LK+BdU+RSO/wyOqbhsgl/KcMONgpVOd5kUGfTIL/+qR9zHuxmati80HCBtGT9q7iCFEqzjWhrxZK6mjki8soUWw7MvwcNbtsYwjVHDTEqLckD8gRSVy1KOE4zNj0RGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNrvt2/CAyVwGPfaki8gskhTPlQSAwbj9RDAvaRs7kI=;
 b=kWyk/Q5yLHJf0zso+kmvxw3s+6zHvqMptJqfA6CInI8HCAb0WX1DFWd3qg5H88kZ5yxbXEJwFMwRn08s30KSOyNjisRQA+ctYiitfdRDKacFW4X5Ej2W9lGX+un1Vw4cl65+gYkVFPCFONXdNWtcAV2kfIap2GM6M+BQXYMZlT5esdrpwKyJcdXFy/Hm0ZO368DiLj/+azEp3LPnGX8cqeVaOj1rU8dbszVvoZoJ/J+bfacQleBLmY+j6Z3bgOwSczG+M4qpBU+TdDzlCrGlCYF6At9YzjRVkidYoLOKDq20w1m8LVgje/TPHjoVwcwzR9vuXnkVkr47atzEYU0VGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNrvt2/CAyVwGPfaki8gskhTPlQSAwbj9RDAvaRs7kI=;
 b=g+Xj1a6FhARpPI2yXFGhOkq4nCp3uLdhIPBAGRWAy+EOrHsh2s5fPPDZ43DYHhi9KcfODg5gV5K0zHyOmiLuR/a9xImJXgitwrdyss0gVkpVnSftrpKIUOg2KDm/WQ0DFGk8QgK9Jh9Us1XP8or+ZH2KK7tzfrjbyETwPXNxyy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 08:06:37 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 08:06:37 +0000
Message-ID: <00aa7ec4-121b-430a-9b83-1430dfee2998@amd.com>
Date: Wed, 15 Apr 2026 10:06:31 +0200
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
 <01f58865-3a89-4adf-9411-0bf8b8c985f7@amd.com>
 <9cd3686a-5fa6-49cc-9b38-96637b9fca39@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <9cd3686a-5fa6-49cc-9b38-96637b9fca39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS7PR12MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e1bcbb-3dda-47b1-a1ef-08de9ac5eadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18096099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IJKtFafTCAIINc5DilG0UvOYIRHHJPEO8xiCSEi+VYrPBtgCdSPS1FB1tDeRNnZ12sNs7DSjyXVliE+JYfUMSZOutQhSbGRYJdEvy+++eQ6blqFLLKAFuVn9G1DLwDv7e7uEx3RNDjxc9XwfkYdVu2rPVkaOtnOsEjaKItex8bH5usJXkMz09FjgOXrz/kdlOJ2FKFn47DC+/XC7vGB5rwpCEYHV3f8DgdBOpCcXbmTcpQf7uRyQ5jfYVfc7HpIzc9WEf6OVPHO8lUItBWEqgT/GHDO5VvsZXW8UBQWmdUNv0TnsSEHUo6BDN1xP4GFyWwPot59oORxa42N7jczS7trrFA2C+zGcqnavVCxpHFnDG06jEoT2YIcyYjkA0tpqTBAuQRTqNH9fuLabO5NMX3Yghr46YnDA6waoI5t7/lYfcPm/QOosZV+kRgLEcRYJ+mWzFoEDwpJL8w/mYSc4kULsFH2xF548ky6JwNrvrZq5obdJ+ob6XFDs3U1+ilsFRXm+70RvQ8pby0gQAP9iWM8XBb3sz3aq6q2GO0oZxpx0N+o0gPjJYr1I8Gfvhw5Rlj1lDnNM5xd3S9F/s/y+68S6/WQQhi78NhqZsA3wS8QA0KYhDBzidqUEJp5g8RRDJb+RsaQNOdfV8XdbE8BfrW2c0bQAHyujrT0RtQm1zQRGkyBQdsSN8cg+WUYkS7caBdYmKWhz2xywd981VrTqEtGBlHZFnkD5Kb7lroS3sUg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18096099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEM1YWl6NFFWNTBVYXNvWnlSaTAvZ2N6Q3pmVVFqdkswOEpSUHlSb2lXeGoz?=
 =?utf-8?B?N3JscDNzaEwzWHZkQ012R0EzZWVLYXc2emZFb0J4TUhwaThmRDBGeTFuWEw1?=
 =?utf-8?B?a3RibDl1ZmR5dW5mRDZpYm5nQ1B0dVppQmxTZk1iK01YMU9kNit5alQyQ2NO?=
 =?utf-8?B?Wm1sdDB6cXhGZmhieDQvdS9PYTRsYmpDWkR1M1hscThVSXJYek5hUjFYYXhK?=
 =?utf-8?B?RDJPbTdRcmEwU1FyLzBjYzl0TjB4RUgzTlZlVWs1cHNMRkJhdmNDYmtwd3RE?=
 =?utf-8?B?cUhvUWNjR1hOT21CTlVFS3c5bVZNWjJvdzVhd2taSnBQZnBYRnl1d1JLM2Qx?=
 =?utf-8?B?YUVla0RuMEd3dCtndGFQU1gramJrYnQ4UVVaL3A5TG4xKy9MQjBjZHJtS2V2?=
 =?utf-8?B?WExVNnNMckdJQnM3bGpDN2trc3VYQWgvVlZuZGtVUEdMZTU0V0VqdGphS1Rz?=
 =?utf-8?B?SWx0Z3Ntc0FGTkp0eVlVMG10dGhWcUE5U1RRaVhmUVIyaURsbEo4UTVSdGUx?=
 =?utf-8?B?OWVaNnRWcm5qUmdsSlJxYkRDM3FQV2xyM3dmQ0ZRaW91OVlXRU9HYTZoT1F3?=
 =?utf-8?B?dlh3YnlKRVArbkJldWdkK1dzWHRhZkNoa0cyVG8wMVlvQjZHR3pScHBTQVBP?=
 =?utf-8?B?cmk5blRmOVZCV0ZoR21MZ2MrMkNFM2hSMjg0clNpbEhrK3FyUTdzVitUMlVH?=
 =?utf-8?B?cWhaWmN5MGQyblNHWncrcUFwc1cydWY1TS9oWUNaaS9oa1hPRHRaaDQ0MGE4?=
 =?utf-8?B?bVZ6eDJhWElVb0ZVRGRDdmk5b3FDZXlmWkpXdkZLTStRV0l1OHpRaU0yM1Fq?=
 =?utf-8?B?cnE4NGVRZ3BBTWhkZmErdFdTN3UxbHpIclp5UXJWdFZzcmhyazdtQ2NOci9V?=
 =?utf-8?B?NFBlK05CNHNFK04xdUcyZXNOa0RiK0d4WWJuRlNTQTJkZThMY2hMeTQ2NVp3?=
 =?utf-8?B?Sk1sWkdUbno5VjBDTml4eXYrWStTcG1zanl6UjJyQllxdHd5ekZmcDNwclRn?=
 =?utf-8?B?dDdrUGVEb0dJeEZXb2FyMTBOYTNUaG1TQVl4QU5IVEY0OFZmYWxwRGhUdEU3?=
 =?utf-8?B?dUhRZTRBL2U5TUNEcnlMelBjVUYyUUF0MFJuRUNOeEtjR0d5TUJYU1dVd1Ax?=
 =?utf-8?B?UTV2MWFnUldvYTRxYWptL1ZlSklIa1AvRFh6WFZyVjdHQzRrdnpERWJ0RFFO?=
 =?utf-8?B?MXlnSGNNS1daMC9DQVFvajV4dFArZnNOVUJoKzAyYjZ2YXlSWTNwMVliMFNW?=
 =?utf-8?B?ZDlGSzFNN3VOQ2ZmWjFOZWhzcGtHUXVPY3U1RzN4MWJZUTdjZ3NUQkg3R2ho?=
 =?utf-8?B?NEczMGROOGg2NHJjSXNaU0lHdXBHNldURVpxSkYrdWJ4bC9ubVMwWGpFWEVH?=
 =?utf-8?B?Uit2WGZLWVo3S0x0ekFCQ1hxWHp6R0kxbnBXVWdacEQyWm5KS1RTMnlKTW51?=
 =?utf-8?B?WUlzaHhlMFNIUWlTa2VCZVZiK3MyQ0VYd0VXZC9sclBlbmZ1dWVJcEFpNDBJ?=
 =?utf-8?B?ODlKOG1KZ1ZrOEM0dDlBRVljN01oR0R3RzZqRUFzenZOYjhZdFZyTEExdWp3?=
 =?utf-8?B?TCtTaEhSU3NxTjJhc3ZCdDNqS0w3L2xtOXZiTXhKOVRhRFAzVS9kM0pPVXVK?=
 =?utf-8?B?eGJOZUtkS1QrcmVGMDRURjZiOUM5NG9oVmlOSWNVMjhBbG5RMElpQ2llbnZq?=
 =?utf-8?B?SlprRGtyaGhUbWRxaUFna1k0cktkRmRzYkdIMjlHajhxRGptbW4yVXdrem1w?=
 =?utf-8?B?RERkMTY2dVhNY2dwMkRLVWhESzMwK3lhdUZPNnF0KzFuNjk4djNyQTNCbkNi?=
 =?utf-8?B?c1hXTVl6bFRzNmVvdUtWUDVrWUlmaVRaeE1SUnNkV1dsb1NPVmlRcFVhZUxm?=
 =?utf-8?B?Z2ROaWRyZGZwVGhueE5oQjhVbG5LNUx1NzZETVNvL1lYdFBsb1hNQnoySlJt?=
 =?utf-8?B?dWZXSzZoREZHWitqSXIxL2l3anhtNDNyWFpnZ2ZnSE5sWE94Mk9URGVqRHhJ?=
 =?utf-8?B?ditXQUtkREd4VkUzdjZYZ0dHUmdPUlpjMGVjQlJaQVBqdWYyMm1vbmtsSkRS?=
 =?utf-8?B?L3o2T3lKNk03TjlxRzdkNDA2czBlcnd3aXJ0bkk4MXMwVW00ZGtQbjhZd3Av?=
 =?utf-8?B?VnNJT3pmbkdjNGw0RjNRWWx6ZFdudDdqNFh6WkFzUXYxRE1xTkc2ajFTY3Jj?=
 =?utf-8?B?Z0N1dGdPa0U4WWoyM2w1RTBqWmExb0xXL0hyd1hoVFRQUDVKVllFQW9uZUJ4?=
 =?utf-8?B?cE5pMXBJREIzaW8yNGVqS3pKcjJjdUsydjhsaXkweEVBajQyREluN1o3S3NW?=
 =?utf-8?B?eEVUcVVLQ2RKN1R2UFJweGVsa1EraVIwYXlMWENTNmJVa3BIb2VGdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e1bcbb-3dda-47b1-a1ef-08de9ac5eadc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:06:37.4158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqJlsCoGEyjdLXd5yOSyHVuqGli1zG2uD6uSCVIQmc4qPnIRNiaKcN8zXRUhuCwm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263



On 4/15/26 09:07, Krzysztof Kozlowski wrote:
> On 15/04/2026 08:55, Michal Simek wrote:
>>>>
>>>> Does it make sense?
>>>
>>> Yes, drop from DT. No need for generic stuff. Or describe the hardware.
>>
>> You need to describe that connection to HW. GPIOs, memory location, etc.
>> It means there must be any description.
> 
> No, you can write user-space driver or pass everything through SW nodes.
> No need for DT description.

The firmware memory typically sits behind AXI-to-AXI bridges and 

interconnect switches. The bus topology varies between FPGA designs. 

DT ranges-based address translation is the standard way to describe 

this, and pushing it into userspace would just mean hardcoding what 

ranges already provides.

I don't think SW nodes should be used here.

> 
> But if you want a DT description, then it must be for the specific
> hardware, since the hardware is not generic.

But there is specific HW loaded. It is loaded at power up and don't change over 
life cycle. What I am just saying that access to this fixed HW (in fpga) is 
generic. At this stage memory and gpio only.

What I was trying to say is that the hardware topology (memory window + 

reset GPIO) is the same regardless of the soft-core cpu (MicroBlaze,
RISC-V, etc.)/fpga, so naming it after the ISA architecture felt wrong to me 

too.

When I look at other bindings. For example this one.
Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml

the compatible describes the communication mechanism (FIFO-based G-Link), not 
the specific processor behind it. 

  

Our case is similar the compatible describes the control mechanism firmware 
loaded through a memory window, processor started via GPIO reset. What sits 
behind that interface varies and is opaque to the binding.
  

Would something like "amd,mem-gpio-rproc" be acceptable, following the same 
pattern where the compatible identifies the interface mechanism?

Thanks,
Michal

