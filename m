Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012069.outbound.protection.outlook.com [40.93.195.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409D13DDAA;
	Mon,  1 Dec 2025 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630359; cv=fail; b=DS1CDQVApFX7ZmQzGanTT2nmiy+7IvSOTa/BDXuAlupUJJHeKCrsSiwi5oemN9V8TKHX1neGVovj+5vClGndNfpWIm77n2WA5Bwo1mcVEMIrs0f5F+Yjw/Do5AqFc953TOQZSKwoUS8CBfFRN6vKKioizIPHBrDpiIY/OVrSIWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630359; c=relaxed/simple;
	bh=Sh0q+sDQQjsR3L0e+of/mCRN+wFYnXO82atGu2QGJM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fe2oXT5SKM/XtldX+ZR8Hq22T/cCpodLrryefEBdCOOQue+GjAhRWzlPTlF546L54Mz7AJWmpM8q8tJ6an8hcOubpk5jp+ahmiQfLHIvJBrjXtjz5Ytb93Z+anV70+ugGe7H//hoPn388t7wO+LttMmcleEEUzUZyKwzyg4TILs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b8qCToJk; arc=fail smtp.client-ip=40.93.195.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b8qCToJk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLtQRnoGRme8mX/twhaUgBaAUr9x8cvWoOOsFC8QZlRMFQHnhi30tIfxRzFrh3NBehXhmi59Yn5ZnzIu8WkYGJn/C8AosYC6o+XBRtDPauhxVGTcCz0Im5ATk8Str5RQsUbcTEz4tcFY6L4fe48fP+xyQkvcuO+/V9jG/n4++jhDFZqduMJPN1hLdp3BEDer+cKMgEMimd5m0iSn1UvbsnPzV15wnGymCoN6LjnmVG6VlEPrRLPuVZlljWSPpyL997jtyJURvrgYSzbLV0I9ktrP6XI4bbjfVwzGbjhgKFphfGdIncX4tKKIyQfgXATvhNcx3U+kC5pPB4sj4hUuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAS33M64aYvqXFrzgvTvgoLcibsKj2jEJrNIuyI4qAw=;
 b=EjqM9t/0thvxLZB1xmAUeyQuOg1JEco4av1r53OyXiB4Y7naQhVFOi8KM7xYkwbJZeHlffFlEX+KEGnvuYsgfjO9S8OytNoMxohJ3o6zWttHT3nzSGGEL/6b68TtPyLAk3VS6hGhZEVPTwcGIcLJyEw9SBnvWm7SqUmejLi579Nun8Azbarc/EWXl7hyTTL2qSttMaM3wFRxVTGgI+DeyJsHr24EIEeEiQrQGtU0iLqiPFpsiH0wdIRSUcmMiBFKYl1+/J/cAIjmYM07LRAWH3PKTiVLXb7q/4T6yGVkClx5cqaql08LOGe/LwPop4UH8qF6JXgyjGb18ZfbarQ9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAS33M64aYvqXFrzgvTvgoLcibsKj2jEJrNIuyI4qAw=;
 b=b8qCToJkQFo7VcZQkFxfckAISnVfe9abz4QOCWsN3s769fYUnKMH41+8u1E3KD/7JqKslvT0VGVQu36vAEgYl2HFneKOz4cbKMjhdUa8dChCCX1cyIveycLsDGXYxmnMdHsnyeTQapUEN2IZgEw8oGU/I4OSg/YhrsHeYtsUvqY=
Received: from SJ0PR05CA0064.namprd05.prod.outlook.com (2603:10b6:a03:332::9)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:05:53 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::59) by SJ0PR05CA0064.outlook.office365.com
 (2603:10b6:a03:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Mon, 1
 Dec 2025 23:05:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:05:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 17:05:50 -0600
Received: from [172.31.132.204] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 15:05:50 -0800
Message-ID: <af34e73c-0e66-4150-ba2b-2cf616dd68d3@amd.com>
Date: Mon, 1 Dec 2025 17:05:50 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 2/3] remoteproc: core: full attach detach during
 recovery
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-3-tanmay.shah@amd.com> <aR9WvVjvBhXoO3oh@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aR9WvVjvBhXoO3oh@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 480730e6-a81b-4fcb-0ee5-08de312e2c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmhXL0hKUzRmaktGZ1JyVjRhZXIyRXE2VkcvNjVxcjN5Ulp1S1NDc1diMjdm?=
 =?utf-8?B?dCsxeDk1TGxUcytFTHdPeFJKcm9BNkYyNWY2bGhuYmhYUGZYQnIwbXdkaFlJ?=
 =?utf-8?B?Wk5vUUt6MkpnNDRPTHpUSldtWjA2TGNDS2h4K1Q0QlliTVIzOVJBUnc1dmlr?=
 =?utf-8?B?ZXliLzdrbzFRaU1tOHo0bU5zMGZOVmQ2OFdPWGZZampCVXZQSDh1YzFBZ2dL?=
 =?utf-8?B?YkZNR002TzBhSGtaLzExUXppaTRtcGVBNG16cUFmaFlJRHVuZTh0NXZoZE9Z?=
 =?utf-8?B?ZTM2NHJ3M1V0c1E0VVpPc0k0OGFPNUN6UkFDdTRMQ2s3NURhN3QrNEhMbi9w?=
 =?utf-8?B?S1NRWDJMUFc3RHh3NWNDZ04xZGs5NEx6d1FvVWpBcjdDTjZYM0swSDIxTndV?=
 =?utf-8?B?ekZSQ0RhSGxNOStMcWx0WHRkV0p4Z0pxbGF3c09HOHIvZzgzRmJtcGtDZjFS?=
 =?utf-8?B?dTVLUXY0SWErVnR1NDVuWGtzamQ2T2Z2NW0zcmRDR3lFK2Z5RWJlWW9Pcmxn?=
 =?utf-8?B?eENsb1FLbnhhSHNDbjdXVkwzNEY1ZlJTbThmQi9BTit3MjRVZnFsdE4xT20w?=
 =?utf-8?B?QjcvOUsyc0tOL2Flc3Q1RDdId0xuYUlkQkx6UnR2UC8rUGFiRGlkM0xha2xV?=
 =?utf-8?B?MWNBb2dEUWZoNFVwRjViWjgzOFcyczJ3U295djZ1bWpMYXVCOE1Vbm1IWllQ?=
 =?utf-8?B?RzNHZFJDWTg4SlZxakdsSFFSNm5iV2YrQnJBMjlXRzJudHd1VEtvd2pCcmp2?=
 =?utf-8?B?MmNhenF1VE9SSGF5RmZBOWxQMUVheTVuTTRoZ3RMcVl6MDlCeTFNUjhLWjl4?=
 =?utf-8?B?WC9uaHhBSjB3QlVqeS9zKzhMdmg5NlJBejR3N2JvR2NncmVoMmNMYTl6OUZq?=
 =?utf-8?B?U0oyUEdobjB3T2x1RVg5d0tmdHc3U3ZnSHRrNTVZcTV2Ujl0WXp5SWV0QVdH?=
 =?utf-8?B?b2hMdXJoMUt0Tm1PRVBaVXlxcWFwaVV1TXNTT1B3UXBaWFF1UDc1ZVpMeTlN?=
 =?utf-8?B?NjZMNW80UFJkR01GVUdqaS9HK25aeVNUZGxNRExCMy9tbEhud3lhcWJrYytl?=
 =?utf-8?B?STNocGpCclc4WW5lR2pFbGlCUGwzWkt3TzhoODJYbytFUGpPRlI5R3JiRExa?=
 =?utf-8?B?bDZNNmNBMUVyalR1cVlxTFVsVmtOVmlqMDI0WHhTOWJkUlo3dFZ6c1RvYisv?=
 =?utf-8?B?c3VlU3pXQ0FzOXdwY3NlTmNScjJRR3o0b3I1Sk15ajRFTkMwcnIwUWVmUTVm?=
 =?utf-8?B?ZG1MMUVKMjVVaUZaTkxQSTNVUGNHQWdlcFowU2YvU2ZRS21URit2N3hZaUd1?=
 =?utf-8?B?S01wcmFFa2sxNEkrY0NXUUFmVjdobDFxSkNROVcyMDBrNHFIRE0rMVlZVC82?=
 =?utf-8?B?a05zR1ZCUEZ0cWh3MmNrcDdkUnZQbkVJMmZxVE82c2R3REU4MEErZGZqK0Nj?=
 =?utf-8?B?SExtNDRMT2Nmd01tVUcvTXdUb2RmSzJuOERSMy9aNTUwZDgzVUl3dldYeHNo?=
 =?utf-8?B?a3U4aDRUTk9WM0RVYmMzSmM3eS9wd05NK0ZDUkF2QkozZHB4Z1ZMeFJseW1q?=
 =?utf-8?B?MmdkZVpZMU1ZRHRWTkxmVFF5MGRrZC9leVY1aVFtcmw2WVBuTm9KdGN2bFZH?=
 =?utf-8?B?UnhqNmZ0aDdFdWlDbkh0cGw4eWU5R2lJWndVdkhJYTY5dFI2ZFhrS2szMDN1?=
 =?utf-8?B?cm9JSUFIWnIwMmc4NGl1Y3BoQzBJTjVrcUZhODdCSmtSSFFMZXp1MVI1ZFVz?=
 =?utf-8?B?TUdwMFdFeG52bnpMcGk5Nzl4cllkeUNMdWlHbEYwVnM5NzRiM0UxS0d1TVdv?=
 =?utf-8?B?eHVCL0FzU3BBOE9SME5lTHdCMXNabDJ4VThxL1RrdlRPOCtESW0xbmdsSGpZ?=
 =?utf-8?B?OFZPb2NlSS9EMXlSMDNYWTZmeTl1N0ZxR1Z3WU5OZi9qNmNOTThtZG4vaVJv?=
 =?utf-8?B?dlpGSk9vMmpodTRwbkNMMk1QQWVDQkx6TS9PbWI4Nkk1Rmw1Zkh2V00yMFp5?=
 =?utf-8?B?ZnowYWNXdS9kVDJQcGNOT0dkY3FjWEdWK0ZsUzBFTDdUZUNBWVRncFUyMFI1?=
 =?utf-8?Q?OSbSrH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:05:51.6108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 480730e6-a81b-4fcb-0ee5-08de312e2c75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106



On 11/20/25 11:58 AM, Mathieu Poirier wrote:
> On Thu, Nov 13, 2025 at 07:44:03AM -0800, Tanmay Shah wrote:
>> Current attach on recovery mechanism loads the clean resource table
>> during recovery, but doesn't re-allocate the resources. RPMsg
>> communication will fail after recovery due to this. Fix this
>> incorrect behavior by doing the full detach and attach of remote
>> processor during the recovery. This will load the clean resource table
>> and re-allocate all the resources, which will set up correct vring
>> information in the resource table.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v2:
>>    - use rproc_boot instead of rproc_attach
>>    - move debug message early in the function
>>
>>   drivers/remoteproc/remoteproc_core.c | 26 +++++++++++++++-----------
>>   1 file changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index aada2780b343..f65e8bc2d1e1 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>>   {
>>   	int ret;
>>   
>> -	ret = __rproc_detach(rproc);
>> +	ret = rproc_detach(rproc);
>>   	if (ret)
>>   		return ret;
>>   
>> -	return __rproc_attach(rproc);
>> +	return rproc_boot(rproc);
>>   }
>>   
>>   static int rproc_boot_recovery(struct rproc *rproc)
>> @@ -1829,6 +1829,11 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>   	struct device *dev = &rproc->dev;
>>   	int ret;
>>   
>> +	dev_err(dev, "recovering %s\n", rproc->name);
>> +
>> +	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>> +		return rproc_attach_recovery(rproc);
>> +
> 
> Humm... I find this a little messy.  Taking [1] as an example, I suggest moving
> the "unlock_mutex" block to line 1846 and add mutex calls to
> rproc_boot_recovery().  That way both rproc_attach_recovery() and
> rproc_boot_recovery() are called the same way.
> 
> [1] https://elixir.bootlin.com/linux/v6.17.8/source/drivers/remoteproc/remoteproc_core.c#L1832
> 

Sounds good. I will have to test it but I don't see problem with the 
suggestion made.

>>   	ret = mutex_lock_interruptible(&rproc->lock);
>>   	if (ret)
>>   		return ret;
>> @@ -1837,12 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>   	if (rproc->state != RPROC_CRASHED)
>>   		goto unlock_mutex;
>>   
>> -	dev_err(dev, "recovering %s\n", rproc->name);
>> -
>> -	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>> -		ret = rproc_attach_recovery(rproc);
>> -	else
>> -		ret = rproc_boot_recovery(rproc);
>> +	ret = rproc_boot_recovery(rproc);
>>   
>>   unlock_mutex:
>>   	mutex_unlock(&rproc->lock);
>> @@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   {
>>   	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
>>   	struct device *dev = &rproc->dev;
>> +	int ret;
>>   
>>   	dev_dbg(dev, "enter %s\n", __func__);
>>   
>> @@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   
>>   	mutex_unlock(&rproc->lock);
>>   
>> -	if (!rproc->recovery_disabled)
>> -		rproc_trigger_recovery(rproc);
>> +	if (!rproc->recovery_disabled) {
>> +		ret = rproc_trigger_recovery(rproc);
>> +		if (ret)
>> +			dev_warn(dev, "rproc recovery failed, err %d\n", ret);
> 
> I would prefer a patch on its own for this one.
> 

Ack.

> I'm running out of time for today, I'll review patch 3/3 tomorrow.
> 
> Thanks,
> Mathieu
> 
>> +	}
>>   
>>   out:
>>   	pm_relax(rproc->dev.parent);
>> @@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
>>   		return ret;
>>   	}
>>   
>> -	if (rproc->state != RPROC_ATTACHED) {
>> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>>   		ret = -EINVAL;
>>   		goto out;
>>   	}
>> -- 
>> 2.34.1
>>

