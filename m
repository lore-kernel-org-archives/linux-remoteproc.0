Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2B2356C6;
	Tue, 16 Jun 2026 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781639580; cv=fail; b=L2/mhQB8k76MH1D1X1ILbM/S2963Mfr8C20azyz6bWlOxT2OELEPlSZSMGrEw9dWjqvlHsm/fmydPhF57GobBnyba159GiGIdtGfq8pz82/LdkMfm2ahNPJ+P2e4ppwZfqllZ/vVVAyFiVZffdZYVXhKIR3XXmpd1FYZrM62ffg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781639580; c=relaxed/simple;
	bh=/lSwQVS0eTbgXx+nEhmgtVIp7qW9HLlayH+wLcszMJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JsngiP2pdx3S+FTlJ7QDrZzcVsypSjJXoF7f8Qt+TX7ehxshX0yDl+8WO+C5/QqQQxoFPdpO4cWiDEwNLUM65rcD+lx8O/ySuaSi9M2Yx/M7bogwyLiQPBUI+PH7hR+TRxJOLaPToShgUtG/rmzj+jT7Ool9iCO7Om7+CFPHOLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NucydM6k; arc=fail smtp.client-ip=52.101.52.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NucydM6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpLFnLoRSyEIL3LeQxw5mkVAKj+db/OJRhbGz9RoSyvjr/CiTXNJIgrgPhxMA9ZmXYJ4cakeYkzmK8eYeK8TI/WQfcR9xM8QVNH//M1GCqOOrr7R4VWlR6HKiADpGOXkfFM5OWdlNz4ILMryV8KzGKHvUcB5IAgJYDO7bqmJ41ajXUVn92r+gFl2x5r5cx7/fLrScwcNh1Tae0w+JJHu+7InXNC/sbF/m5nenG915WuuPLAY03ImS/GM0dbN6gJ+gYC88H/wuwxxPsgmP20LvZN4ukvw+A+ZIL9nnfEmsJzGwk8KtntytqPdm10vOtyTXux4qu2UGXoi1CqP7Gb/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlcGzaeiHSaB/xM1S37mDo356WWU+CAtIy3mhBQJpq0=;
 b=nIjtQ9UkLCNk1L931F/dikSaVs1Afz6+arcu64CeFzlnFXclVvQrSQm+44PlQEn6MEIR5tSpuWKRtV2uE6kJNPVn1g0ygZVIsQSODFRmbo8B/aGpZUI3NIAiYZm1PHbSFSA33sfKtL2+f89d9D/ugENHGKgtUyIM1o7JdvBE9+KWu4AZEahbFFt51R7rNodkeuOv0YCVGy6GFlrZWbYLxGS1of6WWVoUOkWUuoVeq8gYiPOD3FMBVA2PQqM59mxtK8FRQzqneEulrptWQwFIfEtHmSNipbdz8xs2JX43NC54kaieuPrQck6KOoN5SO/uYiIRmz/xLm18qmwQo93v4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlcGzaeiHSaB/xM1S37mDo356WWU+CAtIy3mhBQJpq0=;
 b=NucydM6k/eTExOl7lRaxtOR6HAvS3RjMhwPqS2y4TuzvHK1kD/D0/Mlo8fWmKAm1kl/W0oOlToWhw8YFtZmM9sqBJ2oaVoRZxRzhOlQbl6/TvgkZME4MZdyN/ZsPQ8JCbzolPXYWg7nHt30DzlaTYmqx+qsxjiqSpJ8d+7zhivM=
Received: from MN0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::32)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 19:52:51 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::5c) by MN0P221CA0020.outlook.office365.com
 (2603:10b6:208:52a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 19:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 19:52:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 14:52:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 16 Jun
 2026 14:52:50 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 16 Jun 2026 14:52:50 -0500
Message-ID: <f4809485-91d8-49c2-bed9-0d3bd0172cff@amd.com>
Date: Tue, 16 Jun 2026 14:52:50 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v5 2/2] remoteproc: xlnx: add crash detection mechanism
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260610182711.1758544-1-tanmay.shah@amd.com>
 <20260610182711.1758544-3-tanmay.shah@amd.com> <ajFzbDgrCbWL8-ds@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ajFzbDgrCbWL8-ds@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d328e38-34dd-4ed3-3455-08decbe0d969
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|13003099007|18002099003|4143699003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	T1EvIxA6u3yl4tR5DFIi6Z2RBY6lLz0jq8IJP8xlxnKEpJOCR3a61tmX6oUwFJ+ACuU6LtGlJoikyjgSxLF+d5CQgbsYDZQawYbsO3Sm8Po9vhDrqNO8QeVPNIpeiaoPir197ftq6SOpOzfhDwwWHy7OrmmTH+MV/RB4aQQyI9JIXQnvCAdvjzP8lZKCD1ki7OofIH2m+LIcMsOXQVatfB25aiu61mcAL92wHh97U6fEoH1z7pvQRW4T2MSq/8ztN/baQL5Kdl1h8giX5Lnsp11vKhlATEbR5KSKVi8VVCN1UO/5qWz2Zyl3pH4w6gGijLXDugR0ycULxNJEPMgi2xRFuUbRsKRdVsUTfZZgBQwOyg2cqMgFvJ95xa9UIPTA4XP5+db6mWmDxN+qNauo1p/azjWlVl27atW6fFI5SBeZjKYjfOkyDq09oSRd/LCvsxQMUp5G4dQ8yV3LjFOehc41TK+p9cU3TYebl0iHlVV0eO23tJqduzGbqY8usT7zoUDCbSSQv2JUHEUCQevXTAJXOykGko10aKpex5JbTESpyaO5p6fNE0yePbAestCGJOFobfHfjWbWweUIRrQUvdfJGAcAhxRuNNdHP4WZI+Uv168msDQVYlTM8fxgl/2TgSOm5SkD+SllUycdN6IjJzPkMltjS79oABODGaXAazXI1X6xymB9j+GJi7C/YCMB//wCjmONaWvK7ziWYkc+ijHhvbornKdonMv5wmO1iD0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(13003099007)(18002099003)(4143699003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ABhcHsrFM6cv3T+XouKQXFDB/43TCRzLaIA0wkPhKqURER4hPqwYUnp8xxkDBcpl5DbAgH8WpceFdR8IQ9/yQeJx54OzghLFRmkRStVIAwICcQXHlb9UtGoGjCwJQ1TRSgm4qrCOFmdeKN+k1peijewaoMa2rMJI3YmexQ+TDJIdLskAFt8GGZIHF5YQ7VNqx8kXY8Z2EdAUiScil12AHkusai4CfX1OPAiIc5MMD1xg3zVFIukACutTK5oa7Qbp6zcFN0b09msku8jJhcOL0XmNL63Vv4wQyuTreyFvYTxa6hUBSV1eZRHBO1fcQo3CPQY2D+gY75xMeWkLj2YYVvMkZzSruJsalLaXK2Blkaad7pcfwkAHg9rfoVl0XumsZSgNAjxPK9poscRG8cDbzu8SLu8FPUI3aE1aeg8FT7k6DqJu8kyiOXvALu3x2ZBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 19:52:51.3421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d328e38-34dd-4ed3-3455-08decbe0d969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hello,

Please find my comments below:

On 6/16/2026 11:01 AM, Mathieu Poirier wrote:
> On Wed, Jun 10, 2026 at 11:27:11AM -0700, Tanmay Shah wrote:
>> Remote processor will report the crash reason via the resource table
>> and notify the host via mailbox notification. The host checks this
>> crash reason on every mailbox notification from the remote and report
>> to the rproc core framework. Then the rproc core framework will start
>> the recovery process.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> changes in v5
>>   - use local variable to access crash report pointer
>>   - End crash report string with '\0' without relying on fw
>>
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 73 ++++++++++++++++++++++++-
>>  1 file changed, 72 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 3349d1877751..86afff9f3b40 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -112,6 +112,10 @@ struct rsc_tbl_data {
>>  	const uintptr_t rsc_tbl;
>>  } __packed;
>>  
>> +enum xlnx_rproc_fw_rsc {
>> +	XLNX_RPROC_FW_CRASH_REASON = RSC_VENDOR_START,
> 
> I would call this XLNX_RPROC_FW_CRASH_REPORT
> 

Ack.

>> +};
>> +
>>  /*
>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>   * compatibility with device-tree that does not have TCM information.
>> @@ -131,9 +135,27 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>  };
>>  
>> +#define CRASH_REASON_STR_LEN 16
>> +
>> +/**
>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>> + *
>> + * @version: version of this resource
>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>> + * @crash_reason: number to describe reason of crash
>> + * @crash_reason_str: short string description of crash reason
>> + */
>> +struct xlnx_rproc_crash_report {
>> +	u8 version;
>> +	u8 crash_state;
>> +	u8 crash_reason;
> 
> Do you need 2 variables?  Would it be possible for @crash_reason != 0 to
> indicate a crash, making @cash_state irrelevant?
> 

Actually initially I had defined crash_reason only, but when I looked at
how crash reason/type is defined in the kernel, I got idea to keep
crash_state separate than crash_reason:

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/include/linux/remoteproc.h?h=for-next#n183

enum rproc_crash_type {
	RPROC_MMUFAULT,
	RPROC_WATCHDOG,
	RPROC_FATAL_ERROR,
};

So, if crash_reason is defined like above, then it's easy to make
mistake and not define no_crash = 0. Different firmware projects can
treat crash_reason differently. I would like to keep crash_state and
crash_reason separate and not impose policy on firmware projects on how
to define crash_reason.

>> +	char crash_reason_str[CRASH_REASON_STR_LEN];
>> +} __packed;
>> +
>>  /**
>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>   *
>> + * @crash_report: rproc crash state and reason
>>   * @rsc_tbl_va: resource table virtual address
>>   * @sram: Array of sram memories assigned to this core
>>   * @num_sram: number of sram for this core
>> @@ -147,6 +169,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   * @ipi: pointer to mailbox information
>>   */
>>  struct zynqmp_r5_core {
>> +	struct xlnx_rproc_crash_report *crash_report;
>>  	void __iomem *rsc_tbl_va;
>>  	struct zynqmp_sram_bank *sram;
>>  	int num_sram;
>> @@ -204,11 +227,27 @@ static int event_notified_idr_cb(int id, void *ptr, void *data)
>>   */
>>  static void handle_event_notified(struct work_struct *work)
>>  {
>> +	struct xlnx_rproc_crash_report *report;
>> +	struct zynqmp_r5_core *r5_core;
>>  	struct mbox_info *ipi;
>>  	struct rproc *rproc;
>>  
>>  	ipi = container_of(work, struct mbox_info, mbox_work);
>>  	rproc = ipi->r5_core->rproc;
>> +	r5_core = ipi->r5_core;
>> +	report = r5_core->crash_report;
>> +
>> +	/* report crash only if expected */
>> +	if (report && report->crash_state) {
>> +		if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>> +			report->crash_reason_str[CRASH_REASON_STR_LEN - 1] = '\0';
>> +			dev_warn(&rproc->dev, "crash reason id: %d %s\n",
>> +				 report->crash_reason, report->crash_reason_str);
>> +			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>> +			report->crash_state = false;
>> +			return;
>> +		}
>> +	}
>>  
>>  	/*
>>  	 * We only use IPI for interrupt. The RPU firmware side may or may
>> @@ -448,6 +487,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>  	if (ret)
>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>  
>> +	/*
>> +	 * Clear attach on recovery flag during stop operation. The next state
>> +	 * of the remote processor is expected to be "Running" state. In this
>> +	 * state boot recovery method must take place over attach on recovery.
>> +	 */
>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
> 
> Why is there a need to play set/clear the RPROC_FEAT_ATTACH_ON_RECOVERY flag
> here and in zynqmp_r5_attach() and zynqmp_r5_detach()?  I think we talked about
> that before but can't remember the outcome of that conversation.
> 

The remote processor can go through following life cycle:

attach() -> stop() -> start(). When this happens, ATTACH_ON_RECOVERY is
not valid anymore. At this point, it should be BOOT_RECOVERY which is
indicated by clearing ATTACH_RECOVERY flag. That is why it is important
to clear this bit on stop().

Now in detach() it is not needed. I am just clearing the flag as part of
a cleanup sequence.

 >> +
>>  	return ret;
>>  }
>>  
>> @@ -869,6 +915,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  
>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>  {
>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>> +
>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>  
>>  	return 0;
>> @@ -883,9 +932,30 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>  	 */
>>  	zynqmp_r5_rproc_kick(rproc, 0);
>>  
>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>> +
>>  	return 0;
>>  }
>>  
>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>> +				int offset, int avail)
>> +{
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>> +
> 
>         if (rsc_type != XLNX_RPROC_FW_CRASH_REASON)
>                 return RSC_IGNORED;
> 

Ack.

>> +	if (rsc_type == XLNX_RPROC_FW_CRASH_REASON) {
>> +		r5_core->crash_report = rsc_offset;
>> +		/* reset all values */
>> +		r5_core->crash_report->crash_state = false;
>> +		r5_core->crash_report->crash_reason = 0;
>> +		r5_core->crash_report->crash_reason_str[0] = '\0';
>> +	} else {
>> +		return RSC_IGNORED;
>> +	}
>> +
>> +	return RSC_HANDLED;
>> +}
>> +
>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -900,6 +970,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>  	.attach		= zynqmp_r5_attach,
>>  	.detach		= zynqmp_r5_detach,
>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>  };
>>  
>>  /**
>> @@ -939,7 +1010,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>>  
>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>  
>> -	r5_rproc->recovery_disabled = true;
>> +	r5_rproc->recovery_disabled = false;
> 
> I'm good with the overall architecture of this set.
> 

Okay. If above comments looks good, I will send v6 soon.

> Regards,
> Mathieu
> 
>>  	r5_rproc->has_iommu = false;
>>  	r5_rproc->auto_boot = false;
>>  
>> -- 
>> 2.34.1
>>

