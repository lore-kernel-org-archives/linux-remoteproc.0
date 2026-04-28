Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010044.outbound.protection.outlook.com [40.93.198.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C563372EF3;
	Tue, 28 Apr 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367482; cv=fail; b=JW1LR8EJdyUie110v+51+7bTOm6fn4YHFYoOJyYyNVKGINfimYw8c3Q4SwTsFyp7Buix7MT5MTM0l0UpUcqWPfCPM0ewxvaXd0Y1GYXfxSEqVxnQvw46K41ok0Ej9hpYTNCDl+5alq/ObFY3dDp+3+KQ0fa8ADqRDmHTVmRSLmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367482; c=relaxed/simple;
	bh=/YMdcp0O1TccagQNchK2yI/SPUBJEEzEQTlhJnlzpTM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E1EAf4WXAcoX5LEhFQUJSRNpDhWCdALluBeIqZbIhkH0/zdQH7/H5EMITkWUfzqIi4/lXUVcFv2DDMdV2/SYHcIL+f6aMjUP4/ujY4gCRIPZmlFJmTziblAUHjCka+XN/wfRBsSgwfKJc8SWTwV2S0hGu+gAXdBV5dZ6XS+mwvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xJt7daIT; arc=fail smtp.client-ip=40.93.198.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xJt7daIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9B4pTCMiIv94aPZ6PPfFw07WGhRJmaN2Zk6G47+q8/D0tztMuEofd/UOn6nU59lG6jY2yDMeaKQErMVzYfjx+cJqPdPxbRnYFE04glAwEB5wEaDP73a29GjHNUSCF4SKkLSvYGu7FAMxo8oqGeWAydGWxH7D7vZJWYBBZuOpUK11IrbzBdOO1g3/4ZqY3gYC7cKyfHgpQxw+bgoldBnGk88+S8HvwjHnGqRYk78qqQm81T6wyaPrIOtJNInJxaBhnv3MToXJnYbsZOyff66/2rMv91SfScBfbNfDQoMFwe/o0RwiHI6lH96gaxY/ZZe22doDItJDg3gFof9ggS7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poqTWISErlz2XrsmpX4XERcVGI1yCxvcue4h3ZjMd4A=;
 b=cfkWzF5QQk27GDaxyAAbxcl7RifKaUFl0/8nzewB6B4IXY4DDcdDNA/mFySPM4DsCn8UexJWPqcEOCUy0CfOqHjxBKUQeU70FOLGKdDubBbU+VuzEibZ58PyVzjDsKKMzBmVaT6DcfBZukp6WBSL/GNeVxc/a//+nk6fnnRNZ7pRD9sZwQEVEsT60vuSwBukbpGPVa80x5eS1kXCm3tHryXE+1FXKZB0sFtw92z40qBpDLGKLHf5pcPzcCEU1WL/J37kObRaOrtsDTFbONg2Mx2AEmAi9vI0vnaQWyD9RrkUK1B+uWWDae/uq+dFil0HQs+27uSsXq1pUyvZIQmAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poqTWISErlz2XrsmpX4XERcVGI1yCxvcue4h3ZjMd4A=;
 b=xJt7daITH/8Do4AXuTGfv2d2QmolkXvsnHMBpS330YcWbT2g9+TBBn+Slzvej39Izpt3sC+7IJpBNXNw7aUwAIkwHw+SS6zKXqlUu2ilRqvwzASbEPgDGPTP3UNi2islSjfu0Nr1bGwRX5brOW8iuKQZTo17z2mD0BnVdvIKPME=
Received: from IA0PPFAF4999BF6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be0) by SJ0PR12MB6735.namprd12.prod.outlook.com
 (2603:10b6:a03:479::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 09:11:15 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by IA0PPFAF4999BF6.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 09:04:48 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 09:04:12 +0000
Message-ID: <86e464f2-974b-441d-9459-dd957c16993d@amd.com>
Date: Tue, 28 Apr 2026 11:04:06 +0200
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
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <998b67ff-192a-478f-a9c6-ddcd7773e27c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:a03:338::24) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	LV5PR12MB9779:EE_|IA0PPFAF4999BF6:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f68eaa-e4c5-41ed-e380-08dea5051d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CTsS0pdkHlM+XBUQui8GwgFxrQAPqjrJ8gb6z5ScR+xIleH/h9eqCsZP4S2pCrxlAselRe7sXJCqcSOvIZr1AsWpFvxoYiewJN6jG5vi1Lx/44Lh1SsoeRizIYJKhdEIROjhlWi3vF63rQ95QWUa7bVi7DsdDYcSX1f0SgUQVlY8VwlUEdIRKia6CoXXInjn/7w2sOrPsrReImB4QRx7vROlA7JTi+V3p5R3YxZnmWwfBtyNX55o3qX3nx9Tc9HIze/zNJ4AKYmKzW5Nrf/Tu7BhjLJ+ILWiF7V8g3irNtznsUwSgNCOg2f6Upqi6/fTsmvNPR9AEW4aigvBhCNhGE4g69XYyiwNuIVOx3qforSCNouA6NIov0dJd4yWz8uzEouhXktb5jAfPj+NBwi16iAc6D/08Y5apAJYViZ5F/o3000suQ7G3BUCPjn2rWYorbrtMkEJ2z0Kw8n262MOc13Cq9W6qHfYJ8tLLyz0s6B6UWKekneVYiUETN5+3mBchylIMUxhr/u/mpQHYBA0OjyYNdoSbf+GzFdeiSiB+gE+IWyIwg2/Ea5P9ayT0+8ECKigAErJJVaUCAp6/kqp3G/W44G/w+iLUd5iWCdtlwsGuzEliReLaCGiOvdTQduOh0zV5M1bBDxeVAilKzgKnr9bB+cMVHBiYt70SXFAUDwJZgHGLP9QqLgNUPqOG2kq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPFAF4999BF6.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aStJcEc2Y2RLRDZMWmhqYVZvdElwaUJuNUlSa0xvcVlCblJITit6ZDBlVGhO?=
 =?utf-8?B?aFJKV1F6YURqVU40VUwyT1lzQlZ4SW8xMDRobnFsOFR6RDJ1Q1dkd1RsRkQ4?=
 =?utf-8?B?dEN1U3hmL3BmYWhHTm11cnhnOTBzY2hnY25objlaTmJIZXVYdjRueUxReU1m?=
 =?utf-8?B?a2oxYkVhNXBKOHE0RDBYNWRjUlNaQlplUzY1aFlEUnRNOHJWYVowWWdrdVA4?=
 =?utf-8?B?OU1rYlZNcVdaQlhXWC9LREtYcTJBZTV6UCtYbkplQUIrRitrRWhzTTlrU2cr?=
 =?utf-8?B?OXc3eU9BczVsc2ZNeTk1ZENINkMrc0V1MDhhZUJTcXJ0OHRzbEtsOFhYRkll?=
 =?utf-8?B?dElCK1NjTGFsOVdPYkdob1ZzRDdHN3ZIcUxLdmtEQjVnN2V3amJqL2dTdHhO?=
 =?utf-8?B?UXdobTJkZ2dwQ2dsbHpzQnl6WUdxVjhrT1JCdEc5a3NOS2JTaXpnZGl6Unlr?=
 =?utf-8?B?N0RoTlR2T0pROUJiYm1zdjF3NGc1MUptbURWeXM0eFl6ZzBmTU1mbUU5b3Nt?=
 =?utf-8?B?Yy8yWWlrM0pBNHFWQU5CVm42Zy9nRTJqWUpMVzVkZ2ZJZVVjNXd0ZVN6Ri9t?=
 =?utf-8?B?SXNnNDFlREkxSTNOM241dW5EdWdkVFVkNG5vWG1FQ2ZTT3hOVC8xSDdscGZW?=
 =?utf-8?B?VGJ2UnV2Wnp1bE1qcmNzK3NVVXVOL0l0UjRTbUxqOUNiSGl3bjdqQnRxVUd0?=
 =?utf-8?B?bk9BZ1A4eTVJazBXYUFoQy82ZCtuOUpaeElrdnN4MWdqNlUzckNwMVIvY1gw?=
 =?utf-8?B?S0phaU1uSmwzUmNHZ0N1U041M0xRemFGNzdlNENlcVkwZWxKUk5FZlg0Z2hW?=
 =?utf-8?B?ZkJEdHhMM2NGa2ZDZFI4Q3MyNW0rNko3UEFGaUNjTEN6L09ROVZMb24zd2Za?=
 =?utf-8?B?MFVaRFlQM0MvUGJ3Tk04bmRsZHFtOUV4TUVPaUh1WDlKb2FSQWR6TjRXRjM4?=
 =?utf-8?B?T3RwWDhrNmpMTEI4eldGb0txWElFd2JGbm5wMmJXSDdHN2Y3cGRCZDNRaFQy?=
 =?utf-8?B?dHVvTXBDRHg1c3dTQVhQRElpNVp3WmRkMWxwaURWcnBVM2hrS1VuVDR0MFlo?=
 =?utf-8?B?eTFJYmxiNWRWTHJUQ0pDakJMOXFuMGErVXBraFJ2MlZwOTdPMHlXTXRPSDNT?=
 =?utf-8?B?UEhiL3NrbUFSbEpJd2NmcmVNUGxvTTBtSnVTR2g3aVVTT0lWajllR1RSOFZS?=
 =?utf-8?B?LzJXYXQ4Sm9nM0NmeWUwYnZwWVB4UXExRGdXbGdmNmEzYkRyd2pMTExjbWN2?=
 =?utf-8?B?a1JYSTVXeVljbVFsSm12d0ZlcUhvdnVaU3ozVUdoQ2oxYXh2WFdKMTU1dE5P?=
 =?utf-8?B?d21TUDE1bTVMVW55OVpNbUl2RDY0SytBRmlJdDV5d1JaYk5BZ3RJUVdYRGNG?=
 =?utf-8?B?U2Y5VVJDZU9HSzFQTk1LRmVHMk9FRUVMQjB2Ujc4alpsL0h1Ykx1cjZBVTho?=
 =?utf-8?B?bGY2ODVaRzA5cGRtMUp2ZDRNSkpHOVNJaXV3Rm9nUjV6UUMwWDNxK0FQS0po?=
 =?utf-8?B?eEtyZFQrTHVVZVI5ZTdDZys5Sm9uMUNpb1BOSzdOSDlkVXJ6RWNOR2dpNUIz?=
 =?utf-8?B?TlIvdU1MQ1BVZWR4R2tpSHBlSUZUOC9nK1BBalg2UEErT3JvcEtIRjFDTU44?=
 =?utf-8?B?WEFydWMyTmR2Z0RPeDVReXNiSFNCZGo3N1RqZFk1VTc3cjBISVdtK0M2S0Yr?=
 =?utf-8?B?OU9qNEdlaXB0NlZIVDJqdE1Eand6S3lrczJkNkw0N1czb2xSdnJyWVhCa0Zh?=
 =?utf-8?B?OUFRREErQjBuaEx3VytJWVpxdlhoNENGb0JEZjVMV1ZCM2JxbmRNMVpIZ2dr?=
 =?utf-8?B?OVhTdjdiNVdSZFlHUkRJNzcwK3dQSm9JM0NVbHFNSmNncmlKSlNxdHlBSjUy?=
 =?utf-8?B?QnZPNGxJZlNxUkJzck1CZkgyNTFjeDZvamUyQzIwSGU5V3phVGxPaEJpbkYx?=
 =?utf-8?B?Mk1xYmNEbTNCcCtvQlFaV0tzLzZYYlEzbGNTb0h4amtES1Fma0RYTDduNitZ?=
 =?utf-8?B?ekxCU25DRVM3OEpuOWJYWHdEaTdZUTFVUWgyU25ncG5GQjgyZllCM2pHNjRX?=
 =?utf-8?B?LytZUVNERFBQVUErb29FQVRnNVZpazFHS2F0N1BmMi9XVmdNS3hQY0tqNWZM?=
 =?utf-8?B?S3FzQ2xYdXgxdzNncjFLVnpRRlpDbWlVay9naDU4RjVPL25XRmtLV2JRZEkv?=
 =?utf-8?B?ZDFrWVlGbi91enlXUVB0dDgvM3NXYi9vZlBjUDRwTDlYajdWZDliTk50d0sv?=
 =?utf-8?B?REZxeU5IckxqenR6T2NrSDJzcWdJbnFjZ3djd0dkbE5GOHB0NWZpanlPOTdM?=
 =?utf-8?B?T1JwMGEraHY4SGo3eWJkbGxyeFgrcXhkK2hoVE5CL0dXRFh1L1hyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f68eaa-e4c5-41ed-e380-08dea5051d4e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 09:04:11.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXCPVT/1R3k+sAA3rTqJ8KqKRjazscuUW3od1eATE7M8msLTZqiiUOPctnCtp6KZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735



On 4/28/26 10:47, Krzysztof Kozlowski wrote:
> On 28/04/2026 10:33, Michal Simek wrote:
>>
>>
>> On 4/28/26 08:50, Krzysztof Kozlowski wrote:
>>> On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
>>>> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>> execution.
>>>>
>>>> The binding models a soft-core processor subsystem instantiated in AMD
>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>> execution. The remoteproc device is represented as a child node whose
>>>> reg property describes the firmware memory window in the processor-local
>>>> address space. The parent bus node provides standard devicetree address
>>>> translation through ranges so Linux can access the same BRAM through the
>>>> system physical address space.
>>>>
>>>> A clock input feeds the soft-core processor subsystem, and an active-low
>>>> reset GPIO holds the processor in reset until firmware loading
>>>> completes. The firmware-name property is optional.
>>>>
>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>> ---
>>>>    .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>>>>    1 file changed, 98 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>> new file mode 100644
>>>> index 000000000000..f16657dc0d9f
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>> @@ -0,0 +1,98 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: AMD BRAM-based Remote Processor
>>>> +
>>>> +maintainers:
>>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>>> +
>>>> +description: |
>>>> +  Soft-core processor subsystem instantiated in AMD programmable logic and
>>>> +  using dual-port BRAM for firmware storage and execution.
>>>
>>> Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
>>> completely different thing from SoC and there is a design WITHOUT SoC
>>> using this remote proc?
>>
>> In 99% case this is going to be used on Xilinx SOC with programmable logic next
>> to ARM core.
>> soft core means - means VHDL/Verilog code synthesized to programmable
>> logic/fpga. It means exact location in chip varies based on build and constraints.
>>
>> hard core - physical HW location - like ARM cores in our chip.
>>
>> (ARM is providing RTL/code that even ARM cores in fpga emulated platforms are
>> actually used as soft cores).
>>
>> Not sure if you want me to talk about that 1% use cases which are also possible
>> but don't think anybody will design them.
> 
> Then I would treat it exactly like every other block of a SoC - you need
> a SoC specific compatible. If there is a fallback, SoC specific
> compatible should be used in the fallback as well - that's all already
> documented in writing-bindings.

But which SOC? We have ZynqMP, Versal, Versal NET, Versal Gen 2. And all of 
these will use this configuration.
Do you want to list all of them?

Thanks,
Michal





