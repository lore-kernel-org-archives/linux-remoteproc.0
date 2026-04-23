Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CBA36D4E1;
	Thu, 23 Apr 2026 17:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776967152; cv=fail; b=kmCcqTYfPfUG4hGUFvAUmwtChlETyQqXhXCejT55ajjt1o55oUfSa4z1Rp3Jay3lkQJWGJpqZhuI5uXax0fjBvHZV61a6d8YfHPLvRa1sSudUSK3ZsB6r8MvOmHDFpy7bfvRQqt7MoJ12n5X5EMPGi2u9+bMvttxmJbug+wb754=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776967152; c=relaxed/simple;
	bh=HyLwLr784avC+fdCgL5f/BVBdWW2BJopzdRG55/mXzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XNjUiabJRzXOfA9pJTC/u2cFPpQYLfBrN4x0HPKm/gpK68TpLWaPvMxD1DBHrSBlSYyHCkarU5VBVrvFu+RJtSv3DyDZJ4bOLOWsAo7UQr37zDLjARq1LPnAVZGT+BnSMxkxBVlvVLNHjC8bfqYY+vM8fIvwRBnbJ5m6F6dmUDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D2FVSuwF; arc=fail smtp.client-ip=40.107.209.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D2FVSuwF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwBtouaNzNnSUoPwfsWfdGdzA4j6xFRPioSzlsiDxMtatR6xxLF5/noXZ2jhmQTf3hF35LYvW/B7aQYxO3Pj3fcsML1YuUfrsB1In6zfVi05QHKwMNIMXFw0YjQN5J4+uVJywFF02/KXJZ1fDJDoTF8PKmGTkPAxOaFTLJMhWTauVrz7CW2ls5R3Dj3dTa0mRr5NdDkLwOXTyg3Ijp83RZMQfLGbrWh8zra3Ik5ZTVwxy2BH4MEYs91a+SBFN/7h1ccvaIhqXS2ASPBwxMAun7cKIWvvhlmgcXghiFrr+xT1+gzg3kgYzwikMotkIBIZksdmCNhjXe/Bn4jWtrn88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sURWs2TE9ZdP5YO5BJRmg7n6Wsv+oJO4INdwa53fOWc=;
 b=oyfN3QlGKMbbANssYaNzVlLuC3mplh95ZPPCJzNa0mc1DIfr/PPMx9kQmCCvGKgau6XbHRZpKEmoITei+SeCke3O/zeo4CNp0242W0wqcGUE3aqWu3XZw5LXKgwS5qbY/i8QmBaSv44hiZ5XHqwakkFb0SijERkMeMmy01fdBpsnwLp2z4AwmwD7tf/SjgNMFXQTfnqcn9Tnu6S0JWMbbJzGEphzmgWgRmTTFkWkNPJGk+w/ZDGquUXyOuU0urC7Q8By+zOqkeOXvchgf1dB+crLShUFwt5U4hJB3gqVzCr0DiM2geAE3xNJRO25XQiKIFFsJArLVJt9j5faYjND8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sURWs2TE9ZdP5YO5BJRmg7n6Wsv+oJO4INdwa53fOWc=;
 b=D2FVSuwF6fYUxZfoZjJuRoUyPrj7ijSygIw6pga/5RI3mSpfc9PmqElnorcVG4ZuDVkAWbt0B4A2rwunWRIXHXJavRO07tO9TTA+OHwhYQ5NjDvNn1MTZWhxWG4vxWHoHtKp/6WYpsRtM5GYTe1hQWeYmO/EXGt3efc9bb/bPM0=
Received: from DM6PR06CA0077.namprd06.prod.outlook.com (2603:10b6:5:336::10)
 by IA0PPFDDA81179A.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 17:59:04 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2603:10b6:5:336:cafe::52) by DM6PR06CA0077.outlook.office365.com
 (2603:10b6:5:336::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Thu,
 23 Apr 2026 17:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 17:59:04 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 12:59:03 -0500
Received: from [10.254.48.177] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 23 Apr 2026 12:59:02 -0500
Message-ID: <faef3c54-2292-4470-be6a-4c347ca65453@amd.com>
Date: Thu, 23 Apr 2026 12:59:02 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
To: Krzysztof Kozlowski <krzk@kernel.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
 <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|IA0PPFDDA81179A:EE_
X-MS-Office365-Filtering-Correlation-Id: 7182a2b2-33e7-46d3-5a69-08dea16201da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r0W/XC3BHd53nI9um5jF6G0Uca8b86JP2dnTuE0D2VxK354EaszLhPH0dyK7EduKTpmhzHu9lkWqUE5mh5AkiSzs58h/Hiz6/K4cMPFOwTCyLP+eUm6XV5My9bLstPDvIGpnNAOjpL4VPKlxfKIfxUt7fwUfvGDcel5G3F6NeRsgMQlRZs75CHn/SiRFrTgjstFs95q/f7BQ/tzGE2VKz/IBUFaqK3joeu6dXj25y5zdraYHq3aAfwMHK8cP9UATvokROYwvcl2jf2OwtpfqA8JQKD7cPoeJ/cBULc14TH7OA3wEkovkn2LHg87tnCAH67LuGrm6v1eCzZpQdzijUkojxBzRo0H4dBf9UE+5D5dUiLskW0NS3ddTctIoAWPsjFpSp/mIOAakL6c3Y1t7cfdBO+PvKEIXKJiWXMVXkxag/NZVdC1Quo5EuVN53HpWK7WFI48WpU2SxvM3iGS2lo2GYWlG+cYqI99CKccjL/ujTgpMWd1TX2vhXxPBFhyLMuvKZ3ZSYuxqEya6kfBooOlNlt8drMaeZTpEj69mIVuotYbel66eRjIUVoJHoMsLBHjLxA4HNK7H69/ALsqE05SF21WETa+TrqEoSTUg2zR8sjLqDDiqQztQlk9yPqDUdA5a6pZrN00betbv2y7Be0Rb/zsF29FIph8Mi55jHTrT4s0R4OxPVnhbewOw8e0Vy+wljJEW3U1tsjMCdz7IfW8WLPD0aIT185PYjl2aAUe1I0Oe+QjqovyXPNMf9I2Lj6moS4cIBYz3p/h8bEdRVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iCpI12uKZqzfw+lqDAFZ68nWD17EAFbtbAA/JZauK4q6lCGeLtYMXJBbjl/ZA6e/rva4uRuQ/gvrWoYmXydnPIBpayUb6xWtdrs2AtSLeDMAfohJw84AVejWBEake32v/k7MyMoXSrlZ3aECDuNc0b3da3EKe9xAivp6wno1e4ptVQjycq475HfQKiKCVfa3Byl4pqIp3eL7v9MZpmlRyylfKkk++z65eWIuGlSMjIjgckZ6UDz+RpywPTysDpKUVKenMZB/V3toHimXkHUS8UPHrgSdEarMGp9eHwdIZoksBUsHSasraPxw2oRk66KzShqKEL3FTMpboTSTGoB36tXcuYrjulQvZ5iTYlzuhBy8pl4Bp2AY/pFP9PnVnyLJopzQ3I8bDI2L0AQk8T1DZTmMc5jNvCoSyVvV32I+VudHbYGEEjUIc9fF0xuqf+9g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 17:59:04.2254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7182a2b2-33e7-46d3-5a69-08dea16201da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFDDA81179A



On 4/23/2026 12:26 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 17:14, Shah, Tanmay wrote:
>> Hello,
>>
>> Thanks for reviews. Please see my comments below.
>>
>> On 4/23/2026 4:09 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Apr 22, 2026 at 01:25:57PM -0700, Tanmay Shah wrote:
>>>> Add auto-boot property to notify that remote processor is setup and
>>>> ready to boot. Linux can attempt to boot or attach to already running
>>>> remote processor. "firmware-name" property is used to mention default
>>>> firmware to boot when linux starts the remote processor.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>  .../devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>> index ee63c03949c9..0d27260e3baa 100644
>>>> --- a/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>> +++ b/Documentation/devicetree/bindings/remoteproc/xlnx,zynqmp-r5fss.yaml
>>>> @@ -135,6 +135,14 @@ patternProperties:
>>>>            - description: vring1
>>>>          additionalItems: true
>>>>  
>>>> +      auto-boot:
>>>
>>> Last months, I have been asking AMD to follow writing-bindings doc or
>>> other DT guidelines way too many times.
>>>
>>> Or you just sent us downstream... Do you see anywhere such property?
>>> What properties do you see? How are they named?
>>>
>>
>> I should have put note about this. Current auto-boot properties are
>> named like st,auto-boot fsl,auto-boot etc. but nothing vendor specific
>> there. Can we have a common auto-boot property? Similar to
>> firmware-name? If we agree to it then what's the correct location? New
>> file remoteproc.yaml is okay?
> 
> Common properties go to dtschema, so it would need to go there, but the
> point is that it's way too generic - every component with FW could be
> called "auto-boot". This should stay vendor property, IMO.
> 

Ack, I will rename it to xlnx,auto-boot.

>>
>>>> +        type: boolean
>>>> +        description: remote core is either already running or ready to boot
>>>
>>> And why is this property of a board?
>>>
>>
>> Not sure what indicates it is? The property is under remoteproc child
>> device that is SOC level property. Remote core is on same SOC wher linux
>> core is running.
> 
> So it is implied by SoC compatible? Please provide some arguments why it
> cannot be implied by the SoC compatible. I gave you one way out, but if
> you disagree then no problem.
> 

So on some SoC, the bootloader supports loading and starting of the
remote processor. But it is totally user's choice. User can choose to
load & start one core of a cluster via bootloader and leave another core
powered-off.
That is why it is not possible to decide based on SoC compatible.

If we don't want to make it a device-tree property then I can implement
in a different way. New way will detect if the remote is running or not
via EMMI/SCMI call to the firmware, and take a decision based on that.
If this new way works, then I don't think we need auto-boot property at all.

Let me know your thoughts.

>>
>>>> +
>>>> +      firmware-name:
>>>> +        maxItems: 1
>>>> +        description: default firmware to load
>>>
>>> Can you load non-default firmware later? IOW, why adding description
>>> here, what is special?
>>>
>>
>> The rootfs contains other firmware demos, and it is possible to stop the
>> default firmware, load other fw elf and re-run the remote core.
>> I don't have strong preference on the description part, I will remove it
>> if redundant.
> 
> No, it's fine, I wanted to be sure that such use case makes sense.
> 
> Best regards,
> Krzysztof

