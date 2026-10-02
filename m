Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCAF2D0C92;
	Fri,  2 Oct 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790962086; cv=fail; b=UaGTqwZZNJCyxhb0Op2zH8gjAciz4ACdgaWJdIb9pd031BKwtWrzFTxQvi1Qtt1XrDczvxVUfZUZXPDivKTu6RoZcyC7iZUt1jygA7B0eDwURtimtXd0pmfBQ62w1sifKqzOq+V88T6atQL7MB6IQmregOe6zkLIASLUDgRGnvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790962086; c=relaxed/simple;
	bh=DkzgXhYPXgddiCgExH8bOCwp12MxYGjKzyuC0vEseqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iyToL53pK64rLLy98+ZF2wRvmejoGKP/1nv8YRKNW436PUvOrEaLvKxReWolk2SQKiajLQDuvvm9CZh6WicyeJ4aRj01CSIe2SMgbmTLbeZyGoX4lMTGoNrN5UUtfwQ94s5sZac5EaSFme77l/+6xiR0S/daVqDcM4cpwbzE9iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FTxvz5EF; arc=fail smtp.client-ip=40.107.200.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FTxvz5EF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prsg5V7uEb/da0w958z2b54Kg7Qd/Fw5lDLAc6/WJUrvLX95fnXYiIjZBl3+Yk1r5MzTij4YQLz0TgfWd7MtskdxVWUDBbIBLeRqmizxlSVdZuWQn3zh0KBO9pntNV2HS5YSxs98XN4XHmmexa6AtGL65EfrTw5wTZaCwdWlTXkJx2k52Ynogu4kWHbZw4ia5NGtND35ihiWfx35mWMMfCYW+sc1SMAuimUYfo/cMSzUxxvWG2B7JYueo3CG7tGOtp2Lgsm+Zz5K8ZCulzz4QQ6KVid4wkkeiMR52P2hCaXxEfW7/J9vwqxfAfVUGF2SDHgcxuMVLUvigjXaUQ13xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4BGskBgSbMpP5PpDS8RV/sLSFlG7T3TeEsUhdfzdN8=;
 b=oNjXw6gjOTzEOIkzWu7WvnZN52yJBv1+SpS5gNBLculWMTYBFH9qUyp88L+xlB4akFW51QlAZo7MyXOTxMF4J0aCewIwivGuH+sqqsfV7yyFb30exay/kyVmjjzCunGnoq79C1ijNIdGa21KzSv4I6DlhXesUKXLBSH4wsySCX19uF7aYHEIwd4QovOWOXpewtSYvJY1tlUkoYC3ttIkHzm5AU3TU3lnoSdPh3bcWw6/rjF2fgD/vnpKadretdUV67R0+OCe0Gpa61mmHLKwXMETre/SutrKEFtySeYx81MlXTQMiZm8nKYosmh1tTG8fFbK7uX984DndZfsl3qBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4BGskBgSbMpP5PpDS8RV/sLSFlG7T3TeEsUhdfzdN8=;
 b=FTxvz5EFu4cXi6LfFlbpNhscmX1LC7hLvAuAxT66oMl/p9cnDoVNdsuzR0eTClwSLn1q1CIhOxomZ3aP7EDtae22i4uUNgWB8b+OlKdVOLC/pr50NUCIjkMoE50uPpXpGlCIRS7vb/3LC7SVF9g6wyNiT6XIZjJeGv+DG6lzjZ8=
Received: from PH8P221CA0062.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::14)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 17:27:57 +0000
Received: from CY8PEPF0000004F.namprd05.prod.outlook.com
 (2603:10b6:510:349:cafe::41) by PH8P221CA0062.outlook.office365.com
 (2603:10b6:510:349::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 17:27:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY8PEPF0000004F.mail.protection.outlook.com (10.167.247.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 17:27:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 2 Oct
 2026 12:27:50 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 2 Oct 2026 12:27:50 -0500
Message-ID: <b21070ee-428e-44f9-ad69-2fae9aecb47c@amd.com>
Date: Fri, 2 Oct 2026 12:27:50 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260924203409.2484068-1-tanmay.shah@amd.com>
 <ar04gWStZiwMUogH@p14s> <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
 <CANLsYkxGSgO1pY9Wcbt3mtThaN2_ULKQHFL+qfRGGQV19D7nbA@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkxGSgO1pY9Wcbt3mtThaN2_ULKQHFL+qfRGGQV19D7nbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF0000004F:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: 552775c2-66a5-4373-7264-08df20aa7f6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|30052699003|1800799024|376014|36860700016|82310400026|22082099003|18002099003|56012099006|6133799003|4143699003|11063799006|260925021311599003|260925021911599003|260925022911599003|10067099003;
X-Microsoft-Antispam-Message-Info:
	h531i5SKeIFut9uQM8JewVi2sHvECh9husoofWKUyCHtimjJiwReX5NqsHRSrOB2N/sGyql5EZSy5bApGIfOsawOIFmGE7GXw71nXCafkagbDaCIDG1LJmjOzC9OVKailOlLBTtUHnYy64/iQyYwxr5fFg+rq0Odzr8JfKfXzpfscwLqIN5yF1Gi5YXo2wMK1W1cBf3n/TlyWo7GDKGS3E4eyPu6CI5qcd3iWSPghVNGQ1WswloorQPH7pcqlDvbcs7uX5hPepbdYIs9+rmpxPAworUAehgMb0ot29O8XBUaZM0PphOb9v7Wq0xTIgudkQ8gmaEl/KJEjB5alr5VtguJMvZ1pDahuBmL0Wak4jTSEE0ulDyzVxpXslvgaHb3e51+ga2UZC5YUCtEzYIxORwz3E9nAKN3ZNn4PgHUf3g4cSPGs7UJjVPckY7BNIQSzvTxTRU3tLQDDgB7gUpu8wg0rSP1wdXJ8olsL5XfwfI9xt80Jnl1tNapv72jInQyfa/+MLF6FoOgsjNXerFmG6l1Hc7SaIh5Cl7g6nsmhNqKQ9R52EWaHfKxDDW/kACvLUCmuhHa0jQ70DwRZH8pPzOiPWr8zSurmwh8tCKyYo7shofLGdSprmGij/WNqHhhqRNHBOfc8M2oRBmibHaPVh/0D1SSVQJkMmZ+glnpBugfXpJuQ8kVdIRmTLx9lZ7n22hxzVQ4oqg4/dB1dTLLOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(30052699003)(1800799024)(376014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099006)(6133799003)(4143699003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G1B/c5g+mfr5DgrZf/msE+XsMDTKCEFaVHQGM4R9hCiyOdlIBcQvxr8pkux5MIiAG/CF+nXnO8W9qzC2GQWeGkuLbTqVedWM5GOL0KLwfO1HYf3OVCtPbgMv73JDoPJrg6NnHv41c8u16s+hKahIxsXbT9+WvgKDC5Wr799hn7vKz64CVZOpoHqcjD+HHdSWXCFK6cdJNKvIHpZm3GaCrvJ6YUy75w203LYZDiE8nkC77BYP/5lfTEXia2oXeqRPOLg2/kI8n3w+iZrVAGv/mceIgZ2EsungyvlX/d0Ppi3IYU5zZvNmzcRZi+TDYfUNoJEVsIekHoiwY6orawD2hOfC91sOpPatBXP0Zyk9pj46NKDw997AyMIPaddLYUh04t8Z4K9WkGgACXJciPovTSGie75+9ydLQjg+bsvaS15y1H6MW+rvIDAyjc+Do3Fn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 17:27:56.3502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 552775c2-66a5-4373-7264-08df20aa7f6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF0000004F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284


Hello,

Please see my reply below.

On 10/2/2026 11:34 AM, Mathieu Poirier wrote:
> On Thu, 1 Oct 2026 at 10:51, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>>
>> On 9/30/2026 11:27 AM, Mathieu Poirier wrote:
>>> Hi,
>>>
>>> On Thu, Sep 24, 2026 at 01:34:09PM -0700, Tanmay Shah wrote:
>>>> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
>>>> separate subsystems. In this case, both cores can boot independent of
>>>> each other. This is platform management firmware configuration to manage
>>>
>>> I'm not sure to understand what the above sentence adds to the changelog.  I
>>> suggest either reworking or removing.
>>>
>>
>> Ack, I will remove it.
>>
>>>> cores. In such a configuration, if Linux went through an uncontrolled
>>>> reboot during active rpmsg communication, then during next boot it can
>>>> find rpmsg virtio status not in the reset state. In such case it is
>>>> important to reset the virtio status during attach callback and wait
>>>> for the remote to handle virtio device reset. After reset, the remote
>>>> is expected to generate the notification to the host or the host will
>>>> eventually timeout and continue the normal boot flow.
>>>>
>>>> Assisted-by: LLM
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>  drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
>>>>  1 file changed, 74 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> index 630621288430..6e7e2a5ea83c 100644
>>>> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>>>> @@ -6,6 +6,7 @@
>>>>
>>>>  #include <linux/dma-mapping.h>
>>>>  #include <linux/firmware/xlnx-zynqmp.h>
>>>> +#include <linux/jiffies.h>
>>>>  #include <linux/kernel.h>
>>>>  #include <linux/mailbox_client.h>
>>>>  #include <linux/mailbox/zynqmp-ipi-message.h>
>>>> @@ -15,6 +16,7 @@
>>>>  #include <linux/of_reserved_mem.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/remoteproc.h>
>>>> +#include <linux/wait.h>
>>>>
>>>>  #include "remoteproc_internal.h"
>>>>
>>>> @@ -33,6 +35,8 @@
>>>>  #define RSC_TBL_XLNX_MAGIC  ((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>>>>                               (uint32_t)'m' << 8 | (uint32_t)'p')
>>>>
>>>> +#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
>>>> +
>>>
>>> Please see if you can use a kernel defined time constant instead of minting your
>>> own.
>>>
>>
>> Ack.
>>
>>>>  /*
>>>>   * settings for RPU cluster mode which
>>>>   * reflects possible values of xlnx,cluster-mode dt-property
>>>> @@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
>>>>   * @rsc_tbl_size: resource table size retrieved from remote
>>>>   * @pm_domain_id: RPU CPU power domain id
>>>>   * @ipi: pointer to mailbox information
>>>> + * @attach_wq: wait queue for attach-time vdev reset acknowledgment
>>>
>>> I don't understand the explanation for @attach_wq - please rework.
>>>
>>>> + * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
>>>> + * @attach_ack: remote interrupt observed while attach wait is active
>>>>   */
>>>>  struct zynqmp_r5_core {
>>>>      struct xlnx_rproc_crash_report *crash_report;
>>>> @@ -181,6 +188,9 @@ struct zynqmp_r5_core {
>>>>      u32 rsc_tbl_size;
>>>>      u32 pm_domain_id;
>>>>      struct mbox_info *ipi;
>>>> +    wait_queue_head_t attach_wq;
>>>> +    bool waiting_for_attach_ack;
>>>> +    bool attach_ack;
>>>>  };
>>>>
>>>>  /**
>>>> @@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
>>>>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>>>>  {
>>>>      struct zynqmp_ipi_message *ipi_msg, *buf_msg;
>>>> +    struct zynqmp_r5_core *r5_core;
>>>>      struct mbox_info *ipi;
>>>>      size_t len;
>>>>
>>>>      ipi = container_of(cl, struct mbox_info, mbox_cl);
>>>> +    r5_core = ipi->r5_core;
>>>
>>> Is there really a chance that ipi->r5_core be NULL?
>>>
>>
>> Recently, INIT_WORK was moved before
>> mbox_request_channel_byname(mbox_cl, "rx"), In this case, if interrupt
>> occurs between requesting "rx" channel, and assigning r5_cores to ipi,
>> then r5_core can be NULL.
>>
>>>> +
>>>> +    if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
>>>> +            WRITE_ONCE(r5_core->attach_ack, true);
>>>
>>> Why use READ_ONCE/WRITE_ONCE here - what does it give you?
>>>
>>
>> I think this was added by AI agent, and I think it is to maintain atomic
>> nature of variable access. But if you prefer to protect these variables
>> via locks I will do that. These variables are shared between attach()
>> context and IPI interrupt, so I think they should be protected somehow.
>>
> 
> READ_ONCE/WRITE_ONCE don't guard against concurrency, only against
> access reordering.
> 

Ack, I will remove it.

>>>> +            wake_up(&r5_core->attach_wq);
>>>> +    }
>>>
>>> If @rsc->status has been set to 0 in zynqmp_r5_attach() and an IPI is received
>>> before ->kick(), the core may erroneously think the remote processor is
>>> acknowleging the reset.
>>>
>>
>> Ack. Probably need to set these flags after kick(). I will do that.
>>
>>>>
>>>>      /* copy data from ipi buffer to r5_core if IPI is buffered. */
>>>>      ipi_msg = (struct zynqmp_ipi_message *)msg;
>>>> @@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>>>>
>>>>  static int zynqmp_r5_attach(struct rproc *rproc)
>>>>  {
>>>> +    struct zynqmp_r5_core *r5_core = rproc->priv;
>>>> +    struct device *dev = &rproc->dev;
>>>> +    bool wait_for_remote = false;
>>>> +    struct fw_rsc_vdev *rsc;
>>>> +    struct fw_rsc_hdr *hdr;
>>>> +    int i, offset, avail;
>>>> +    long time_left;
>>>> +
>>>> +    if (!rproc->table_ptr)
>>>> +            goto attach_success;
>>>> +
>>>> +    for (i = 0; i < rproc->table_ptr->num; i++) {
>>>> +            offset = rproc->table_ptr->offset[i];
>>>> +            hdr = (void *)rproc->table_ptr + offset;
>>>> +            avail = rproc->table_sz - offset - sizeof(*hdr);
>>>> +            rsc = (void *)hdr + sizeof(*hdr);
>>>> +
>>>> +            /* make sure table isn't truncated */
>>>> +            if (avail < 0) {
>>>> +                    dev_err(dev, "rsc table is truncated\n");
>>>> +                    return -EINVAL;
>>>> +            }
>>>> +
>>>> +            if (hdr->type != RSC_VDEV)
>>>> +                    continue;
>>>> +
>>>> +            /*
>>>> +             * reset vdev status, in case previous run didn't leave it in
>>>> +             * a clean state.
>>>> +             */
>>>> +            if (rsc->status) {
>>>> +                    rsc->status = 0;
>>>> +                    wait_for_remote = true;
>>>> +                    break;
>>>> +            }
>>>> +    }
>>>> +
>>>> +    if (wait_for_remote) {
>>>> +            WRITE_ONCE(r5_core->attach_ack, false);
>>>> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
>>>> +    }
>>>
>>> Again, I would like to understand the motivation behind using WRITE_ONCE()
>>> here...  I just don't see what kind of re-ordering issue you need to guard
>>> against.
>>>
>>
>> Ack. I will remove and introduce locks if that plan works.
>>
>>>> +
>>>> +    /* kick remote to notify about attach */
>>>> +    rproc->ops->kick(rproc, 0);
>>>
>>> Will older FW be able to deal with this properly?
>>>
> 
> This question hasn't been answered.
> 

I missed to reply.

Short answer is, the old firmware will have to be updated to support
this use case.

The old xlnx firmware isn't designed to handle this case where, the
Linux is expected to get reboot in the middle of the RPMsg
communication. It is a new use case. The current use case is limited to
reboot both cores (Cortex-A and Cortex-R) in sync i.e. if Linux sees
reboot so does the remote too. So, old firmware will never hit this use
case. Once this patch gets merged, I will modify the firmware to handle
this reset case as well.

The worst case, if someone still end-up using old firmware with new
kernel, and hit this case then, firmware will simply fail. Because the
firmware doesn't expect the Linux to reboot at all. It is always in sync
of attach() -> detach() -> re-attach() for the old firmware.

>>>> +
>>>> +    if (wait_for_remote) {
>>>> +            time_left = wait_event_timeout(r5_core->attach_wq,
>>>> +                                           READ_ONCE(r5_core->attach_ack),
>>>> +                                           usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));
>>>
>>> The condition where the driver is removed or the remoteproc shut down needs also
>>> needs to be handled as a break out condition.
>>>
>>
>> So this whole feature will be helpful only if linux gets rebooted
>> without proper cleanup. If driver is removed, it will call detach() via
>> zynqmp_cluster_exit(). If machine goes throug 'reboot' command, then the
>> driver has 'shutdown' callback registered which will call 'detach()'
>> operation. In these cases the remoteproc reset is guranteed and the
>> status will be 0 on next boot.
>>
>> But if linux didn't get chance to execute above callbacks, only then the
>> status will be left non-zero on reboot.
>>
> 
> What if you insmod the driver after an unexpected reboot and then
> rmmod the driver while waiting for the remote processor to come back
> up?
> 

I guess in this case, I will have to leave status 0, and cleanup the
waitqueue that is rproc::attach() is waiting on. Since on rmmod, we will
execute the zynqmp_r5_cluster_exit(), I will release the wq there,
before calling rproc_del().

Thanks,
Tanmay

>>> Thanks,
>>> Mathieu
>>>
>>>> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
>>>> +
>>>> +            if (!time_left)
>>>> +                    dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
>>>> +    }
>>>> +
>>>> +attach_success:
>>>>      dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>>>>
>>>>      return 0;
>>>> @@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>>>>      r5_core = r5_rproc->priv;
>>>>      r5_core->dev = cdev;
>>>>      r5_core->np = dev_of_node(cdev);
>>>> +    init_waitqueue_head(&r5_core->attach_wq);
>>>>      if (!r5_core->np) {
>>>>              dev_err(cdev, "can't get device node for r5 core\n");
>>>>              ret = -EINVAL;
>>>>
>>>> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
>>>> --
>>>> 2.43.0
>>>>
>>

