Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F713C199A;
	Wed, 25 Feb 2026 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040134; cv=fail; b=EMkSQZD8Yv7YdkoHnlcsUtC45i0saR1ycWXG7kz0uaX8kEc8YPcrKBQIOwZKBSJ8pWClCaJmOiRJwKYHsZY+09u2cCyZ+W0119edz/G93V8/YMh7YIoVgqB2VAthAWzc043p1HGTIGx6BnBtsTJPr/QGk8ruLq7VYWeDLl/WiTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040134; c=relaxed/simple;
	bh=5H6kH3JBfM1KO3TBrGZO8XT7uetmP3rpiwnFFHc08gg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=HCD5QCA5mf9Fk3zX5O2myZjm5qeht5C7I2H2TWJKjbDCgeAArUaeazkJtJv/WMfUZjegSd61IvJHhvUGhpSRh7vRyrAdLxAD8axMvHjCMaHuDR7fNlUO322ia1p0k+puduVjEPQhjQlYUx6iQDGYa0gRRAM42OyAvQ3vNZVmiHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Pu4o+9/q; arc=fail smtp.client-ip=40.107.209.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Pu4o+9/q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO5QzW/kWS9tUes7E9FkMOD87tBfwzdel0Zv2fEqc2TQnP5L2OxofaFRt79TkixOrYr4p+3pqcDnMMd6jO7FCKil2vxYeGYjEm+6976PIhn2QHS1MRoGmOQ8oWN9+loIKXX+LU+i2tIX4ewQqdhoeYFOmYnv/ALipBxaibcD9UI+y2hTSezAB+5ILAMgV9fC19R2HmvOd5klhtmHjU/MKc/UXj2hHqMZuxkNavbVUVo07wskoiaioQBaa1BI2yRc/kGNvigDaEMFW+taQYG2h1DvWy+miM6TxfmAxIcwE9ykwDXgfyTtBTEF6WqSbbHLka0shNoIzi/fzh/P7livVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YB6oaVsM68At+shQajnuRgKNs5plAPqULikxga4KQo=;
 b=pUKqTpq29lr6oidwSvhOYgMAuhKpgaiPoS43UBT2nznhFxYeifelWUI9/dses81BjdlVeKkIgmpbZjADU05+ms4Q3MJCJWw7s00kMv7j7+ZMUQPoBVnrPUDNjRTt35hyoT6XjS4xRgwixAeFofhphCUPzCuogbpHyPVSZAB2Z6ITx9oOBtEvMaeJ1zeoHDM7gAHBjlSHys/aPjKD7ciKSduQISlbS+x5ohL5NV0oRVAuTijd1sV0UjW9A3GHr9zLyywKZRDN5Lb/2u8gjk+42Bx+BKDb1GekAUOzmeOWgkYhr9oMCUHaP8m36Qje9tEs9U0QEmT9qirqnNGG+lR1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YB6oaVsM68At+shQajnuRgKNs5plAPqULikxga4KQo=;
 b=Pu4o+9/q6aubOBoAh00sqTVAvSsdHWy/pqGV7h3od9bsWzUtSfGiPXsN15kGFvteQJj63SAk6HvOTe7Ui8MrflYwVfeRvyvFV/QpdLucnRR8Vu7Dijy3bZzN3UJrlc+fNoiy6kkU9fVxbZU/eVfqupS3XHvMk3gDrcqAABWrGJg=
Received: from CH0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:610:b3::15)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 17:22:08 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::f5) by CH0PR03CA0040.outlook.office365.com
 (2603:10b6:610:b3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.19 via Frontend Transport; Wed,
 25 Feb 2026 17:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 17:22:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Feb
 2026 11:22:06 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Feb
 2026 11:22:05 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 11:22:05 -0600
Message-ID: <f480e21a-6075-40c0-b420-56171f7d4e60@amd.com>
Date: Wed, 25 Feb 2026 11:22:05 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
From: "Shah, Tanmay" <tanmays@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-3-tanmay.shah@amd.com>
 <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
 <3175bac0-1def-4f3c-bebb-31459855b1a9@amd.com>
Content-Language: en-US
In-Reply-To: <3175bac0-1def-4f3c-bebb-31459855b1a9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CH2PR12MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7721a4-52d8-4d6d-ad5d-08de7492674a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	gWQAoYAqaVZ91ilkYhqUGbwPHKmFGqcfrOClg20H5WcIwodgDedeNmCS/UGk02pdUxztVRPGIU9RcMB6b717Wcdbtb1FYNssqOkX8D3x2FpbhmYAUo4URbnfDn/QGb5Xc+PLPAM5paLSsk+TX2aF2BSLEWOS7Pb4rD7zLVQFxh9BTILs8tERs/ypzeio71wHQdHSvFnh7Z0lmYWCykfsNibrgbGRjd3yZDgQ4ZGEl6l44C/boZAGPg8MUXNNIPM7xArSiennk03odwYQAz03uQxgkNQaiZXY4DeN9aW/HE0cR/OUwI/yGaKEJ9pftChFqeDHxNt9h5F5mNSCNinhRavvSwqB/iWoqask2IaKvsC7WF+OUdrZ7mWolqCqFNOVnVkIrxSp9/6Tl6OAK5X5FX99PuOJFQ6f6vZHycX9eJriB08ZYi5HHB5XYvZrKFZVZNIfOGzJRO96/Mddv63YhSA7hjkqFAPqGKeO1/GPlR4a46i8B5kxArYw28eOoraaLHEla6qT6YXnnEANuLwUMauFA31r/ERaFbDgk74XsKd4Eg+e749aqsZx1vH/uIj1N5C71U4Ks5RP1tCI5pQhf/ZaIwkH3ByNPBW9RDDl2aUW7W3Upr7Db74Dk7iCZPUlvHs1GS4RdsHdZ2M53RHJmJ7kt6e9GETyS9SjNNKiOUStro4feSY6qHB5rCz0FspfKWQXjV45w9jlMW9vcLMVE8oIKKn9tOjyqTcHIjG+2wug3Z3ajUcmVPUkdoFCY5VqqHUpEUH4bYzZQbFvHnHa99tCHjrKJoEED5KLJ8m147zn9NwhsdLJV6NyBTUAVKRqXUPSSj8meVOsX+W++Fiqtg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nQdbNDpz+UZ+WNL06OL5WLccbwspFBSVPU95br0d45UcMU1tBtlosL0fcVZGLW/zYXkAQ6WKzOJxZc5VLMR18Xk58zIJ6XQhq5ZgiGzbIUYsbelCbCCKf02/h0BE370fOaiTFtA+YMz9SGcMeKNUpZFv4mHp4PJmfii3B/9d1m5xH7sX4WUYWZ5OK4QxsXljMILX09zBajzyQMrDQikMM3Tu4xRttNZHiUuW08IRVpEMiIt4iwNMQgwVCYtkHZ+giLPFAWUcW1zPWo2XOBI79D5+pS+PvekcMiF+J21b7jjSs4OKGN2q2OdhL5wpYRys609Qdj1jqN45uWS/rqS5NjXEIhhO8kZl/NdmrdCm/R7/pVi3WARUo8QKg5niHaafwLr0XKjc1GjuxmbqIwHf+mSoIp0I+1ZfKDqf2FRUoouXvaTtyQFNM2BnD7XIend+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 17:22:07.9642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7721a4-52d8-4d6d-ad5d-08de7492674a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183



On 2/23/2026 4:40 PM, Shah, Tanmay wrote:
> 
> 
> On 2/23/2026 1:55 PM, Bjorn Andersson wrote:
>> On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
>>> Remote processor will report the crash reason via the resource table
>>> and notify the host via mailbox notification. The host checks this
>>> crash reason on every mailbox notification from the remote and report
>>> to the rproc core framework. Then the rproc core framework will start
>>> the recovery process.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> Changes in v3:
>>>   - %s/kick/mailbox notification/
>>>   - %s/core framework/rproc core framework/
>>>   - fold simple function within zynqmp_r5_handle_rsc().
>>>   - remove spurious change
>>>   - reset crash state after reporting the crash
>>>   - document set and reset of ATTACH_ON_RECOVERY flag
>>>   - set recovery_disabled flag to false
>>>   - check condition rproc->crash_reason != NULL
>>>
>>> Changes in v2:
>>>   - clear attach recovery boot flag during detach and stop ops
>>>
>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
>>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> index bd619a6c42aa..0d831330ea90 100644
>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>>>  	const uintptr_t rsc_tbl;
>>>  } __packed;
>>>  
>>> +enum fw_vendor_rsc {
>>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
>>
>> Given that this is a vendor-specific resource, wouldn't it be nice to
>> find e.g. XLNX somewhere in the name? Same thing with the enum itself.
>>
> 
> Ack. I will change name for enum and resource both.
> 
>>> +};
>>> +
>>>  /*
>>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>>   * compatibility with device-tree that does not have TCM information.
>>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>>  };
>>>  
>>> +/**
>>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>>> + *
>>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>>> + * @crash_reason: reason of crash
>>> + */
>>> +struct xlnx_rproc_crash_report {
>>> +	u32 crash_state;
>>> +	u32 crash_reason;
>>> +} __packed;
>>> +
>>>  /**
>>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>>   *
>>> + * @crash_report: rproc crash state and reason
>>>   * @rsc_tbl_va: resource table virtual address
>>>   * @sram: Array of sram memories assigned to this core
>>>   * @num_sram: number of sram for this core
>>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>   * @ipi: pointer to mailbox information
>>>   */
>>>  struct zynqmp_r5_core {
>>> +	struct xlnx_rproc_crash_report *crash_report;
>>>  	void __iomem *rsc_tbl_va;
>>>  	struct zynqmp_sram_bank *sram;
>>>  	int num_sram;
>>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>  {
>>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>> +	struct zynqmp_r5_core *r5_core;
>>> +	struct rproc *rproc;
>>>  	struct mbox_info *ipi;
>>>  	size_t len;
>>>  
>>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
>>> +	r5_core = ipi->r5_core;
>>> +	rproc = r5_core->rproc;
>>>  
>>>  	/* copy data from ipi buffer to r5_core */
>>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>>> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>  	buf_msg->len = len;
>>>  	memcpy(buf_msg->data, ipi_msg->data, len);
>>>  
>>> +	/* Check for crash only if rproc crash is expected */
>>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>>> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
>>
>> Nit. I'd prefer the order of these to be swapped...
>>
>> Compare:
>>
>> "Check if we have crashed, and if so check that we're in a state where
>> that makes sense."
>>
>> vs the way you're ordering this:
>>
>> "Check if we're in a state, and if in that state we have crashed"
>>
>>
>> The "have we crashed" question is the most-significant-bit of this
>> chunk, making that the outermost conditional makes it faster for the
>> next reader to orient themselves in the code.
> 
> Ack, that makes sense.
> 
>>
>>> +			rproc_report_crash(rproc,
>>> +					   r5_core->crash_report->crash_reason);
>>
>> Are these two value spaces synchronized? crash_reason seems to be a
>> generic 32-bit number without particular definition, and you pass it
>> into a enum rproc_crash_type.
>>
> 
> Yes, crash_reason is supposed to be enum rproc_crash_type.
> 
>> I presume the outcome is that you get the string
>> "crash detected in <name>: type: unknown" in your log for most cases?
>>
> 
> So far, we have only "WATCHDOG" and "FATAL ERROR" cases. I guess any
> more reasons would have to go in the "unknown" case.
> 
>>
>> In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
>> For the watchdog bite there isn't much information, but for the fatal
>> error we have a error string which we print, then we call
>> rproc_report_crash(FATAL) which results in another "useless" print.
>>
>> Perhaps we could expand rproc_report_crash() to allow drivers to provide
>> some information about the crash beyond the enum.
>>
>> Something like:
>> 	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);
>>
>> Would that be useful to you? Would it be valuable to turn your
>> "crash_reason" into a human readable string?
>>
> 
> Yes, it is valuable to turn "crash_reason" to human readable string.
> Should we leave that part to each driver and not have it in the common
> framework?
> 
> If we are to refactor rproc_report_crash, then I think following is more
> flexible:
> 
> rproc_report_crash(rproc, const char *crash_reason_str);
> 
> Then each platform driver can print crash reason however they see fit.
> We can also avoid printing crash reason two times this way.
> 

Hi Bjorn,

I take this back. I think crash_reason can be defined differently for
each firmware project. I would like to provide that flexibility to the
firmware developer. Hence, I prefer not to convert crash_reason integer
to human readable string, as can be different for different fw projects.

Instead, the xlnx platform driver will simply print the crash_reason
integer as given by the firmware, and notify the crash to the core
framework as following:

rproc_report_crash(rproc, RPROC_FATAL_ERROR);

This way, we don't have to modify the rproc_report_crash() API.
I hope this makes sense.

I will wait for your response before sending the new version. Rest of
the comments I will address as asked.

Thanks,
Tanmay

> If we do this, then crash_reason can be defined for each driver
> individually. That's more appropriate as each vendor can have different
> enum for crash.
> 
> Let me know your thoughts.
> 
>>> +			r5_core->crash_report->crash_state = 0;
>>> +			r5_core->crash_report->crash_reason = 0;
>>> +		}
>>> +	}
>>> +
>>>  	/* received and processed interrupt ack */
>>>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>  	if (ret)
>>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>>  
>>> +	/*
>>> +	 * Clear attach on recovery flag during stop operation. The next state
>>> +	 * of the remote processor is expected to be "Running" state. In this
>>> +	 * state boot recovery method must take place over attach on recovery.
>>> +	 */
>>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>> +
>>>  	return ret;
>>>  }
>>>  
>>> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>  
>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>  {
>>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>>> +
>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>  
>>>  	return 0;
>>> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>>  	 */
>>>  	zynqmp_r5_rproc_kick(rproc, 0);
>>>  
>>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>> +
>>>  	return 0;
>>>  }
>>>  
>>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>>> +				int offset, int avail)
>>> +{
>>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>>> +
>>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
>>> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
>>
>> I don't think you need the cast.
>>
>> Regards,
>> Bjorn
>>
>>> +	else
>>> +		return RSC_IGNORED;
>>> +
>>> +	return RSC_HANDLED;
>>> +}
>>> +
>>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>>> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>>  	.attach		= zynqmp_r5_attach,
>>>  	.detach		= zynqmp_r5_detach,
>>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>>  };
>>>  
>>>  /**
>>> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>  
>>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>>  
>>> -	r5_rproc->recovery_disabled = true;
>>> +	r5_rproc->recovery_disabled = false;
>>>  	r5_rproc->has_iommu = false;
>>>  	r5_rproc->auto_boot = false;
>>>  	r5_core = r5_rproc->priv;
>>> -- 
>>> 2.34.1
>>>
> 

