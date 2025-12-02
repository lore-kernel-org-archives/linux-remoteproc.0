Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE91CD2C;
	Tue,  2 Dec 2025 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764651900; cv=fail; b=QVW5ks0qfAXaUzbYexMwFpn/l70ByR3BoI4enSX5LGpJ4fyuZOsLI5RHQBC+vQsovv2SeezUuWgDzDef8j2ewZTaRbAQxGSzA9GgTodTM/fb2fFU87iFkFscsrA31GLEX0rIwPHcGFpejrqV8z6ZLEgk6LAV+DTbUvSthFhHROA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764651900; c=relaxed/simple;
	bh=N+OwNjVDRNM2gq0a1PKMC1p3PhFgQXbYjr70s7P3DLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SAQfmfGwi09QL2QY03RJla3C5YlNlUS0ULNMy2A244dSdf9GqsKLef3enjBr/wVJCy2FoZXloXpDeX2hDh8/KkIRUmdXVh/3t7Hkc8Qq3Bm3ZWPTimY/spX1gdDZ+0qdYwNn/RbQXMME2PE3p/LKFhts4nFyE+nTFSGKf/z/YCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=voHuYbT8; arc=fail smtp.client-ip=52.101.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="voHuYbT8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB7OAQftp9xm39uVn7Ngo9f4YTGg/dt9bRO/wmWPqDexcVcrXu9P5cL9cAhQIB0yOTTTchXQ0vvoOvtLbk+zvJzmUN3iYg3a6DJf8K2SENP/HaNeGe+tZeJXH/xLfVL7k35VR6zdVYs8FwF5qFtmvOviOSn87U7HHUy99f1fQdCtUzQaGuv4FstZgX25SuHoD8Y/TODsevkLfpO/B/onY1U2DNp19vMnruHPHIQ/NMFiEpbFyjIbi07bxdVb3FIkSJex9+zO9gdg7ttBEmiJ+O1g1zisX37A0u7HkZ0yFffX2EsGuNhaWJMT6h1Urfk1GgxOnYz4siSCBgxT0hCC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDSCEs+Fwk96XmkcpxoeZhqUI8QeowWw+aM1Tf9WKyQ=;
 b=KWeRdg29QjNBv68/tAxUxa59eomLoDGJVk12CzJSftj2fncOze2hVLjspe4lj/Gkxjv0jlzL+L3xfu1lm07vu+H5zy69oSzrON3AsxTmM70eDrlnNmZd8gYTMQgfOnqbYuRYLlVOgIylAbvwntFsp6VjrK2AsbrgfAxtxummv4FgLerVn9udH9NMOE1tS7I1lW0s27tKDj8dPr+fmL+aTMp8RqLTEEWPH4GkKuKkBoYWuDszukYp/XxT2pOdTdT41eJqyYxZfrgteANNT4gSELvFOh5D8faf97X/5PfNywMeeeCE0AvNvhuOEXFXkCOe6ENbrcD+v22EPEt3t71eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDSCEs+Fwk96XmkcpxoeZhqUI8QeowWw+aM1Tf9WKyQ=;
 b=voHuYbT8j7iTH8SgObdOgnxpFNpopkoqFCPZMvv8Iu5nTbrFLNeXu4Ft8h/2Gt7KxRL//p8v0NLNinFNgxCnHpCKXlvBJnh/hz7r22jToqbVi1E+BSEVI/DUJYrBm0XKvIPEQm5zU/U3ZVt10UCu9fD9K7qscuHeQ5f4mrJIYxs=
Received: from IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::12)
 by BN7PPF9C6E5285F.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 05:04:54 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::ce) by IA4P220CA0003.outlook.office365.com
 (2603:10b6:208:558::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 05:04:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 05:04:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 23:04:53 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 21:04:52 -0800
Received: from [172.31.132.204] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 21:04:52 -0800
Message-ID: <a4c586e5-f89c-4a92-b74e-d358e7cf7a2d@amd.com>
Date: Mon, 1 Dec 2025 23:04:52 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 3/3] remoteproc: xlnx: add crash detection mechanism
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20251113154403.2454319-1-tanmay.shah@amd.com>
 <20251113154403.2454319-4-tanmay.shah@amd.com> <aSCHJvtEwYWb6Ie0@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <aSCHJvtEwYWb6Ie0@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|BN7PPF9C6E5285F:EE_
X-MS-Office365-Filtering-Correlation-Id: 807e13a7-b8a4-4746-0446-08de31605478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW9udDFmQVpjS1ZqQjJHK2ZDaDNMTFJ6YnMyQ1RIYUc0eHRwYThJZWNwNGdv?=
 =?utf-8?B?b1RmTE1kZkZPTXA3UGFuVGtWRFl3aTFtSjdqZTI4ZmZTU3g4OFhHRDRicXMr?=
 =?utf-8?B?L3dOMkZ0WE9vZEdzUG8zUHUrMWlLRyt0d21lWlV5MVVpdStMczljVE9oK1dO?=
 =?utf-8?B?ek1jV2p5SlRTMkFKNGtESXV3ZzhDdTEyQkcyYnhJR1cyOVkxN1MybkNUOFVy?=
 =?utf-8?B?eGdTME1namF0cUhwZXpOQkZhNVpJVDFnenBBN2dWK1l5L2FpOHM2eEFHSndJ?=
 =?utf-8?B?TGtRTHU5b0RqWFRUaFhsOFR6U2tGN2loeUJ0SEFUcDlVdEV6TEVFbjRSTTdN?=
 =?utf-8?B?V21kNmc1TWJ5SXE4U0tjY3hSQkNxcDlnejZac0duZG5rT0VjdkNZWE9GeWc1?=
 =?utf-8?B?UXhwdEFOTzdHSDZadFpTNlFpbkx1YkVIWXp6OTdXc2pGNmhNNlQ5R3hZaml1?=
 =?utf-8?B?L1RPRjJsZEJ0RGJVck9FRVVNbnIrdHNSS281VjdZWktzKzRqamVVY1RkQmtt?=
 =?utf-8?B?bEdSZmNSOHh4SnQvbktvZjVEU3JYWHF5NEwrbHo4ZS9NM1kwaGdKbm9iZjJT?=
 =?utf-8?B?SzExc1grb3pWU3N5NWpkWG1JcFFsLzNGdmpXRThaWHI5cTYwUWJ4RS9mTnhl?=
 =?utf-8?B?ckpETHRDZ1l2bHhnVVgzNUNOeTRoK0NZR21LOUFnMDA5ajMyYnRMQXY1OFBh?=
 =?utf-8?B?aUlvL3Q3TlJYamFDR3E4MUJjNkNrMWNXaEpMZEhFTnhBNkZXOXNzOUVuekNE?=
 =?utf-8?B?Q2hoY2pRTUhXY1hjcDJBbjB1alRVR3RvZmtURlNIRkNzRUo1RDdvUXphSGxs?=
 =?utf-8?B?a1RheTBuRjMza05DME9KdWU5MUw4dG9XRWJLRkZhYTR1SWVPbSs5SXdjb1Yy?=
 =?utf-8?B?QlZieWp3SjVlODY0d1dHYmhvNTBpbzVXZ0duYVVzQVdBaURMd1IxT21XVkNp?=
 =?utf-8?B?b3FPNnRBWC9ubzlBWldNMG1vQ2RtUXBMaVpFdUxYTEFNQmJpbkthMllhUGpO?=
 =?utf-8?B?dVdFZ25RUkgvYkY2dFhCVUQyV1pFTTNuSHI0SVo3UDRmLzlDbFd2cWtWK0pw?=
 =?utf-8?B?dndvVGFqeGFkT0Y4SXhLeE1nbFdyZmVxYTcwRjVDNGd3c1JwM2V0MnN5ZDhX?=
 =?utf-8?B?a0djRnNwZjFqam5FZzc1Q0Fac0NFQ2UwUEpMN0s5ejhJK2FadTUweXZXM3l5?=
 =?utf-8?B?UFpGbDZSR0loQkwyRHRKTjhzRU1LczZac0hzcm9zZS9ub09kRFdVNkVmMWY1?=
 =?utf-8?B?WWdiT2EyeDNWMVkyY0FCbkhjcmhMUXh5Wkpadm5CM01tU2JhRDhySDFMeFhZ?=
 =?utf-8?B?NmxMYTdZQ0R6VElyM0oxaEFCajNHSy9mVG5la1luU0tsRWg1T2taWXlkYjIv?=
 =?utf-8?B?NksrTmk5aUNncFhJRFh1bjIybHkyQW5ZTUh3K2lVTkJLZ09IS2ZMU25XV3RQ?=
 =?utf-8?B?cXlxM0Q5aGdYYmJoTDNjOUp3Uk4vK3Y4dmRXeEtvZmRlbkp2eFJxRXJzaW5n?=
 =?utf-8?B?OG8yM2JVQ0lHVkdaYUR5VGtqbjJpc1U5U2lsY3QvdkRnVitGcTVOb3FFUWY3?=
 =?utf-8?B?WFlXZVFBeG1zYlI1UndzYnFzODY2YXM5OWhNZFpwKzRSS3M4MVE0SWI5NnNO?=
 =?utf-8?B?MExmdXpkSmpwT3FFbVcrbThJMFVvNEUvOHhVSjNxRmlzZEtxUW01aHVEUGFB?=
 =?utf-8?B?dGFma1dINFB0Qk1pdTQ2UzArR1h5RU5tOEg1SGFkNHpxdCtRZlorTDhlSDVI?=
 =?utf-8?B?M0N4QUxCM0EwemtjcW03TlY5dnUxOE5RYVd3SVhkRjFiWk1KeGZaNGtUeGdK?=
 =?utf-8?B?S1BZQ1haSWN1aUtrRHIwakxTckFGQWNobFp6ZU5DU2ZELytpSHVBU0tpOFJw?=
 =?utf-8?B?dGVYRFFhcitkYWRNZTcrMGxubjR5Ulp1YnlnWGM3b29pbmZrVDl3L2dCUmRt?=
 =?utf-8?B?UGZGMFJQR1FGaXJzQi8rSGtmamtlY2srdEYxaGNLa3pWTEI4R2ZoWFpEMU0w?=
 =?utf-8?B?WUxPVE41eVFxY0hXS1pQQi9hYndFZGhWbnRkdjV2NEF2WHhta0poeXVXQjV2?=
 =?utf-8?B?L09Ndk1PTHBQY2tpZlA0cmxQelpkdThsQ0VRaWhiVWkzNGt5UE5heDA4SWpD?=
 =?utf-8?Q?9Z0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 05:04:53.6536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 807e13a7-b8a4-4746-0446-08de31605478
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF9C6E5285F



On 11/21/25 9:37 AM, Mathieu Poirier wrote:
> On Thu, Nov 13, 2025 at 07:44:04AM -0800, Tanmay Shah wrote:
>> Remote processor will report the crash reason via the resource table
>> and notify the host via kick. The host checks this crash reason on
>> every kick notification from the remote and report to the core
>> framework. Then the rproc core framework will start the recovery
>> process.
> 
> Please substitute the word "kick" for "mailbox notification".  I also have to
> assume "core framework" and "rproc core framework" are the same.  Pick one and
> stick with it.
> 

Ack.

>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v2:
>>    - clear attach recovery boot flag during detach and stop ops
>>
>>   drivers/remoteproc/xlnx_r5_remoteproc.c | 56 +++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 8677b732ad14..5d04e8c0dc52 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>>   	const uintptr_t rsc_tbl;
>>   } __packed;
>>   
>> +enum fw_vendor_rsc {
>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
>> +};
>> +
>>   /*
>>    * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>    * compatibility with device-tree that does not have TCM information.
>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>   };
>>   
>> +/**
>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>> + *
>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>> + * @crash_reason: reason of crash
>> + */
>> +struct xlnx_rproc_crash_report {
>> +	u32 crash_state;
>> +	u32 crash_reason;
>> +} __packed;
>> +
>>   /**
>>    * struct zynqmp_r5_core - remoteproc core's internal data
>>    *
>> + * @crash_report: rproc crash state and reason
>>    * @rsc_tbl_va: resource table virtual address
>>    * @sram: Array of sram memories assigned to this core
>>    * @num_sram: number of sram for this core
>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>    * @ipi: pointer to mailbox information
>>    */
>>   struct zynqmp_r5_core {
>> +	struct xlnx_rproc_crash_report *crash_report;
>>   	void __iomem *rsc_tbl_va;
>>   	struct zynqmp_sram_bank *sram;
>>   	int num_sram;
>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>>   static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>   {
>>   	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>> +	struct zynqmp_r5_core *r5_core;
>> +	struct rproc *rproc;
>>   	struct mbox_info *ipi;
>>   	size_t len;
>>   
>>   	ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +	r5_core = ipi->r5_core;
>> +	rproc = r5_core->rproc;
>>   
>>   	/* copy data from ipi buffer to r5_core */
>>   	ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -244,6 +265,13 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>   	buf_msg->len = len;
>>   	memcpy(buf_msg->data, ipi_msg->data, len);
>>   
>> +	/* Check for crash only if rproc crash is expected */
>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>> +		if (r5_core->crash_report->crash_state)
>> +			rproc_report_crash(rproc,
>> +					   r5_core->crash_report->crash_reason);
> 
> At this stage ->crash_state indicates that a crash occured, but how is it reset
> once the crash has been handle?  How do we make sure the next mailbox
> notification won't trigger another crash report?
> 

I was counting on the remote firmware to reset the crash_state once it 
reboots before sending the next mailbox notification.

If it's not the best idea, I can reset the crash_state field in start() 
callback or attach() callback at the end. That will indicate that remote 
firmware has started successfully.

>> +	}
>> +
>>   	/* received and processed interrupt ack */
>>   	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>   		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>> @@ -397,6 +425,7 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>>   	if (ret)
>>   		dev_err(r5_core->dev,
>>   			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
>> +
> 
> Spurious change
> 

Ack will remove it.

>>   	return ret;
>>   }
>>   
>> @@ -438,6 +467,8 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>   	if (ret)
>>   		dev_err(r5_core->dev, "core force power down failed\n");
>>   
>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>> +
>>   	return ret;
>>   }
>>   
>> @@ -874,6 +905,8 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>   
>>   static int zynqmp_r5_attach(struct rproc *rproc)
>>   {
>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>> +
> 
> Why can't this be set in probe() and left alone from thereon?
> 

Right now no specific reason. But I wanted to enable recovery only if 
attach() callback is successful. If execution fails anytime before that, 
then no point in enabling it.

>>   	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>   
>>   	return 0;
>> @@ -888,6 +921,8 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>   	 */
>>   	zynqmp_r5_rproc_kick(rproc, 0);
>>   
>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>> +
> 
> I'm not sure why this needs to be done, same comment for zynqmp_r5_rproc_stop().
> 

I think for detach() may be it's not needed. I added it as a cleanup 
sequence i.e. reverse of what's done in the attach() callback.

For stop it is needed in the following case:

attach() -> stop () -> load fw () -> start ().

In this sequence we need to make sure that if recovery is requested 
after start(), then we execute "boot recovery" and not "attach recovery".


Thanks,
Tanmay



>>   	return 0;
>>   }
>>   
>> @@ -896,6 +931,26 @@ static void zynqmp_r5_coredump(struct rproc *rproc)
>>   	(void)rproc;
>>   }
>>   
>> +static int zynqmp_r5_handle_crash_rsc(struct rproc *rproc, void *rsc,
>> +				      int offset, int avail)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +
>> +	r5_core->crash_report =
>> +		(struct xlnx_rproc_crash_report *)(r5_core->rsc_tbl_va + offset);
>> +
> 
> This function is so simple that I would fold it in zynqmp_r5_handle_rsc() below.
> 

Ack.

> Thanks,
> Mathieu
> 
>> +	return RSC_HANDLED;
>> +}
>> +
>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>> +				int offset, int avail)
>> +{
>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
>> +		return zynqmp_r5_handle_crash_rsc(rproc, rsc, offset, avail);
>> +
>> +	return RSC_IGNORED;
>> +}
>> +
>>   static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>   	.prepare	= zynqmp_r5_rproc_prepare,
>>   	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -911,6 +966,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>   	.attach		= zynqmp_r5_attach,
>>   	.detach		= zynqmp_r5_detach,
>>   	.coredump	= zynqmp_r5_coredump,
>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>   };
>>   
>>   /**
>> -- 
>> 2.34.1
>>

