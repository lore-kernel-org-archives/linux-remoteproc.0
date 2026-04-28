Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300626F2B0;
	Tue, 28 Apr 2026 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777387140; cv=fail; b=mfXE4uBSvuTQ8qdYQ7CTndjiqphAkk8ms0YSkDAnM+0eX7Z9Aa+qcv9pOe8cP8t/Xds2Zfy/3QzphyCbIweZB3AZovwElhI89g8ERMkfywNBV5Tuvfqeo9ElCLVWcNofNjwrkhsgjT/IqdCjsiav5QfGrPX8pRgCEH8qYkpY0DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777387140; c=relaxed/simple;
	bh=KnwyTZVZh97UIezCxm8ybyN1DcIvzTGjHIk+UjtZoF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RFiZbfuee4KHiBMwd4qAB/1Rjz7YVikQQkAywKjoCPz+4bosOKTJM29lMidubDAXiVhB4MYTqKrR7bTWCov/0XVAsIQHPtxAIEm37L5TatuFGbd2UYeJq4FPndz1SKIiRHDDT6IWmUF9CZ5eletsO4bWr0RmuptYCR7N0nu+nxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4XKsHhbM; arc=fail smtp.client-ip=52.101.57.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4XKsHhbM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmp+yfOxwVda1cfMM+aKe4+dXbS8+fstBKl2CozaVcyHzGEVx7iQL/oz8XSBklfjzhbx3Wqgu44PwAqRffMVph8Vnp3acvSXrx6PL1UEJ5pJ2jZIZ8DihIH0iw8KPsvKMi2ptV9X5TFsotkSfu12tPBiKHk13qCvm47rHU8RHfRAMN8R9S7RhU1X8/Ia2RSyGBLYJOFp0u2DGoIWax+U3z4NAelr7j6sfQjeltJ5lJVw5LrvgVsFvQrAEjf0UuI9g3ebir9xHKmuz4m37n2fX7J7MMHHySLs5SGpDwxL1jJkVaFJYjVXtGJ8Ixmlwd1Adnj//IgAQuBzQVjwtVRISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWTV+zpooUf+vBbUnZu3e6HC/YCvpdAg3Gs4GYcyKZE=;
 b=Ixoa5sL4n1nLyfpjioqef4xvO/j62XfGAAv8P3tkJtYLEMVQpjPsqgbx/DranTjShscDJWQNHgKyRdDIbJMMJKPyreBeQLE9DOq+i8tVnvzDYLjKUH4KD3tjLSIVtYTyGVkYZwqoKc9YIdVhidy+7A6pCQTIS279bCQPMRaIK9zdctz9kRIoK7TvH+spTWPoSeDBN2tqLDo2Dewf9985hxis3xS6dLfndEy/i6itlhOYy6hAyYuWYFhIRB5dU3ppYZMQNJKIi3A/crsp8rvCnFC+tcew3P4FIpCDHuPmsfw/tPsTLz04vzOM2TgvUlcU7L1woStBS2lrr1Tb4gqVtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWTV+zpooUf+vBbUnZu3e6HC/YCvpdAg3Gs4GYcyKZE=;
 b=4XKsHhbMpHAgjqpkLFQ/5AH9wqEswbIVuk4h1bJzWh3k9dOXNHpRhbRwa6P0qLumeH6ljEYcM5Z9Jg/Tc8LBi5w2CyIRyrpasNhfp93uNkLEFNSK5bgySkEGMN50U0+uL5hRwD2x8WQICUHDqWsXLgOJhGfWe10MeJmGFtS3z6k=
Received: from DS7P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::10) by
 PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 14:38:53 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::ef) by DS7P220CA0020.outlook.office365.com
 (2603:10b6:8:223::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 14:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 14:38:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 09:38:49 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 07:38:49 -0700
Received: from [172.31.134.241] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 28 Apr 2026 09:38:48 -0500
Message-ID: <b12db749-1a6e-4013-bde3-421633861b3a@amd.com>
Date: Tue, 28 Apr 2026 09:38:48 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
 <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
 <faef3c54-2292-4470-be6a-4c347ca65453@amd.com>
 <67f442f7-377d-46f3-82bc-86053e34c277@kernel.org>
 <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com> <afDEgHUN8fWatC_u@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <afDEgHUN8fWatC_u@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 826fb304-be84-467c-3fc1-08dea533de51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k4DvfLuG1K29bBwwuS/WRdrMr2Abmlqz+fJ4tVfWbdCkVLlQz6vFa0awIb6fP77UrXNIEXlFY8sM2vIZ1WLzzh117qZdKXUF6vnR9Fr1YzOXwqNYri+L0/GEo7lxH7+DbH2PGWPNVsOAh5aCYDOyFN0ylrz8mR4yfGx1srL5Lb2MHXcXwSAhvs2IZ4D80xncpt8WGtmNLWyOFLG0/9JNwtO7IleOEcF2bbyCdg570ZO2UdRyUaKbpFsruTkvokuw5d/MIkRTORcLmasO8FfNjsb2x/NxIEgzmdfDcSuaQBlsf2EuuxFIL/0eLeHL3KMne6KgBJQCoZdiksxr/yFIU+IKbA/nuKi64JYVYrRxGGI0l+ohkCtswJA47HQCulnLDso6DxzbMgQ9TWq+lFHpbTJf4NdQK+ziKki7yAUm6rqRNLbP0r5Up03ov8EyM+kNhIu/PfAEMVr8nDdYmtCfDFrwzWRnAz3C08pdMqu5lx6Z9JPYH5u+InFpNQ1+ZVtH6Vr5F0wr3FxV13WJQLlOxfnocFV7xrV+0MP073OQLs+1U8yI7fzQ7AQMQCYV2fJo6hMekRuNz3WQsK1ygfGNGUr6ceFf6r766y6dlBr8g4JEX3MUxxkos621yE2YyCgxw5t4D7BSg9FB1kPTIlx1WvhGdCK6rGAWyUPxRfZgygP2ydxdrFXMhWmqfWItVHo/C2ipk+S5V3W7ekW6gCQHsRe12ORQimpsGPkGwV60VmRG7ZR4hvX5dOzH7pWXYznogFRAMq28tRgAKM7XHh1ksQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AcHQJesyHEjqZknUjOoG21LXXHQYMva5wLbH0w4lIRBOlh2xlW6luUzL2KG4FbNpSM5LNFxhI32ja0Lmrk6D/Rfz8Gb+MqI12KNJ0OEaf6QRfMugqyRakVhQfOjyDA7VZo+iTVihOTwvkQtylijFxE99yDs8NlSxLZd/Psg9Ycp9mQ5pPKCQW9oXxJW3M0FIfgjz7/EbN0bgODU9JQhj6QK1IRmf30fxH5VBytjscUvxZ4HpEDJqJzo7G82PVbdx6XMvF7te26yoKUrcMn7L+7s9LVPTaVzf+nbzS8yagHqUNZdOhcokbQsPcyBb+7I5x1ZOofSgB/3yN8DNS98ySdWioUipjqPzBlFVbc9Y3vNRRg9iseW9RXVanbjpqzhY61XuJt2BB8lodb0BF3RHF7MJ6Q932GSuGm4NtiSvA9QjMNx9RyyoiCQPvoXEiXBI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 14:38:52.4353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 826fb304-be84-467c-3fc1-08dea533de51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564



On 4/28/2026 9:30 AM, Mathieu Poirier wrote:
> On Fri, Apr 24, 2026 at 12:52:40PM -0500, Shah, Tanmay wrote:
>>
>>
>> On 4/24/2026 11:53 AM, Krzysztof Kozlowski wrote:
>>> On 23/04/2026 19:59, Shah, Tanmay wrote:
>>>> Ack, I will rename it to xlnx,auto-boot.
>>>>
>>>>>>
>>>>>>>> +        type: boolean
>>>>>>>> +        description: remote core is either already running or ready to boot
>>>>>>>
>>>>>>> And why is this property of a board?
>>>>>>>
>>>>>>
>>>>>> Not sure what indicates it is? The property is under remoteproc child
>>>>>> device that is SOC level property. Remote core is on same SOC wher linux
>>>>>> core is running.
>>>>>
>>>>> So it is implied by SoC compatible? Please provide some arguments why it
>>>>> cannot be implied by the SoC compatible. I gave you one way out, but if
>>>>> you disagree then no problem.
>>>>>
>>>>
>>>> So on some SoC, the bootloader supports loading and starting of the
>>>> remote processor. But it is totally user's choice. User can choose to
>>>> load & start one core of a cluster via bootloader and leave another core
>>>> powered-off.
>>>> That is why it is not possible to decide based on SoC compatible.
>>>
>>> OK. The problem is that "user" is a bit vague and usually user choice
>>> goes to user-space.
>>>
>>> The property will be set or unset for ALL of given boards. So all of the
>>> DTS->DTB. That's why it should be clear why all such boards should
>>> behave like you described. If this is truly user, as in user-space,
>>> choice, then DT is not the way.
>>>
>>
>> Okay 'user' may not be the right choice of word. I should say 'hardware
>> configuration'. On same SoC, some cores can be configured to boot
>> automatically before Linux boots, and some won't. So if device-tree is
>> about hardware configuration, then we need a way to show which core is
>> configured to boot before linux. This configuration is board agnostic.
>> So I think auto-boot in device-tree makes sense.
>>
>> The only advantage on this platform is, it has a way to detect if the
>> core is running or not runtime and don't have to rely on device-tree.
>>
>>>
>>>>
>>>> If we don't want to make it a device-tree property then I can implement
>>>> in a different way. New way will detect if the remote is running or not
>>>> via EMMI/SCMI call to the firmware, and take a decision based on that.
>>>> If this new way works, then I don't think we need auto-boot property at all.
>>>>
>>>> Let me know your thoughts.
>>>
>>> This works for me and solves my questions from DT point of view, but I
>>> cannot judge whether this makes sense for you.
>>>
>>
>> I say I will keep it open ended for now. I will avoid introducing
>> auto-boot in the device-tree for now, and send a patch without it. In
>> future if for some other reason this property is needed, will send new
>> patch later.
>>
> 
> In light of this conversation, should I still review this patchset or it was
> made obsolete by "[PATCH] remoteproc: xlnx: check remote node state" ?
> 
> 

Hi,

Yes it was made obsolete by the mentioned patch.
Please wait for v2, which depends on the mentioned patch and removes
need of the auto-boot property from the device-tree.

Thanks,
Tanmay

>> Thanks,
>> Tanmay
>>
>>>
>>> Best regards,
>>> Krzysztof
>>

