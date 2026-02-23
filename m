Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162237BE6B;
	Mon, 23 Feb 2026 22:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771886417; cv=fail; b=p86NPhDhJ9usC/m/uPGh9zLLeyfewq7x82sZDecwY1kkgtLvOmCdvI/8sFbE7HekmZCavCm2D9AXY3tY8gF7oaKCUPC828ojmcjDif6ROEF8cV1j5Rm1uWO4LJN4q1QrSIT9a9TSTGp0rOiA+4i4sYUm29L5QOzNu3LLT3XcBek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771886417; c=relaxed/simple;
	bh=hF/V0QA0AYQeyCKxZk3TxofGy7wdVFsVw/7hAg3Lgt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=J5HWY9lH9t4ZOhlei+hjSI8koC3735tfTl+2CrjBXcCjcwR30/v5M9OAjWrVRvxT7t+KIF5NH6iplYCCV5Zcpa6mZlWoLbhtIs8GxD6k0mUwsQAVIgOLB4CZyBnIvaRfMR7geg3ItvtQuWvj38+p45r0MlfxpNnk/QgcYhw/+t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KhpAIbhx; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KhpAIbhx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnfohtE566WDD02QVF9yrBN+QOVtGAqU4m1dxCiYbNs2gzBsdot+hXU+L8V17vO2yY14NIFl3aT4iMS1H0I1SZY1UtYzrxAE66O8IuC6Cmr/I49QtwIQH0ktHP44ZZLkF1QwTqMFEoAeuAmcrlKVEfgxMTuRqs7kfLidy4t4BNjLUrHGvFgcOvMAIY83vFWtZVc+21rAWOegGloTfq3V41Q1iHjot4esXe6VCqK765QzFJg8H2qMcwkho8j6FSt/WO1TeA0cdShUC3O5Ky70/p1Jmg023fVvEyseV3wyeU5h7USBeWBAZWQi5lXyU577Tey9dlgi++nYFLICNgjR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WLaE4Ifkiexcg5StmUd8N8E/YWUrsHNDKNTNOZ9TXE=;
 b=iZOD/9AdBKnmaH0LEiX8mkXf6LBwH5Zlr5F03CZbNOXq09EDW4Qok2fSi0W7PMYfKkxGtJ2OzVPt2aigJmy/QJHFwdUfbrOMDMRgq6gbsdmXeYex9ImbyCYpYDr+D8JvCtCt7vT+UoLoJBZeyUcje2gi3eVl3pgeZTBK7QgJU4mS+Jm7atKW0KHN4fbqICNU36PURsuSHskrsxQM1plxD3znM12QIwfaeH9CdQYp5pkZ3win+goJEiibjycPLkU8g6iPbzu7bVh0V8v8kAGjPjepudVFHGKT0d3Lbye9i+xI+JLYobqDnH91aYp3+UqZWgW6axaD6saBzSP4pv5fOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WLaE4Ifkiexcg5StmUd8N8E/YWUrsHNDKNTNOZ9TXE=;
 b=KhpAIbhxr1ibXDRxbL3etuxYYyzTh67Pr2n27UaA9v+ZKXkvwdnJmx+rx60vmo+z/b0m0YP5TREsQ7uezSER3mjhD5vUhbevJK31s9mbh5T44sxo22CbS/dHA9KA3Ls9EW8ifnR3HS42fxW8niiRrzARNu3noztbEBoT/8+KYYo=
Received: from BYAPR21CA0014.namprd21.prod.outlook.com (2603:10b6:a03:114::24)
 by SN7PR12MB7809.namprd12.prod.outlook.com (2603:10b6:806:34e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:40:07 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::54) by BYAPR21CA0014.outlook.office365.com
 (2603:10b6:a03:114::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.6 via Frontend Transport; Mon,
 23 Feb 2026 22:40:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:40:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 16:40:06 -0600
Received: from [10.31.200.39] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 23 Feb 2026 16:40:06 -0600
Message-ID: <3175bac0-1def-4f3c-bebb-31459855b1a9@amd.com>
Date: Mon, 23 Feb 2026 16:40:06 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: add crash detection mechanism
To: Bjorn Andersson <andersson@kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260223185006.1278518-1-tanmay.shah@amd.com>
 <20260223185006.1278518-3-tanmay.shah@amd.com>
 <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <kwgx4f5ig6m24w7gzaiokvi7udta4ugywuzqeysc2x3j3no4jp@eywiejlnvjsq>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc3f9a2-3d70-48f6-fc50-08de732c7e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2ZPck9MOVRiWTA3ZnFScEp4c0VyWjZhRVFQWHVOZjN1WXQ3ZnVkNmVLVHhM?=
 =?utf-8?B?YTZkdW9BaEdmOGFWRVJtWHhlVmNFMkY3RVFHci9CNFltdElDaFV5VDFvMFJN?=
 =?utf-8?B?Ri9YV2Y0Z2krSlRFYU9VR2d4UkpDME42QWVNZnk3cEtHbWFPMVFoMGdjbG9s?=
 =?utf-8?B?aGdIOENmZVJINUVRRmFUL0dnK2pnVktGcGJlbjVmYUdBbkRQS214VnY1SFNM?=
 =?utf-8?B?WUltamdQNFFKb3hRODB4Z3hwQ1g2aklCNVdHSWFURlBwQkJ4VEp1d0M3MndL?=
 =?utf-8?B?bCs5b0NweUlya0pYRytEaGhMN1RYallnTVVoT05WRmJCbldWSHJDSk5ZT3pj?=
 =?utf-8?B?SFJKL2FsV2FsWnAzdE5wbENXSXZoeURpTnZVbjIzM2J6OXQ4KzVsMnlvSTVx?=
 =?utf-8?B?dStteXFLT0xHZFdnZ1VoMjQrVlFqSFdJMjhTNTcvRFVCaitOV0pzRUU5YjA5?=
 =?utf-8?B?dWlWRW02bVVwQTNOUzQxb2hwMmZPYkRocVIrRWpyWW5hNTJ2SmUxa0srWnVI?=
 =?utf-8?B?ZTlxQWNqbmZGZ1FrTUZSMDBveFd2UHRsd1hmVjV0bFhnZjkwR01Jcmt2K1Y4?=
 =?utf-8?B?M2dvdFUvTk55VnY0R3hMS1pRWmpUMkhOR3ViTUJycHE1Q09pVnNmMUo1QU85?=
 =?utf-8?B?aXM3RXQ2MkZLemIyaWdYQW5Sd2E1ZnlwQ2QrVlEzNy9iNzU3VlY0RFJuNC9t?=
 =?utf-8?B?dURuMU8xZ1VnTWxkTXV5VFFjczEyYWpEa2lqVTRKd28rWXdOeTdWbmhGOTdZ?=
 =?utf-8?B?TEYyWEpjS3FodW1DSVdOYXpCY3doc0F1cG0za3g4cnBTNmNRSEJMMzFJSXIy?=
 =?utf-8?B?TGJ0a0Y1WjBzRW5KSEVXRWE4WktSQ09Hd1NCZTF1dFRvVEc2VWJiOFJ6YXFs?=
 =?utf-8?B?ODFEb2lTL3Q4bXQ5M0NVY0xidTE4K3hCUHVLc2xxVXJBdnpGQk8vb0hQUFJ5?=
 =?utf-8?B?WkFYa09rSUlNZkN2T0IwbnNNMllVU1VQQjdsVXRvbXR2TDAxMG1tRkxGRUxB?=
 =?utf-8?B?Y2RGaUVYcTNQZk1HK1NaaHZrUmhuNUx4RnVVWG9UVS9ROTdrMnN3TDlCZkEw?=
 =?utf-8?B?QVpMY3owK2RhK0VvQW16Ym5wZGtrRnhVcm5BbUxEY0NRVmUyOFAwNVNrMFI2?=
 =?utf-8?B?ZlF2c3ZHbXpQVUQ1M2VPajNrWHh2UjFOTDdKeDlqQ3lsNHZuRWxhcFN6bzlZ?=
 =?utf-8?B?U29BUVNWb1oyQUI3ZC9qY21kZGVqT0EvWlBCdzRKVTVwUS9yTnAvd1M1V1d6?=
 =?utf-8?B?d0NSRk5YMzBENjlkRkxvYkNsY2RxN2lZd1B3TWU4Um5ROUNMY0RyY3dOT1J3?=
 =?utf-8?B?UURTY0FhOVdGTzYzbUNOcHAxSm9LVVRPWUxETXkwak9RYjRZZk9acXZha2FE?=
 =?utf-8?B?QkdwMzdmeGNqMU0zSmluTVBoN0E3bXM0bTFVdlBjQjd2TXpvLy9wOGRUdGhP?=
 =?utf-8?B?R3NiK1BpL3Q5NXgyNkplaWxKMnk4aFR5SXFZakh2RnBHZjNadVYwRjZCR0pv?=
 =?utf-8?B?cjVWYzY2VVc3UkZiTlhSajU3RjloeU93YXVKMmpCT2hjWnU3b3ErS1FEOXNr?=
 =?utf-8?B?a3M3eWMyUGp3dUpLOWZmUys1b2JrcFU2US9XS2p1dTZaMDV2NlV4ZW1TelFz?=
 =?utf-8?B?d2QrZXZvcDJnZ0d4RjltNDkrbHArOHFKckk2czNXc0xPa3BnYjJ2YnJZZVhF?=
 =?utf-8?B?SVpqa3IyU3R0Zk1ueHlzWDRHQ0pMWGVzTXVKUDAwejVnMVMvejQ4YzZWbGdm?=
 =?utf-8?B?MDZ0aUFyRVQ0WlFueUU0NW43N1lSR2dZaEZtbklnOElsTjlTZld3WlhDWmN6?=
 =?utf-8?B?K3I2cW93WUd0TVZvbGFtYVVJdnp0Mk9nQlpLZG1QN1JBUDRZZndSbFB1Z2Nq?=
 =?utf-8?B?cUpZVlI3a2JBa09iR0k1TVVjRFFkS3V1bUJTR3BLR1k3bEY1cVRad0hSRjYy?=
 =?utf-8?B?RGN4OXRqWnU4clYxSk15NXRNNDhKcG5DT0paSFlIcS9TaHBQREVoOU84d0kr?=
 =?utf-8?B?RFFod0MveHZDZzlQbW1zck0ra09KU29PRUhDQ3FsUzhMS2xoUmVydkx6aFl1?=
 =?utf-8?B?RURXTDk4TTkxMUtXRmNYcUkyTldaUGEvTlBqd29KVWRLNWFkZ1RtZ0JxQXc1?=
 =?utf-8?B?Qmx4eUFFeHE4YjdZVTNNb0MrcTBhaGJvNnlLK2VJZWVpVFliQUtGZ0tvTlg0?=
 =?utf-8?B?VHptbENMeXpBZDNpUXlLZ2ljc1VaTUtVSCtXeUtVc1BPL2dKZUNLMHhQYTRr?=
 =?utf-8?B?c0xaa1hPM3R3ZFpSN0ZzajNrTWV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hekEWiFtET7Qt1KMZNzuLu9nrWPCrQu0Hf4Wq02MmsL/24XWZ4ACZHESHvTJcCC+mC0RXxTw+sCnNLvwt1IyT5ChFSK24/NxIjTslf75Znu1a594PfhsQFy67t138Kw14CG2tsI+edJm/vEe9lqEI0i2/1g/y+9hr611ET3UApRhWwPxQqlZbk2ldLCw2TSfyNpD7dBplEgnPqECqzfaCWgaAzNhDg8PMftEErtKpPpYyMCc3NZsweyu7smD5LAhZQXi//dVrz/9HegRkAUIs/c0G6nMBFcHyGzNm1As5m5u22E998s4bIuvdTZ/0/LFrgHWOhgbqZfni09lyUij7WK5y4j8P5/TF5SPjBlVaVdJDyZy3wKz0bIP0cVQqLOLN1mlXufDusdgrrBMrINzx5oh9tSYKKYrNI1ceRe9dA78Y8yjkE2NWfME8vqJJuEB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:40:07.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc3f9a2-3d70-48f6-fc50-08de732c7e84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7809



On 2/23/2026 1:55 PM, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 10:50:06AM -0800, Tanmay Shah wrote:
>> Remote processor will report the crash reason via the resource table
>> and notify the host via mailbox notification. The host checks this
>> crash reason on every mailbox notification from the remote and report
>> to the rproc core framework. Then the rproc core framework will start
>> the recovery process.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v3:
>>   - %s/kick/mailbox notification/
>>   - %s/core framework/rproc core framework/
>>   - fold simple function within zynqmp_r5_handle_rsc().
>>   - remove spurious change
>>   - reset crash state after reporting the crash
>>   - document set and reset of ATTACH_ON_RECOVERY flag
>>   - set recovery_disabled flag to false
>>   - check condition rproc->crash_reason != NULL
>>
>> Changes in v2:
>>   - clear attach recovery boot flag during detach and stop ops
>>
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 60 ++++++++++++++++++++++++-
>>  1 file changed, 59 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index bd619a6c42aa..0d831330ea90 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -108,6 +108,10 @@ struct rsc_tbl_data {
>>  	const uintptr_t rsc_tbl;
>>  } __packed;
>>  
>> +enum fw_vendor_rsc {
>> +	FW_RSC_VENDOR_CRASH_REASON = RSC_VENDOR_START,
> 
> Given that this is a vendor-specific resource, wouldn't it be nice to
> find e.g. XLNX somewhere in the name? Same thing with the enum itself.
> 

Ack. I will change name for enum and resource both.

>> +};
>> +
>>  /*
>>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>>   * compatibility with device-tree that does not have TCM information.
>> @@ -127,9 +131,21 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>  	{0xffe30000UL, 0x30000, 0x10000UL, PD_R5_1_BTCM, "btcm1"},
>>  };
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
>>  /**
>>   * struct zynqmp_r5_core - remoteproc core's internal data
>>   *
>> + * @crash_report: rproc crash state and reason
>>   * @rsc_tbl_va: resource table virtual address
>>   * @sram: Array of sram memories assigned to this core
>>   * @num_sram: number of sram for this core
>> @@ -143,6 +159,7 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>>   * @ipi: pointer to mailbox information
>>   */
>>  struct zynqmp_r5_core {
>> +	struct xlnx_rproc_crash_report *crash_report;
>>  	void __iomem *rsc_tbl_va;
>>  	struct zynqmp_sram_bank *sram;
>>  	int num_sram;
>> @@ -227,10 +244,14 @@ static void handle_event_notified(struct work_struct *work)
>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>  {
>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>> +	struct zynqmp_r5_core *r5_core;
>> +	struct rproc *rproc;
>>  	struct mbox_info *ipi;
>>  	size_t len;
>>  
>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +	r5_core = ipi->r5_core;
>> +	rproc = r5_core->rproc;
>>  
>>  	/* copy data from ipi buffer to r5_core */
>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -244,6 +265,16 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>  	buf_msg->len = len;
>>  	memcpy(buf_msg->data, ipi_msg->data, len);
>>  
>> +	/* Check for crash only if rproc crash is expected */
>> +	if (rproc->state == RPROC_ATTACHED || rproc->state == RPROC_RUNNING) {
>> +		if (r5_core->crash_report && r5_core->crash_report->crash_state) {
> 
> Nit. I'd prefer the order of these to be swapped...
> 
> Compare:
> 
> "Check if we have crashed, and if so check that we're in a state where
> that makes sense."
> 
> vs the way you're ordering this:
> 
> "Check if we're in a state, and if in that state we have crashed"
> 
> 
> The "have we crashed" question is the most-significant-bit of this
> chunk, making that the outermost conditional makes it faster for the
> next reader to orient themselves in the code.

Ack, that makes sense.

> 
>> +			rproc_report_crash(rproc,
>> +					   r5_core->crash_report->crash_reason);
> 
> Are these two value spaces synchronized? crash_reason seems to be a
> generic 32-bit number without particular definition, and you pass it
> into a enum rproc_crash_type.
> 

Yes, crash_reason is supposed to be enum rproc_crash_type.

> I presume the outcome is that you get the string
> "crash detected in <name>: type: unknown" in your log for most cases?
> 

So far, we have only "WATCHDOG" and "FATAL ERROR" cases. I guess any
more reasons would have to go in the "unknown" case.

> 
> In the Qualcomm drivers we can get RPROC_WATCHDOG or RPROC_FATAL_ERROR.
> For the watchdog bite there isn't much information, but for the fatal
> error we have a error string which we print, then we call
> rproc_report_crash(FATAL) which results in another "useless" print.
> 
> Perhaps we could expand rproc_report_crash() to allow drivers to provide
> some information about the crash beyond the enum.
> 
> Something like:
> 	rproc_report_crash(rproc, RPROC_FATAL_ERROR, "%d", report->crash_reason);
> 
> Would that be useful to you? Would it be valuable to turn your
> "crash_reason" into a human readable string?
> 

Yes, it is valuable to turn "crash_reason" to human readable string.
Should we leave that part to each driver and not have it in the common
framework?

If we are to refactor rproc_report_crash, then I think following is more
flexible:

rproc_report_crash(rproc, const char *crash_reason_str);

Then each platform driver can print crash reason however they see fit.
We can also avoid printing crash reason two times this way.

If we do this, then crash_reason can be defined for each driver
individually. That's more appropriate as each vendor can have different
enum for crash.

Let me know your thoughts.

>> +			r5_core->crash_report->crash_state = 0;
>> +			r5_core->crash_report->crash_reason = 0;
>> +		}
>> +	}
>> +
>>  	/* received and processed interrupt ack */
>>  	if (mbox_send_message(ipi->rx_chan, NULL) < 0)
>>  		dev_err(cl->dev, "ack failed to mbox rx_chan\n");
>> @@ -438,6 +469,13 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>>  	if (ret)
>>  		dev_err(r5_core->dev, "core force power down failed\n");
>>  
>> +	/*
>> +	 * Clear attach on recovery flag during stop operation. The next state
>> +	 * of the remote processor is expected to be "Running" state. In this
>> +	 * state boot recovery method must take place over attach on recovery.
>> +	 */
>> +	test_and_clear_bit(RPROC_FEAT_ATTACH_ON_RECOVERY, rproc->features);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -859,6 +897,9 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  
>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>  {
>> +	/* Enable attach on recovery method. Clear it during rproc stop. */
>> +	rproc_set_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY);
>> +
>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>  
>>  	return 0;
>> @@ -873,9 +914,25 @@ static int zynqmp_r5_detach(struct rproc *rproc)
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
>> +	if (rsc_type == FW_RSC_VENDOR_CRASH_REASON)
>> +		r5_core->crash_report = (struct xlnx_rproc_crash_report *)(rsc_offset);
> 
> I don't think you need the cast.
> 
> Regards,
> Bjorn
> 
>> +	else
>> +		return RSC_IGNORED;
>> +
>> +	return RSC_HANDLED;
>> +}
>> +
>>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.prepare	= zynqmp_r5_rproc_prepare,
>>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> @@ -890,6 +947,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>>  	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>>  	.attach		= zynqmp_r5_attach,
>>  	.detach		= zynqmp_r5_detach,
>> +	.handle_rsc	= zynqmp_r5_handle_rsc,
>>  };
>>  
>>  /**
>> @@ -923,7 +981,7 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>>  
>>  	rproc_coredump_set_elf_info(r5_rproc, ELFCLASS32, EM_ARM);
>>  
>> -	r5_rproc->recovery_disabled = true;
>> +	r5_rproc->recovery_disabled = false;
>>  	r5_rproc->has_iommu = false;
>>  	r5_rproc->auto_boot = false;
>>  	r5_core = r5_rproc->priv;
>> -- 
>> 2.34.1
>>

