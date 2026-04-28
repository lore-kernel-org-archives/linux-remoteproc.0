Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCCD441044;
	Tue, 28 Apr 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777382328; cv=fail; b=p6DlofYMcYJBS1qBk6XeBEZ1PZVo/E0o/qkb1VHzUpdHuvzQuYaKABzSDDAsrRCcSdZhI2Z5pmQLC1aZiwF1UpN52GCsEj93wCDKRPxhyrGNsgWzwaADJLiRTUBLO2NCMKL0IVGL90XGsYBhsPXLYd7BnUEiRXT0GEKknTXqSGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777382328; c=relaxed/simple;
	bh=jSKX3EN7du0NTkVRQL6miw76B5RFtgZqJiylgmDC7Eo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2xSSAHKTsptQzXzKelIrI66ULGkAYWD4N+wZZfUmANyiciOJ7BZdWtfd4ZXUtIB9K0B7SDUVr8Nj/KMlOYYD5mz1cS/9ubRXmXddW03aOJK3JAq8qrR+gNKz/dRWfrgHHVjE7ajqWoabOqdlddvUQO5njL0flr7y1PKJ87eOLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dNxmlin0; arc=fail smtp.client-ip=52.101.57.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dNxmlin0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZnBBloANQBocAHvLtyQQEqeG6Ho7V+44/1nHIrSQ9y4TS0X3720xfEjKC888TajsjvmMnrmI0aiuffFsMTumjdWb07byplnDNBVhZYhPj7GdANHtU6cS2iSmUYA4BeUqRl7GB5pXtc+k1hFPHNvC0HMl1rWHjLcU7nNvZKM01JCYfcPVTruGZx4N7HtwtK20C91EwOeN8OOzI5uzOFHJf+3O6RnwhW43x4VV0jR31qvvc8yQ2RNYXvy9QOOzKhv9ADBoK5Lmt4umwn1o4RB8X78NAm8ywZ/0s/BPjLqxxJ1Eyimntal5hwIiAA0BcwuHwFphK19NCkWOK7s4T+hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsfldpiQXeMr90fLZnI5z6DnZmXGG+dcvmV9KsAlmqI=;
 b=sdy3o/opcLF5UWKMKR8FyyeprdXhYwyvJBbskDnurkE6EAKZ51oj6/IdqTjIjkQ8+bl5GM9s4qfDhLLFwpqlSz/73TqGUe0xv9jdZxPnJavY+tcxxjl6Bw6wwjHyyZT5yV697OreHYTcJEu9EkSxW/YIUkizI1LHCmFEa2jUlBTuhwRkIWUnbb7TWmUnfP1saAEKkyTq94EsDHxdU/OYd3O0CWm2AE/pHZvLeXpSJNYEkBRqWyFSNPfQMUNesyy8MIwjCfS0fUqeV3HuulnlCEqO3BACr6zxZdw2OcbGuTivo/sBePKTnpV+UQsNdR1UFfLsrGtMOXaXx1jNfVRzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsfldpiQXeMr90fLZnI5z6DnZmXGG+dcvmV9KsAlmqI=;
 b=dNxmlin07FqCXqt4YB2OoiWSqROVjfRbUYnqwDK722mE6ngSXIxMmjB/NQIGty5E1UFovxfJJfI1Nqr6MI8Fwed1ksyTcDaaZAWycEwHl+4dUc58qRTdfSYVf4IV127/JIKWmRckkLyD5WKOG9035VumEQeYzmvIZQjjflAIksI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 13:18:40 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 13:18:40 +0000
Message-ID: <a6a231e5-ee87-4045-ab16-8acdd4937f42@amd.com>
Date: Tue, 28 Apr 2026 15:18:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
 <20260427162703.1644103-2-ben.levinsky@amd.com>
 <20260428-curly-hyena-of-triumph-fc1f4c@quoll>
 <68cf4479-c6f5-4947-bc75-df9be73644d3@amd.com>
 <998b67ff-192a-478f-a9c6-ddcd7773e27c@kernel.org>
 <86e464f2-974b-441d-9459-dd957c16993d@amd.com>
 <5ded8bbd-11b2-4552-80f5-972df15dc6e0@kernel.org>
 <c2ee8499-2ba2-42b2-bacc-18166135abbb@amd.com>
 <b8193657-65ba-422b-b207-a75de419cd65@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <b8193657-65ba-422b-b207-a75de419cd65@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:510:324::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 26214e40-4f1e-44e0-4fa9-08dea528a9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T9r6CV3+akEoaO3Kxm+ubhTFS8rP3XPxZKCZq9ABfHyftXAVWPFmgR+oxGiIyaR0Y8aR/DmA97wmZK8dVAtin9l5t5FvGCZpEOA1gMOa3PabyizLZUA7nvTe7vnTJ68mAA5ED2mcoWTG9H3bcvSFYaGNkLOV7gfmXofaEofMBjEyIEUSpz6iM/4KTIEC3SJ+jE8UISkFh3i105E4jRvx+RW2j2pKTmmu+rC+esOwyHsdp7CdSE4Zeo/Jewb3n6E2oDXqitIgd2MbVxDa+gB9RzRgzI2NCgxsUGyE8qEF84qK9rCfiLypSPCzTAk/pAz6spal1lRRF4JGc0HstEIIWn0LTOyGISS0vdFi1TdXRVoaCgGdtcXgjP0IaylB47UWBPKiE1QY1CaQgS4dsxlVBhgtShQ29RRpgkEVAAWCJEoDmcIwwoe+8PQEhIlPrgSojU4pHzQaztiGWZv5Rwpd0pwmSiTIgiV3GPD3HPgRla9jvYCQJWVCh+fu0PQ8oMW3W6io39dKeOsTuFKSCIZuimeaFknrEJu+yxnOVir/AWLKXoMYm0dlHK7DUiEikgRq6XdG4oQlrii5g4Omzw2C4GqOu0v3vfmkV6usBeRtoac/1nWmIxRMDZYK6H4UX9UTyFBpqBdNwFYr4HeCpJHHDLKLPsys/ZbdFCKTuFHTWuEJPXEgqMqe6lVLRvuoCNmf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eC9BL0gzOVk3VklCYUhYNHNTQS9rbXIzejZCL1ZmMTFseERtVGJ4OTVvcGpy?=
 =?utf-8?B?VGtmWHV3TXVHazhnWjhiVzZIZSs4TkRMcXYwS1hpWVd1NDhJTFI4eVZkYXph?=
 =?utf-8?B?UHVVVS8weENBcG9KNmM1WFBPdVB1aEZpQ0t1K3p1dE5uZWlYUVgwcGdrZUVS?=
 =?utf-8?B?NmpQNXlaUTIzcDVSNjFRd0piZVhqaXQ1WTBqTFVOeHFXNG4zaHc1NWQ0ZE5K?=
 =?utf-8?B?c25OZmY4RnJlM1pSMWJ3YXNKVmpZOVV6SW9URkptZ1NiU0pZdkdLdTRUUHRs?=
 =?utf-8?B?RnlXNDZCNHd2d2V6NHdONFVhNHc5bHR3Q3hvbW1DUkY4Q2FjTmtUZVp1VENr?=
 =?utf-8?B?VFQxanVZUDY3M1I1ZkxLYjRDekFOa2ljdStsTTRjUDFES2l2VnRsMlo2ekJY?=
 =?utf-8?B?L2ZXSmFFV1lSaXhtY3I0cytpSFNRR3BvTXVZcjUvcTROa0orRjJnYXNSL1hn?=
 =?utf-8?B?M3dJUGJ5TmFMVmd2WTFwZ3BNU3A0aGROSC9DZ0tIeGY2NFpWT2tSSG1MdjNU?=
 =?utf-8?B?WGszZmZybmJwU3gzWloxaUFhNm9ocE1rWnBGcXNLdWZzOVZWZG1VV1ZLWHdT?=
 =?utf-8?B?V1dHdDl0Q1pRNk9TbTVIVHJZalVPZnphWXNzVkR1L3daZjBxQU5QaEFUdm51?=
 =?utf-8?B?WFphYVlPOVZlNVEzT2Z5QlpOQStiN2J3d1F2L0Rqd2Z2M3M4UjRVbmhYTmpp?=
 =?utf-8?B?akY4QWYyZDVWeW1BQ29UZy9wRXQzUENrTTR6VTFYSmE3a0hNTERKU0h5NjdQ?=
 =?utf-8?B?WEl6dEJZclVmVmhYSGV3UDh4b3BCa09tZ1Z2U1ZUN0Ezd3d3bVZzY3M3ZlAx?=
 =?utf-8?B?VXllZktMelQ0S2N5UUJNWG9iOFpwTWM2N0VNQTRCd0EyUVpXQTdRa3gzT2U1?=
 =?utf-8?B?bGYxWUJEWVFjaGVGTStiUVgwdkV0UTM2dW9WYXpiRnhJYUViaXBVb1R2c3lJ?=
 =?utf-8?B?Q0dwbXAzbSswSndCeFJ6cmJHZUFPRlRzaEFZZ0lSMVlWMTJXSk9wUTFiVEs4?=
 =?utf-8?B?YmRETnRNbURLcndZOXA0UkJhZkJvNUtjYk9WWjJsR0dCMkhsa2Y5a3N1SFBG?=
 =?utf-8?B?cXYybTdFV2tNNjJyVHVBZVdkOHJtWkwvcWZkV1I0QW5Ca2I5UlNlcVBBd0Z2?=
 =?utf-8?B?ZlJXSmFsSWhQV3RHWE0xTGVaL3ZraUNqcDB0NktZVTUzZk5nYnJodVJZYjhN?=
 =?utf-8?B?MnJxaDlmTk5aTUdRbHRuSUhOWjlBWlZNYjFaK1VZMFJiMW9UZldnNGJQK01S?=
 =?utf-8?B?ZjlONVJReWxseTFJOFArRWgzbThYU0d1V215MkxDalBxUEd5bFhEcWEzL0M5?=
 =?utf-8?B?dkRIaDNoYXAyWGgzcjVjOXBlQSt5cks3eGJ3cG9LMXUzRjRKNlpWcGtmQUpu?=
 =?utf-8?B?elJ6TzE4bjVqcytwMzJxNHR1R25Ebk9RSVlxS1BUYnhDNDhXYVhSZ1ovZFpr?=
 =?utf-8?B?MVFaZzJTNElHYW05SWNlNVZzV2EwaFdod0hCRWZEVTJjekROSWR0dkRwZWEz?=
 =?utf-8?B?cklBSlByL3dtc1VPNmUzUDk1TUZRQU1sS2FnbTVEcGxuMElVNnhaV3h2VlNZ?=
 =?utf-8?B?T3VlbnlpV2pVVFNYbkJJSjVVVEJmb0V4RXpOMEVoWGQ3aDFzTXRaV0t4VUZt?=
 =?utf-8?B?UmZvbUdNMkxRUThQNURMZTZ1eXJxMGE2WUoxTW81b1NHZGQ4eXliM3JWVVBB?=
 =?utf-8?B?c3RadVlRZ3F5MFRkT0ppSE1kejRrT0pLUTlRRGNUZjFSRWRDMkNuUlhnRVN6?=
 =?utf-8?B?b3FvbW5lQWZoNHhYNEtmOVhkbHRISlZsQWZpd1MreFFTYjNUbjR1VENYblV2?=
 =?utf-8?B?YXp5WEZBZHVkbm1JMXpWelBpdWV1T21wN3pzczVUbXdvNTBROUtTVFFiWEVE?=
 =?utf-8?B?L1FaZWluNEtmTk42SDE5bHBmVkRFQURXTW9INVZYNnNmUXNoVGlrR09qNjZB?=
 =?utf-8?B?bmdPcU5rTkhYUHBGcnJyV3U4aHFEd0k2WnVvM3E1OVExR3YydG1RajdJdEZ4?=
 =?utf-8?B?aDJMYzdXa3c1QWp5aUlpdHVOT3hxbi94eGtjaVhEck1MakorbC82YVN0OGNB?=
 =?utf-8?B?emlDTjlkQ3Q3WWlvZndRUTVKbndDbnl2YmZQYXp1RlNaVDVCZGNmNmQ1dllI?=
 =?utf-8?B?RzhCMlh5dVVxQWQ1RWxRVkcwdzhqbndpd0x4OTNxWUZmV0VBRThrWkpCYjYz?=
 =?utf-8?B?enZXZDJZdmwwNk15ZytpQjI1aVp5NnBhZEhrWjJGbHRRMGU1ekQ3UmQxc0dC?=
 =?utf-8?B?Vys5T3JtbVhsNSsxdGRzcFV0OC9GRkMvYnQzWFJuK0dna0FDVDVXZEU4eUg0?=
 =?utf-8?B?N2gvTHUrcWZua1pLRytKby93STY3UUd5Z2lZQmVoKzd2dUlXN2Fsdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26214e40-4f1e-44e0-4fa9-08dea528a9e9
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:18:40.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq2jUMV1WNOX6zb5QtX4RUi+e0Dn2077HfbH96YAT0DKL65txK3PyPeK4FCOMQs5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753



On 4/28/26 15:12, Krzysztof Kozlowski wrote:
> On 28/04/2026 15:09, Michal Simek wrote:
>>
>>
>> On 4/28/26 11:14, Krzysztof Kozlowski wrote:
>>> On 28/04/2026 11:04, Michal Simek wrote:
>>>>
>>>>
>>>> On 4/28/26 10:47, Krzysztof Kozlowski wrote:
>>>>> On 28/04/2026 10:33, Michal Simek wrote:
>>>>>>
>>>>>>
>>>>>> On 4/28/26 08:50, Krzysztof Kozlowski wrote:
>>>>>>> On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
>>>>>>>> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
>>>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>>>> execution.
>>>>>>>>
>>>>>>>> The binding models a soft-core processor subsystem instantiated in AMD
>>>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>>>> execution. The remoteproc device is represented as a child node whose
>>>>>>>> reg property describes the firmware memory window in the processor-local
>>>>>>>> address space. The parent bus node provides standard devicetree address
>>>>>>>> translation through ranges so Linux can access the same BRAM through the
>>>>>>>> system physical address space.
>>>>>>>>
>>>>>>>> A clock input feeds the soft-core processor subsystem, and an active-low
>>>>>>>> reset GPIO holds the processor in reset until firmware loading
>>>>>>>> completes. The firmware-name property is optional.
>>>>>>>>
>>>>>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>>>>>> ---
>>>>>>>>      .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>>>>>>>>      1 file changed, 98 insertions(+)
>>>>>>>>      create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..f16657dc0d9f
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>>> @@ -0,0 +1,98 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: AMD BRAM-based Remote Processor
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>>>>>>> +
>>>>>>>> +description: |
>>>>>>>> +  Soft-core processor subsystem instantiated in AMD programmable logic and
>>>>>>>> +  using dual-port BRAM for firmware storage and execution.
>>>>>>>
>>>>>>> Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
>>>>>>> completely different thing from SoC and there is a design WITHOUT SoC
>>>>>>> using this remote proc?
>>>>>>
>>>>>> In 99% case this is going to be used on Xilinx SOC with programmable logic next
>>>>>> to ARM core.
>>>>>> soft core means - means VHDL/Verilog code synthesized to programmable
>>>>>> logic/fpga. It means exact location in chip varies based on build and constraints.
>>>>>>
>>>>>> hard core - physical HW location - like ARM cores in our chip.
>>>>>>
>>>>>> (ARM is providing RTL/code that even ARM cores in fpga emulated platforms are
>>>>>> actually used as soft cores).
>>>>>>
>>>>>> Not sure if you want me to talk about that 1% use cases which are also possible
>>>>>> but don't think anybody will design them.
>>>>>
>>>>> Then I would treat it exactly like every other block of a SoC - you need
>>>>> a SoC specific compatible. If there is a fallback, SoC specific
>>>>> compatible should be used in the fallback as well - that's all already
>>>>> documented in writing-bindings.
>>>>
>>>> But which SOC? We have ZynqMP, Versal, Versal NET, Versal Gen 2. And all of
>>>> these will use this configuration.
>>>> Do you want to list all of them?
>>>
>>> "Then I would treat it exactly like every other block of a SoC"
>>
>> No issue. Here is snippet.
>>
>>     properties:
>>       compatible:
>>         items:
>>           - enum:
>>               - xlnx,zynqmp-bram-rproc
>>               - xlnx,versal-bram-rproc
>>               - xlnx,versal-net-bram-rproc
>>               - amd,versal2-bram-rproc
>>           - const: amd,bram-rproc
>>
>>     The example should also be updated:
> 
> Yes, except what I wrote earlier and is mentioned in the writing
> bindings doc - the specific compatible should be also the fallback.

   properties:
     compatible:
       oneOf:
         - const: xlnx,zynqmp-bram-rproc
         - items:
             - enum:
                 - xlnx,versal-bram-rproc
                 - xlnx,versal-net-bram-rproc
                 - amd,versal2-bram-rproc
             - const: xlnx,zynqmp-bram-rproc

Good now?

M
