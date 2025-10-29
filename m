Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CA311C20;
	Wed, 29 Oct 2025 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781326; cv=fail; b=IbqawqdOL40i0ujLRn7NrUvpSSFn0Fx1K34nSCUGHo7yc3BpFAC5zeOP/uhQLogCtxKKG0sC2VoNPGZNrzeCuy4MQ9aJf48XL0lip/ABywFOReP1rIU0F+u3avwvzpi2MsEoDF1pZRIYpBfDdP4b+hBqMj4vQyeM+UzMz3Meark=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781326; c=relaxed/simple;
	bh=zO9OjUvJYtHd2jrHcEwAEjPSoX3+SXbKm2+QPsX+95w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LqPwJ7oevHMxMPmVLDP8jD30RWS0BBsvGzhqQukF+NImNIfxJ+PsG4AK+FhKjNT8EsqKYs74DPOhALqIJdV0sG5GUFNXYjweJonTEXXtRSu6LDOJP1ZiJxPvlmaAqTKTKvwIoBs+cNYW0nPWwnoQ5BX/UFTw+1FWJuNwIfwgajc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IRF7m8BT; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IRF7m8BT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LAgccZgmfBKr9tSlAvqF1ZVcCOdoKpoNrExK/kGHsKqXEYgZL8tdRLuiJ8zJtKMu4LImIJDfg8yWKsYj63aTLKmOxzZYLe87ZhRjVVRTF0HH4ZQ6ROTkrZ5Ao0aIv81rqx4KuUN67j3dx8TYnvSj0nI/HhtDvBD1ikOVyGhQTXo8JM53TUR3iPFieYVtXGEH4yNHItYcep8n6N3lAvacjZVCGMeQYSapZRq10Hc3QPO2qpvS3L/347ydWWmZniwxg1SLaPEgc0aT55wAsajy09sxLtkBNfnz0Lm11slT6sLBunJBeY5/35oLh11mrhRAeFqk09hzyVs0d721l8xrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joh0bg32dnadt1HEUv8A6zaEOulnbLahkZ16hE89uAM=;
 b=QHrwqEUWE3cwJyY3ZJ7dyh6NY7IdSKWIaz+mM7D7VN94hwpvyeCLLEZ5S60w5+/0VPwN1kpDdbqhd4ew8H+WgKycxnlGwS7Dxq1A+QOJqiI1LPf6PZm/m2T8eXGXb4AHpJuf1kkJkcXLcJ9qll0r5oDSnZYOZbLPmw0u2s0YeDhjtzTy2wiVEVGd9QY5yQi9DqQKQDGXwfn6ZrgYnBB/tVxqiQnajNQjQ6BcGI+n81SCTfxDN9R3IKwxzOQPjakDL/RwahXl6HVVMBsfolLfvDPK0yZ7z9TDiIFMMw5GcIn7eMAKqRphdvJCLydmriddqEuRDuEnmL4gFOpGl+Nyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joh0bg32dnadt1HEUv8A6zaEOulnbLahkZ16hE89uAM=;
 b=IRF7m8BTeRYwWxffR7GfuZAHnFkJLZVkc2LhAxOK+/E6/7eKUKX0Yw6HOk5sFOGVfuc/Y1nRLvPyPjIWDsOsRFNMDBou2B9+oyyiPAh/4W+sRIQjcnkPYyDDiwQtBZk08ExlhJjqTQO0o/JyNALaAc7urY6aSBHcqLOqxG7eY58=
Received: from CH0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:610:e7::7)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 23:42:01 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::4f) by CH0PR03CA0212.outlook.office365.com
 (2603:10b6:610:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.12 via Frontend Transport; Wed,
 29 Oct 2025 23:41:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 23:42:00 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 16:42:00 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 16:42:00 -0700
Received: from [172.31.8.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Oct 2025 16:41:59 -0700
Message-ID: <f60385b5-e6b3-4e76-a0c9-e8816388d93a@amd.com>
Date: Wed, 29 Oct 2025 18:41:59 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH 2/3] remoteproc: core: full attach detach during recovery
To: Iuliana Prodan <iuliana.prodan@nxp.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251028045730.1622685-3-tanmay.shah@amd.com>
 <35f18c7d-8853-4e1e-b506-c0899453ca95@nxp.com>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <35f18c7d-8853-4e1e-b506-c0899453ca95@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5288e9-91c9-495c-1197-08de1744c1cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SG9hcTFFVG1FYnl4Q2tFWWhQM21KWnk4OFZ6SysvRWJhTGZxWVVYaC9Id3R4?=
 =?utf-8?B?emVYaE9kOWVXcTVhME5uR0tWNnkxWDlWRVVWTjBZVmE2S3BPQTk5VzBFYUdV?=
 =?utf-8?B?OFJPdUNKQmw1QVcvNlFnNkV4aVdCWlAzN0QwZVdRMlJYbEZnYWJwMllrMlFp?=
 =?utf-8?B?T01RbU9rb2UwaVMvVElHL2dBOG1WbGZma3ZHS05KZHEydnY5OVRrMlhSVG5l?=
 =?utf-8?B?Y0JScG85aTZRb1VEY2RheklsbFo3OXhSRFMyQ045UCt6cUJQcnk5aTk1bW05?=
 =?utf-8?B?aks0ajFtN1Y3R0JRYjk5ekJQeFBQamFlcXpQUW54SStYVllMV3VuMWFaam5T?=
 =?utf-8?B?NnBMak9oand6eHQrUDhlNXBrRDA2eXhsNGdrY2UxUWlweGVHaDJ4dVlFalBE?=
 =?utf-8?B?ZytQdmVldGRPLy9saWdsSmJBS1EvNjBqcnVoNU8zenh5MlFFUGRnL05LZ2tV?=
 =?utf-8?B?WWtsTkNSYzhSV0NIdzZpSHdTSDR5bnA3dDRuT1J1TWhhc0Voa1R6dWd2VVFN?=
 =?utf-8?B?ZG9LcXhOZFQ5MjJRV0dXamRnZG5XRWh6Mk5ISm1CM2NEUnJsMHFrQXVWeWUw?=
 =?utf-8?B?ZVlIR0tpemtDSVZwTS9ndTVLTFRsMHBWRitYbUFQeERLSytYMEVTS3UwU2hX?=
 =?utf-8?B?UWZJd3d2ZE1zUzFzZ2ZxUmNUdDJzcmkwajVNWXkzY1l3RWE1eDJvVXpJcmlY?=
 =?utf-8?B?NzYxaHV0bUFUVko2eFFrdno0RDI1VWlSajgzOTNabUkxblIvbDhqRXpBTE02?=
 =?utf-8?B?TllleUg1dlMvdktnby9TMGhqenNodExEclhuVTlLVmJpZjFnVCtsVkNRd0RK?=
 =?utf-8?B?eDlBTWpMbnljL1NBblkzZ1ZIWUJ0YjdKVmFob21pMEhNRlVtZ0ZYMXV3Z09K?=
 =?utf-8?B?cG96Rk5MU0hEYXBEMmRTbVVrTEZNZi9Mam9USmp0QVZSU3BnNytkSjU1ZHU1?=
 =?utf-8?B?Q1oySG1EWWJMdnZZL3JYNUE0eWNxZ0lVK3ZiZjkxbVVRc2g1VG1tQWdwYmY5?=
 =?utf-8?B?N3Y5Q3ozMjRmejY3dUh4R1F6Qk8wejhNeTVxL2F6T3NQQlFHS2g2N0d4cDJp?=
 =?utf-8?B?Z1J1V1RTczBpMlJJdks5K29zRHF2dTlKT2o4aEwydWM1NTd3TFdtRWlNbjdS?=
 =?utf-8?B?WU1QVkl1Y0NoZ2wwbXp5QzVGYzN3NG1NdTgyV0dSQWtEMFQwVlVnN29SaWhs?=
 =?utf-8?B?MWpjOU5mVkFCcHI5Ym5zbEpHL2lvQjIvdkQwbFNPWUF4N2pnT2xUY1ZQbjdO?=
 =?utf-8?B?T1FlVTJOOExIbUJ1YVlsanZNbzY1YTRlbzl6NjBSTjI0blA2L0FNNWxFTmNH?=
 =?utf-8?B?cVNPYWFNekloNUU0VEViMlB0UGFJNHBWUHJHUDVyVHk1QzNRZ0hvM3hnS0xs?=
 =?utf-8?B?YWdZRERYcGFLRlBuWkN2bjljMzBZT2pWbmVsd1dlNWpONUxUcnJrd0dqWXMr?=
 =?utf-8?B?MWwyaENRRW5XUVI3NjZhNjlwYk5BUlNhQWFFSlVvQWNyWXVOcWNsZVlhTy9R?=
 =?utf-8?B?RXBSWHg0aFV3OEZ6VERNRUt3aGkyZFJoUDdLR3FLMTRmY2h0eHBMYUZ3cmp1?=
 =?utf-8?B?bngyUUxUdkU0MEo2dFNJcHN5NVBLcnJQdFFvUEE3bVZSWEZ5RW5tb2U4azFp?=
 =?utf-8?B?d2NCdFVjWlFWUjhpWXIzemZLV0dFcGdubHVaWDNjcEZZa2RnalVCUWVjYkZG?=
 =?utf-8?B?amt1aElQc0hpY011SmFTV2tGRW9yWWxPSWd3bnlvSHRjTkZpZVBuZUEzdWtv?=
 =?utf-8?B?TStOMk5IZjBhYTZQRGZNd2hPVlhJR0hXb3FBZmo5cTJscjlEMFh3ZTFvNEVV?=
 =?utf-8?B?RDY2M2lianhTVkJ4L21EdUxESHJidUJuUHl1aEFzdlE3WUJ1bzVtN2V2dmdk?=
 =?utf-8?B?c2w1bUZhWURUZFFnTGs0RmlNeUxzdWRuekczN01XQXAwdlRkL2FzZWRCSVpF?=
 =?utf-8?B?NmF4cGVQV2R4bE1iWXhmeXRpcUZzKzhKcVB3SzlmYzV1eXZlcmxMS1NrNEJE?=
 =?utf-8?B?OHBTdEt1eWFVdjVsMjNQMVFLWGdXU1ZLQnRDQ05KQVZaZkJsM1RyS0xsa2Ez?=
 =?utf-8?B?ZlZHZmo3K214RXRoaERlTDNUUUFsVDc2V0Z6b1BmMGtKcWcwRTVscU1nd2Vo?=
 =?utf-8?Q?uWG0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:42:00.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5288e9-91c9-495c-1197-08de1744c1cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130



On 10/29/25 5:49 PM, Iuliana Prodan wrote:
> Hi Tanmay,
> 
> On 10/28/2025 6:57 AM, Tanmay Shah wrote:
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
>>       if (ret)
>>           return ret;
>> @@ -1839,10 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>>       dev_err(dev, "recovering %s\n", rproc->name);
> 
> Please move the log message above the new early return so both paths log 
> recovery.
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
> Tested this on i.MX8M Plus using the imx_dsp_rproc driver, which 
> supports recovery.
> Everything looks good, but on imx_dsp_rproc we use rproc_boot_recovery, 
> not rproc_attach_recovery, where most of the changes happened.
> 

Hello,

Thanks for testing the patch. Correct, if attach recovery is not used 
then the patch shouldn't affect functionality of any platform driver.

Thanks,
Tanmay

> Iulia

