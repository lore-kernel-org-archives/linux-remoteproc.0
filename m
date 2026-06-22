Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013061.outbound.protection.outlook.com [40.93.196.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602C312807;
	Mon, 22 Jun 2026 18:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152210; cv=fail; b=pRlkRvv2qoWWsDI+fXi2CHhPf8YvIRyI+TjKXVRrva/mqlvkskDMMM21DG3uzZ54GL27JVAMJNSPin8isuRja7zItW5N2QD4OV+VkHU5v/gHeTqkK+t8se8wpXV8E4eZB6Fr/1LL1/C5DHs5eFZCJZWF5I9TKdx7xoEu93eRd0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152210; c=relaxed/simple;
	bh=bAAHNw1QdyS+z/WBFH4tPQo95XBmnzSGqsqNDUj9zkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X0tIxoPRXzW7ZNIe2fXlcarxigjzMNUMfLE3Qe6RiZAJcYJ+tdWY994QbnMuqJH72t4U5lW/jWS1zmi5dcLDA2Ois6NNFBUwIOKIqM5Pp9ttPyuKAqKFzG0nB45bs8dU5SuYB/GndLw3bupVigSyrP86hvsS4rknsb+s4Q1Ln64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vk3CqIg1; arc=fail smtp.client-ip=40.93.196.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vk3CqIg1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HB9dUMLA5em04SPlddSzsPPBl2kUui/5w8kPyfaTRFUm1dfEupp8ZHhPhTNEBaEemxpkLaH2jkYFBDDcRSlMGXBUMgR9Vq0J7ST9wYqw0xG9zDUoG4GqOjlezBw5sBcnTNa+ex4GqHrIlelOWY2yopDquwogHulfm1DAtTH62Z6LRx7AL62RuY1kuhVBWTV9D2bzdxteJ/Tn6BUo4tiTXbXQYnb8N702oNfcFmelAfwG4ty078NWIXhWzqkKjHoWWgHFH2b8SzYTlgWsVW+ZCEz3zdEwMD1hI8eyxhrpJaAuOvnUSvDYKfTFBkC6kVrCXQR2Cv84hRV0GSkMfuCZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeZk899mx+2BHSvrzoGSvrG65cDzoBnpI/+0yQnxrhE=;
 b=yMJ5UYG07JD9tjGefpg3Rl9+J6Whq2hXjlXLVOOftKL2tN2qStc8vdscSFmMVfBk8UAIGima3Nj7ROizOy6/M2wD11TCsD0mWgcidCcAfBTm3XLRiiUspeCX6meZfmVwN3ZTOer2fRfVVQuJY9Q3SBgxwFzpK/O9DZUxSV2xtvEHmC6rzDVbe7NtJaXJjNtYuCM8OaQKPZ2iIvSS61PQWxQTW+BOc9gc8srrIK20TMIbCSzKNMW+KecL0jUZOpz69mrizOdMdLyXlxtY6SPNNWR6JRY/b1FLEaPcjJWPrV36LerwfZExFMubSkQu2+MR/GPFYgaujhsx4Vcrkbpk7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeZk899mx+2BHSvrzoGSvrG65cDzoBnpI/+0yQnxrhE=;
 b=vk3CqIg1gntplptimnHXeZh0Jnb9xStcj4zFZ+iVNk98wc4dpgEr1hbyO1JcWTc3OYOFVhQhUJrt11EC1OqHArMeeVUXHahQ7jFTWYEykrpx2VndgLCgiAanIJnUCNuA1gBsHfGBC0XwIsD+WoXeRZ4UmvZgY0/ktvbEkTKAENw=
Received: from BL0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:91::25)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 18:16:38 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::50) by BL0PR05CA0015.outlook.office365.com
 (2603:10b6:208:91::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Mon,
 22 Jun 2026 18:16:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 18:16:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 13:16:38 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 11:16:37 -0700
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 13:16:37 -0500
Message-ID: <cf1e73be-e7d8-4d42-8d7f-f282fd37eda1@amd.com>
Date: Mon, 22 Jun 2026 13:16:37 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
 <20260610182711.1758544-3-tanmay.shah@amd.com> <ajFzbDgrCbWL8-ds@p14s>
 <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com> <ajl08A4WkzGaaCCs@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ajl08A4WkzGaaCCs@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b4a27d-52b0-491c-5261-08ded08a66eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|4143699003|56012099006|11063799006|6133799003|22082099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	zamNrKmd/nZF86R9l7XjYSnhIvahY4WJyYoJwPKKQWTuJwMhU4o+6S3XjhAdTE/kkYURh/ncCJGp+A4KMsP4sHRO94EUtfatqMpnR6VL3ZwsyB/NJVeL7la8hw2m/eVk/EWkOcToWgr9stfFxyX1GfjK23H7y8UvRydCy3UbqQUHjQC9LsUybFtWbbBzh/2clFGA8LG4LvtxZnULg4ct+HiXr5rIB5Tryd21WdBlZ+2WX9TdM0epCFPCnAFw83dzjGFrbPN4UYUxsnrJnYE0JLfc3/CxOFypbiz2DCiduEPwD9IflN2CCiPjMRr2lqBwHap6eod1/kJR7ewzhKZfncldypuETxtavg4P3Wln6kmRyhGRw0ei9BXV9zIiv5kxULwffxfF7NViEKyZMSnabF5I8H/o1nlaAj1xQneOu52+ew8Jpfe/YZYc29Ic054QUsUTIw8077IgWK1dez54piySwWkOtWDNa8Nf+v4ZPYMZUDhqr2YfnJ8mGiUeEa68870+9mH3W289mSgWvY6jMowOSjy7aUf9KSOmx52xH5Kzr/3avStWAcjRloCFAF1jWCiXv+t52EJUz2iZjk1Wayn31eJ72rAVoXYVg6MjIbt6T5Htkk2YR77J4yfpysHnCu7Rnmjj26fVYI2fDC0XIHWINLNZMmkxY5wUIzLXDhUT0mh9eZ4T+Poz1sO5ls1BxznvVYeODhG7XGb7D+qgdw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(4143699003)(56012099006)(11063799006)(6133799003)(22082099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ovM7iwjNQm2Z0cuIuSvgI1dLPRChtguX0ZWdJRA1Qghxm7vJwRHscR5b3sOLAd0sv6MeJaUWBcjlJCftT8QRcKoAtRSCLqb+c97iXjLTOA6CBh3mgFQ2JiMC6YXJqIg0lFuvCGC/Mhn+o+ITYK5KXcFUbH1Hq3eaY72x6ZQABXxAU9PDc+loSkK0GCwZmw7HfsxqrpVfUB/ZPtn1Xxv/PG40O1vsBLmy3YSi3TKi3kBJxHyZoi4qahJjLYax1BRchW66o8hpa+31ZezYEP7GyItWTeDdX4IbiNED0VNlqAUR6764MglC9IaRwvG6YUAhv8AjePX+OMOWNoln7nsupRieljXF0V3Ac25IZiAW8Lu/W2tGEpG0fHQZYJ0sRw/KX4jQ22LGHcerpxogutUjvmG8dK+XmXFBb3+xBFLoWRriVprptjlNb7RQeu11Hz8e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:16:38.3459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b4a27d-52b0-491c-5261-08ded08a66eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478



On 6/22/2026 12:46 PM, Mathieu Poirier wrote:
> On Tue, Jun 16, 2026 at 02:52:50PM -0500, Shah, Tanmay wrote:
>> Hello,
>>
>> Please find my comments below:
>>
>> On 6/16/2026 11:01 AM, Mathieu Poirier wrote:
>>> On Wed, Jun 10, 2026 at 11:27:11AM -0700, Tanmay Shah wrote:
>>>> Remote processor will report the crash reason via the resource table
>>>> and notify the host via mailbox notification. The host checks this
>>>> crash reason on every mailbox notification from the remote and report
>>>> to the rproc core framework. Then the rproc core framework will start
>>>> the recovery process.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> changes in v5
>>>>   - use local variable to access crash report pointer
>>>>   - End crash report string with '\0' without relying on fw
>>>>
>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
>>>>  1 file changed, 72 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index 3349d1877751..86afff9f3b40 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -112,6 +112,10 @@ struct rsc_tbl_data {
>>>>  	const uintptr_t rsc_tbl;
>>>>  } __packed;
>>>>  
>>>> +enum xlnx_rproc_fw_rsc {
>>>> +	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
>>>
>>> I would call this XLNX_RPROC_FW_CRASH_REPORT
>>>
>>
>> Ack.
>>
>>>> +};
>>>> +
>>>>  /*
>>>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>>>   * compatibility with device-tree that does not have TCM information.
>>>> @@ -131,9 +135,27 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>>>  };
>>>>  
>>>> +#define CRASH_REASON_STR_LEN 16
>>>> +
>>>> +/**
>>>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>>>> + *
>>>> + * @version: version of this resource
>>>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>>>> + * @crash_reason: number to describe reason of crash
>>>> + * @crash_reason_str: short string description of crash reason
>>>> + */
>>>> +struct xlnx_rproc_crash_report {
>>>> +	u8 version;
>>>> +	u8 crash_state;
>>>> +	u8 crash_reason;
>>>
>>> Do you need 2 variables?  Would it be possible for @crash_reason != 0 to
>>> indicate a crash, making @cash_state irrelevant?
>>>
>>
>> Actually initially I had defined crash_reason only, but when I looked at
>> how crash reason/type is defined in the kernel, I got idea to keep
>> crash_state separate than crash_reason:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/include/linux/remoteproc.h?h=for-next#n183
>>
>> enum rproc_crash_type {
>> 	RPROC_MMUFAULT,
>> 	RPROC_WATCHDOG,
>> 	RPROC_FATAL_ERROR,
>> };
>>
>> So, if crash_reason is defined like above, then it's easy to make
>> mistake and not define no_crash = 0. Different firmware projects can
>> treat crash_reason differently. I would like to keep crash_state and
>> crash_reason separate and not impose policy on firmware projects on how
>> to define crash_reason.
>>
> 
> I agree with your assessment.  Please move "crash_state" to "crashed".
>  

Ack.

>>>> +	char crash_reason_str[CRASH_REASON_STR_LEN];
>>>> +} __packed;
>>>> +
>>>>  /**
>>>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>>>   *
>>>> + * @crash_report: rproc crash state and reason
>>>>   * @rsc_tbl_va: resource table virtual address
>>>>   * @sram: Array of sram memories assigned to this core
>>>>   * @num_sram: number of sram for this core
>>>> @@ -147,6 +169,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>   * @ipi: pointer to mailbox information
>>>>   */
>>>>  struct zynqmp_r5_core {
>>>> +	struct xlnx_rproc_crash_report *crash_report;
>>>>  	void __iomem *rsc_tbl_va;
>>>>  	struct zynqmp_sram_bank *sram;
>>>>  	int num_sram;
>>>> @@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
>>>>   */
>>>>  static void handle_event_notified(struct work_struct *work)
>>>>  {
>>>> +	struct xlnx_rproc_crash_report *report;
>>>> +	struct zynqmp_r5_core *r5_core;
>>>>  	struct mbox_info *ipi;
>>>>  	struct rproc *rproc;
>>>>  
>>>>  	ipi = container_of(work, struct mbox_info, mbox_work);
>>>>  	rproc = ipi->r5_core->rproc;
>>>> +	r5_core = ipi->r5_core;
>>>> +	report = r5_core->crash_report;
>>>> +
>>>> +	/* report crash only if expected */
>>>> +	if (report && report->crash_state) {
>>>> +		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>>>> +			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
>>>> +			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
>>>> +				 report->crash_reason, report->crash_reason_str);
>>>> +			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>>> +			report->crash_state = false;
>>>> +			return;
>>>> +		}
>>>> +	}
>>>>  
>>>>  	/*
>>>>  	 * We only use IPI for interrupt. The RPU firmware side may or may
>>>> @@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>>  	if (ret)
>>>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>>>  
>>>> +	/*
>>>> +	 * Clear attach on recovery flag during stop operation. The next state
>>>> +	 * of the remote processor is expected to be "Running" state. In this
>>>> +	 * state boot recovery method must take place over attach on recovery.
>>>> +	 */
>>>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>
>>> Why is there a need to play set/clear the RPROC_FEAT_ATTACH_ON_RECOVERY flag
>>> here and in zynqmp_r5_attach() and zynqmp_r5_detach()?  I think we talked about
>>> that before but can't remember the outcome of that conversation.
>>>
>>
>> The remote processor can go through following life cycle:
>>
>> attach() -> stop() -> start(). When this happens, ATTACH_ON_RECOVERY is
>> not valid anymore. At this point, it should be BOOT_RECOVERY which is
>> indicated by clearing ATTACH_RECOVERY flag. That is why it is important
>> to clear this bit on stop().
> 
> I'm good with that part...
> 
>>
>> Now in detach() it is not needed. I am just clearing the flag as part of
>> a cleanup sequence.
>>
>>  >> +
>>>>  	return ret;
>>>>  }
>>>>  
>>>> @@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>  
>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>  {
>>>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>>>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>>>> +
>>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>  
>>>>  	return 0;
>>>> @@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>>>  	 */
>>>>  	zynqmp_r5_rproc_kick(rproc, 0);
>>>>  
>>>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>> +
> 
> ... but why is this needed?  Why can't it just be set once in
> zynqmp_r5_add_rproc_core() ?  The only time the bit should be cleared is in
> zynqmp_r5_rproc_stop().
> 

Yes we don't need in detach(). I was just clearing it as a reverse
operation of what's done in attach(). You are right if we move the _set
part during probe, then we don't need to clean it in the detach(). I
will send next revision with this refactor.

Thanks,
Tanmay

> 
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>>>> +				int offset, int avail)
>>>> +{
>>>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>>>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>>>> +
>>>
>>>         if (rsc_type != XLNX_RPROC_FW_CRASH_REASON)
>>>                 return RSC_IGNORED;
>>>
>>
>> Ack.
>>
>>>> +	if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
>>>> +		r5_core->crash_report = rsc_offset;
>>>> +		/* reset all values */
>>>> +		r5_core->crash_report->crash_state = false;
>>>> +		r5_core->crash_report->crash_reason = 0;
>>>> +		r5_core->crash_report->crash_reason_str[0] = '\0';
>>>> +	} else {
>>>> +		return RSC_IGNORED;
>>>> +	}
>>>> +
>>>> +	return RSC_HANDLED;
>>>> +}
>>>> +
>>>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>>>> @@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>>>  	.attach		= zynqmp_r5_attach,
>>>>  	.detach		= zynqmp_r5_detach,
>>>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>>>  };
>>>>  
>>>>  /**
>>>> @@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>>>>  
>>>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>>>  
>>>> -	r5_rproc->recovery_disabled = true;
>>>> +	r5_rproc->recovery_disabled = false;
>>>
>>> I'm good with the overall architecture of this set.
>>>
>>
>> Okay. If above comments looks good, I will send v6 soon.
>>
>>> Regards,
>>> Mathieu
>>>
>>>>  	r5_rproc->has_iommu = false;
>>>>  	r5_rproc->auto_boot = false;
>>>>  
>>>> -- 
>>>> 2.34.1
>>>>
>>

