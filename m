Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B538836E;
	Wed, 15 Apr 2026 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776233773; cv=fail; b=ACtGraOopkIlEuK30GUMRQF/AftvZile4atxdC9g2ZFh/mu9aQWNCZwyc1we8g/xhP7XGkqF/GOEFYyHitEIwe4BFy+rUE5wqMYPD8c91xPSpDpwPw4YM40KI+IG3tMUfuKYFpwCKOk5rJ70/zwWjbK0CaZMQiLISzs73mjvN3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776233773; c=relaxed/simple;
	bh=P5O0W1ti/QzjGMVxvp0vwdDA4TX02OMTqnE2vNDHmMQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FFzKSWgK3DTbI0nO7hokOtzqu/bNEtRIxGvHcyDJ/GZubqjJiR8LYcabKHbRlgga8eSQ74XVq1nB+08xNjOK7P5u8B0GJon1PjtI8eoLO8sn06ENoZfCXXw+an2wLxVymK+VPoEgZujYcjYJviHeKb2wgj/MnPaEf3j+9pHamTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rMWCQ6Qy; arc=fail smtp.client-ip=52.101.193.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rMWCQ6Qy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD3GVSxZbXEe2MFhIp4VRXi9GW6UPAuRYh3w7ukFPbVcGMydHk+4erKxc6MBvHkLLg63+8RUkY4n1YhyMIlJ/mcXVq2zN2ICNsPy6nwx73LzohROBpJPS0QEVAzTrf9575HyTBB9UV4K/qCAwX8pdFijB+A18Ip8lWZTcUSGYU04/G+C5P3zhuA3TC+v1jZHcJFzOf9Lk43p/yeMEfNGi/JPiqb1AO+/HRbvHZEwzNdBEF5logwrEDmxtTkZlEfair33mzUox3DVYIfZm2P2AvMH/7AYZ0GLCuHKOOnI3ys21oaXW86Wkv+z/w9CiZt/wmznPNp5KwH1xzT+s7l5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQ10A42HCMqcWFkS1vTFMRxig+PtYys5fls3dfqpbMc=;
 b=CwclJYVivQAI/M3b6SbyF7b2Y2WEEx+IlYLMh+5c+f4zMpO52RDh0LXLzRDP0oY6Qcs+g+VJAWhtY2LIN5lBYPmoPVLDuX0HnS5rC8s+1zZrrQbK/zEfkyMcmQkgxPeGoyx9yEfvrSEIsxfDbqi83eeSp30j4j6/C3Y9py/9Zjw83pqwdj9J+f6WPtiiO8a6FtA1Z6vAJUMIFouoev45QmhekVaIq/XsvZDH4F9xymGkR/0h/szHt8DgCXGVBzdY4xH1M/ezP2T3xY5zswdD1XmgzzKq6IHVb6bnhitIoS6m61TJIIjrtYjj1urNd9FlLr8gDU7EjgRqU7EyJN169g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQ10A42HCMqcWFkS1vTFMRxig+PtYys5fls3dfqpbMc=;
 b=rMWCQ6QyNGIsDjwDQPxcba117clq8YWCCysgajx5nVIERs7Ss4KDbC/HWuVt0+pH78eTn5UbOqErahnMB6FuWMzLcqgVBXJt4S2JUX3cbBrGyRYdu4I8kNtt6hH00I8MXq6U4mZMhSky74PES93cLEY8bo8MD2XDSb060x7MFqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Wed, 15 Apr
 2026 06:16:08 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 06:16:08 +0000
Message-ID: <e82faa64-22fa-4dba-8cde-f02cf9f95e25@amd.com>
Date: Wed, 15 Apr 2026 08:16:01 +0200
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
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <774a8e9f-cfd9-4584-aaf0-2fd1189f65e8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0141.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::29) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: d03e2994-b6ff-4887-be6b-08de9ab67b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	Az2u7fYHc1aJDweiEpUQaRG2JYm3oV6pYEWK0zM0nkCvnrA0/XCdKJGHYohGd5dj+PcvTzfZrJrCnzAqvvCZTlMM1s3irETMufRQTHhh9LdtheIrZA3crY2ic4okMwnenu7lXGU174Vbs1iU4eGKVAreemoYUdRG00Xs6M4Ja1lclD6G2hx9gKZ52Bq4i/WcYtmazh8nAaASqLqIySCnAj9LOt0D61fuCLymA2+KsUlYivwXN+InJQ5KdgcyP83tcl+czTSVa6iMRjKrxZPDFUddEm5fbM4HxHcG0j2CG+vHeD0JeCbhVNfM1tlqh9xQIURQjaohKSkkwVGsYxqUX3wWL6bJonLjZu0XiK5XG2qTV6tiJ+CgAfqCyvNii3DFWWA2CYNZAnY8mgvleR7I47q6xi4QO+DlqX+1fLOdnl8X+RoD+99cKj4dVdE+Atu/AkC1411vudSpjOmM3JnJqIuM6uLrGA3pLYHadKQgiYbr0AceGgE6PIA4ATl/4Yendc7Y336pyc200O9057hDDMtZ4sWbaIoP3R7OleiTy3H0muBR/A8n/SDKp6oFNkgiUofeBFdn8fTo6rRA29mcT8bCT000DlbKLB8PVNRLwLXG7ajKxJrS2NDELelVfh1OdZgGKcNh3qMJQw1bnASPycP78v9yJC3QIsf3WrKItbk7tJFPaRzhwcPqCEjCneRi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGNGVWZvN1ZOSHhPQVJjUDRvV0s0NzdIWlZuRjY5QzNleEVuTnFqUzUrcmJh?=
 =?utf-8?B?Nmd6T1NrajdaSmZISlZId2RrZ25XYmlvZHR1YkNrNHhRZVVQQjJydG9NZCtT?=
 =?utf-8?B?ZXRvTDBaYlpKaXpTMDI0L0pLQ2xlTjN1Q2dKekpNRitHSmVKUisyeDZyZ0NJ?=
 =?utf-8?B?OVFITEVocHZhVFg1NDF6VmFQUE5kMkRpaUJmU25rSWFXczVrMUs2NWtFcWxj?=
 =?utf-8?B?VnlJNThyclhFcTloS2szRWxHU1R4M2pia2hJdHNKak5VRnJOcEJYS0tJUzhU?=
 =?utf-8?B?WUNLVXlCNHV3dDFaejdLWnZBVHZvcS9RZ0JMSGdKZjVOdGdMWXFKaGhLRHVN?=
 =?utf-8?B?MlhJYm40QVVwTHV6aTdVNUZSMUhyYnBtZTRiQW1YSHIxKzRLVnp5elNlajl0?=
 =?utf-8?B?WVdMdTYwUFhQdlhvNWFjZ05tbnZORDV1aU03QlFMYzhheFRMOFZZcGVtOUdD?=
 =?utf-8?B?eDM2RVRnZVZHMGR3T0Q1cTR4ZEtDK1Nqd2s4NUVsZm9EcWtJVWdqam9XZC9P?=
 =?utf-8?B?cGFtQlR6ZXF1S0RtMWdMVVdRS1NhMXJlS3BXNmdaRmROemU5am1xMENjUmp2?=
 =?utf-8?B?ME5PeTRKajdCbVVXaktsRUtqaXNtWjQ5aWFVUFVoOGFnVjVCTlNGeGxPY0Nj?=
 =?utf-8?B?TnZ3WmQxK0NBaE1VbXZPYUpqOWZ0SGZhMlhaWWozWlRHNHFPNVhONEhDQnpM?=
 =?utf-8?B?a2EwekpjZFNEZWZKMW10RDZBb3YzNWk0Q3RPbDhFMjRBWmlWb2NUWno3QXhH?=
 =?utf-8?B?Y2VSTENld0lWNzRMOHpWY2tiWTF5MU40ZFY0SFNhZjJxVjVyWi95bjcrdWs3?=
 =?utf-8?B?YkNqWHBEUjhFMEk5RFdrckFoVlJaMU51dVo2MGFYdlYxNWtSWElVeDBwUHNV?=
 =?utf-8?B?N29malgzQmlXbFc0NXZQSGE0NmJpT3R6NFFYd01mNGxZQjM2aHB3WUp0STYx?=
 =?utf-8?B?Uk5HQzBhMEJ6Z2VIZGROUlQzSTRneExFai9lbUFITFEyRmtvS29lWmUvajF4?=
 =?utf-8?B?S2paaTBSWFNaRTMrdDZtN2FFM2RxY1V0TmpnTjk3NktrWkhjUUVHdjNLN1pS?=
 =?utf-8?B?UjRnRXpSWEVHaUFpdktrc29IYnZqaXFmYzJjcDFnWk1iK3lIb1R1c2FYVGdS?=
 =?utf-8?B?aHpQaERaeUdoWE9EaGhTTFBhVkFTRXhxOUlBYTluang5VzNhdk1ZK2grMUNX?=
 =?utf-8?B?SDhuNUtidzByYnNKN3c1cGFOQmR3OERkNGxYVk9jVUNPMUdESFI3aVkyWGdr?=
 =?utf-8?B?VjAvRzA5RTViOGVPK2IvaWJXSGRBbGtFcXdBbGhLN2s5dlFSS2UwT0EycFpa?=
 =?utf-8?B?YXR4SjFKbHVWUEpQRFRQOWgzaXNFbktlQ2RJd1ZpOGtUVDBESE0yVE9lbExJ?=
 =?utf-8?B?cUpxRjV0KzhyblFRbVRtVW5URmlsQVdJNjNOZzY0OFNOSmZzMmx2d1RRUW9J?=
 =?utf-8?B?a2NrMHNBbGk2R2dNWktLUE9hM3cvMURsdXluNjB2bXB1eU92OGRKQ3JwTVlG?=
 =?utf-8?B?dzRsdXRHQVp6R3JxSjRGT2VRUCtSWVZKMVRtRTc3RHYrdyt2MFVDMExTR0lv?=
 =?utf-8?B?UVdNWmtaVTQ4bmVDVW5LRGtRM2ZQUW5xeXhrYTZ4NTJkbjVNZkxtSTlSeHhR?=
 =?utf-8?B?UnNQM1pqbzdIeGQzWmlqNFgzaEV2bHNrSG0wVkZmMGp0eGxOL1JWdmV2aTNZ?=
 =?utf-8?B?L2k1eVVBVTY2V0xiZko5b3ZPUWtiUWZua3lsNU5zc0Z2WHpJeEpON0FhQTc3?=
 =?utf-8?B?M2N0dDc5cHNILzZ1SGZqTHFldnhsN2N6RFFQZHhXY1NmMUgweDZZbTR1b0wv?=
 =?utf-8?B?RnNhUkJ0WUROUGQ1cmdnSGhtOEdISG1FWmxQYmlYRFMyT0M0L0N1WFpTNWU4?=
 =?utf-8?B?U1A2eC9OV09aZEUydmJsMkRFdFRZVEV1ZnFGak5hWGlYUlJrZmpLdFhJcWIz?=
 =?utf-8?B?U0c0Qnd1WHhZRC9DWVFyQTZLcW1LamZMNEdIZzNiaitWU3hGaUhkcDNDd1NQ?=
 =?utf-8?B?RVhxT0J6OG1JSXFIeWJUNWRzeVhxYlE5ZjIzUHdqcFN1Zy96UFh2MlMrS3Fq?=
 =?utf-8?B?MzFwampvOXl0d0N0QWl6S1Z6NXlDRUdHdFpjdENNdTluT1NRNzFmNmZQMDZw?=
 =?utf-8?B?Y3lvbXgrQnpVYlRRTWNnZ3pOS0VYVXBSMnQxdlE1SGpIWTNRK1A0cXR6Nml4?=
 =?utf-8?B?ZVBmRzJSQUlQUG9QbDdBT2p2dm01Y0czamhrU2V2aXo3TmNQVTdUTWNEdDRT?=
 =?utf-8?B?Z1B2Zk1GVkljSHkxR3I1Y0xzRXdsa3gyZEhkZjhBN0hYOG5vT3NocU4xYVVZ?=
 =?utf-8?B?UmlqQktySHdwTnl2cW1IMGl1S3VqUjFlbHI5RmhYRzFZMllrNGZsZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d03e2994-b6ff-4887-be6b-08de9ab67b5b
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 06:16:07.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMXZVQqiyCHsCKfEYbXwyCyLCHazh6hIreHukYysPGVmqWisgkUJwYlru9FWzc/S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077



On 4/14/26 19:53, Krzysztof Kozlowski wrote:
> On 14/04/2026 18:15, Ben Levinsky wrote:
> 
> A nit, subject: drop second/last, redundant "binding". The "dt-bindings"
> prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/amd,microblaze.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AMD MicroBlaze remote processor
>> +
>> +maintainers:
>> +  - Ben Levinsky <ben.levinsky@amd.com>
>> +
>> +description:
>> +  MicroBlaze remote processor controlled by Linux through the remoteproc
>> +  framework.
> 
> Describe hardware, not Linux frameworks. IOW, Linux framework is here
> irrelevant.
> 
>> +
>> +  The executable firmware memory window is described in the
>> +  MicroBlaze-local address space by the node's reg property and translated
>> +  to the system physical address space with standard devicetree address
>> +  translation provided by the parent bus node's ranges property.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^remoteproc@[0-9a-f]+$"
>> +
>> +  compatible:
>> +    const: amd,microblaze
> 
> microblaze is architecture, so this feels way too generic. You need SoC
> specific compatibles and I suggest do not reference architecture, but
> name or the function of the processor, if there are such.

I have been arguing internally that I think when you look at driver itself it 
can be pretty much generic loader for any firmware and doesn't really matter if 
target subsystem is Microblaze/Risc-V/whatever based. And I was suggesting them 
to use more generic name.

Because at the end of day reg property is pointing to location where firmware 
should be loaded and gpio is a way how to start that subsystem and there is 
nothing Microblaze specific.

I can also imagine that the same driver could be extended with optional power 
domain, power regulator and clock properties if there is a need to drive them 
before subsystem gets out of reset.

Does it make sense?

Thanks,
Michal
