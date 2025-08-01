Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700AD197A76;
	Fri,  1 Aug 2025 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754065915; cv=fail; b=VlNhGsv8J/ZLRPAMGi7PlR4NtEOriCv/6f4DMg3qye01KN809LY9H9bhBpSG16HC8J8gDXbOuHvhhhZxeeNCLU6SAqnKBWAaqOrMZv1kofgKwkCXDnUtUrF6GuXQoxTrdvXM97t0QeTQT8yCMCJY2yTvy+kQE8Xz22gOokDobwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754065915; c=relaxed/simple;
	bh=zebDTUMxlXBpsOflp50kLe/rw+GFQ4gEa3CwxtNl4l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JHxYBZoNkyuzIVo18TlUyjr9lMydbcQY7+PUuVy1M2PvGVzSvtYnq2sGCf/TDot9tMiXBI/rqri7KLnjRz1Ir1FNoF0TT9tXFdj31LHOahUuTS/2LhW8jxMO92y8aMSkoNxe6TE43/HNvRZRltRBw16usAWxUBS031k0sflq0Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B/l2cQ/h; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B/l2cQ/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpO79SnAOwtJKgk2fPPfu9Pn92+fzXpwCCayEEzN/Jg1kXkZ6ZqfUWYkJfyafqE+12M7oHcpc1fbsoiT+uHj47Lp7K2Z6NhvGu+dUGkx0hdtkPm8P4Bt0LHnjnuCSiwsrmPHUbk7FftpqWV3oeCTyV9vrqMwhK7lxVgaFt71wl/4rhsWmlFrL9u+B6wXuSw4b6YlORyjFmKCiDIN33UtQvevHWM3krBrAavIPqFdHFn8A+hn8qnUfn53wTlJbMCUySswq0JroWFeKGvsrGMH41vpq66bwLLNI71tQeGa3CDgU+5LVGhAmKPn/6E0tIamNZbnyUvG7wC5nKir6xyJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5JlQdqtpJZO1juMeLvttMlyzYDCwUyQBI+SIihYs4I=;
 b=ZGjttIKsQTmg/bYHZC0dY058vd9z2+hKSO6atg+04nZRnOP2VPFQ/4LLUOzuASTQSIcqQpBj7pnw31HaPrl5abWslbiJpFvyZywJpBYOyLUwZwCo11t4DMRt4GANi9usXj7A60atwUHyPWaP0mdoBCLilTcj6Uft2GCzjUcozCH1RFMLZKP6Mk1sFfzyGnX8HNjFX/bghAa3GB4oYxrQTvz8j2vCxCeMlGSYEKJGZuXaiT24RlhY/WDHvcwvBgOKi9w8os2SjU0lHlloE8HHnI/lDEagIMpXo+1yGpup9IpGdnDxFD0qU/IGnUXugo0wzTkos/iZi/LRcHSH2NS6og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5JlQdqtpJZO1juMeLvttMlyzYDCwUyQBI+SIihYs4I=;
 b=B/l2cQ/hmnrMPzbBaIe3XXk3bw5+TRiFGNs1qywu60BHzg7AdxUzfnV7ubf1Av0A5gBdg061KHB8FG9v4J/EPH0UhU1iRAKQFTQY/1gOg8AiGGcd1iNLxrvtldBObcvlHqsTcHVDvdxHTioDfbO2tIdCnk2xcWo6BSye359PCHs=
Received: from MW4PR03CA0294.namprd03.prod.outlook.com (2603:10b6:303:b5::29)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 16:31:49 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:b5:cafe::9d) by MW4PR03CA0294.outlook.office365.com
 (2603:10b6:303:b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.17 via Frontend Transport; Fri,
 1 Aug 2025 16:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 16:31:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 11:31:48 -0500
Received: from [172.31.128.174] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 11:31:47 -0500
Message-ID: <10019734-a819-438b-a7a2-2d22c747945f@amd.com>
Date: Fri, 1 Aug 2025 11:31:47 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [RFC PATCH] remoteproc: core: Do not process carveout and devmem
 rsc in attach mode
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Beleswar Padhi
	<b-padhi@ti.com>
CC: <andersson@kernel.org>, <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
	<jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<daniel.baluta@nxp.com>, <iuliana.prodan@nxp.com>,
	<arnaud.pouliquen@foss.st.com>
References: <20250724133144.3776839-1-b-padhi@ti.com> <aIjqBi3X4hWGsJLP@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aIjqBi3X4hWGsJLP@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: f9911cee-8a2b-4e39-d5c5-08ddd118ea34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWZTRjlWeWVJbU40c0RkTGM3REFGQm4rRy9xYlVBejZaOUZWcnhXQ2Q2Uk5B?=
 =?utf-8?B?MG1saUlza2JQUkl5QVR0em5LQTdORlFRYm9IK2RYM2M1bkE1MFdZdlNNQ29z?=
 =?utf-8?B?bVV0V0RoblRMS1hWNWovWnRrcTRGNXh5L2F5L2V6OTBVZnFQNWdZRS9WSUZH?=
 =?utf-8?B?b3BTVGh5eHd4dXJvU2g1V1lhMWtrM1Mwd09SOVFqTUphTzlEQ01kbU5lZ1lu?=
 =?utf-8?B?ZXNQMEhTR2VpYjJMVWdYWFB5bXlpa0lMbmg1cll2amZVaDZxRWJNN0g5ZGhX?=
 =?utf-8?B?enFtRHhueUUvUFVVYU1TUXJXNTFzcGwweXNteE51RFRONnhucDN0VEppZWhJ?=
 =?utf-8?B?UzAzM0dLMkozOElYbkp6ZEs5bDlieklpa1lBdXFlK2U3dHJ1dWhWNkZydTlw?=
 =?utf-8?B?MDNRWnk2SStJL2xoSE1tWjRFTzFBWTVPYlpvNzZLTWdMa0Fmeno4R3NTbCtr?=
 =?utf-8?B?blk0UEdHa0E5cE9YNzdzWlNBeEF4c0FvSzRMNWJJMGJzNU44aDUyTnVCSGdz?=
 =?utf-8?B?OHRQbkxhaThFVW1MZFQ4R29wcVVTQVlLdVpvOGFhakh4TEUxV1BKU2ttOTJk?=
 =?utf-8?B?cVlBb2tzWDZnRWdHRGVaSm1WbEdrRnZsMVZvM2NCRjRqMkZCVHNsd3p4ajhX?=
 =?utf-8?B?RkpGTWowQWJ3MWk5TnNDWXpkamVJcU5MTTZNKzQ2Y2UyRXlUYUl3L01SRFA1?=
 =?utf-8?B?d0FkKytiaVh6U0R0eTNuSUE3aEZPNURxK2M3bHIxWEE3WTl4SXlGanhWNHdr?=
 =?utf-8?B?bnl6S2g5MGJjaXo4WjdoQWlUOHVNNzh5bUNQT2ozbktRMnJsU3YwYk9XbUdW?=
 =?utf-8?B?VjhiSFFUeTRoUm1xTE5XZjdjSGV0eS9nQzUzYkkycmRLUURaWmJQY3AxT09T?=
 =?utf-8?B?anFveStuaGtKQk9NbDdFSTV1ZXpTdVRmRnVjUUV6S0I0c0tWQklzL0dwZ2tj?=
 =?utf-8?B?SUJvNGorbVNuNUo1RndKQ3BjYUxXb0Z4MjBVYkdwNHFadXdvYnpVUmNpRFBv?=
 =?utf-8?B?WGVleU9laVgrV0lJRlI0Q1JLcTVvQVhucHZGajdyMUxXYTU1YTYrRTJ5VW1Z?=
 =?utf-8?B?YnZ2OXpYUWFXUzhnVm83c3dFQVBEaWhZdmJFeXdnMyt2N1JqTVZQemlWZkgx?=
 =?utf-8?B?ZTZTY3RReWNzL0duMTNPVENrZFBiZGxIQ0tpTnZ1OEhiWTNiM2JmSW1wa2tr?=
 =?utf-8?B?ZWRETm1PVW5HOFVWVmppWHI4WlVGMm5oTDQ5NlpzU01CRGx5WklYY1loNUFm?=
 =?utf-8?B?ZExuWTlCL2Y2YWhjdzdxVXRiVGlwNmFlVGp2d3N6Mm9xcW9iTWlaL0JHWE5t?=
 =?utf-8?B?a0JDSzQ3R0p6R2xPajdZOXg2dGhkYUFPNWFOb3p2RkxLT2wrZ08rQnZVZTVH?=
 =?utf-8?B?TnVsc3RacURVck9ocWt2ZHJjT3B6bFJpZHBzbFFtRjZ0RHpabC8vQTRSRjlZ?=
 =?utf-8?B?UzhudldvS0NJR3QyYWpmWXIrUk9tdFBkRHRUYVBRSWI2b0hnMlNCOGZjcXNE?=
 =?utf-8?B?ZkR5V1pZV0RjUXpRUVFiaXYvSFNTMGUyZUhWdXBldVYremczS0xqdXMwL083?=
 =?utf-8?B?R2lra1VhankwVDhsNFozTUZsZk12c080eWRWVjlCTkxFc2tTUWh3VENuVGVo?=
 =?utf-8?B?ZU1nQ0cwT2FQOXk4RUJxTnU1eFRHT1dDYXFkaFBRemRQb2lKanJBSCtvaTRB?=
 =?utf-8?B?cWxRT2lSc0taZXVmZUQ2cHgxWjVJdlhSWGwydis4T21QK2RxWklXQVVpV1U3?=
 =?utf-8?B?RnVnVUNwaTlUWjh0bC9OWnF6YmdWQ0kzQzJuYW5VNVFkbThZbVllMnYvUVdF?=
 =?utf-8?B?L1dQRldNODlwekJGQXgvWXBMTWhzNG83NHFMTTZYRml4Tk1jdUxzT0lwMTVE?=
 =?utf-8?B?ak5EL0xYb2phZHJIWEJrQW00a3ZmQ2ZsQkhOSWJCc24xcG42MVAzMU4zNXBo?=
 =?utf-8?B?Z2tyaWFYbFd4SzRLS0V6WDZIcThwZG11d3dDK1ZLQ2N1ckJ0NC8rYUQyY3kv?=
 =?utf-8?B?WWxQNXNiWlhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 16:31:49.3890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9911cee-8a2b-4e39-d5c5-08ddd118ea34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032

Hi Beleswar & Mathieu,

Please find my comments below.

On 7/29/25 10:34 AM, Mathieu Poirier wrote:
> Hi Beleswar,
> 
> On Thu, Jul 24, 2025 at 07:01:44PM +0530, Beleswar Padhi wrote:
>> When attaching to a remote processor, it is implied that the rproc was
>> booted by an external entity. Thus, it's carveout and devmem resources
>> would already have been processed by the external entity during boot.
>>
>> Re-allocating the carveouts in Linux (without proper flags) would zero
>> out the memory regions used by the firmware and can lead to undefined
>> behaviour. And there is no need to re-map the memory regions for devmem
>> resources as well.
>>
>> Therefore, do not process the carveout and devmem resources in attach
>> mode by not appending them to the rproc->carveouts and rproc->mappings
>> lists respectively.
>>
> 
> I think what you are proposing is logical.  Arnaud, Daniel, Iuliana and Tanmay -
> please test this on your platforms.  I will also need another TB from someone at
> TI.
> 
> Regards,
> Mathieu
> 
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Testing:
>> 1. Tested IPC with remoteprocs in attach mode in TI platforms.
>> [However, TI K3 platforms do not use resource table for carveouts,
>> all the memory regions are reserved statically in Device Tree.]
>>
>>   drivers/remoteproc/remoteproc_core.c | 30 ++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 825672100528..ef709a5fa73c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -640,6 +640,20 @@ static int rproc_handle_devmem(struct rproc *rproc, void *ptr,
>>   		return -EINVAL;
>>   	}
>>   
>> +	/*
>> +	 * When attaching to a remote processor, it is implied that the rproc
>> +	 * was booted by an external entity. Thus, it's devmem resources would
>> +	 * already have been mapped by the external entity during boot. There is
>> +	 * no need to re-map the memory regions here.
>> +	 *
>> +	 * Skip adding the devmem rsc to the mapping list and return without
>> +	 * complaining.
>> +	 */
>> +	if (rproc->state == RPROC_DETACHED) {
>> +		dev_info(dev, "skipping devmem rsc in attach mode\n");
>> +		return 0;
>> +	}
>> +

On AMD-Xilinx platforms we don't use RSC_DEVMEM resources so this isn't 
affected. And I haven't deep dived into how this works. I would let 
Mathieu take decision here.

>>   	mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>>   	if (!mapping)
>>   		return -ENOMEM;
>> @@ -839,6 +853,22 @@ static int rproc_handle_carveout(struct rproc *rproc,
>>   		return -EINVAL;
>>   	}
>>   
>> +	/*
>> +	 * When attaching to a remote processor, it is implied that the rproc
>> +	 * was booted by an external entity. Thus, it's carveout resources would
>> +	 * already have been allocated by the external entity during boot.
>> +	 * Re-allocating the carveouts here (without proper flags) would zero
>> +	 * out the memory regions used by the firmware and can lead to undefined
>> +	 * behaviour.
>> +	 *
>> +	 * Skip adding the carveouts to the alloc list and return without
>> +	 * complaining.
>> +	 */
>> +	if (rproc->state == RPROC_DETACHED) {
>> +		dev_info(dev, "skipping carveout allocation in attach mode\n");
>> +		return 0;
>> +	}
>> +

RSC_CARVEOUT type of resources are used on AMD-Xilinx platform firmwares 
and this path I can test. I will let know results once I do that,

But before that I have few comments:

1) This check should be moved right before `rproc_mem_entry_init`. That 
means if carveout is found then we should allow flags allocation from 
firmware. This can happen if platform driver has already allocated the 
carveout and during next attach, we are just updating flags and offset.

2) In this patch following assumption is made:

```
       * When attaching to a remote processor, it is implied that the 
rproc
          * was booted by an external entity. Thus, it's carveout 
resources would
          * already have been allocated by the external entity during boot.

```

I think this is really platform/firmware dependent. This was not 
complained by any other users yet. That could mean they are relying on 
Linux to initialize these carveouts and remoteproc firmware may not 
initialize it.

To avoid breaking any back compatibility or other's use case (if there 
is one),
can we add new feature in rproc->features like:

RPROC_SKIP_ALLOC_CARVEOUT_ON_ATTACH and platform drivers can set that 
feature in during probe.

Then we can check that feature here along with DETACHED state and make 
decision based on it.

https://github.com/torvalds/linux/blob/89748acdf226fd1a8775ff6fa2703f8412b286c8/include/linux/remoteproc.h#L501

Thanks,
Tanmay

>>   	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
>>   		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
>>   
>> -- 
>> 2.34.1
>>

