Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC7613B5AE;
	Thu, 26 Feb 2026 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146634; cv=fail; b=BEtBC0ZmSEGqf4IukwIIzh79ynoMSmXA46EAGA2/0vLECPsFovv9H6KhO/s25Lr6Zx19koP2jhUGKkbirknpR6SNkRIsitsw/uzgqd7nWhFFt/oDD72b92GsNPpf1EGWHdmbykayg5Wy18Yk4HOA9W3Bksl9QQmMxUy3raRvn2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146634; c=relaxed/simple;
	bh=LHb5GK1cMFGU1QUontLxRoVkSaGvqTsvQR//eIHTtms=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AuVR/dYX62q7CbO02qDQY9RsmBeHxuSsOoIDPu2ID/eqkeVqIL3fKSPUyuuVhKB42iwx9lS+i5N9vF59q+oJxfSnIs6zs8wPVhaywNQ9vmWRaEcCSc8qG4y1vUzZ7Ud0swWzoY3PHWtcMboAsDzui9z8U7kkPjDxJKdpEuQzjyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wndwA16E; arc=fail smtp.client-ip=52.101.61.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wndwA16E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COFwfxEy9ijho//3vAap9F68USTzLPCT5ZqS/KfFcUNSspRQ8e7IOo8kSJsBcHHNfaizt+K1XLynK+Z1LlGvNlImIIdmYELYLkLcv34NreD/MBif6vIPatv3zJ7nEDzhmOIQVyc+BaQR8wekEtZOIsoGIxIg9/3p4d11jW/J3vA9Dif3fuZxZ0L2QiEE24zwe7SMlx4fmH4gD4FohpgD56kaT+bB4AjsE6ZxTFqw8DVGox+GMF/UU4sATJ/HSmjx1N5VXNhddFAQQf8KJMGdvKqRhbERhVboWNuhz+esWZxn/rWbl+G1ZtlDEZq7EV+0oaOKTq8HrCQhRD4YU+Lqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6S6IdB5cyTOErDtlCg3PAcAOA8oOHPMr6P2bTXDJO0=;
 b=QtoAj9XKtUJoS81zdIXGW22yw7vU8rAA9/GmzvBfx2tKUbyWCk7eUcX1WCAgb/Jey7zsWxa9545wNv0PGV4hTZKQ2l0tkjyA+MFb+qKW8BPzT25x0mBo+D7nizS5S9+HW8zYFTjjo/y4npcagR6HXxi8r4+1Pv30kB6Cs48b+cqcLJXxdGjpcmHzkIr5MBIKhvK/MZLxzW4WdTviXhOSuJC7XQrbAx2Y1b/HBCOAVc6300Bb+7bEubJCTDamzNSNIO19x5T/atckEPwu/gplDETBQUXEld+F2eqX4RSneYg2/K6XQRbDkR/8038YD59bV9QzA0EpOhWO/Xg6p70KEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6S6IdB5cyTOErDtlCg3PAcAOA8oOHPMr6P2bTXDJO0=;
 b=wndwA16Eo+/P16ai41SBWacCFW6UitTAKujUfpBaTmqYctxp4KlhBJZ6gu284usJPaNei1v9cVJQAkEH+Uwu7550YXHRW2euedCZhqU33QF6xDxrOF0ghR4Js3E23CYmR3/+2TsyqHYW+YEg4KJl8vY6QwdP4Odp+eYIB89AQPg=
Received: from CH5PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:1f4::27)
 by CYYPR12MB8729.namprd12.prod.outlook.com (2603:10b6:930:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 22:57:07 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::a5) by CH5PR04CA0011.outlook.office365.com
 (2603:10b6:610:1f4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 22:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 26 Feb 2026 22:57:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 26 Feb
 2026 16:57:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Feb
 2026 16:57:06 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Feb 2026 16:57:06 -0600
Message-ID: <96f8825f-7f20-40c7-be5f-164f44911d62@amd.com>
Date: Thu, 26 Feb 2026 16:57:06 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
To: Bjorn Andersson <andersson@kernel.org>, <tanmay.shah@amd.com>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-3-tanmay.shah@amd.com>
 <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
 <3175bac0-1def-4f3c-bebb-31459855b1a9@amd.com>
 <f480e21a-6075-40c0-b420-56171f7d4e60@amd.com>
 <invfmjqikuyzpkfv7sw5lccj4kudoktzhk37t3rjfvuizpashl@ssjowsnczygz>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <invfmjqikuyzpkfv7sw5lccj4kudoktzhk37t3rjfvuizpashl@ssjowsnczygz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|CYYPR12MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: be0fa41a-f119-4cfc-49d4-08de758a5df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	jMbbVz/QW3tYwu6nCDYTdynLnN76D3fkRVOZezoXaQOV49axQEn1OdrRCch0jvW8FKA0fxeh1X0OgzrpiBh47FEXlgmo9sF5M1JeHjta7V24e+hCwTfVFZph+twqSlczIf9eqkINgg1ppHXuNpAaSGbQg2xe7po3VaxblBzbQHjujClXkdI/Tus3HkIAdW2OW+e8Nvx9/C8tVSpdnjk5HYfpDUm2KmOdK0ZVihzRAG/VtZghhdEBaIT1nPeYWfObJK8PVErNwHkoVCRcPPLS6Z+4W4QU07qZOTh/7fFejh3LDJ79gCQO3D/yrPM1Uiw+4quo0pAljDGR5VTFVTFzJ6LnusF18jitCIe/1k1KNNpj0DwMEXtnIoz/47iyq7iuWZvn42RjoyffC8r+ZLpWANG/fZz7HLlQ2ZHEbNgRxkF/Fdo1sWxSsiTIQC9YsdYZjmxILZXNP3w9sgVxc0Wsabq1JSJJLjyYTe4+eBCoLUHiRz7gkgji/g4hYc+jv0h2tcus5hxzF51+3TcrvmGI+2cTUdXl0MRFt1Ig8tzhC5pIUkXze7zWNxvpL6tQOhQiHXDlZ41yWX/lfgSlDEDlJw/Gy8j7z9eUZ9/hY1bsPk8GfLNTTUVihgyDUEcskCGiV9Aoe2FN2npOQaJZ9qu8BwcxipJyPxY0MrMTLyUZTMSnM3OLYiYWGid3l7aZuwXFzqHOuZqG8nys8aINoGMpkEFUfGETYyECkdd6TcfOw9riu9mYnHEWT4JPtyxSCDwVMd40swafJP2TBjTwhN1wCBzaraPX1OzADkVzOMroW4exV/dh7xZSTnB4KG8JTJQZe7r4ERMENcidW5vAA2Fjww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6tDc4AYTdAAds3yDU3hoOr4MUxixkqbyHgKTfcas9C9IMSsTh065winsovB1e3oiewePxTm0Zg5q0pf+v4ppxHGCGtWt7OXbVaJQqfL6VCqZqEZqtykKQfvm7mD0XufNR82DOui5FkdrQTjlOdD1/ZYmdtJJJssClobU26khMoZiZQDJKHAtdq2j8wlZCF8jAXIJ7KfsZ3SdZVVwwpitYBjN5WyocdTVEE1B2jFERluEot/59f1BOT4wAY9m+B1JUqPht8Rk2TiIVXUKczcg1qLDacOd5dPeUhO1cq7VrSvZIdUk6LVlxYsJklo60pXEXtO1RF74scrnbZ5oabxFIoBkoFOjCXS2XK6H6jKjiPgSEJPLjaah7sbV8j33LpYf1R4a2yQqeeOboAIcfyF3r9hq6Dp/rOEWSFE1nI8ItIh6i4Tgg+OGXHF1QyC3OmDH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:57:07.4631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0fa41a-f119-4cfc-49d4-08de758a5df1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8729



On 2/25/2026 5:30 PM, Bjorn Andersson wrote:
> On Wed, Feb 25, 2026 at 11:22:05AM -0600, Shah, Tanmay wrote:
>>
>>
>> On 2/23/2026 4:40 PM, Shah, Tanmay wrote:
>>>
>>>
>>> On 2/23/2026 1:55 PM, Bjorn Andersson wrote:
>>>> On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
>>>>> Remote processor will report the crash reason via the resource table
>>>>> and notify the host via mailbox notification. The host checks this
>>>>> crash reason on every mailbox notification from the remote and report
>>>>> to the rproc core framework. Then the rproc core framework will start
>>>>> the recovery process.
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>
>>>>> Changes in v3:
>>>>>   - %s/kick/mailbox notification/
>>>>>   - %s/core framework/rproc core framework/
>>>>>   - fold simple function within zynqmp_r5_handle_rsc().
>>>>>   - remove spurious change
>>>>>   - reset crash state after reporting the crash
>>>>>   - document set and reset of ATTACH_ON_RECOVERY flag
>>>>>   - set recovery_disabled flag to false
>>>>>   - check condition rproc->crash_reason != NULL
>>>>>
>>>>> Changes in v2:
>>>>>   - clear attach recovery boot flag during detach and stop ops
>>>>>
>>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
>>>>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> index bd619a6c42aa..0d831330ea90 100644
>>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>>>>>  	const uintptr_t rsc_tbl;
>>>>>  } __packed;
>>>>>  
>>>>> +enum fw_vendor_rsc {
>>>>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
>>>>
>>>> Given that this is a vendor-specific resource, wouldn't it be nice to
>>>> find e.g. XLNX somewhere in the name? Same thing with the enum itself.
>>>>
>>>
>>> Ack. I will change name for enum and resource both.
>>>
>>>>> +};
>>>>> +
>>>>>  /*
>>>>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>>>>   * compatibility with device-tree that does not have TCM information.
>>>>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>>>>  };
>>>>>  
>>>>> +/**
>>>>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>>>>> + *
>>>>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>>>>> + * @crash_reason: reason of crash
>>>>> + */
>>>>> +struct xlnx_rproc_crash_report {
>>>>> +	u32 crash_state;
>>>>> +	u32 crash_reason;
>>>>> +} __packed;
>>>>> +
>>>>>  /**
>>>>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>>>>   *
>>>>> + * @crash_report: rproc crash state and reason
>>>>>   * @rsc_tbl_va: resource table virtual address
>>>>>   * @sram: Array of sram memories assigned to this core
>>>>>   * @num_sram: number of sram for this core
>>>>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>>   * @ipi: pointer to mailbox information
>>>>>   */
>>>>>  struct zynqmp_r5_core {
>>>>> +	struct xlnx_rproc_crash_report *crash_report;
>>>>>  	void __iomem *rsc_tbl_va;
>>>>>  	struct zynqmp_sram_bank *sram;
>>>>>  	int num_sram;
>>>>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>>>>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>>  {
>>>>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>>>> +	struct zynqmp_r5_core *r5_core;
>>>>> +	struct rproc *rproc;
>>>>>  	struct mbox_info *ipi;
>>>>>  	size_t len;
>>>>>  
>>>>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
>>>>> +	r5_core = ipi->r5_core;
>>>>> +	rproc = r5_core->rproc;
>>>>>  
>>>>>  	/* copy data from ipi buffer to r5_core */
>>>>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>>>>> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>>  	buf_msg->len = len;
>>>>>  	memcpy(buf_msg->data, ipi_msg->data, len);
>>>>>  
>>>>> +	/* Check for crash only if rproc crash is expected */
>>>>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>>>>> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
>>>>
>>>> Nit. I'd prefer the order of these to be swapped...
>>>>
>>>> Compare:
>>>>
>>>> "Check if we have crashed, and if so check that we're in a state where
>>>> that makes sense."
>>>>
>>>> vs the way you're ordering this:
>>>>
>>>> "Check if we're in a state, and if in that state we have crashed"
>>>>
>>>>
>>>> The "have we crashed" question is the most-significant-bit of this
>>>> chunk, making that the outermost conditional makes it faster for the
>>>> next reader to orient themselves in the code.
>>>
>>> Ack, that makes sense.
>>>
>>>>
>>>>> +			rproc_report_crash(rproc,
>>>>> +					   r5_core->crash_report->crash_reason);
>>>>
>>>> Are these two value spaces synchronized? crash_reason seems to be a
>>>> generic 32-bit number without particular definition, and you pass it
>>>> into a enum rproc_crash_type.
>>>>
>>>
>>> Yes, crash_reason is supposed to be enum rproc_crash_type.
>>>
>>>> I presume the outcome is that you get the string
>>>> "crash detected in <name>: type: unknown" in your log for most cases?
>>>>
>>>
>>> So far, we have only "WATCHDOG" and "FATAL ERROR" cases. I guess any
>>> more reasons would have to go in the "unknown" case.
>>>
>>>>
>>>> In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
>>>> For the watchdog bite there isn't much information, but for the fatal
>>>> error we have a error string which we print, then we call
>>>> rproc_report_crash(FATAL) which results in another "useless" print.
>>>>
>>>> Perhaps we could expand rproc_report_crash() to allow drivers to provide
>>>> some information about the crash beyond the enum.
>>>>
>>>> Something like:
>>>> 	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);
>>>>
>>>> Would that be useful to you? Would it be valuable to turn your
>>>> "crash_reason" into a human readable string?
>>>>
>>>
>>> Yes, it is valuable to turn "crash_reason" to human readable string.
>>> Should we leave that part to each driver and not have it in the common
>>> framework?
>>>
>>> If we are to refactor rproc_report_crash, then I think following is more
>>> flexible:
>>>
>>> rproc_report_crash(rproc, const char *crash_reason_str);
>>>
>>> Then each platform driver can print crash reason however they see fit.
>>> We can also avoid printing crash reason two times this way.
>>>
>>
>> Hi Bjorn,
>>
>> I take this back. I think crash_reason can be defined differently for
>> each firmware project. I would like to provide that flexibility to the
>> firmware developer. Hence, I prefer not to convert crash_reason integer
>> to human readable string, as can be different for different fw projects.
>>
> 
> Then we certainly shouldn't pass it as the second argument of
> rproc_report_crash().
> 
>> Instead, the xlnx platform driver will simply print the crash_reason
>> integer as given by the firmware, and notify the crash to the core
>> framework as following:
>>
>> rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>
>> This way, we don't have to modify the rproc_report_crash() API.
>> I hope this makes sense.
>>
> 
> Yes, that makes sense.
> 
> I think I'd like to make the proposed modification regardless, but that
> is then a completely separate change.
> 
>> I will wait for your response before sending the new version. Rest of
>> the comments I will address as asked.
>>
> 
> Is your struct xlnx_rproc_crash_report already defined and in use by the
> firmware? If not, I'd recommend that you spend a little bit extra time
> thinking about the content of it. E.g. the human readable char [] found
> in Qualcomm's crash reports is quite useful...
> 

We can modify the resource structure as needed. I looked at the qcom
rproc crash report. I don't know much the qcom smem infrastructure, but
per my understanding qcom rproc uses crash_reason integer to retrieve
the string format of the crash reason stored in the smem, via smem
driver. That's too complex for my use case. Also, I prefer not to map
crash reason number with the fixed string. Instead would like to provide
flexibility to the user to insert human readable string as needed.

How does following resource definition looks like?

struct fw_rsc_xlnx_crash_report {
        uint32_t type;
        uint32_t crash_state;
        uint32_t crash_reason;
        char crash_reason_str[16];
        uint32_t reserved;
} __packed;

So, if the user prefer to provide human readable string along with the
integer, then 16 characters should be enough, and they can choose any
string to insert when reporting the crash.

Linux side will simply print those 16 characters as string. We don't
need to verify the content of it. It is users responsibility to make
sure the characters are valid, if not crash_reason_str[0] should be '\0'.

Thanks,
Tanmay

> Regards,
> Bjorn
> 
>> Thanks,
>> Tanmay
>>
>>> If we do this, then crash_reason can be defined for each driver
>>> individually. That's more appropriate as each vendor can have different
>>> enum for crash.
>>>
>>> Let me know your thoughts.
>>>
>>>>> +			r5_core->crash_report->crash_state = 0;
>>>>> +			r5_core->crash_report->crash_reason = 0;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>  	/* received and processed interrupt ack */
>>>>>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>>>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>>>> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>>>  	if (ret)
>>>>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>>>>  
>>>>> +	/*
>>>>> +	 * Clear attach on recovery flag during stop operation. The next state
>>>>> +	 * of the remote processor is expected to be "Running" state. In this
>>>>> +	 * state boot recovery method must take place over attach on recovery.
>>>>> +	 */
>>>>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>>> +
>>>>>  	return ret;
>>>>>  }
>>>>>  
>>>>> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>>  
>>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>>  {
>>>>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>>>>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>>>>> +
>>>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>>  
>>>>>  	return 0;
>>>>> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>>>>  	 */
>>>>>  	zynqmp_r5_rproc_kick(rproc, 0);
>>>>>  
>>>>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>>> +
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>>>>> +				int offset, int avail)
>>>>> +{
>>>>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>>>>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>>>>> +
>>>>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
>>>>> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
>>>>
>>>> I don't think you need the cast.
>>>>
>>>> Regards,
>>>> Bjorn
>>>>
>>>>> +	else
>>>>> +		return RSC_IGNORED;
>>>>> +
>>>>> +	return RSC_HANDLED;
>>>>> +}
>>>>> +
>>>>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>>>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>>>>> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>>>>  	.attach		= zynqmp_r5_attach,
>>>>>  	.detach		= zynqmp_r5_detach,
>>>>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>>>>  };
>>>>>  
>>>>>  /**
>>>>> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>>>  
>>>>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>>>>  
>>>>> -	r5_rproc->recovery_disabled = true;
>>>>> +	r5_rproc->recovery_disabled = false;
>>>>>  	r5_rproc->has_iommu = false;
>>>>>  	r5_rproc->auto_boot = false;
>>>>>  	r5_core = r5_rproc->priv;
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
>>

