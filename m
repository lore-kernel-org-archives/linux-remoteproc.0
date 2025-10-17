Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E3A2836A4;
	Fri, 17 Oct 2025 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718187; cv=fail; b=lMX2JRBVFNGZKGymINjIBsv6tvGviU99q8deRu1TaZviVBQt02PBRMH3Xch1c9f2mgbD4VcaZbb8D3bEg/QmuO4LGIgWSHMc1fJnDGNQSVoZSCbMFXUEBM9aXQzvfMt6hEIHsX2nfneQvpC0q4MHR5ZAVgLNexVsxu3tNjruGvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718187; c=relaxed/simple;
	bh=OhuHlW/AVNJY+mKAexmeR6ckHzepfMzJaztFrALyTYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uDb5bNr2ZDMBplEFl73zmFyXVrwgwWBnFBSMDHbedDc/ofH8Cs0i7cHhl7lk6Lh4r/ppSTzGoOoNxz6lscyH2XlJXQik6Q6AVysw00eUH5T62G3il9qrs2bxeSQ88cq8Q/YrK+U/dldjGQkFySe8xoHaxSQ07C8n6ouX61b2tqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tCoAblrY; arc=fail smtp.client-ip=52.101.62.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tCoAblrY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHZltaIrjRSa35i/fyHPW5eBSEe7ZUQYf02zPaRLPR40uGV88HCbyW/B6cwWMfKbeskBQcEYBNfPtAg/fyx/EIhIaAm4gf7KF6T+WzbNp0W4ek13AlW0Vyoq9F7haKePDPyob0svg3MtfAfMm8LrnJO/0IYzN86GACjVjYES92lPEgazakvk3hqxpkURD8y+FNWUqakf3EkdBQp/abItyEz77jKVYFaRBYhEmPbOqM699Mn5ERzxUaGds6c9a7a1Fiz5g9CG1UnuUWItP3yHbG3ncc7VBV3yGPUSVRVp8dqTs+eSD8QoLri9lXNg6sWUj7p5JT6DFPRxhZek70Q5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF2Ettq/TsRpm6LYY1Mq7Q23lSeT8hZw+Y2zG7Gz2W0=;
 b=lMJqyOKlgWWyKqYlc0mUKOJcwtf2UmIbb6ms+lP7aTmmsdtvQMXlV6teEmQrkqDq4GRf1j7oojT7QZC9yZFCwjkNW6DUCQBpf210XWkd1nGypI2HHV9eR/KwHDGDZyvOp7ai1Kd9RssAv/NTRwNLpzIpUTBBhg6YcAu4oJQ6274deakewIAH6cMvPggwiJv4zbRp2zYN6LVxVHrVwTEQ7+zEQtFA4EB9zggMXEbMmx3Q1B9KIdKHayopkPu4eSaCg3j1RSskiBffowvmazqpslEHN40edtSppId1dqWaxBYBCoR/mZnLGFEmIHDAiS11Gxp13E50Bvh+ZSR0hEDhzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF2Ettq/TsRpm6LYY1Mq7Q23lSeT8hZw+Y2zG7Gz2W0=;
 b=tCoAblrYjUSqHopEwrBic4OOYHnw9sN6rzuhmqK6ww6/BoNV+2u+F78e6PDNZpp2V66eZ12VBJg+GAKR34fEuhF5Pe4EjWNd+eqcJ9zTzCyn+0Ul7L14xbjSNZc31/KCsHesfk7akn4UGypHe/DbEbGJ/fu5SEcDQBaPotzkFy8=
Received: from PH8P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::29)
 by DS5PPFEC0C6BDA1.namprd12.prod.outlook.com (2603:10b6:f:fc00::668) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 16:23:01 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::e8) by PH8P221CA0026.outlook.office365.com
 (2603:10b6:510:2d8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 16:22:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 16:23:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 17 Oct
 2025 09:22:58 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 17 Oct
 2025 11:22:58 -0500
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 17 Oct 2025 09:22:57 -0700
Message-ID: <d40fc0cf-83e6-4ccf-bddf-5d6e571b6241@amd.com>
Date: Fri, 17 Oct 2025 11:22:57 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [RFC PATCH] remoteproc: core: full attach detach during recovery
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251002153343.766352-1-tanmay.shah@amd.com>
 <aPELVfhkk0qDXqa9@p14s> <9e22a020-937b-4965-b7f8-140853ad7d37@amd.com>
 <aPJiW2ROdaUuCiwi@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aPJiW2ROdaUuCiwi@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS5PPFEC0C6BDA1:EE_
X-MS-Office365-Filtering-Correlation-Id: e95e70ac-8dba-4a06-9382-08de0d997080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1VjYW9yVkkzRzBQRWl2MkpXNmtoZkdLa2tJcXF5Wnh0ZXZrbGZvY21jclhh?=
 =?utf-8?B?b0JEUjRmVm5peUQ1R0I2dEQyS2JKZXM2MElMSi84aXpWbndjNG16Uk5xbm05?=
 =?utf-8?B?ajhRc21ZSkl6TnU5cUxqb29zMExvdHVLVGI5M1daeDZpcUdIQzhMWUJ3WWhY?=
 =?utf-8?B?NDBPQUoxSXkwUWZUU1gvVmFjRXhSekU4QUx5KzJQWE5semxHSkFuam1jVmFs?=
 =?utf-8?B?aXFmZVRKWlRqLzNFRkxwYVdBUkVubzBQSDFwWVpJbTVnNXBNV0xwZnNRMVNK?=
 =?utf-8?B?V25RTlI5QVBKdUNyb0Q0bHJLaCtYV3pSNzZTZHJHU05nSlF4UmpqS0xvTG1z?=
 =?utf-8?B?VjErNXVweC9uQThIeWxaWmpVR0R2VnQ1Yms3ZTE5MWlIRHpQeXRTRkFXSTZn?=
 =?utf-8?B?R3RZM0JuYUhrVjNFUk0rK3djUmUzWU12YXExM1lYSHdjWncwQ2RheEl2ZEQz?=
 =?utf-8?B?TnlBQnpEUXJzRE5uWXk3NWYreE8ya1lGY042SWEweUgzUU9mczYxNzhzTFY5?=
 =?utf-8?B?MXJOdExwRzltdWFJS1Q2TlF5TGU4UytnV21hUElXUDlHWDhsa0xHMUlxWTgv?=
 =?utf-8?B?MjlPUDFuZFdLNm5RdVBTd3hWbWRjRTR6cGJyazY1MUxMWjJ6TXVPaW1wc1pl?=
 =?utf-8?B?QTFNaTdHT0kxeWZWbys1QURXUEk3TVl2SFAzWmltbVpwaFplTTRVdGdGU1Rs?=
 =?utf-8?B?Z08yOHlPakdmaGVqQlpIK1VPTnRtRUw3WGZWK0cxRVEySzBKSEo3ZXVjQ3hn?=
 =?utf-8?B?eXc2L2lrQnl5a1l0NG1ldzA5UW5CTDJMYnZFM1VaUzBSSWtqUXIrY1BCZUQw?=
 =?utf-8?B?Vm1EdEpGNEtXVDd2aGNyREFGNHZGREhmNk43NkxaTkZ4am9FWExZZmNIb0VQ?=
 =?utf-8?B?TnVMQldiSGR4TFMzT0pTbDNZd2FUWGc4V1pvWkpNL2hOMmkzdXVYQkFScXNB?=
 =?utf-8?B?OEpOakJ4aDFBV1VuOTNzajcraTYvOS9pNFpOVk5wc3BtZmVWaWxpUlNWUms5?=
 =?utf-8?B?MkRzazBlaGdtR3U1ZWJxRFRaWW1qbE5Mb1d2OGV5RTNDWW9kYjRrRTZWZ0dK?=
 =?utf-8?B?eDk3TmkvK1hQdmM5RzRTeCs4SW1SRjE1aUdpU0JEeWFOcXdqNStDdmF4b0dj?=
 =?utf-8?B?QW5HcFVmR2V4NGZPM1diVUlqbEpKUElEUVlaOWxzNTNpNDBJRGJuSzc3bzFB?=
 =?utf-8?B?VEJMSXAyZDZpM3FMR3FZMkprbXhBMFgvUFhFN0orY0p5SGN2RG9DOHRsQnIy?=
 =?utf-8?B?TWo0SW5TbDhXSVdOT29ScG5vam85MUNlcFp5SW91ako3SGFITFcySFdyWUVJ?=
 =?utf-8?B?Sk9VMlVXTWFadWd1VWp3R3ZMMkJyYUZPTWtWdlQ3TTB2NkV5K3g1M3o2Z2JY?=
 =?utf-8?B?UnlveUhQMVhXQzg2ejJ3QklXbkhLZ0FJbUpBRUZrQ25PY1lLN1Z2a21oYnlX?=
 =?utf-8?B?TER4Z1dYMlZJUFR1M2dMS1UrdFMvTk1BeXdyeXdTMHhXWWdHM3I2azVyblZE?=
 =?utf-8?B?Nm1JNHBWdGE1Qk9nUm9Fd1lYRXY0RzZzWUZ4NHFwZDF6NWs0RFFVN1ZzK3Az?=
 =?utf-8?B?Uk01NjdTVVhMZTBDblRKMktZeFdqVWdhRDRMTzZKU0xWd1dwbklNZWlLbExC?=
 =?utf-8?B?Y0ExMUhUUlljWFlpa3JnTGk0YkRWZlltL1NSaUpVSjROWlBJSXhBSWNKdjRM?=
 =?utf-8?B?a0MrRDBhNk1OclpOeXAvY2FTclltR1M1ell3ME1MVTg0UVZFRXoyY1lDNTFN?=
 =?utf-8?B?dXIwV2h5TlUyU0xISTA2SERqNkgyQVVXZDR3dUtPaldxeHhHenEzbGk3TVgx?=
 =?utf-8?B?YWJGb1RtdUdRY09hM2FBZTB0N3RMUitDNVVaS0dBenM0bEZ6TERZSXpBbkRG?=
 =?utf-8?B?aXQ0TFp2dmxmMGV2eDdvbks5NGszOEhLcWpRRUxFWjRHckpWQlJLUjFGMjBJ?=
 =?utf-8?B?eGF4Ui9ocVdMS2N0aEdMQ3dpa3R0N0xud05oL2lJUExHMlV0Y2J5Y3ErUGlO?=
 =?utf-8?B?bjV3MnlzelFDUnhDMkNZLzk3eVd0RURsTENYN1JiNXRNaGgrS25PekdhMWpY?=
 =?utf-8?Q?vm11fV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 16:23:00.0940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e95e70ac-8dba-4a06-9382-08de0d997080
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEC0C6BDA1



On 10/17/25 10:35 AM, Mathieu Poirier wrote:
> On Thu, Oct 16, 2025 at 11:12:26AM -0500, Tanmay Shah wrote:
>>
>> Hello,
>>
>> Please find my comments below:
>>
>> On 10/16/25 10:12 AM, Mathieu Poirier wrote:
>>> Good morning,
>>>
>>> On Thu, Oct 02, 2025 at 08:33:46AM -0700, Tanmay Shah wrote:
>>>> Current recovery operation does only virtio device reset, but do not
>>>> free and re-allocate all the resources. As third-party is booting the
>>>> remote processor during attach-detach, it is better to free and
>>>> re-allocate resoruces as resource table state might be unknown to linux
>>>> when remote processor boots and reports crash.
>>>
>>> 1) When referring to "third-party", should I assume boot loader?
>>
>> Here, "third-party" could be a bootloader or another core in a heterogeneous
>> system. In my-case it is a platform management controller.
> 
> Ok
> 
>>
>>
>>> 2) Function rproc_attach_recovery() calls __rproc_detach(), which in turn calls
>>> rproc_reset_rsc_table_on_detach().  That function deals explicitly with the
>>> resource table.
>>
>> As per my understanding, rproc_reset_rsc_table_on_detach() will setup clean
>> resource table, that sets vring addresses to 0xffffffff. Please let me know
>> if this understanding is not correct.
>>
>> If we do not, call rproc_attach(), then correct vring addresses are not
>> setup in the resource table for next attach to work. Because,
>> rproc_handle_resources() and rproc_alloc_registered_carveouts() are not
>> called as part __rproc_attach().
> 
> Your assessment is correct.  When the clean_table was introduced, it was to
> address the detach->attach scenario.  At that time the only recovery we
> supported was to stop and start again, which did not involved the clean_table.
> Re-attaching on crash was introduced later in a scenario that may not have
> included a resource table.
> 

Okay that explains the current architecture.

>>
>>> 3) The code in this patch mixes __rproc_detach() with rproc_attach(), something
>>> that is likely not a good idea.  We either do __rproc_detach/__rproc_attach or
>>> rproc_detach/rproc_attach but I'd like to avoid the mix-and-match to keep the
>>> amount of possible states to a minimum.
>>>
>>
>> I agree to this. I can find a way to call rproc_detach() and rproc_attach()
>> sequentially, instead of __rproc_detach() and rproc_attach() calls. I might
>> have to remove rproc_trigger_attach_recovery completely, but that is
>> implementation details. We can work it out later, once we agree to the
>> current problem & solution.
>>
> 
> Humm... You might just be able to call rproc_detach/rproc_attach from
> rproc_attach_recovery() if you enhance rproc_detach to be called in a CRASHED
> context [1].  Let's see what you find when trying this on real HW.
> 
> [1]. https://elixir.bootlin.com/linux/v6.17.1/source/drivers/remoteproc/remoteproc_core.c#L2065
> 
> 

Thank You for the suggestion. Agreed. Since we are coming to an 
agreement on the final solution, I will send the actual series which 
also takes care of start/stop recovery on xlnx platform driver. I will 
implement above suggestion, and test on HW.

Thanks,
Tanmay

>>> If I understand correctly, the main motivation for this patch is the management
>>> of the resource table.  But as noted in (2), this should be taken care of.  Am I
>>> missing some information?
>>>
>>
>> The main motivation is to make the attach operation works during
>> attach_recovery(). The __rproc_detach() works as expected, but attach
>> doesn't work. After recovery, I am not able to strat RPMsg communication.
>>
>> Please let me know if I am missing something.
>>
>> Thanks,
>> Tanmay
>>
>>> Thanks,
>>> Mathieu
>>>
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Note: RFC patch for design discussion. Please do not merge.
>>>>
>>>>    drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++++-
>>>>    1 file changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 825672100528..4971508bc5b2 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1786,7 +1786,20 @@ static int rproc_attach_recovery(struct rproc *rproc)
>>>>    	if (ret)
>>>>    		return ret;
>>>> -	return __rproc_attach(rproc);
>>>> +	/* clean up all acquired resources */
>>>> +	rproc_resource_cleanup(rproc);
>>>> +
>>>> +	/* release HW resources if needed */
>>>> +	rproc_unprepare_device(rproc);
>>>> +
>>>> +	rproc_disable_iommu(rproc);
>>>> +
>>>> +	/* Free the copy of the resource table */
>>>> +	kfree(rproc->cached_table);
>>>> +	rproc->cached_table = NULL;
>>>> +	rproc->table_ptr = NULL;
>>>> +
>>>> +	return rproc_attach(rproc);
>>>>    }
>>>>    static int rproc_boot_recovery(struct rproc *rproc)
>>>>
>>>> base-commit: 56d030ea3330ab737fe6c05f89d52f56208b07ac
>>>> -- 
>>>> 2.34.1
>>>>
>>

