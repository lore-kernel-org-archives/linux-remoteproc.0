Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E213542FF;
	Fri, 30 Jan 2026 18:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769796903; cv=fail; b=RtyVAnx+dpCAN1LBxgnACpHtoyOhv6FYtZmeRBJHGS5FvoF3WXrSgMI+Pvk5340yDGl60DCcepiQFlw+kSn3kzPsNsVyvoXRnXkTSMUypHbh61ev9ZGZzchkb9fBnx14WulJknG1G+0PCVkZQ42Zi6LSK4kXduYIT+yR8Z65ScM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769796903; c=relaxed/simple;
	bh=PBwBVJm5LEA89Ntqv5DRCPAuJq2prlElBkXC7j9n7YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ayrX9Kr50mGfQHonqlc4zSaG4WidP1TMKqP86CG6N+Q/lhwI1X48UOvhNj6okia2NGIoWRjsNDmCFwHzDyvviMvstLoJ8JZ18J0auwIQokc775RxBA4WJf+5SUcewOpTxKeb1NQnbVd53Z4GULmWrxJzSHNHshM17xEqwjPrGJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=284LRrc4; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="284LRrc4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj9Inoau3GAiBg91UeBzm8/uuB8YbFO6+jCi6q8GlO0tsC2LK+Pzd8qnEVwnTpPuN+0erm4KtByMCxIeYk+rJmhc21bFKgxkDvRw5GXLNJDWjJpGyXXNSUXSOIb63+femqTDVOVzSlgT3K5VXGO+xUs9CcfBAX5LV71NexNEFrQUsJmIV1Jm6nEr4mTLjRNaDbBqD0pSJEwkRacYqFOhzyFEEQ2LXYd7gnQaycFW7V7stjpXZjaPEjds62RMS/g+rdczQbaDbkECOIpLbHpKF69/rDUM8ckSKa4zbTGAEwbglAEvZ3H8YHkEl2RrSnlGiN3YducgRL9UHC81Rmc+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HaCH21e5GjWWQ0z9CiJPI5Hus6ogSWfs00c7T8MfUZU=;
 b=tz9lW9mvv30xaGlYig75UzvwKPGZIjBmb7SU/GxCuZLTGmNF1FvjSdFrcSm9vTKpvZwwipYUaWbNbdDfAtlhAuiAgniysIk2weAYGXZFaEEQtm5nk3Peyp1VVgo9N2dCtLKKjnhPFXgAMig3zRectomuBfe1UQsIugz2iUtEXn7j11QBWqYVoyLhnPZoISfyafoTNCTiKcTpyyR3dN0acfg3ljv1liJbiHNxnKt2xCG3d7UQGT/DSYz/kOdv84hXrDunPQXCsu2oNh9HewYQqZvhUW4d3BenMxLQOUKHJnP+2Ybj7YoUe4MjVU3sVqyMsyPo13MziW16bbW1MHlG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HaCH21e5GjWWQ0z9CiJPI5Hus6ogSWfs00c7T8MfUZU=;
 b=284LRrc4sTOX45sVQULnLYURJ+WlWexRqs+JYGmP5Yz+LFR0GNejbeSBOITvvXcsPp8lHcQiNz9jYgKBd1bYD2UGYR++S4h5FmDuXFWPmbtI/LEEX6306vflCxeFeJp2hUJWYr65FSuJX/GQpEy6+dTpYNfAhkaJMjwxPdmpyyY=
Received: from CH0PR04CA0079.namprd04.prod.outlook.com (2603:10b6:610:74::24)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 18:14:58 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::a9) by CH0PR04CA0079.outlook.office365.com
 (2603:10b6:610:74::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 18:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 18:14:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 30 Jan
 2026 12:14:57 -0600
Received: from [10.254.48.177] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 30 Jan 2026 10:14:57 -0800
Message-ID: <3fa3ee57-620f-433b-b0a7-e3f0069e0fa5@amd.com>
Date: Fri, 30 Jan 2026 12:14:51 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 2/2] remoteproc: xlnx: do not kick if mbox queue is
 full
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20251217212728.1540043-1-tanmay.shah@amd.com>
 <20251217212728.1540043-3-tanmay.shah@amd.com> <aVwrdGiZZ9E-5Nkq@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <aVwrdGiZZ9E-5Nkq@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 50be2e03-23e0-4972-7cfa-08de602b79f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHNiY1VEMStnZU5HTUpYMXFCb0tjSFNhSXM4bGdaVG5pSXFjeVYrcWw1ZU9y?=
 =?utf-8?B?RlFtNSs5c2w0VHN0YXU4TDk4SVBMY0tsRFVNMU81bWpuWkdHZGdERlBhNnVs?=
 =?utf-8?B?Zk05VkVaUGN2cjNTejhudko5UFo2OFp1RzZGbVN0dzc5WExDL0dvdGRTNlNo?=
 =?utf-8?B?SDdpVkdGeG5BZTFXUW5aenNPYkhpbEQ0dmhtK29aNUY5ZExKMEtuZnRmNmVt?=
 =?utf-8?B?SVovWkphUXVtLytoNUsyTDBPY3lWQjdYUzlydnNkNEVkVzBEVlRKODd0UzVk?=
 =?utf-8?B?V0d6QmRtTVB0S21PODFURDZudXREUjJFNkZacHc0dlFNMnY4Y3Y4eWIzd29Q?=
 =?utf-8?B?b1ZTbWw4Z3l5Q0lFazVxMjZCRm1SMWFWZWN2ajFvd1ViTnlWcVo5Nld0N3pn?=
 =?utf-8?B?WXJMNDNuUVFQbkJYVnZTN0hqMTU3b0VSNnVOVXBKdHFhMUtsQjVBejNlT29M?=
 =?utf-8?B?YzIxOVdzTzNZVXZ2RXpCQVNsRTBtV1pQMGdlYm4vS1h6K1ZSVDdQQ1pOQis0?=
 =?utf-8?B?QVRsdW5URHFnb0l1bTNiZHQ3RnJ6WFBlMitXUjhuVkxDSUhUSG4xb09BVmxH?=
 =?utf-8?B?dGJZSHFhV2Q3VEwxb1U1a1R2V1FERSs0QXhiYTlQK3RyVzdWV01GaGZSdThx?=
 =?utf-8?B?dzVyTHAyNUtqV3owbUk0SVMzcmgvcHdWVFBxb0ZLSllDUjk0RWNqL0VPdXU3?=
 =?utf-8?B?c3NGbC9sWUhBck5SQnR3a2JEaVpDVHFMR1F1amoxL21GRnlqRHVDTTc0V2hG?=
 =?utf-8?B?UDU0dUJiMCszWW1MYVhhQW1rTE8xWDlXd1ZZQ3hEOE9WbXdUVmhJVmZjbUdO?=
 =?utf-8?B?LzBnRWRsZHdIaW1mdnB3enFxY1MwY0kxTnlwWWExTzlNUkpaano2bDBVVHl1?=
 =?utf-8?B?YTRIWWw1eDZRL2I1RUpKM01VQkRZSTlTK0J6RGIvbjBDQXJXdDFZZTllUFY4?=
 =?utf-8?B?anZjY0NCMGRzTFpIcjVuS044NVhHcU9ZdUNyMStHQUZhZG5HeElJQXpjdm1n?=
 =?utf-8?B?cDZmeDBoSlBNclZLT2NkbmQwa2hKdi9tVXFGb1ZKb0t2QURqem9qQmdLMFdk?=
 =?utf-8?B?Ylh2WlkvSnhZVjF6UVZWMUFTdGV5WEFvTUg3bVUrZHVFcDNqeUozbEo4N3V0?=
 =?utf-8?B?bzF6NW1sbGtsVS96dGVRNzFQZklXZlhlU1h4RXZCQi8vQXJNV0dKelRFajlK?=
 =?utf-8?B?cXhUZExPeUtPejg2VFpsNm9yNW1BTVVsVUdIS0EweG9qcExvVGJwZlc1K1Fr?=
 =?utf-8?B?K3RRWlNWOElLNUpKWHFtTXJWbWRVRE5iRWpRbFR5UzRpTy9PVFd0R3pvSktl?=
 =?utf-8?B?Z3JJWVJhYjJ4NnR2Ulc5Y1FHalNpbnpLcXJ0YnROZTI5VStIN1pjVTdxVEFV?=
 =?utf-8?B?dDRHVHZLL0trRjJVWWQ3OThEU056N09kMnZCb3ZqNWN0NGNKb3U1Z2g5eEts?=
 =?utf-8?B?T1lXZk94N2JzRHplaGswQmZIb2tESzcydmFxZkJxK0hhWTlORnV5MmNoTCtq?=
 =?utf-8?B?N3RYZklEdEcvci94SjZFaXlTakFZNUdza3ZZUjVwQzFHeTc4eUdPMzd1eFRl?=
 =?utf-8?B?VlZjMEp5eUlnNkVFNy9SWU5aYWNocEFkakRxZ0JHRnZLT2ttZFo3aWFGNGYr?=
 =?utf-8?B?WnRsbVBxUGlDUGYyMmVtWGl1TEdNendoaStIZS9oNGU3cnRUeG5Zbkc5R01Y?=
 =?utf-8?B?TDY0aDVaRXJzMll3cExyRVpIbXJNSVpVWUJYUzFzeGduekR2UGFRbFhmZysz?=
 =?utf-8?B?N21WbGFrRGlGaDkySmlQYms5ajc5c2pZd1VyaE9BUG5WRWh0SU9SMFZmZXM4?=
 =?utf-8?B?Mm4yTlk0OXFnelZLbzljZzIzN080RGRtdSszQXVJcFdXNFJuL3lJbHk1Qmpr?=
 =?utf-8?B?bVFrejNUMTdFTzczRGI0V2pvSjU3YWdDZytvR2ZTVEs2eHZqcTJuMVFNTVBw?=
 =?utf-8?B?K0M2ZjQvMllETVF4czJyaFVWMUNMOEY0RE9MMXdITVp1dTI1czltbTBreTh4?=
 =?utf-8?B?ZnBuMXBVbXpkcDhhZW1BOFRrcDRkeEh5VHVvN3BBZks4dHROVzlmTHpxTFNX?=
 =?utf-8?B?aEJXZytvVWFDK3dVK09xQStXbytab3BObVFtdlZCMGtNV044Z3dLYXRpTDR1?=
 =?utf-8?B?VXhIUE0wV1N6Zm52ZkU4NVJqTExHSm83bTlya3dWMi9hcWlIYzJSSUkvUXdI?=
 =?utf-8?B?NXRZWFhPWUxkTzNxVXk5Tkk4TDhyVTk4ZXNyblFIY1RNeXVVVnJLUDVYS044?=
 =?utf-8?B?ZG1lZWp2RHFUVnhPN0ZuNXEyQUVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	64jdrFr41E44iyy3CkwOoUcGthPhLkHC7Q4GasJgUgTSCl/ba8RzrOR4XiPEHnXkksG8b2cfbqeJ69asb1vTAz0uzPfDP5/WkZ0DcsUrSi/6l2N2/t8u5eA56qgseKrsjd7Dg9yrSux1uHwgJ9oLPV5eFZkH7MRZ6BRFUCoXJ4i+WSSFJIob6w2JrzP8U93M57QRxQa+HyFMIOQC2Aqd9fxvnGstH3i1eB9EbPSXPpBRHTaoUAv0oUzQPvE29sSk/1LX5iWwxPMVEIIY7v6DeKfheY4h0VvqYfRURe17oA0Fe1accQLTh0oiaL32TmbJPoUpmJJPwbzvocGUEPQxBtefIQnjVeWyAsaoaSAEr3lcZyB1eFSNviuj7Jrh9voSmNbNY8krFyqr05fzf3DFGWL0+zmrVHxTOZEM9ZWabMxLKPSkAe+Wdqm11QQO6LwN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:14:57.8907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50be2e03-23e0-4972-7cfa-08de602b79f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897


On 1/5/2026 3:21 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, Dec 17, 2025 at 01:27:28PM -0800, Tanmay Shah wrote:
>> If MBOX_TX_QUEUE_LEN number of kicks are pending, then no need to keep
>> doing more kicks because it will fail anyway. Preventing further kicks
>> is needed because it avoids printing false positive warning messages
>> from mailbox framework. Functionally nothing changes from RPMsg or
>> remoteproc point of view.
>>
>> Also, allocate different mbox client data structure for tx channel, as
>> it's a requirement from the mailbox framework.
>>
> 
> The semantic of these two changes is different enough to mandate two separate
> patches.  I'm fine with the changes themselves.
> 

Thanks Mathieu.

Ack, I will send two separate patches for each change.

Thanks,
Tanmay

> Thanks,
> Mathieu 
> 
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index a7b75235f53e..2db158c189be 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/firmware/xlnx-zynqmp.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mailbox_client.h>
>> +#include <linux/mailbox_controller.h>
>>  #include <linux/mailbox/zynqmp-ipi-message.h>
>>  #include <linux/module.h>
>>  #include <linux/of_address.h>
>> @@ -74,7 +75,8 @@ struct zynqmp_sram_bank {
>>   * @tx_mc_buf: to copy data to mailbox tx channel
>>   * @r5_core: this mailbox's corresponding r5_core pointer
>>   * @mbox_work: schedule work after receiving data from mailbox
>> - * @mbox_cl: mailbox client
>> + * @mbox_tx_cl: tx channel mailbox client
>> + * @mbox_rx_cl: rx channel mailbox client
>>   * @tx_chan: mailbox tx channel
>>   * @rx_chan: mailbox rx channel
>>   */
>> @@ -83,7 +85,8 @@ struct mbox_info {
>>  	unsigned char tx_mc_buf[MBOX_CLIENT_BUF_MAX];
>>  	struct zynqmp_r5_core *r5_core;
>>  	struct work_struct mbox_work;
>> -	struct mbox_client mbox_cl;
>> +	struct mbox_client mbox_tx_cl;
>> +	struct mbox_client mbox_rx_cl;
>>  	struct mbox_chan *tx_chan;
>>  	struct mbox_chan *rx_chan;
>>  };
>> @@ -230,7 +233,7 @@ static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>  	struct mbox_info *ipi;
>>  	size_t len;
>>  
>> -	ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +	ipi = container_of(cl, struct mbox_info, mbox_rx_cl);
>>  
>>  	/* copy data from ipi buffer to r5_core */
>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -269,8 +272,8 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>>  	if (!ipi)
>>  		return NULL;
>>  
>> -	mbox_cl = &ipi->mbox_cl;
>> -	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>> +	mbox_cl = &ipi->mbox_tx_cl;
>> +	mbox_cl->rx_callback = NULL;
>>  	mbox_cl->tx_block = false;
>>  	mbox_cl->knows_txdone = false;
>>  	mbox_cl->tx_done = NULL;
>> @@ -285,6 +288,13 @@ static struct mbox_info *zynqmp_r5_setup_mbox(struct device *cdev)
>>  		return NULL;
>>  	}
>>  
>> +	mbox_cl = &ipi->mbox_rx_cl;
>> +	mbox_cl->rx_callback = zynqmp_r5_mb_rx_cb;
>> +	mbox_cl->tx_block = false;
>> +	mbox_cl->knows_txdone = false;
>> +	mbox_cl->tx_done = NULL;
>> +	mbox_cl->dev = cdev;
>> +
>>  	ipi->rx_chan = mbox_request_channel_byname(mbox_cl, "rx");
>>  	if (IS_ERR(ipi->rx_chan)) {
>>  		mbox_free_channel(ipi->tx_chan);
>> @@ -335,6 +345,10 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>>  	if (!ipi)
>>  		return;
>>  
>> +	/* Do not need new kick as already many kicks are pending. */
>> +	if (ipi->tx_chan->cl->msg_slot_ro == 0)
>> +		return;
>> +
>>  	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
>>  	memcpy(mb_msg->data, &vqid, sizeof(vqid));
>>  	mb_msg->len = sizeof(vqid);
>> -- 
>> 2.34.1
>>

