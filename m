Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861A18C26;
	Mon, 10 Nov 2025 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799974; cv=fail; b=uaKNqceKh06AdxrAjfe0WnEpJ15pV25o+FJ8w+931D7Vo+fRsbYntGBYa+fnPTGC8nqiXr8NegSCx71PwRljFJUYA0Sw5yjP22yoNyA1RjV2dF0IW/o69IRAh7MtYSQi6IE9/r1DLwurehrPLMJIDiUyStozi1o4ZRmFNIWfLlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799974; c=relaxed/simple;
	bh=lLbBFCKbGae0NASV9YrMl6dTt9AJXuvfPPYbmDrePVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s+i6LHTUvyeRRS+srIBXqOzW8W+TFIVWu4dLZaHwhsjqv8Zdr7l5hKs/v4BNqM6vGCV9IPTcp+VNbX8FzeTaZ/u1fEAn6XXWxKNP5tx7b8dV3aa08vyizL/CoqsTis0aW40ivVCkO9663yGP+gx6J3N+XdLkxBYv+fouJB0Af6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hRusClQo; arc=fail smtp.client-ip=40.93.198.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hRusClQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJGAWf/MbvWJgpc3IFYyHV6LCYLhRWmoSQcnyE6nDeqWe4wnVZ7mxUzfwmhtSYwby6l04YEukH7K0ruwY5Ll9KWNDYJFRAKs1QIWsu/oFEKPH+t8rNN57Zf5nzFosagNENVUppnG4DOoQe4EQkhTm0YMSq+yFtTOx/7981upWnTgIvlr9EcTgFhJMVFViX7EEdYktmVMvigxknEUrmdjM14owVbzOFyR09y4axrkxsqcPtHPyS0zBpG1V1NyKNhQLMXf71sDEqg/WE+z4YiNR9XxsWrGPSgvlCp7duiDYhnY3PRbDkq2yzT0tg4/b6zVSt/gzSFQDc877HrMIJFE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1mtt+1/lh3k/N+sdMeagqorK2EciFtIJKiNJSuUNQs=;
 b=b5wGp8deJMgppN/vvHyEBYNsVy47KzmC7x/yJ7y9yjzVaq/nxtzMyHGFKPUOuSXZdGPwMdQg1G5xTgCD6cewVHlYtH9fGaAOcsF3Woav5d0LqVQC+4W3Srwslw+NzXcLzhmETvQmuSgvKhDQPwK4F4IEpFoaBTohQghPiehdeTXuXFklk4wrABtW2u51ZXOLkWdBu++7forFDOg2VI4LDgCUZ0HIQnz9VBLBy5mVAeT/UvXepU+qSmDGEaAUmrbe+Mm73pVQ89rtlnkzaIfhRlDDXIXelx17hjq/8NnUPje3K6DdonuRtlu5t1sQT0+EBwo84X7ESh7Ub+4z2U6Jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1mtt+1/lh3k/N+sdMeagqorK2EciFtIJKiNJSuUNQs=;
 b=hRusClQoVgMOijbrDwsihGd4iU1A0wB+uBhFiuq+NWCzbX5V3Mi6rcqPKhcUsx2prN8c3xpf30ZUSmD4AL+p91LkWVU/hIVfzSQOvm0oTPHgnyBa2BbXmLvRozYqZzoImmcbOM7W1uxa/bd6PbAVzkqQEfm8/UkmcoKtA6aPDnk=
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 18:39:28 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::af) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 18:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 18:39:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 10:39:28 -0800
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 10 Nov 2025 10:39:27 -0800
Message-ID: <d14a778c-3298-400a-870a-efd76a0d9959@amd.com>
Date: Mon, 10 Nov 2025 12:39:27 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Peng Fan
	<peng.fan@oss.nxp.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
 <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
 <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
 <20251030042124.GA18595@nxa18884-linux.ap.freescale.net>
 <aRIo2MUol09Onu9B@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aRIo2MUol09Onu9B@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: e460c19d-22cb-49c2-3c05-08de20887b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1RpR0lIV3o3MkxCb0tWbHo2d2xDdXlLZ1F0ZjhML2M0MWhEb3BmNFVUQjN6?=
 =?utf-8?B?LzNTalR4a2MveXRzS2JGY3R5WVBZbjhyNldDMjMrbU96MmEvMElzT0g2UFMv?=
 =?utf-8?B?Zms2QnhleGt3OXdTc1dRTVVEaDdLTlI5Q2VqOHA3UmdOYkViY3RYQjZiVE1m?=
 =?utf-8?B?SDdMeFZqSXplQTBaZ3JmeWZ6WWt1MUZKMTNjL3JkbHlSQkpuVGowRE83Rm9s?=
 =?utf-8?B?N1o0aGdhZTJlL1Z1citxRjRRRGdUSkxMQ3p6ZGZhR3FOSk45TzNUUTJjZnR0?=
 =?utf-8?B?ck5veDduaHJpdXV1eEE2OEVYRUJMMnhvRE1uOXhUUURaTTNNQzgwbkduTDJQ?=
 =?utf-8?B?S1lIanl4U3NJUUNGaGd1ZnZUKytFSlhyc2w5bmNMSjl3K0lPOXBWaWVLYm1R?=
 =?utf-8?B?c3ZCN0xtalJJOGRCSEFGYk9vZUFBOUE4M0JNYWRpTzFlcnlsS2NNK1hoNnNK?=
 =?utf-8?B?WVNzaVFnWTdvcjdDbUs2czhyUjBMbFozajY1WUVKSW5oR3ZId1FBUkJBOVJJ?=
 =?utf-8?B?R0I3SHZ0Mkt1dElNU2V5cHBYRGpOQWdETEFrTXcwSlUvN25ZaW9lNDk0Y2l3?=
 =?utf-8?B?YjA1eE93QUFrWkd0aEFiZG1VNWYzQmxnYmdZVndzQWhTM2pZT2ZKZXkyeDh2?=
 =?utf-8?B?UG45R3Z3ZVRLSjg4RHRSWHdRYVZwcWErb0w5cEdqRHR6dnZhcFZJVG82VzY4?=
 =?utf-8?B?MExSL0pJSlVkRkpmbnpXZG56dGVaNjhnQXV0aG83cUNVeHFNeXZHbWpYLzlI?=
 =?utf-8?B?aElad3V5RXEzZ3RUWjhkRGdkaXFHRW02bkFrQzRmTEdBUTFiRi91N0F2Mk13?=
 =?utf-8?B?YTVWSTVnZVgvR0s1M283UlozcmtQckJMMCtJbkFSTFlPNXRhNG5aVmpUOHB4?=
 =?utf-8?B?d252RFJXbGxiaEdOTlNwOTRyRmV6V1hEcG9wdTFjRDQ5Tk1IY3dwQ1RKVFlp?=
 =?utf-8?B?QmhjWTlOeFV3SGZMWWIrMU1Yck9WNFg5NFFJVEZuZ1Uxb1hmSXFTdE1vLzgr?=
 =?utf-8?B?anRwQk1ZK0QwbmR3SWw2QzRaSE1teTJhMDZMR1ZzKzVENEhuZFRjci9ILy9K?=
 =?utf-8?B?Wjd1NHc0NHJLaDZaYjVlNGhjOW1ZTlRxSWFIbGdncCtsSng3dVFCVFNmRk1h?=
 =?utf-8?B?bWdOcDcxampuS1BSV05GVU5jd3VNTFk3WnR3Rm5GbCtqcEtLTnFBSGQ3UHdF?=
 =?utf-8?B?cDVkSmcvdndJYlR6UXBXNFhnOE12OUtLQ2c2Z1B2djM1Vk4xUG15UWlDUHpZ?=
 =?utf-8?B?Q1dnaFN5OUJxZXA2K201dVNCWUpKcHhoK1pNWk1pRmZXMll6VXpqSkttTmlG?=
 =?utf-8?B?VC83UkZKd3BFZFRKYU5laENwT2QzVDRhUVBqTmF1eDRIRVlSTm9HR1M2Y3B6?=
 =?utf-8?B?NjluSGhnOVM5MWx3a055MzJYNUY1U2EzdzhGUlBVTUlxQnFqbDBDRUdGLzlI?=
 =?utf-8?B?WU91enVrT3NmeFlCaEM2T1N0bG1YSjVOUklkb3JGc3VkaCtzME1CSFR3OFJ6?=
 =?utf-8?B?YkpmdFBYSS9DTGlzQzFGYkpZSUN4eFUwMTNBQm56S1NMMFlxemNkMDZYeENw?=
 =?utf-8?B?RjBDYm9kL05laHNSTDVpNHEzaGZaeFF0L2JCNW5UUm5PREY0bk5KWE42SGFr?=
 =?utf-8?B?SExGVHI2K3U1M0VDQWpTejBxOVA5T28yZHpuc2txRVlXa0lWaDgzcnozeXBB?=
 =?utf-8?B?RmVnZjZ4ZmpJYlBpeHNBbDlZK1drVFZNK1Fic1NQRUxpdEhJbXFkcUtVSDVD?=
 =?utf-8?B?SHdLK3MwQ1NSU2dmaUQ5Ymx0NFZ4dFhRczZFWUFBSHBqcHdvS2JacHRNb3di?=
 =?utf-8?B?RlZrRGZQMFFnWUVYMGpSUXluRE1jMlArOHpYTXZzcEtKYU9EZEtxTVowZkdQ?=
 =?utf-8?B?K0tER29lWElyK05xMFpLa0hMMW5oSkkxSS9FblU4emlYUnEvVnQrTjhSNUJL?=
 =?utf-8?B?Z2FrZWtFY2labVh3ZXRMdjNkMWttcDl3dHlRS3U0cDhiamtFUnhMckxlWDhH?=
 =?utf-8?B?T3VPdVVESWlHTzNucUlHaTc5cXllTktsbmNYR2dlQnNDWGhNWVc1TDZiSmdL?=
 =?utf-8?B?eWwrU250ZDM4LzJ2cmdOS1Y2OWJxdS85dHBhVzFRM3B0YklHd3Z6aWgwOFgr?=
 =?utf-8?Q?EScs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 18:39:28.4060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e460c19d-22cb-49c2-3c05-08de20887b01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586



On 11/10/25 12:03 PM, Mathieu Poirier wrote:
> On Thu, Oct 30, 2025 at 12:21:24PM +0800, Peng Fan wrote:
>> Hi Tanmay,
>>
>> On Wed, Oct 29, 2025 at 06:51:51PM -0500, Tanmay Shah wrote:
>> ...
>>>>>
>>>>
>>>> Hi Peng,
>>>>
>>>> I don't understand why it should fail. The patch simply implements
>>>> rproc_detach() -> rproc_attach() sequence.
>>>>
>>>
>>> Hi Peng,
>>>
>>> Thanks for testing the patch. I appreciate your quick response. I think
>>> rproc_boot() should be used instead of rproc_attach(). That should probably
>>> solve the issue you are facing. I will send v2 with this change for you to
>>> try.
>>>
>>> Thanks,
>>> Tanmay
>>>
>>>> In your case, when you do detach -> attach via sysfs that sequence works?
>>>> If that works, then crash recovery should work as well.
>>
>> sysfs does not have attach option, only start/stop/detach are there.
>>
>>>>
>>>> Could you give steps how do you generate the crash?
>>
>> I have not look into the details on why it fails at my side for the 2nd time.
>>
>> On my board, the M4 core use watchdog to reset itself and notify Linux, then
>> linux side imx_rproc driver will do
>> "rproc_report_crash(priv->rproc, RPROC_WATCHDOG);"
>>
>> I will give a debug on the failures in a few days.
>>
> 
> So what is happening here - Peng, do you plan on providing more debugging
> information? Tanmay - are you planning on sending a second revision?
>   

Mathieu,

I will be providing the v2, that will replace rproc_attach with 
rproc_boot. I am testing it, so far have not seen any issues.

I hope that will resolve Peng's problem. V2 will be posted this week 
sometime.


Thanks,
Tanmay

>> Thanks,
>> Peng
>>
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>> Thanks,
>>>>> Peng
>>>>
>>>

