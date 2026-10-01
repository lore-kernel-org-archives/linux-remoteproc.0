Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576D4EFFB8;
	Thu,  1 Oct 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873489; cv=fail; b=O1+omGBrMQc4Romu01HCoIddSU2EGtWUsLaH2+W3UgZm9E1pLj9h+e7yy7hlvRAtLCmibV1vUqpyrlsbV18d3p+/KHSY+fsHWlOMtGlwTM+zqvhiOvzDOwWb48DYhEznwZR6QjGR+qoluZgJi7MpZ6s0Tx/90efDKnSL+XL7Ou8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873489; c=relaxed/simple;
	bh=OhZGDhtI0X82mS5x5qswiWI8jmlmxTxRZ4NLpQnvS60=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AOwR3/rw+IQz72nX/JK+CBX5fjWl27ajqGAXgdWiXn9e33DTUjI0a4bhaeOEjU61SBt4eQMRy1VGz5UTyOyqvb0hnE7oIfJ4W68ONP/AiNzb0dHas/MIFG5soTdk109EGFZu5GbzZQBMwn2yOgdxaXyaTFTH20HPfTJsK+y65eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GndXerVm; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GndXerVm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6fbDVcGKCyj98NQEfTTZ9J6+HlGL9g6FV+0QqaJYp3rq8sSkgicmb9Kg/dEH7Hzya/px/2GigGb1bwWTDk3IUHbUt+ZTY7gbsrl3DMDcrbgK7Xy1S8jFpu+urxAKUjynggm+13V7pI6s4iE4cXWusXLXmmcAqZ06kFPBtQ3Nfn2CYof8DmuV2eDqXDs6xnbaFTnyrcixccMSUn37jHUu0nq6LYgsabV0Sswd3FYZi4la3ymcZ31IB1yTiPFo/97DI4BU1CCxN0dw98qnL7necEMFySqIZn8qA8Qu0VyB2uk0FTQAJWxRoZBESF4Gp6ggjVOLMWHjJITFHgmdQW4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItiFfI2XyOL/Sme9h2BoiHmfm+tsbbbdOZ72NmK9yi0=;
 b=zOcSk2ta8KZ0Td4Xh/5b/vBL8Xh0bpKCVG3dGHnlbky5j2Acvljx77ls8ZCLD0/oAIYtOrtCwFB7bCoxjf4gmA4oNfElRNRLr+UA/dzUD1/zLN1bxIt35sWPXxvLFSnVDxbxkt1qraTdr+WBXVn23nzX/M0oDAqHmv0dGZnAtnehnPKLmVuOhXJvYsovbSpQHZD4WnUGGv34tsOMoygZM0LYd9LxAGkoDzuUU1tlfRZE9q/80FRw5timk2optrgXhYZYJpvkuBZLkFf5wXwF+fzosqi6w90SFR8sfDXCVzx7p8TV+pDi2P9sONq0qmvtYJdUYdkRzVEPddu6v/Dh4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ItiFfI2XyOL/Sme9h2BoiHmfm+tsbbbdOZ72NmK9yi0=;
 b=GndXerVmZRQot5XYxFubP4Z7GnYy6c4QroNkv1UdR4fV7o3f8mhXui+QEUaP21Ekhr1GuoJngwy7WNcoYhlSg1ppW05MAHZJ06xr2eerLHTcAm2ypLKl0TLw167J0TgiCJYuu+8jIJOwbW+CsD+SNsDWZQfaMmxQEzpQW0Ptljo=
Received: from MW4PR03CA0217.namprd03.prod.outlook.com (2603:10b6:303:b9::12)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 16:51:07 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:b9:cafe::5a) by MW4PR03CA0217.outlook.office365.com
 (2603:10b6:303:b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 16:51:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 16:51:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 11:51:05 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 1 Oct 2026 11:51:04 -0500
Message-ID: <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
Date: Thu, 1 Oct 2026 11:51:04 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260924203409.2484068-1-tanmay.shah@amd.com>
 <ar04gWStZiwMUogH@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ar04gWStZiwMUogH@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 629099e1-b061-4837-ef0a-08df1fdc2fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|30052699003|11063799006|4143699003|10067099003|260925021911599003|260925022911599003|260925021311599003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jqPQ63a78ZCjvbAdJaUWElnTvAiidAWiNAatKliG5iiFO37iEZV2s3Q+kTjufVrwtjf6LdzWOcWQkI7SXrusgKxY/0ErEzRiD1IP3iBvm0i9bO0WVAvCaOcQQDSOi4zJhWH0Wu5qgk5EHw/8zlUNrbH/7YBDNBiPQbfQYb4Q607FHHSRdiC4x+WrhLX6AaXKR946i45ZY3dtdblX5IA9rZTML/mXIbcMR6ppXw6ymYvjGD0FjPP4nygwuodBGwWSV0jQ7qiRRfDa+huA+arl10pScodvRCYWQxuahSC/ttrdUwks+m8a2tgVuO9phmn90a+jekZR/fLuzIZ7FOz5wh0eprtebK+epnqxq6SOVFTEZ0mLZ0bzRqy1i8xfBlYdfUMoqfHrG3vCfIVBSdGcdtO2OrlhCdkVfq3ztJkQEkTNQniOaq5MhGiK83g0aVK8SblE7zasiYr5oYNr8yYGz1lEOma3YUG37bUJX4IZnVuaEV+cB3gGfFXCQsyoNsZpFOSIze8I5+7Pejn+Vk4w+JjlhXmZC60TaVI6AMm7aOPlrHxKqM5n9QRJFN2TfdZ2biVlRRKt+AnPLnyvspV1HPs9ESsPBHxyB7ujIIWVk7Q11oNElQAWthJCZoMIFDyPqBUYPrytS1q8E7PlAQ1NMhr1Zd477GlIbJdDko4dcttGQst/exImGz4zmyIny5ac7dt+6NSAtwpfyTMkKOhnWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(30052699003)(11063799006)(4143699003)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G5cAl+ODob6RINMvp/ReECaPMjbNB+KB7tvz8T628clIon5mGFtFYVTHWhudTD61TiznTbZp9ylpUmN+mIzAut0O3r8B8Vo4QuueaEwKpxkMMIGNFvh0bIckSuElb8um6vaMuWkAnNd4LIPnP1aOp9T1Kn4YSK0XgYFwcCtz8zUyYtgpdJopcL68wYd1tmaKqGrfcf+nOeAWkCXZnu5en1XfrWb+CdZl7viYZPMXFQOrxKOsPkMdS6PGBD7ah1z1MNCvmiMVqPd6qfqCDSpUbAy96ifStrXr4D4l2Zlh437wxtG6W7xzf3T6gKEQXZLN4+X27cU+UHk/IrJ8vo0mH+SNWIcCN+rwIOvQFqPltDpOzz7yq5fAAyODbpDpx16mJwCd99GJfLmz8m8Z2p+qy4rKoi2rkIKdW+L61SEgKWCw7mmz4knn2kD2hGEDxYSb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:51:06.3936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 629099e1-b061-4837-ef0a-08df1fdc2fcd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584



On 9/30/2026 11:27 AM, Mathieu Poirier wrote:
> Hi,
> 
> On Thu, Sep 24, 2026 at 01:34:09PM -0700, Tanmay Shah wrote:
>> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
>> separate subsystems. In this case, both cores can boot independent of
>> each other. This is platform management firmware configuration to manage
> 
> I'm not sure to understand what the above sentence adds to the changelog.  I
> suggest either reworking or removing.
> 

Ack, I will remove it.

>> cores. In such a configuration, if Linux went through an uncontrolled
>> reboot during active rpmsg communication, then during next boot it can
>> find rpmsg virtio status not in the reset state. In such case it is
>> important to reset the virtio status during attach callback and wait
>> for the remote to handle virtio device reset. After reset, the remote
>> is expected to generate the notification to the host or the host will
>> eventually timeout and continue the normal boot flow.
>>
>> Assisted-by: LLM
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> index 630621288430..6e7e2a5ea83c 100644
>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> @@ -6,6 +6,7 @@
>>  
>>  #include <linux/dma-mapping.h>
>>  #include <linux/firmware/xlnx-zynqmp.h>
>> +#include <linux/jiffies.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/mailbox/zynqmp-ipi-message.h>
>> @@ -15,6 +16,7 @@
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/remoteproc.h>
>> +#include <linux/wait.h>
>>  
>>  #include "remoteproc_internal.h"
>>  
>> @@ -33,6 +35,8 @@
>>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>>  
>> +#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
>> +
> 
> Please see if you can use a kernel defined time constant instead of minting your
> own.
> 

Ack.

>>  /*
>>   * settings for RPU cluster mode which
>>   * reflects possible values of xlnx,cluster-mode dt-property
>> @@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
>>   * @rsc_tbl_size: resource table size retrieved from remote
>>   * @pm_domain_id: RPU CPU power domain id
>>   * @ipi: pointer to mailbox information
>> + * @attach_wq: wait queue for attach-time vdev reset acknowledgment
> 
> I don't understand the explanation for @attach_wq - please rework.
> 
>> + * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
>> + * @attach_ack: remote interrupt observed while attach wait is active
>>   */
>>  struct zynqmp_r5_core {
>>  	struct xlnx_rproc_crash_report *crash_report;
>> @@ -181,6 +188,9 @@ struct zynqmp_r5_core {
>>  	u32 rsc_tbl_size;
>>  	u32 pm_domain_id;
>>  	struct mbox_info *ipi;
>> +	wait_queue_head_t attach_wq;
>> +	bool waiting_for_attach_ack;
>> +	bool attach_ack;
>>  };
>>  
>>  /**
>> @@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>  {
>>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>> +	struct zynqmp_r5_core *r5_core;
>>  	struct mbox_info *ipi;
>>  	size_t len;
>>  
>>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
>> +	r5_core = ipi->r5_core;
> 
> Is there really a chance that ipi->r5_core be NULL?
> 

Recently, INIT_WORK was moved before
mbox_request_channel_byname(mbox_cl, "rx"), In this case, if interrupt
occurs between requesting "rx" channel, and assigning r5_cores to ipi,
then r5_core can be NULL.

>> +
>> +	if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
>> +		WRITE_ONCE(r5_core->attach_ack, true);
> 
> Why use READ_ONCE/WRITE_ONCE here - what does it give you?
> 

I think this was added by AI agent, and I think it is to maintain atomic
nature of variable access. But if you prefer to protect these variables
via locks I will do that. These variables are shared between attach()
context and IPI interrupt, so I think they should be protected somehow.

>> +		wake_up(&r5_core->attach_wq);
>> +	}
> 
> If @rsc->status has been set to 0 in zynqmp_r5_attach() and an IPI is received
> before ->kick(), the core may erroneously think the remote processor is
> acknowleging the reset.
> 

Ack. Probably need to set these flags after kick(). I will do that.

>>  
>>  	/* copy data from ipi buffer to r5_core if IPI is buffered. */
>>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
>> @@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>  
>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>  {
>> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> +	struct device *dev = &rproc->dev;
>> +	bool wait_for_remote = false;
>> +	struct fw_rsc_vdev *rsc;
>> +	struct fw_rsc_hdr *hdr;
>> +	int i, offset, avail;
>> +	long time_left;
>> +
>> +	if (!rproc->table_ptr)
>> +		goto attach_success;
>> +
>> +	for (i = 0; i < rproc->table_ptr->num; i++) {
>> +		offset = rproc->table_ptr->offset[i];
>> +		hdr = (void *)rproc->table_ptr + offset;
>> +		avail = rproc->table_sz - offset - sizeof(*hdr);
>> +		rsc = (void *)hdr + sizeof(*hdr);
>> +
>> +		/* make sure table isn't truncated */
>> +		if (avail < 0) {
>> +			dev_err(dev, "rsc table is truncated\n");
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (hdr->type != RSC_VDEV)
>> +			continue;
>> +
>> +		/*
>> +		 * reset vdev status, in case previous run didn't leave it in
>> +		 * a clean state.
>> +		 */
>> +		if (rsc->status) {
>> +			rsc->status = 0;
>> +			wait_for_remote = true;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (wait_for_remote) {
>> +		WRITE_ONCE(r5_core->attach_ack, false);
>> +		WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
>> +	}
> 
> Again, I would like to understand the motivation behind using WRITE_ONCE()
> here...  I just don't see what kind of re-ordering issue you need to guard
> against.
> 

Ack. I will remove and introduce locks if that plan works.

>> +
>> +	/* kick remote to notify about attach */
>> +	rproc->ops->kick(rproc, 0);
> 
> Will older FW be able to deal with this properly?
> 
>> +
>> +	if (wait_for_remote) {
>> +		time_left = wait_event_timeout(r5_core->attach_wq,
>> +					       READ_ONCE(r5_core->attach_ack),
>> +					       usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));
> 
> The condition where the driver is removed or the remoteproc shut down needs also
> needs to be handled as a break out condition.
> 

So this whole feature will be helpful only if linux gets rebooted
without proper cleanup. If driver is removed, it will call detach() via
zynqmp_cluster_exit(). If machine goes throug 'reboot' command, then the
driver has 'shutdown' callback registered which will call 'detach()'
operation. In these cases the remoteproc reset is guranteed and the
status will be 0 on next boot.

But if linux didn't get chance to execute above callbacks, only then the
status will be left non-zero on reboot.

> Thanks,
> Mathieu
> 
>> +		WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
>> +
>> +		if (!time_left)
>> +			dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
>> +	}
>> +
>> +attach_success:
>>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>  
>>  	return 0;
>> @@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>>  	r5_core = r5_rproc->priv;
>>  	r5_core->dev = cdev;
>>  	r5_core->np = dev_of_node(cdev);
>> +	init_waitqueue_head(&r5_core->attach_wq);
>>  	if (!r5_core->np) {
>>  		dev_err(cdev, "can't get device node for r5 core\n");
>>  		ret = -EINVAL;
>>
>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
>> -- 
>> 2.43.0
>>

