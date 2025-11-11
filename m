Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011047.outbound.protection.outlook.com [40.107.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591C2D979F;
	Tue, 11 Nov 2025 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762879655; cv=fail; b=GO6B5eOLWHT/+uOHyX6C7cnhqm3w+WCgTfpVo62hNpRrStDhQyTKji12/AyIhOHUEFCiE3X1J0OrI/JGKXpnLLqwheeuDnL8XV+C7inGALQyfEjyjYQAnlX6mtcTCtOGbHHZ+7fFYmXOLkD1THZRn5hBSXen4nHgUntNrFBC6+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762879655; c=relaxed/simple;
	bh=8BXemLozzsV3FJUqqSbAl4bQ4NXByITD+ZET1N7csAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D1/ZHs5AUeeERdU2GVjB0mMXNBBzXsoDc4wU95VCPEbOKml7UVM885LIsdMnhf0jNwSSk/lcHOkoXePOsP3ko4WH/7xXR9b4byLVHbGiENVZI/0b3GylGzH8tyBKhu9k/eh8k2rTiRi5yuoGngmO+WwMEUkTU9VeP8Sf5ko9/Ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W7je2reV; arc=fail smtp.client-ip=40.107.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W7je2reV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnGkL/XbxRtX0CYGOcAFve3OLRNNqRVzmGus+lcjQoleWHuBRbDHIrOLt4W5XYFyQKlWQNdoRzqnth5AyGs3Nh4FcsurWH8a0QrKgMV2lThGHezfWUhZw1mBxAtyEQ0XjJBdafxBCmzLtYOZCEO+3Ihp08k7mZBx2lZ0Pd3J9/0draksEUawOIUHObBISc4yLL94XhA9vpJKnIT2PDNeqW3DCkDBBRQq0iPYA9yhsqjf6jqDMl9PegEB6idi1kDfkMc3KcG4noSrmePv7uxzaIpV0IQXxpn6k5mUIgQwOf7GCMPBe9bKv69waxGaOG0CUwQHKe1u7r7rJaC8EOECPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8VJpG/0KNA8kDLg5gYXNVX1SLUU03kfbaPpg6z2LLg=;
 b=ZBuNrw7QZJ8GXJ9cdJaYyJtR+fNll18Ufg7MjV/ZSV/MtNeQ92qLZx10+WRSr9tyrKReFWkZNm65tpYUBRBKS+xb5uQw4/QrNcgntLk5G7p4FG7YgFhzna+XgTzYesXvKPcI3c07NcuxG2id92Hur/hVBSnHepnDobd7nr2mPUr6zay2c3nC321qEbSWBKTgcZZqTD8MkFie3LDVI09jVxsPREdrhnIxv3vEdR2cn9e9BETAH/NRsjLYdUevc7dLSXii0GvzJCIPltja24ukxrR7LfFzlYz59YkprWdyaIXzYpOxOJY3bfYa+I9Ppl1Gh1VDuEMDJkWMz+qGe596fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8VJpG/0KNA8kDLg5gYXNVX1SLUU03kfbaPpg6z2LLg=;
 b=W7je2reV2iwDaSpcs7ZaFaJ+XawHqo3ZFLLLDjTyz3XI67Rw9UpLXza9yW7nUQVCEmSrvxQThJWJFrsxFkYvtE/hZnnN2rmaeeD5HpoBon3HWDX2CEXML2Qy9ztcK5xpr3AUegWOt9IvwLrUESCFVkXDLzCkRVrzGbPk2w2Da5g=
Received: from MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::22)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 16:47:30 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::2) by MW4P221CA0017.outlook.office365.com
 (2603:10b6:303:8b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Tue,
 11 Nov 2025 16:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 16:47:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 08:47:26 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 11 Nov
 2025 08:47:26 -0800
Received: from [172.31.8.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 11 Nov 2025 08:47:26 -0800
Message-ID: <1698d1f9-440c-41e1-86ab-a8b09f4ddd59@amd.com>
Date: Tue, 11 Nov 2025 10:47:25 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
To: Peng Fan <peng.fan@nxp.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: "andersson@kernel.org" <andersson@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251029032422.GA7297@nxa18884-linux.ap.freescale.net>
 <b9ce8b9c-6391-47fd-b7b5-be5cddf9cd4e@amd.com>
 <1bb3a121-614d-4040-9cbe-505ccb7a7fcc@amd.com>
 <20251030042124.GA18595@nxa18884-linux.ap.freescale.net>
 <aRIo2MUol09Onu9B@p14s>
 <PAXPR04MB8459029D7DCF4A6D2DDCB54288CFA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <PAXPR04MB8459029D7DCF4A6D2DDCB54288CFA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: 040e0626-6157-4fbb-cd72-08de214200f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a1NhVHkrdU1kWXg3Q1BrVk96bGlEemlTbVUvVm5ueTNWU3ZBNy9iaXlRQThx?=
 =?utf-8?B?Y2taV2txVGw5R3dTblZMM214VjdJcHJlOE5tb09iWXE5Rzl6WmZCZ0pUWW94?=
 =?utf-8?B?OHZwL0hRWnp0WTJiS04ybGtSUE5ZMThqVWg0V1U0NHFwYXR5a3JyWlVsSzJs?=
 =?utf-8?B?MjVHNW5XRnhITGVTMzlBbzd0bEhmNWZKVUQxclJwaVI3K2xsbzJGbUprTXgy?=
 =?utf-8?B?OVY5eXBsQUo3RWc2S0VBYUJualR1QUFEdlMzbEovNzNhQ1NIVHFER0tCWHRo?=
 =?utf-8?B?UGNpRWlTb00rOGk5aXFlQXZFaFBURTNrSkswU3pQQklWZzBUVVZkOW50U3RI?=
 =?utf-8?B?K2tzK2RibzhMc0xsVUFoaXIxTEsva2E4Mm1LOFE5c2Y1ZktVckczRXZ1QmZB?=
 =?utf-8?B?RkJYYVhpR1JSQjB2QUFDNHFEV0F6UEdOVFd5WHVnWHV2blYrYUxlQk9GWmc2?=
 =?utf-8?B?WWJ6bVg4WlJWTVFwZi92ZUdENUJtWUxGQUlTWDRSRmZuYVh0bFdJU0xyNVFz?=
 =?utf-8?B?TmR3SEVuaUwrUXhyR2xXZ3Njb2JKaEZtNS9WK0QyVGo4OEJ0RzVPcVpvanJX?=
 =?utf-8?B?dngvdFd0RGFSMzZ2YksxZ21WalJtWlBRMkVJU0czTEhZNWFJclAwSEZCQ0dn?=
 =?utf-8?B?anhCazhlL0VraGVnQkFSUHgzbmxINm9obTZlTGZNd01CaGxlYTgvcHBoRzZl?=
 =?utf-8?B?VXJTRGd1bUNXVEViclFEek1zQ0RqRlBZbzJCTVZNZTJTc3dtUVhsWUhEZ29m?=
 =?utf-8?B?R1FkREF1ZXpCR29tcEVjTUVrN1I0QW92L1dOQ0RaeUhqQTVYNlhmNGc3ejVW?=
 =?utf-8?B?ZUhIQS9rNmZQSEVQTHZISnp2d2RjMzBqYU1WTWFucmo1Rko5c0VtNzVYbnQ1?=
 =?utf-8?B?Znh6SzZzUzlUeHAvR3NVbER6aDNsTythaUtaVGNxNTNHY3JzbVlEQXpkdzFK?=
 =?utf-8?B?cnlweDFrZGl3cEo4RmxDK1dyM1VFRzNlMUdrUDBwbWRTSjk1bjJJTm1TV2pj?=
 =?utf-8?B?bXZWcTBXQVpyVVlRcVNrUzNISTl6UDZQN29RVi9TWjd1RjVvOWEzTGxqUUNO?=
 =?utf-8?B?OGtydE5LVzd0T1R4TUNMR01yd2pSeEpGWGtRUkdDTjNrbW5QM2c4cTBXRVB5?=
 =?utf-8?B?K3JhWlJQeWg1aTJBdlpPQXNsWFkxSVo0S1lxYlpUNVFwYWlibEZranphWHRz?=
 =?utf-8?B?clI1MjAwR0t5Ny9RdkR4TFpES2Z6eVdyM08yaEVZT1NjdE0wYUxoZlhhSnJ6?=
 =?utf-8?B?S2R2NG5MM0ZlaVNlSnViazBKNW5ycjU0aHdiejMzdEJMUDJOTDFXMm4yN2E4?=
 =?utf-8?B?ck4xQmxPbGR1MFFROEo3YlJ4dGJJMTNLWThLT0JJRHFEbjJoUGNhc0Q3Z1R2?=
 =?utf-8?B?dVE3QU5QV0tDeGpqWWZiVU1aV1M2UCtJeEZBREdUUEw0UkVWWHFHL2pDQlJx?=
 =?utf-8?B?eUkvMlNaQXR3WkNYKzZQdDFqSmQzakdoR29UNjBuQ3JxS1ZieldsUUhidUs0?=
 =?utf-8?B?SmZVT0xZMzh6bVJ5Qk1ubTl4bHl3eWZ4bVNCbEljY3BsdnpBb0R6TGNUbUZ4?=
 =?utf-8?B?Z044UTc1RjhvMSsxS2JqNERqdVVqTmlpTmNYd0lQOEJrdUUzQ0xrS3Z2WXBZ?=
 =?utf-8?B?U3Vsa0h3cG0yNGFTaU42OHdsdjU0WTkyYitIZ0duQTlYTnBLVXlvekZoK0l2?=
 =?utf-8?B?VDZZc2d5bFdueXg1M1BYaHBWNFlGYmVHZDBvSGxjSGlGTVkxM1REakZsQUE0?=
 =?utf-8?B?RkJ4Mit1aUQvRTJxNjhpYmVDZmJjVWhVRGFISmNuSURIUGxub0Q3TjRzNW9E?=
 =?utf-8?B?Y3FzRC9RYUNXSXNXQVNXcEI1MS90aWdOcDBLWmgxZ0QxSG9XbFZYV3owTCs0?=
 =?utf-8?B?Qm1OVmpFUWZtdVBKTWpBOEMyaHFIWlpmZlBDV0doeGJFeTRLRzluWm9weEJv?=
 =?utf-8?B?NXlDb0FCb2l3N1Flb2NiakxwK3Z3RXMxdU9WVjkxZXJlU0NkN2VxMk5iVUR3?=
 =?utf-8?B?NkNVUHdpelk3NktLNFNtMWFFOENIaWphWVBQTEs3WVBjcDJQRjQ3ZWUxWGpz?=
 =?utf-8?B?UnhjMzc4TWVlZHowZE9ZRFBqaldpRWV3Y1U5T3IzNDl5NlFvWG1tK01sZjV1?=
 =?utf-8?Q?5RfE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 16:47:29.9519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040e0626-6157-4fbb-cd72-08de214200f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176



On 11/11/25 1:12 AM, Peng Fan wrote:
> Hi Mathieu, Tanmay
> 
>> Subject: Re: [PATCH 0/3] remoteproc: xlnx: remote crash recovery
> ....
>>>
>>
>> So what is happening here - Peng, do you plan on providing more
>> debugging information? Tanmay - are you planning on sending a
>> second revision?
>>
> 
> Sorry for delay.  I gave a hack with below changes(at end) and it works.
> The below change is just hack code to let me verify the rproc->power value.
> The issue with current patchset is that after rproc_attach(),
> the rproc->power will be 0. So recovery only works for the 1st time,
> when it is triggered again, rproc_detach() will abort early in the if check:
> if (!atomic_dec_and_test(&rproc->power)) {
> ret = 0;
> return ret;
> }
> 
> ---------------
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a92c6cd6df67b..2b69304084d11 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1786,7 +1786,9 @@ static int rproc_attach_recovery(struct rproc *rproc)
>          if (ret)
>                  return ret;
>   
> -       return rproc_attach(rproc);
> +       ret = rproc_attach(rproc);
> +       atomic_set(&rproc->power, 1);
> +       return ret;
>   }
> 
> Thanks,
> Peng.
> 

Hi Peng,

This issue should be fixed after using rproc_boot instead of 
rproc_attach. rproc_boot makes sure that rproc_attach is atomic 
operation and it also increases power count as you mentioned above.

Thanks,
Tanmay

>>> Thanks,
>>> Peng
>>>
>>>>>
>>>>> Thanks,
>>>>> Tanmay
>>>>>
>>>>>> Thanks,
>>>>>> Peng
>>>>>
>>>>
> 

