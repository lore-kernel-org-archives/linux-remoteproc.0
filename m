Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B9730B528;
	Mon,  3 Nov 2025 17:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762190539; cv=fail; b=LTm5xQvJpRTZPlYgwzjdm9Ba9KWqD4rGBbr9pFtbVP6dgp5fp2weGv/kEPn3mXOZAxo5FTWxNcRsLAOH6f4j8pmw3eU6UnB0CBZ77Nxy7QPpXF/WX5gX6ggDe+qBoWmzNSGdkQ0gCL3+mdNoubk3sybQqXO5uXO5lf5/pODYFFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762190539; c=relaxed/simple;
	bh=6g3omi00Z7ybIyAxVtRJEEZHIusjj9MsPA8ySfNRLXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T6VQrsWd2wH1dxLnU6/RepAF/nWbhQFv1dq2FgIgxMGYPQuTjSIHskcKVSW6N+5EEOz4OOjqx0pkS8rh8wxv74XAviyKuoIP6QQXB3ebW4iZKTKAeKwcp+4Qd5ML+wkpSj55dMDojfmLjcFpasP6vuQPYsf0jP8yE++izRIvJ+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ISgXBm4k; arc=fail smtp.client-ip=40.107.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ISgXBm4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5JZ9gzkOMkQMtv52o3ARQtWncJoSWJFMz1KJ1kNvDemn2jjyartyszzWG0P1BmwxgL/pPqFg5Q/XIa3mXJiEdG2ugXlCGCKY14BaLAOdIyPsV0u7rTcgjAbtFaBsK8/Qn671EfeJdNHZNyTxj2ETohhNZM7zu/PEWqoEd3yKXcoHwGQoji9Jyn/S9ROFB4SzWNp/aKYXXn0YdsGSgv8WrCoQYGUIV81koMAj81Rik0NI3UBIlW8efNP2E0NgsPZcLdW3Q9/Fs8Ssq946a/1Ne8rwYGqngGcced4tavldS4YUhHdorVDoMYvuYYJ+zCziBo1PtPRUkVq7SoFivEU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcVl4FWg7ZOmgXL4bq64EhDujdiGF/nESvvzB4oJemo=;
 b=MT76q4ZbxMTWgb0sux00Jvrqg3jtoQhoR8YX5HwgWB2glJZlLVH86RPfLJ3fSFhZTu2HmGs8eaTR4bDMir7O2KD6lBA05UWms0ptxF6U+QuhS+lSJtPbIyISPdq/fTlpMtvO+a6jHYCMHz1b/9X9i1PuB/fm5+TdhBDzvI6w+xZ4jQf8Mq9VYjBl+nTpW6zm12tNuX7d01V18VsLfqM0yKIf7yTJcOvcVE62AmLTQo+uroZkrOaSMHHiR11Zqj9iKIw3RMYt9i9bjTK2oQIcHEGR557NmFnoSkD3RX4MUn6FaV5Ey/+HP+1zAf+hcf8I6VdJUhZAs7hGEWuqxyeVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcVl4FWg7ZOmgXL4bq64EhDujdiGF/nESvvzB4oJemo=;
 b=ISgXBm4kH77dQOtDkVRNDjZ7FjSUN4jgoEwZEgBczLwY1kxHoxyjsoTRzRpnWfNbEtzjIdL7jgjot4wHcm49KJXtBYU72Rele0efJ+pqIHDi2nBLcPTr//w/Mxr9lrZPUKdcpgooU3GSCms88Bg4kEMcwKHosTz1n/4KE0pxvHU=
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by IA0PPF73BED5E32.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 17:22:13 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:510:34b:cafe::51) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 17:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.0 via Frontend Transport; Mon, 3 Nov 2025 17:22:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 09:22:10 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Nov
 2025 11:22:10 -0600
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 09:22:10 -0800
Message-ID: <a67854cf-1061-4335-8e39-e74b9733d1a9@amd.com>
Date: Mon, 3 Nov 2025 11:22:04 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 2/3] remoteproc: core: full attach detach during recovery
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251028045730.1622685-3-tanmay.shah@amd.com>
 <e3e2f821-4585-4eb3-8e5c-af4d6ab29234@oss.qualcomm.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <e3e2f821-4585-4eb3-8e5c-af4d6ab29234@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|IA0PPF73BED5E32:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb096e2-6983-4a3f-0e62-08de1afd86f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0FtR1pLSUlNOE1RK1VRR0N0WG5PY2hIMlNldzNYWG56VXRTODhmSTlscnV5?=
 =?utf-8?B?S29vWm1UbzNuY29ZQWp3MFVqUHFzS3E3ckZkZVhvakVBRnFZN2Z4cC9KWXZT?=
 =?utf-8?B?M0lFNEUxTUc2ODRBUkNvWWRxSjBCSTdnQVZFT3lQdlZoRDRtZ3FQRzlLbmxO?=
 =?utf-8?B?QVArSy81bHhzSnROSzU0WE9KRjQ2amhFUm9xeExPdXAyaW96ZUdvcXFtY0No?=
 =?utf-8?B?eHN0cmtHa1BvZ0ZkRCt0dno4OS9idFlxYjBMVzZYSE44SUZPcytTaVlJYmlk?=
 =?utf-8?B?KzN5MHBPempNTks0SWcrS1JxYjZDRVBmUDhEUHpKSTc3bFJLYlY0dWtLSFVw?=
 =?utf-8?B?VDdGM3d5V1N0SHpqekdoaG1HaW9IOVlpYkUwYkQ5b0NnQ0tNd0JUR1k3N3h3?=
 =?utf-8?B?RHMwMzBFd0EvL3ZEYnNqMllyakdZMFA4RWdYUDlXblFpcU1hd3lPbTFYdHR4?=
 =?utf-8?B?UGNvcVp0d0hNYWNCbjArcnNDNnJBYkJNUVRUeEJnUlM2QTM2dWF0cURlMGVR?=
 =?utf-8?B?UjlES2xZR213ZVczMjJjd1ZMUFBIeFoxUHFVZ01GTnZDaFBCUUt1b3M2aWlv?=
 =?utf-8?B?cmNnRUNYeC9jcmVBK1RwRktYenhQSkREbzFNeldmNm90VDhaWXlCb3Jhc1Ro?=
 =?utf-8?B?QThhUisvTmJtQnMrOWVyNmZGL3RycFFJcEdLenhQc1ZIelhmUlZUTGtzNjF4?=
 =?utf-8?B?MGJIOXFBbWJ4UmlPb1NpbFB5MS9PaVM5ZVdPYm1maWhsbzd3d0VsK0JCWU1t?=
 =?utf-8?B?anBtOFVGMGU5b3YreE1qZjBvOVZYYXpHYjZKaGNBU01naThyaEdxWnFxOEsx?=
 =?utf-8?B?dkNiUnBseDlCSTV0cTZLRnptd0FuZFhqNDQ2UG1EUUpVZGt5cEFlMkhOWklI?=
 =?utf-8?B?Wk1ub2RwRXp2R1NvaVZwRVd5eER4OWNVd2xrMmJQSVpMTXRFVG5SdjlDUFgv?=
 =?utf-8?B?WjRnQitvOTVTWUQ1NHh2bStqR2tnMjFzZ0VPVGNOWmVCRE5vVjB2SGJ5b3cx?=
 =?utf-8?B?cG0zdUVIck1Gb3NRRjlNRUpnNm1pVSs5cFl0MnpmdkIwank3ajZhVXF6Q0I4?=
 =?utf-8?B?eENGNTZyY2ozK21mNmFlN2taSjNYTG5KTlRvbnJxVDlBOGVlNVphZmM4eVlE?=
 =?utf-8?B?MzY0SVFzZUxwdG1nanRFYUp6eU5rK2x5Q1NsVXpNVUdIQ2tBTit2UGxZZU1m?=
 =?utf-8?B?QUtROUFDSFlLRG44Tjh4bUJ0N1VKNFdTZkNNSVNFOTIwb1ZlUDRkNkt4KzJo?=
 =?utf-8?B?TnNXQVNpandoYUNiZUxoUGIvbjNGdzBMbHo1VFRrR1YzekIyTzVjb3l2UTFY?=
 =?utf-8?B?c2g1UUw1VE43RlBuTnRRRndVMmZCc08xdlkva2UyTHBUVXE2d0YvNVdnNnFB?=
 =?utf-8?B?NythbFM5eEF1YjJCTHIyNUJaOUNWUWgvMkpVKytrcllWQlpVVmRTY08vZ3pn?=
 =?utf-8?B?RklyM3B6RzZIc3EwU3pnVGF0Z2xIVWR3azVmZDZMcDJXSFpTR3oxQWRtV0tH?=
 =?utf-8?B?b1ptVVF3azRtYXJxUWlTUUlMWlhlQVYzTjZhdGVwQmZUY1l1YVFoYkRHVUlP?=
 =?utf-8?B?QitMUkpmcml3aVhzZ2pkOTFQcjZrSG5IWXA5L1ZlQjZRSnU2ZldNUnJGWVd4?=
 =?utf-8?B?QWY2MzBsVi8wQVZlNlhyWHlHdnNVWW5qQjY4UXQ5bWs0L2NsaW4xa0FjQ0l0?=
 =?utf-8?B?S1lSMy9TTmlaQ3kxZmhndnFrVFQwZEtNcDhadzBRN1lGNU5nNFhsQS93dm9k?=
 =?utf-8?B?TFcxRHBDM0lWMks4bWlBd1o5dU4vdlBDWGlSNmw3cThMMGtUTFJlaU56TWJI?=
 =?utf-8?B?VG41Y05IUnRwcjZXWW9LMUtIZjcyWFRJVDZSTXFkek1KRGRKOVNzZURjZC9U?=
 =?utf-8?B?TXlRc2h5L0pHa3NqNmxXVkdxSWNMcmExQWNtbzRYR2Z4c0hqc1JwOXQ0b1VE?=
 =?utf-8?B?U1dHODhxQXlMRUhmTElaVU5IZmpmRjBjN2lwamRqS2ZwUTlFMVZnZXowUC92?=
 =?utf-8?B?bnFYcGhvN09YekNCUUdxUEJHd2VMODRxcHFiU1d0YlB2YUx6NUZWWUt5Y0V0?=
 =?utf-8?B?dTQxY0ZneHk4R2tXK0NwRDJ6di92VHpPVUJKa2J6TXh2bTVhc29kenFJQm9o?=
 =?utf-8?Q?taKA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 17:22:12.5242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb096e2-6983-4a3f-0e62-08de1afd86f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF73BED5E32



On 11/2/25 2:54 AM, Zhongqiu Han wrote:
> On 10/28/2025 12:57 PM, Tanmay Shah wrote:
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
>>   drivers/remoteproc/remoteproc_core.c | 22 +++++++++++++---------
>>   1 file changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/ 
>> remoteproc/remoteproc_core.c
>> index aada2780b343..f5b078fe056a 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc 
>> *rproc)
>>   {
>>       int ret;
>> -    ret = __rproc_detach(rproc);
>> +    ret = rproc_detach(rproc);
>>       if (ret)
>>           return ret;
>> -    return __rproc_attach(rproc);
>> +    return rproc_attach(rproc);
>>   }
>>   static int rproc_boot_recovery(struct rproc *rproc)
>> @@ -1829,6 +1829,9 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>       struct device *dev = &rproc->dev;
>>       int ret;
>> +    if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>> +        return rproc_attach_recovery(rproc);
>> +
>>       ret = mutex_lock_interruptible(&rproc->lock);
> 
> Hi Tanmay,
> 
> I have a concern about this patch, specifically regarding the locking
> behavior and potential race conditions introduced by the early return in
> rproc_trigger_recovery(), by calling rproc_attach_recovery() directly
> and bypassing the original mutex_lock_interruptible() in
> rproc_trigger_recovery(), the recovery flow now executes rproc_attach()
> without holding rproc->lock.
> 
> This could potentially lead to race conditions if other threads are
> accessing or modifying shared resources concurrently.For example, one
> possible scenario is:
> 
> 
> state_store/rproc_trigger_auto_boot
> -->rproc_boot
>     -->ret = mutex_lock_interruptible(&rproc->lock);    <--(4)
>     -->if (rproc->state == RPROC_DETACHED) {
>         -->ret = rproc_attach(rproc);                   <--(5)
>        }
>     -->mutex_unlock(&rproc->lock);
> 
> 
> rproc_trigger_recovery
> -->rproc_attach_recovery
>     -->rproc_detach
>        -->ret = mutex_lock_interruptible(&rproc->lock); <--(1)
>        -->ret = __rproc_detach(rproc);
>        -->rproc->state = RPROC_DETACHED;                <--(2)
>        -->mutex_unlock(&rproc->lock);                   <--(3)
>    -->return rproc_attach(rproc);                       <--(6)
> 
> As shown in stack (5) and (6), two threads may simultaneously
> execute the rproc_attach() function, which could lead to a race
> condition.
> 
> Please feel free to correct me, thanks~

Hello,

Thanks for your reviews.

I did not face this problem during verification on board, but
your assessment is correct. I have been thinking to use rproc_boot 
instead of rproc_attach. It provides locking mechanism, and then also 
increases power refcount.

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/remoteproc/remoteproc_core.c?h=for-next#n1904

I hope that will address your concern.

Thanks,
Tanmay


> 
> 
>>       if (ret)
>>           return ret;
>> @@ -1839,10 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>       dev_err(dev, "recovering %s\n", rproc->name);
>> -    if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
>> -        ret = rproc_attach_recovery(rproc);
>> -    else
>> -        ret = rproc_boot_recovery(rproc);
>> +    ret = rproc_boot_recovery(rproc);
>>   unlock_mutex:
>>       mutex_unlock(&rproc->lock);
>> @@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct 
>> work_struct *work)
>>   {
>>       struct rproc *rproc = container_of(work, struct rproc, 
>> crash_handler);
>>       struct device *dev = &rproc->dev;
>> +    int ret;
>>       dev_dbg(dev, "enter %s\n", __func__);
>> @@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct 
>> work_struct *work)
>>       mutex_unlock(&rproc->lock);
>> -    if (!rproc->recovery_disabled)
>> -        rproc_trigger_recovery(rproc);
>> +    if (!rproc->recovery_disabled) {
>> +        ret = rproc_trigger_recovery(rproc);
>> +        if (ret)
>> +            dev_warn(dev, "rproc recovery failed, err %d\n", ret);
>> +    }
>>   out:
>>       pm_relax(rproc->dev.parent);
>> @@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
>>           return ret;
>>       }
>> -    if (rproc->state != RPROC_ATTACHED) {
>> +    if (rproc->state != RPROC_ATTACHED && rproc->state != 
>> RPROC_CRASHED) {
>>           ret = -EINVAL;
>>           goto out;
>>       }
> 
> 

