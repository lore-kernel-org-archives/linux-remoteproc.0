Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290B288C08;
	Fri, 27 Feb 2026 15:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207923; cv=fail; b=RlyJYVXBHrJKlkHgD5JZQwAF7dPA95OXmWJRni75PzAapR4SrsZxgJynVHiD/udoCf0NFxbQcoOnHHqz9dE/Nl7KZTK4E3YrUG6goNcztW9vHqQuOIsp7LyTwSHWhB3wYarTYdR+7ypN+BP2R9WGMneQTgqlLT97lYTB5ARC6Z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207923; c=relaxed/simple;
	bh=4aaRvu93xFHZIF8bBKb6gcP+tvYjWPvV4HeHhGDklqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C3Cc+mxXL5NMDt+Zsbex750IUU9p33DHIqHQ1g/BuZ4WsrDZ85t+ygFlBW6gOiu01gLX/ADbzKQLrDgrGqdhhgBNzA15n6yk9cyC+gDQV2bfhx+IP54iRtqwrgAVXZCvujrKwg33BhDLZ5/+Tdfu1s/NPcsw4RTC8w4uvCUbjrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=moeHWW+9; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="moeHWW+9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CepBD5vQZMHgGgwg0fuhzGHDY6KFJibcDXcJxNQo2CG6S/ZJKMnfEMmx0sMQaN5UrU44cRKfXugx4fK9b3LO4GOskRV9SReGrzq1PxZ462kBm7/CB/674yrrR6gMBp0cZkGb8NxfKw5SohPNDvXslo4LiV+R23Fcp9yafsgcs0v/5UXQFytL4qNgtmhUIqby1Qj54ar9kEMObr2qGnBhGyQjMKyhkVMQSzA3SDjtLan8U4kRW0BRpSRTruJ2fYth6i40KjTLcVriLARhYQ7gkMTuqJ9FKpoSZATgqe4uuaCMI7epfRgSnS8GE0UdDbZIy1UWA8ITgawRI+U67blBJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zdatx0SJKIc5VmmF+IOr5Yx/madz4HKesa9fmIe2Ss=;
 b=Kff2uLPaLYA2EEb37w+zsoC40el81nybYL/MHbgAuoS0pgPLXt4Y4uC//FSRgeokemC86uk35NHi9+Ic16nGKDQFVL2r5lTkAlb1Lj+ddVJpn0DVemofrzN3d80DX2JKJa8OOfg4JRmgRacF18F2aBJmfHWJdwENpseQTbPdHaxup8zvL381nB9Yruy0Ol3DH6iBncYxsXQSnwyHUrVExousjzDhUlkSsPSntnO4MlRJR5V8wejoc9njgtICj5TZvw6l5NhYdLmAjcAscsrslZSuIz3n5mdA22VbUuqu0Yn6wOzgLOepWr7W/FThf79Y/xDM5xMmfoIJdUq2Ao9QaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zdatx0SJKIc5VmmF+IOr5Yx/madz4HKesa9fmIe2Ss=;
 b=moeHWW+9XBvpYIjERAzIxf06LNlO0zl6iVS/MMEdZK5Kf0qrNftAiVNf7+DPlPhbVfjD7sDUrXPf5dYdTJv8FGDvBpgp+Jnvt2MdXOhuwRnbTXMbTmNi+JSj6yI5VsiYhP38dR0O9NluN1oVKKNoGg5Wtz1X4nFdnwcrdhpXlOw=
Received: from SJ0PR13CA0067.namprd13.prod.outlook.com (2603:10b6:a03:2c4::12)
 by CYYPR12MB8963.namprd12.prod.outlook.com (2603:10b6:930:c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:58:29 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::96) by SJ0PR13CA0067.outlook.office365.com
 (2603:10b6:a03:2c4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.14 via Frontend Transport; Fri,
 27 Feb 2026 15:58:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 27 Feb 2026 15:58:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 09:58:27 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 27 Feb
 2026 09:58:27 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 27 Feb 2026 09:58:26 -0600
Message-ID: <d6751234-a9e2-44c2-b2f8-764367bca828@amd.com>
Date: Fri, 27 Feb 2026 09:58:26 -0600
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
 <96f8825f-7f20-40c7-be5f-164f44911d62@amd.com>
 <24pymyxpkajnyavmtora2viclvwu2o4hkzcsw4kzg5z26ner6n@iltfpvxuoeqb>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <24pymyxpkajnyavmtora2viclvwu2o4hkzcsw4kzg5z26ner6n@iltfpvxuoeqb>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CYYPR12MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: aaf338b2-f801-4f81-5ad7-08de76190c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	+Ckq4xo0MvwTR8Jno9jz5Qveb5PkqyxtC+IVUH0fxlvAg4ZLrD5tDFRFSHc4qwpe1ObVJhlaJlBb8FxDc5hDwRj2Xg2sNhvzsFcFCxg8Pd1KeDvjrBKJwjuxaRBCofQxyQQfPRegnPDy/P3AAZlhQXPXlnDof0sIW8EKG0YvizkVnaoa/C2DNiuZK8sdG+QC+4jgV1jLirRIxqoij5xmwiZagZesFuJrGPyGqSjRVAK2+jMZ/dgwmzocLqd0NnVKUL5kedQiQ+FjV9xBTjijskpCLP8ZrwpK48G4OEPJxTCR8sm2ShQbi+PgcU2m+kEqGvcNhXIpJTBiXBSLwQXQKPNpKI5nDJQyBjUkOaekOp0lCYoup7l79TOfrbmsbohFUrN1QfjSfFNA0AwN+q/je+wd96k/84LeA6oYXk+gmLcF8fMCIGHwtNtL/MOuQkMW8ekboJY9yrJCWPJ4QwCnjhR5MO3aw3rKyw2qae4uV+tMR62t/S6V/yuvLTMyc5WrzyUFaAjZJDq2wdGmHqw8PyZfpGHMG2Gc9JerFEBU4Nbg/PrB117gr0zRA9DXd71ucSP7/Je6LTsTjpPtYGxiJKKtqQmzt9dOhQoUAfqzcagNIQj0+AEhQ10ecx6J8/WbjHZkF6ROqw9QkGPClCoL+p+BvPqWowRPExykOwxSqrp94i+oKq2NsIMLKfbFDIX7kQFStGlvkw7p3d1qKoiiiica80YEYlRp5HP2zddgWtLbWMuK+hKUnfLc0jA31LaLUBoZ1ne0Vkr2meO48R2tKOAzEOZKn8bfb6jP9uYfX+jToFHYDTXkVIpbMVLgivMDUXwF6fBTAKUnTmLNURnaKA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pztAsMkjrO+q1UwB/yZ8ZqIEhqU7J//9cNFmCZPJ9M3rh1JDey6/8SLkaC5R7ihQk2EgIHxe8HJ639KCaaDcsv1XZD/s4VsHzA732irPnrrDVmK2ELWARQ4MSJOZVECZCQKJyCWBg7UfJshtFAMxzto8BLrXS6I/srK5KKhE4kWKahscjVwuNx1eV12oZOFFGkF9WEkjyJzDbCvP6+LqqW0ebsFuPQ7aji+yWdKgfEWXFGa8NHGJ6I/pWifCQ06Iw634rRawC5oBJLMXnpTTD1svLx1PKkmGIFanc2VsWZi3qXE6IfAt3kri58+bQfpxt+6whXGZVEduXBpPRjH4Lg0lDtxL/Ix3wnZ5XuCfI+QIJUuF43AVsZn7p7qGOOeqQ3va3fuhzlai5uz0jew2Z85PDgpTDsdtDxUUKbRzFjqsg3JC8oMsbnwLN4UJ8IW4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:58:28.9330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf338b2-f801-4f81-5ad7-08de76190c98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8963



On 2/26/2026 10:19 PM, Bjorn Andersson wrote:
> On Thu, Feb 26, 2026 at 04:57:06PM -0600, Shah, Tanmay wrote:
>>
>>
>> On 2/25/2026 5:30 PM, Bjorn Andersson wrote:
>>> On Wed, Feb 25, 2026 at 11:22:05AM -0600, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 2/23/2026 4:40 PM, Shah, Tanmay wrote:
>>>>>
>>>>>
>>>>> On 2/23/2026 1:55 PM, Bjorn Andersson wrote:
>>>>>> On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
>>>>>>> Remote processor will report the crash reason via the resource table
>>>>>>> and notify the host via mailbox notification. The host checks this
>>>>>>> crash reason on every mailbox notification from the remote and report
>>>>>>> to the rproc core framework. Then the rproc core framework will start
>>>>>>> the recovery process.
>>>>>>>
>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>>   - %s/kick/mailbox notification/
>>>>>>>   - %s/core framework/rproc core framework/
>>>>>>>   - fold simple function within zynqmp_r5_handle_rsc().
>>>>>>>   - remove spurious change
>>>>>>>   - reset crash state after reporting the crash
>>>>>>>   - document set and reset of ATTACH_ON_RECOVERY flag
>>>>>>>   - set recovery_disabled flag to false
>>>>>>>   - check condition rproc->crash_reason != NULL
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>   - clear attach recovery boot flag during detach and stop ops
>>>>>>>
>>>>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
>>>>>>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>>> index bd619a6c42aa..0d831330ea90 100644
>>>>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>>>>>>>  	const uintptr_t rsc_tbl;
>>>>>>>  } __packed;
>>>>>>>  
>>>>>>> +enum fw_vendor_rsc {
>>>>>>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
>>>>>>
>>>>>> Given that this is a vendor-specific resource, wouldn't it be nice to
>>>>>> find e.g. XLNX somewhere in the name? Same thing with the enum itself.
>>>>>>
>>>>>
>>>>> Ack. I will change name for enum and resource both.
>>>>>
>>>>>>> +};
>>>>>>> +
>>>>>>>  /*
>>>>>>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>>>>>>   * compatibility with device-tree that does not have TCM information.
>>>>>>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>>>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>>>>>>  };
>>>>>>>  
>>>>>>> +/**
>>>>>>> + * struct xlnx_rproc_crash_report - resource to know crash status and reason
>>>>>>> + *
>>>>>>> + * @crash_state: if true, the rproc is notifying crash, time to recover
>>>>>>> + * @crash_reason: reason of crash
>>>>>>> + */
>>>>>>> +struct xlnx_rproc_crash_report {
>>>>>>> +	u32 crash_state;
>>>>>>> +	u32 crash_reason;
>>>>>>> +} __packed;
>>>>>>> +
>>>>>>>  /**
>>>>>>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>>>>>>   *
>>>>>>> + * @crash_report: rproc crash state and reason
>>>>>>>   * @rsc_tbl_va: resource table virtual address
>>>>>>>   * @sram: Array of sram memories assigned to this core
>>>>>>>   * @num_sram: number of sram for this core
>>>>>>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>>>>>>   * @ipi: pointer to mailbox information
>>>>>>>   */
>>>>>>>  struct zynqmp_r5_core {
>>>>>>> +	struct xlnx_rproc_crash_report *crash_report;
>>>>>>>  	void __iomem *rsc_tbl_va;
>>>>>>>  	struct zynqmp_sram_bank *sram;
>>>>>>>  	int num_sram;
>>>>>>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>>>>>>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>>>>  {
>>>>>>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>>>>>> +	struct zynqmp_r5_core *r5_core;
>>>>>>> +	struct rproc *rproc;
>>>>>>>  	struct mbox_info *ipi;
>>>>>>>  	size_t len;
>>>>>>>  
>>>>>>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
>>>>>>> +	r5_core = ipi->r5_core;
>>>>>>> +	rproc = r5_core->rproc;
>>>>>>>  
>>>>>>>  	/* copy data from ipi buffer to r5_core */
>>>>>>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>>>>>>> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>>>>  	buf_msg->len = len;
>>>>>>>  	memcpy(buf_msg->data, ipi_msg->data, len);
>>>>>>>  
>>>>>>> +	/* Check for crash only if rproc crash is expected */
>>>>>>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>>>>>>> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
>>>>>>
>>>>>> Nit. I'd prefer the order of these to be swapped...
>>>>>>
>>>>>> Compare:
>>>>>>
>>>>>> "Check if we have crashed, and if so check that we're in a state where
>>>>>> that makes sense."
>>>>>>
>>>>>> vs the way you're ordering this:
>>>>>>
>>>>>> "Check if we're in a state, and if in that state we have crashed"
>>>>>>
>>>>>>
>>>>>> The "have we crashed" question is the most-significant-bit of this
>>>>>> chunk, making that the outermost conditional makes it faster for the
>>>>>> next reader to orient themselves in the code.
>>>>>
>>>>> Ack, that makes sense.
>>>>>
>>>>>>
>>>>>>> +			rproc_report_crash(rproc,
>>>>>>> +					   r5_core->crash_report->crash_reason);
>>>>>>
>>>>>> Are these two value spaces synchronized? crash_reason seems to be a
>>>>>> generic 32-bit number without particular definition, and you pass it
>>>>>> into a enum rproc_crash_type.
>>>>>>
>>>>>
>>>>> Yes, crash_reason is supposed to be enum rproc_crash_type.
>>>>>
>>>>>> I presume the outcome is that you get the string
>>>>>> "crash detected in <name>: type: unknown" in your log for most cases?
>>>>>>
>>>>>
>>>>> So far, we have only "WATCHDOG" and "FATAL ERROR" cases. I guess any
>>>>> more reasons would have to go in the "unknown" case.
>>>>>
>>>>>>
>>>>>> In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
>>>>>> For the watchdog bite there isn't much information, but for the fatal
>>>>>> error we have a error string which we print, then we call
>>>>>> rproc_report_crash(FATAL) which results in another "useless" print.
>>>>>>
>>>>>> Perhaps we could expand rproc_report_crash() to allow drivers to provide
>>>>>> some information about the crash beyond the enum.
>>>>>>
>>>>>> Something like:
>>>>>> 	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);
>>>>>>
>>>>>> Would that be useful to you? Would it be valuable to turn your
>>>>>> "crash_reason" into a human readable string?
>>>>>>
>>>>>
>>>>> Yes, it is valuable to turn "crash_reason" to human readable string.
>>>>> Should we leave that part to each driver and not have it in the common
>>>>> framework?
>>>>>
>>>>> If we are to refactor rproc_report_crash, then I think following is more
>>>>> flexible:
>>>>>
>>>>> rproc_report_crash(rproc, const char *crash_reason_str);
>>>>>
>>>>> Then each platform driver can print crash reason however they see fit.
>>>>> We can also avoid printing crash reason two times this way.
>>>>>
>>>>
>>>> Hi Bjorn,
>>>>
>>>> I take this back. I think crash_reason can be defined differently for
>>>> each firmware project. I would like to provide that flexibility to the
>>>> firmware developer. Hence, I prefer not to convert crash_reason integer
>>>> to human readable string, as can be different for different fw projects.
>>>>
>>>
>>> Then we certainly shouldn't pass it as the second argument of
>>> rproc_report_crash().
>>>
>>>> Instead, the xlnx platform driver will simply print the crash_reason
>>>> integer as given by the firmware, and notify the crash to the core
>>>> framework as following:
>>>>
>>>> rproc_report_crash(rproc, RPROC_FATAL_ERROR);
>>>>
>>>> This way, we don't have to modify the rproc_report_crash() API.
>>>> I hope this makes sense.
>>>>
>>>
>>> Yes, that makes sense.
>>>
>>> I think I'd like to make the proposed modification regardless, but that
>>> is then a completely separate change.
>>>
>>>> I will wait for your response before sending the new version. Rest of
>>>> the comments I will address as asked.
>>>>
>>>
>>> Is your struct xlnx_rproc_crash_report already defined and in use by the
>>> firmware? If not, I'd recommend that you spend a little bit extra time
>>> thinking about the content of it. E.g. the human readable char [] found
>>> in Qualcomm's crash reports is quite useful...
>>>
>>
>> We can modify the resource structure as needed.
> 
> Just to make sure it's clear, this is merely a suggestion based on my
> experience, not a review request. But if the format of the structure
> isn't already defined, I would suggest packing some additional
> information in there.
> 

Thanks Bjorn, yes I understand this. In fact people's past experiences
help new code development robust and I appreciate every suggestion.

>> I looked at the qcom
>> rproc crash report. I don't know much the qcom smem infrastructure, but
>> per my understanding qcom rproc uses crash_reason integer to retrieve
>> the string format of the crash reason stored in the smem, via smem
>> driver. That's too complex for my use case. Also, I prefer not to map
>> crash reason number with the fixed string. Instead would like to provide
>> flexibility to the user to insert human readable string as needed.
>>
> 
> Qualcomm has SMEM which is an allocate-only "heap" which is shared
> between Linux and the different remoteprocs, so that's used to share
> such information between the different systems.
> 
> It sounds correct to me that you don't want to introduce something like
> that to solve this problem. In fact I think your solution is quite
> elegant.
> 
>> How does following resource definition looks like?
>>
>> struct fw_rsc_xlnx_crash_report {
>>         uint32_t type;
> 
> It sounds like a good idea to have a "type" or "version" here, to allow
> changing the struct at a later point if necessary.
> 

Thanks, I will add version field.

> But you're probably only going to be using a few bits here, and iiuc you
> only use 1 bit from the "crash_state". So you should be able to reduce
> the size of these types.
> 

Yes I think changing type to u8 makes sense.

>>         uint32_t crash_state;
>>         uint32_t crash_reason;
>>         char crash_reason_str[16];
> 
> Would that be sufficient to convey a good error message?
> 
> As an example I triggered an error on one of the Qualcomm remoteprocs
> earlier today, the error message is 17 characters, but then it includes
> the process, file and line number of the error and the caller. So in
> total it's 73 characters - but it gave me a pretty good idea of what
> went wrong.

This crash reason string is not meant for long debug/error messages.
Example of crash reasons I am expecting as following:

"mem fault"
"hard fault"
"thermal fault"
"io fault"
"watchdog rst"
"power on rst" etc..

Just some short description of the reason to report the crash.

We have other features in the remoteproc subsystem for long messages
such as "trace buffers" and "coredump". Users can use those features to
print long error/debug messages when needed.

> 
>>         uint32_t reserved;
> 
> Why pad here? If you want an even size, make the string 20 characters
> (or adjust the u32 pair at the beginning). If you want room for future
> improvements, use the "type" field for that.
> 

Ack, I think this is not needed.

>> } __packed;
>>
>> So, if the user prefer to provide human readable string along with the
>> integer, then 16 characters should be enough, and they can choose any
>> string to insert when reporting the crash.
>>
> 
> Give it some extra thought, and weigh it against memory budget etc and
> pick something that you think suits you.
> 

Good idea, I will redesign & re-test this as discussed, and think about
future extension as well.

>> Linux side will simply print those 16 characters as string. We don't
>> need to verify the content of it. It is users responsibility to make
>> sure the characters are valid, if not crash_reason_str[0] should be '\0'.
>>
> 
> I'd still suggest that you \0-terminate the string explicitly on the
> Linux side, just to be safe. You don't want a firmware bug to crash your
> Linux driver.
> 

Yup, Ack. Also, while printing I will print only first 15 characters.

> Regards,
> Bjorn
> 
>> Thanks,
>> Tanmay
>>
>>> Regards,
>>> Bjorn
>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>> If we do this, then crash_reason can be defined for each driver
>>>>> individually. That's more appropriate as each vendor can have different
>>>>> enum for crash.
>>>>>
>>>>> Let me know your thoughts.
>>>>>
>>>>>>> +			r5_core->crash_report->crash_state = 0;
>>>>>>> +			r5_core->crash_report->crash_reason = 0;
>>>>>>> +		}
>>>>>>> +	}
>>>>>>> +
>>>>>>>  	/* received and processed interrupt ack */
>>>>>>>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>>>>>>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>>>>>>> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>>>>>>  	if (ret)
>>>>>>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>>>>>>  
>>>>>>> +	/*
>>>>>>> +	 * Clear attach on recovery flag during stop operation. The next state
>>>>>>> +	 * of the remote processor is expected to be "Running" state. In this
>>>>>>> +	 * state boot recovery method must take place over attach on recovery.
>>>>>>> +	 */
>>>>>>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>>>>> +
>>>>>>>  	return ret;
>>>>>>>  }
>>>>>>>  
>>>>>>> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>>>>  
>>>>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>>>>  {
>>>>>>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>>>>>>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>>>>>>> +
>>>>>>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>>>>  
>>>>>>>  	return 0;
>>>>>>> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>>>>>>>  	 */
>>>>>>>  	zynqmp_r5_rproc_kick(rproc, 0);
>>>>>>>  
>>>>>>> +	clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>>>>>>> +
>>>>>>>  	return 0;
>>>>>>>  }
>>>>>>>  
>>>>>>> +static int zynqmp_r5_handle_rsc(struct rproc *rproc, u32 rsc_type, void *rsc,
>>>>>>> +				int offset, int avail)
>>>>>>> +{
>>>>>>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>>>>>>> +	void *rsc_offset = (r5_core->rsc_tbl_va + offset);
>>>>>>> +
>>>>>>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
>>>>>>> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
>>>>>>
>>>>>> I don't think you need the cast.
>>>>>>
>>>>>> Regards,
>>>>>> Bjorn
>>>>>>
>>>>>>> +	else
>>>>>>> +		return RSC_IGNORED;
>>>>>>> +
>>>>>>> +	return RSC_HANDLED;
>>>>>>> +}
>>>>>>> +
>>>>>>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>>>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>>>>>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>>>>>>> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>>>>>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>>>>>>  	.attach		= zynqmp_r5_attach,
>>>>>>>  	.detach		= zynqmp_r5_detach,
>>>>>>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>>>>>>  };
>>>>>>>  
>>>>>>>  /**
>>>>>>> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>>>>>>  
>>>>>>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>>>>>>  
>>>>>>> -	r5_rproc->recovery_disabled = true;
>>>>>>> +	r5_rproc->recovery_disabled = false;
>>>>>>>  	r5_rproc->has_iommu = false;
>>>>>>>  	r5_rproc->auto_boot = false;
>>>>>>>  	r5_core = r5_rproc->priv;
>>>>>>> -- 
>>>>>>> 2.34.1
>>>>>>>
>>>>>
>>>>
>>

