Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4323A0E8E;
	Wed, 15 Apr 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242144; cv=fail; b=hD7MKQILmAfVbPsyKQ/Q24wrkQqyWUxpYpWyX21yoQRK9d1JOmtmLH3Y/Yf1hlLhoRvxHJJ58qeBMiVLPRmlmQ1xSq+kWjHnn7tcjwbzrCcPmOJACn7UbE5LX/ISR5Hbg+8buOXMgV+lXxsx26H5y/qYdzZaJjjW3tomj1DwLHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242144; c=relaxed/simple;
	bh=Vb7z7uEb2n2EQHIi1Oa9EJQ1tPQIJerIA5tgUvbrC50=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K4Z4KgzBOk+nNTmjVSBA/NBZ5RJpRgxt/sU+X0RB517S1zaqvQj4aSlzK2lT1XppmdXDmX/j8QrkSnZ7URNDLPrDpIazNYf15hYxi6RPwkzDIxgfY9KlvFAd7WY55lOAv7qiq8Ne3DtWcqk3SAnwMqAC4GqD/82UlVJfObI9rlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QITjPHhN; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QITjPHhN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZP35Y+6KrOCPcxPbWRfB79B6UHdWkVXsB0WY2vZF9Kcq8W4aEX6RKSHfHo1YRE0h+8m8C1FHlXoZS6IgHnB983BJH7G+rl0SxjMXaCDpJu/yVKlcSszCU5LLeYZRiSMlS/Xif33Tb2IaS+5pPtzhT/iyHldvOIWqFaMebFNgiKod9hVwVGgFSCsJ2Xt6GvDTAucMGcTrAgevluYEa0+lZY2VHgaPd6Gi7l/aCwrtXPottcXwZ4bQYzpMHqeHkx9vXTgDCqlMfjBNgd+ldfTrJJ447qup3U6mki4Ca5x9fCK/+WSz7BTl5ioq2Adi+uNOkEAbXjUJYYpjINngG3ygJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLa4oKp0WNWS91UYQ3fZ8/gCusGfBQEuEphGYDpr0UI=;
 b=ynqMPr8bzeVvI3TNh91nK7UTHqF/BUjKavJp1e11qreyHxyybbM8kXwDEgo5eAyj3tnsMeHLiGzN8dqmI4gZcHDIFR2cIWQa5FLgLVfqg6evciPElp+kg9wrbaFRSl0UieIkS5IeMggrxW6eHDdidmAUzTyvZj1uDBsZipUKLnRqibYhf320k8JHtMUoZ6KhmqMkxNkdXntni2tSAi515wXVCmoPUT10gdojBKGBjymtzQQejFaRuf8BpW6UHuuEU+F+Z345G0r9m6rOuslU1CZeChoafA4ARVgEhnGI+sgcjjdOBnbb8SYPX0xJ+Mllyy6/g/y/cNxBew+w2MvL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLa4oKp0WNWS91UYQ3fZ8/gCusGfBQEuEphGYDpr0UI=;
 b=QITjPHhNoOfXpM13QrOs9rcRZPvAdhPA1erhlCmN5CpYaJigxV6ZASjEzO/oJshelBfxUAKgu5p9WWv/T6cNkZphAL9S7DIUy4teHbelzuow5IyyoH+Ekd6gy1HRo0rjNctuThB59OEz91dSE85/apBo0OokxVtFeQiAa4XuCAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 08:35:40 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 08:35:40 +0000
Message-ID: <3e29dc94-30bb-4989-94f4-2cadfb9f4f23@amd.com>
Date: Wed, 15 Apr 2026 10:35:28 +0200
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
 <00aa7ec4-121b-430a-9b83-1430dfee2998@amd.com>
 <f5cd25ae-712f-4d0d-b24e-6ca33501f15d@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <f5cd25ae-712f-4d0d-b24e-6ca33501f15d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:15::7) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: a198d25f-e0a9-4bf0-2c69-08de9ac9f98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info:
	dIwTKC3slz5gygMskLn60a+78S+6n0nDxzW96D44OvRn+uhFLpjCEA+6Phj/znmbYq9ZwJmAMoHox7bREW6SqWb7Ky7V6OTr4SUziy93D9VMK+b+rdRLmABpPOnC9kSQWLr9Bryhejg73ru9Exjqk5PDOyF+gSWXpJYKCsb3TMRRh9VnSF8LSM7alvZi4jbLOXEkSbBb8fBwjC9nvQ9sWcMfWkGspVY+p4Y9mOYH5U9D9h0/kn52BUD5LNcbw+nTdT/jOlF/S+/VQnLqcHVym6kYdEB65igqXGJUNuCTw++HEFof8uEIQ33+1Un4N+hh1CKedfDe2K7rm4JAqVslpUdNf5CdeRNHwXMx7wekAzGa/GJZ8xaORL/NXkL5DhQSon3RyenvwSb4NTA79LZuONkjHgyO9FqCM3vBVdtrJ0qLSX5WkCWdhgEKICgkLOX/X/uDpjsx7/1av3TjGpK+iNPC6olUQ4/oN3P1iPt+5g8ghf/Jvogi+qClLOu0iaP9Rtws3VNsENsx/wgQIUwEcF2rb5pqPvWb+BZ7BQYTCyfJwG0HIrRHWXyoanEMFJUiv/9l+7nUgwabvTmRjfFCx9UqvSWXVpWrOgufdJ7/dycsm81ssWa6E93RVvB1Mp1UyNgPrsUCbRXLEsNiymC50rvHNCkkivXdiF3F1Ra1VihaN3gngJ6iZDT4MaGt5XrpCcWBPK2uVCoDzvTgRuGUnqveFtjPkSdmv5HpheBBZEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(18096099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aERndm5yVmFKNmZFcHN3a1VqaWFNdHBiaGFDUEt4ZEM5ZWpBNDE5YnhZSHJp?=
 =?utf-8?B?dGtRZDhoNVhLenc1TEdUVERVYTVGNDUxcWpIRjZJbFRYYUFTamhydTdjUHFk?=
 =?utf-8?B?RGErdVp3QXErbXZsUnAwUnVaS3NuVFF6WWpzcSs3Z3pyM1FHblpER21qTkxl?=
 =?utf-8?B?dEJTNjArWGFJRDBYdEpMUkFlQ1EwVlcwTmVsVzk1Mm1EQkNGMldSWnRkY0hh?=
 =?utf-8?B?a0xCMEpCdnhZcUJEMTBqRHBTN2p4N2c1K1ROT0lvdTRHYTh2WDd4WGdtakRB?=
 =?utf-8?B?ZDJhM3hlSGtkVXBNYkFuTTFpZExsZTJzKzlRaXZvV3ZZQVRMbG5KZnhrMmVv?=
 =?utf-8?B?dFloR2dtcXpLSG94a0p2elA0eGNpYWY0VnZvWDZmVm1paG9kekJLRTB2b0JR?=
 =?utf-8?B?WEx1NnlOeUtMdHh4T0ZKbmRET1lLdnVRTXNZU05USTF2U1pYRDhTdG9VemxW?=
 =?utf-8?B?eCs1OVZWQ1IzRTQ5c0xjWXhEQnZEMFM3Tkd4NUlZUTVMOEUwclo1eTFlQmEy?=
 =?utf-8?B?UHdxSERJeE9QUlBXL1pPaWk5Vm84LzN4aVQ0aHp5UWlZQk5wN0xhLzN1MStE?=
 =?utf-8?B?cGxjRzRXbUR2a0ZMSTMvMUxUalZiYjBlVS84WHFac2pId1pyd2RUS1JHamhX?=
 =?utf-8?B?eUlSMkM3RDlFTk0vbUJmYko0dTdnYU5CME91NUlIdG5rTFR0dUo5NmdxM3Nm?=
 =?utf-8?B?ekMzbnJpZnBlZUpyOXlFNG9vOHpTZlRGNnRnUVJOaG1Vc0ppdzVTWnNaWmdB?=
 =?utf-8?B?YWhEaHhnR1JrTngyMkRQNkxsNFZVY2RkbGpVbTRUR0RtVHM4NTBlRlhRd1Iv?=
 =?utf-8?B?TjZ1N21WWlFjZ1VUSkxucm1ka0NObERNZXVIQ1EzMnlRTkczNlZZMHE5MDN2?=
 =?utf-8?B?V2I4NnJrdjhaVmk2NEZad3NrZ1drNzJsM25sU0lKSXlYb0FNSEN6RTQ4OEFl?=
 =?utf-8?B?RzlTQTJGWGw2YUpmNTlCK1MyWlRmMm9vUHlyMTBHU1pwd0dudkRSTWdOVDVY?=
 =?utf-8?B?azBmOTF6dzNlM1B2cXFpY2dvZFMwZnRYQnVLRXJycjAzRWFDT0NZc3B2V05a?=
 =?utf-8?B?QjFEZHpwQ3BvdXFrZm05NzQ2bTlxR3pUbUtET0t2cXFBV05ralNhTGNjclpT?=
 =?utf-8?B?Snl5emdzQy92bG1rdStaN1lBOU5BUWkweGhTbmFkbzRzd2lMZDFadWFIVE1v?=
 =?utf-8?B?V3BmWVU2cnprbE9KSzN2VTgwcUI2UzVXY1BzdE5yZUpPdS9tVlh3R1d3WVdB?=
 =?utf-8?B?dFlJSThFQU4vVnRaVFp4bkhuMUNTMXFURDRnZDlZc2ttNzJWN3MyLzk0OGgz?=
 =?utf-8?B?dmVJbUE2VFRGckFXOVkxYlRxOXU0dzNoSk9oWU9rdFpaZk5HcTc0bWxyYy9I?=
 =?utf-8?B?YWtaRWY5M3gwWFBhNDlCWnkrQWFOZGR5SVVrSUZZWkxmOTJjUzc1MG9ES2s1?=
 =?utf-8?B?ZnYzS1Z1b29mc2pLV3RFYTBILzlWaXdCSjR1QzdtNUZmK1VodTVIc3VjSUFV?=
 =?utf-8?B?cU5QdTdqbTBLNHRYYTdlUjNyTjU0OTUvWmNSeE93SGNpRVJ2MlhYMjlyemZX?=
 =?utf-8?B?d1I3L3BUb0gzRE04dmI5VkFZMVdxTHhqeFA1SEFlcFRXR3FGNEhiS0JpUXda?=
 =?utf-8?B?QnFqTFRNRzkvNlozcmRERWs3K29iSUNSTjIxWEJxMlhlRHJ4azJ1NVU3YUI4?=
 =?utf-8?B?Vld5Y3g5eFRHdFVXbzd4YXRNcXNsR01MaCtoWERibzVCUGIrcjI1cElBQTRu?=
 =?utf-8?B?VVF2VnpQUlRaaUFrSXlPMzg1Q21ORnQyV0FoNkl1aWZCVzhDbzN6SnRtNjQz?=
 =?utf-8?B?eXlFVVZ6dE5vVGNPYWZCcmFyWmorbE1DR2dzRFovV0RXN2NDZU9lN0xXM0J5?=
 =?utf-8?B?NkRsRlorY3BNY2pkckVLWmhpTXl2QjhXZlhxZEpXbnlXYk1OWDhlME5jZURX?=
 =?utf-8?B?ZUpSUzI5cVlYcFh1TXhSUm1LekdLVk5mYldqdmJha1J4RTNjcXR4L2twSzhD?=
 =?utf-8?B?S1NBdEJua2JsQUJ6S1NrWDVVdnJLcTZ6NnliMm5iQ1JWb2JKSGkvallXNGdy?=
 =?utf-8?B?Q0VDbDFCeHB4R2ZxZFYyaWtpalU3bWt0aHk4OGNVdERMOGRzN2NxYnJReUpP?=
 =?utf-8?B?bVkwT0poUENvZXZENVlMMnJEa0dCNUlOMG1zTE5XMk11b0xvSFA1cFB4VDZa?=
 =?utf-8?B?L2psV01SWHF6RjVVdVNmaGJyT0pBUmRnSmpMd0daSnhYL0RwbWRCbUtxKzRV?=
 =?utf-8?B?dkZYM1BFMllGVXAzSnBjMm50MjlwVytZZUdSdW5YeDZtemp4T3Z2QytZdUFU?=
 =?utf-8?B?OTBTUTN0V3BmRnNVRDNNelk0ZUQwUUdSZFBjVmwvWGN1UG9uWE9Edz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a198d25f-e0a9-4bf0-2c69-08de9ac9f98a
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:35:40.0631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1PGY7sBsIpg4Uv2YmZOaYa1nPw6PH5qY1oIeN+NqM3/VOB10tp2SfdfZG/JitMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719



On 4/15/26 10:24, Krzysztof Kozlowski wrote:
> On 15/04/2026 10:06, Michal Simek wrote:
>>
>>
>> On 4/15/26 09:07, Krzysztof Kozlowski wrote:
>>> On 15/04/2026 08:55, Michal Simek wrote:
>>>>>>
>>>>>> Does it make sense?
>>>>>
>>>>> Yes, drop from DT. No need for generic stuff. Or describe the hardware.
>>>>
>>>> You need to describe that connection to HW. GPIOs, memory location, etc.
>>>> It means there must be any description.
>>>
>>> No, you can write user-space driver or pass everything through SW nodes.
>>> No need for DT description.
>>
>> The firmware memory typically sits behind AXI-to-AXI bridges and
>>
>> interconnect switches. The bus topology varies between FPGA designs.
>>
>> DT ranges-based address translation is the standard way to describe
>>
>> this, and pushing it into userspace would just mean hardcoding what
>>
>> ranges already provides.
>>
>> I don't think SW nodes should be used here.
>>
>>>
>>> But if you want a DT description, then it must be for the specific
>>> hardware, since the hardware is not generic.
>>
>> But there is specific HW loaded. It is loaded at power up and don't change over
>> life cycle. What I am just saying that access to this fixed HW (in fpga) is
>> generic. At this stage memory and gpio only.
>>
>> What I was trying to say is that the hardware topology (memory window +
>>
>> reset GPIO) is the same regardless of the soft-core cpu (MicroBlaze,
>> RISC-V, etc.)/fpga, so naming it after the ISA architecture felt wrong to me
>>
>> too.
>>
>> When I look at other bindings. For example this one.
>> Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.yaml
> 
> That's a subnode of other device. Not an independent device.
> 
> Plus I dislike most of Qualcomm remoteproc bindings and find them way to
> downstreamish, written to match downstream approaches without respecting
> DT rules.
> 
>>
>> the compatible describes the communication mechanism (FIFO-based G-Link), not
>> the specific processor behind it.
>>
>>    
>>
>> Our case is similar the compatible describes the control mechanism firmware
>> loaded through a memory window, processor started via GPIO reset. What sits
>> behind that interface varies and is opaque to the binding.
>>    
>>
>> Would something like "amd,mem-gpio-rproc" be acceptable, following the same
>> pattern where the compatible identifies the interface mechanism?
> 
> Not for me. You have a very specific physical remote processor. That's
> what you write bindings for.

And we have it which is Microblaze with bram (block ram) which is mapped to host 
CPU memory range which is going to be loaded by firmware and start by toggling 
gpio.
I think what we only don't have is proper compatible string which will describe 
this HW. If you don't like generic name we can describe it specifically for this 
configuration.

amd,microblaze-mem-gpio-rproc for example without any generic fallback.

Or we could create a spec, design recommendation for this type of configuration 
if that helps.

What do you suggest?

Thanks,
Michal



