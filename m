Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074D82EC09B;
	Wed, 15 Apr 2026 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256889; cv=fail; b=UVEVD1u9q0ix51ny8ZvjrNpx564VjBVvbYYUqufQlOdQHeRd8vDGXQtpmNazIX7qFhpkGeQebpr7/AZX/CX4psAXDZpYwjpNlzmMBiwbF1+IQn5/WnVJ3FPLIK1QVA8/ywvcFcc2AI7B964kfhr3xq2Nzj1e6CaFbuJLnhLpraE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256889; c=relaxed/simple;
	bh=2OEpigMUGV8lwd44NMgv3P6KIhAO9vImMpC9byohMK4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XhSzvTzIZ57pHmtADE1nzN3MqcAM5wmeLxUtcLSOkBpw1w3WR2pJmUaF+JEJqSpYeYZzZCFNDjITMEKj2bFCKH6TlVXEulaBwTyNMjToZ0POLFptKKVCwOsUL6G4fAKG12eDf8ETpvBH34iZXkcqgPFBVM6ZEQ43UHi66Tajcjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0CTZbYwk; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0CTZbYwk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZfNlLYmR0DUefLycg2v61mwG6oAKTXbyGmdsFpl5nZKQUEEUDR+DKttOR/1zCQ0iVcyFuuwg+BdO83y5XqR2W9p4mb7il9jTDdsDxFokikV87FsYv36ucJoepDXpvnZ1roAsyZ4FW27uitFF48wxlN9GzbzrXH/2jPMlt9VS8F+q4gSOWKODqQnvoMb3V6zD0y5LPVfaJCAvwOGxm/n8VBr7Mj/bzmI7K2iwW9EezLts0hYce+HBU8Hl6+jPWWVxufsDQjCDn5/W/A1PwbHKYqpdkZhx7WyXcaYNHIfbqoz4w77jNnyjTJG/soAHd+X7+6tFuaRf/i819GShh48bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucMMToj9mOzz3JZhWdXm1FSGQX5XBUPUEq2LPbX0Yh0=;
 b=GeadLqLH5DAnT/EGi5Ov5b/T9JFNFzP1qtxjQ1ZzI6pyWzyIpSEF79YB64vUzicFbvbqkPtEH6Jk5HxfBpFsgenKZzvbv8CuOCBoMlRdn2/Jsl2QxN290JleXnVnmEXS86v3Ktf8Rsh8ibIyrqA/60ZegQGII3QOODKSciytG9EL0hI7+y0wz3RWdCvZONg156t7KljXavYc3uaFT9IESZYK6/jHmMWz4f5t25EwkrSgbGnVnobuByvtl/xe14C/PZ9+Yh54UagnwhCS4NIVh2VY86d7DoJn1FXeJJDJdnjSuFBlFJZA/uV5u/urBTz3R2sVf4P+JTYy+lm+ne9TzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucMMToj9mOzz3JZhWdXm1FSGQX5XBUPUEq2LPbX0Yh0=;
 b=0CTZbYwkqdPPCYTUcKYQ982GwTXDIZtZYT0+DCH3fNHFwpvfZPMAc1T8LtiB6vF0HhXwlzKXLDLeqjz0KMmbLkaEO41qLVMFMnQLS6UmXZh2pBv8dUql9y8unS9n8UdP0KcH6/A2MdHbL+oKAPuJGKTgecWt2aZwcWsVSxup0yI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 12:41:23 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 12:41:23 +0000
Message-ID: <b679fbff-21df-4f45-bdcc-787c00a8baef@amd.com>
Date: Wed, 15 Apr 2026 14:41:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: add AMD MicroBlaze binding
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky
 <ben.levinsky@amd.com>, andersson@kernel.org, mathieu.poirier@linaro.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260414161558.2579920-1-ben.levinsky@amd.com>
 <20260414161558.2579920-2-ben.levinsky@amd.com>
 <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
 <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
 <CAL_JsqKE1G+sdJnSZazVVyy=gV6iAz=HgtCOBXGz31qdzbUShQ@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <CAL_JsqKE1G+sdJnSZazVVyy=gV6iAz=HgtCOBXGz31qdzbUShQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH5P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::16) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a85b09e-c3cc-481c-6915-08de9aec4d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	wmqATl15Tqk1Drp1Qm5IOs+LSjnn4plvwA3LUcidd/wKU5uJLC2ILzrusPH1BZxus52GCLv6MqKGbmCwLcbWwBLlFAW04AAK9rpG/tGPV5zA3wwn5KAWsJ2XFHhpxr/ZmcZ/L8hnrGzM6dZFDOunLlj4wfGnXuoLBZoCqAvmJqrBoiOPIcyaUJlg/HY0il2lNKcnozsJDzhO1ymQjBN/8FodfYVmfUuCqoYgsY1yZy+SzTOYJACWXTa+zTciE5nI2tBtmSlQGHcPjrSGtm27B7xTHcGdqX4R11dCOZyNVM9KpsV7bhWp+jvYOhxgI1zYZN/10Kom3sb0US+7xazQFy7R59258+DGekts4EHonKVrIjpZCu9oMQ9MERRTVN9ZT1Q7FA+7d7FXqulT5qqbIqZ70PnugRzmz3DA5VWFkfUVQ0+Drc1OYbzmBTo8bThyPX2Kw3A7icXYs11Mgi2MptH9aUr4zTXXgjGmrz+r4EIa90EvNd4dwV6IMUXviFFKwuwOXn8T4Cvo8u7HH3XDgo75xK3VbCqPRSuvqrUm0xfOgnHU4p8CJ15/JTLksT1sojnhGZiWI6caYWywJcywZmTDnTm3niI/X8oMP3XV7BBYN2obXT/wRIiMzslQBNvQ+bxilmTdu2Z8aKZWOm1WKiZIXLviCQ1lBtoOEGUfBDR7HgN+k2FiVXsXFAGQ2j4j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjA5Wm4ybkplL1U3dUJnK0JJSTdsMFRpTENQZk83YytPS3BnS2hhRVNxTHJi?=
 =?utf-8?B?MC9xd1ViK0g1ZzNOcFE1UWlQa1hhb000OVJHYzE2Y0diN21BMU40cC9CTkFp?=
 =?utf-8?B?bzNKZ0lGWVpCUGMyc1NmOVNnWWlEOTMrcTF5ZWV2alg3SExIbDBLdFM1VmZW?=
 =?utf-8?B?VGJHcElDV3FSTFNxYzlzRndkU3BMYWpVd2MwV1F5NTJUT0ZRK3M4bFBaNzV4?=
 =?utf-8?B?OGdHSXFwWlZMaE10cXNFVHJiRkVzWXNxb0twcmZsMTVWaklKaHVzUmFaYmNj?=
 =?utf-8?B?WlNLVzd4WHV1dVo3cDB1Q1NpcG82dFgrSFJIcXZDOU56ejNtSit5WnBEUklG?=
 =?utf-8?B?cFhISGM5NVNBcTZzVzB5WWpTbkxBZXFHcDBjV29pRVMvMXVDMGZUQ2wyWEN1?=
 =?utf-8?B?WlhGVmkxd0Z0ZVhYOHlpUG1SdjhiT2QxM3JrR3B2c0wrRzdzY3U3dFVoN3hK?=
 =?utf-8?B?Rm1VQ2pWSFJubjN2alRjZktoMGVac2Z4dTVpQzV2SWo3SnY1eFpqOFBmNXQ3?=
 =?utf-8?B?MXp4UC9zOWhZSzlCNzFDZWt5OXVKcjFLT3dmVzUreFhsQzE1eFRsMEZ6eXE4?=
 =?utf-8?B?M0NDclpodVl0TTIwVVd6ZDBaWkJ3Z3FGdkFnTmEvT21HRm9LcEswU1k3SXVu?=
 =?utf-8?B?K1JNRUx3NUVVd29aMkZvVzJzNjhheHFNZW1nS2ZXM09NS2M5Zjh5dWZSaVRZ?=
 =?utf-8?B?RVQyMDVhRlJJYklmdzRSYjZOQXorMUZiakV0YVUyMmpJRlI2VGhyRThyOVQ3?=
 =?utf-8?B?WEdKeWpibWtNbzd1NVh2bW1ZQ0xTeklqMDlLaUU5bWhObDdoRHUwU0hkdG96?=
 =?utf-8?B?TDVUWXMwTTdTdnF5bnV2MWpURnBYSlYraG5jQ3lIS2t1SlhzWnJIZTlFTy85?=
 =?utf-8?B?cnZKaDNmaGdEbmFyZC90dDB5Q3V2aXRCSzYzcmVvVzR4TVFOT1Y3ZUsyR2Q2?=
 =?utf-8?B?dWVPN1lEaFFuZENQZFh1a1J6T2tRMjh3bVNvYkFyNHNWQUNMRHd6MnhxcGty?=
 =?utf-8?B?c1pSTC93UE9RMUNwL3JpTmx3dVc1bXAxOGhHZlI4MEI0SVJsUDQxcldFZlF2?=
 =?utf-8?B?c1M0cGx2RVQraVhReG9MY012UlRwYUhKcjlXTStwT1FFK0dIYVEvQmhxUFRO?=
 =?utf-8?B?d2pkdHdzQlpYQXd2V1F4cW9YTC9IVXlQV1pVdlBTN0ZETEFybVk1aGxuZTNF?=
 =?utf-8?B?L2Vtbkc5K3lQcWhRVndhZm5XVFJwUkNjcEV3b3JyWVZnRnRNbCt4NzY2cmwy?=
 =?utf-8?B?R3hRZTFOamJhdkVVRlZEU0lWVjc0R29lT2pKSEM2R1VERmZIVC9pMDNaWTQ2?=
 =?utf-8?B?MGVJaUowNzdDL05VcVhhU1FONEZadWdoTDFPc3RubUVsMGE0MzZHajFsbEZ2?=
 =?utf-8?B?SVJUTGJBc0pyeDljRmpObTVrUUNZcmkrbU9xLzdCY0xsOXUzeDVIYUxtY2Ft?=
 =?utf-8?B?MGNHRHJwRWNPVGM4SElmRnhibWlETmRJeFNpQkxMYVo2b2x3dzFreUJ3bmZD?=
 =?utf-8?B?YkdJYmVsQ3NvanZwbDZEUGU2SGhIQ0hzOGxCUDJxSGVnS3BMbHZhY0cyK2U4?=
 =?utf-8?B?NUw0a0lqNHIwL3JHUm0wL3ZLcUpObWtBQkNxOVJDRUc2a3JGL3hSbWhBbDl3?=
 =?utf-8?B?OVNKcC9JTDlrU2czWXA0OEVjMUdhMWJxZXBzUm04SGU2TTF1cktHSkFZemIr?=
 =?utf-8?B?Nmo1OGV6Tkl3UEZYV0pGVlhkZDVQb0k2QjBJTTlpYXJGTjMwK0V3VVdqTFl6?=
 =?utf-8?B?NVE4RENsWEs0YUNZNHJ1OE9mdTdleFpZRFFHZzhBR29HWGRpc1djcnNIbHJ5?=
 =?utf-8?B?SENYV0oxelpjY2VZNUZxd0p0Y05uNkJ3VEt4aWxMS2tXVUhZZ0lmeVcyQVZw?=
 =?utf-8?B?d2RIUUZTaUc3aE1WdU80S0hTb01YTEVTSTJuajREekZjTmdPWUd4ZUlPa3Rv?=
 =?utf-8?B?WHpJSnlDUGFKTDBxU1B5a2lDaFdidTZoNzN1THprekNzL1ZPN0dQTWRtejE0?=
 =?utf-8?B?OTNhSU5wdWp2SWs5QkRJSzRRV0Q2aVV3RXNHUzg0aWQ4TUJ5N0FlTmQ4Y3ZD?=
 =?utf-8?B?OTI0WVdubDhna3pIT1p4ZTI0a3ViditLWXVSMkFvK3VTMUZUOWgvNmJIckxB?=
 =?utf-8?B?U2hycTFtZ0pnNWV1VmV0dHN2Z1R1VHlUY3lVMnNjZW1PMXIrdG1lYWozcHVx?=
 =?utf-8?B?RGI1aVVoaTRyNURpRzk2RFRxUEZGNjVLZk81Rk5FNkdGdTlDT05Vd1BvYTRT?=
 =?utf-8?B?OXdXT05VRWxtWVFOVENyWGdJaDB4M1RnczY4TVdDSEd2MnlXVzJOUEplbk82?=
 =?utf-8?B?SFlsVHd5NEhJbFlmdldrOU4wUkIvN0FBbUQ3bVRTVmVja2JzVkFQUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a85b09e-c3cc-481c-6915-08de9aec4d64
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:41:23.5897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmd91NK6U/avmvJQhb6p4g0BtfK6Ueepit6A+xLW6DoWL+fNMDTA8lPnppdYtf4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473



On 4/15/26 14:19, Rob Herring wrote:
> On Wed, Apr 15, 2026 at 1:16 AM Michal Simek <michal.simek@amd.com> wrote:
>>
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
>> target subsystem is Microblaze/Risc-V/whatever based. And I was suggesting them
>> to use more generic name.
> 
> Generic to AMD though, not everyone, right?
> 
> I agree it probably doesn't matter what the processor arch is. The
> compatible just needs to be specific enough when there's some
> quirk/feature in the interface to the operating system, that we can
> distinguish the specific implementation *without* a DT update.


If any fpga vendor creates the same configuration description will be the same 
for them too. But not a problem with having it generic to AMD only.

I think the point is to come up with proper compatible string which you will 
agree on.


> 
>> Because at the end of day reg property is pointing to location where firmware
>> should be loaded and gpio is a way how to start that subsystem and there is
>> nothing Microblaze specific.
>>
>> I can also imagine that the same driver could be extended with optional power
>> domain, power regulator and clock properties if there is a need to drive them
>> before subsystem gets out of reset.
> 
> That never works because then there's timing/ordering constraints for
> enabling/disabling all those resources. Then we end up with a never
> ending stream of properties added which results in a poorly designed
> binding.

Actually even current binding should have clock described and handled because 
clock has to be enabled before releasing GPIO out of reset. If it is coming 
outside of chip it should still be modeled.

Anyway I don't think we have ever end in a never ending stream of properties for 
our IP and this is not going to be the case too.

Thanks,
Michal

