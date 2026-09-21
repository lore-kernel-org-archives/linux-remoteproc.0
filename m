Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653B03AF66F;
	Mon, 21 Sep 2026 22:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031545; cv=fail; b=SbQNyLbLRfNW341OKpckpWDvjNTcyiGBymJbNb3nnpVvOnWhIS/WnW3cvYRZwgwLMvCKlNLB/jW+Z3f6SWqPazqLZuajLmaUBAz2hINr4wmoWkA5ErIFznz7253eGWDJYT5+KSEjOxWTS4wtRpIHJC70QHqVKEeN0G5fMxOVxS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031545; c=relaxed/simple;
	bh=v6BTlLJTkyK7Nui1dO5I00Z/71FmqQZYlIOUUjEAqD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lEm/GtCgt5pm4Kv/MCZE+O0m44HPM8NB7gN4XZ+zvubjIAld3kw93IgXv8OBs16J3bIKcoF00BIOlDiLsikOMmMQSaqlQ0GI6bikXLdxEkSncLAE+qh5b8Ux28fz11cK0tbf7qRgB+lcDOgRM1YJOJTRcROX+4DMydHTJc/PAEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OQxwqR88; arc=fail smtp.client-ip=52.101.56.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OQxwqR88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfpd1cu4vJauNpRnvgtfuqR5u96VtSwczpqLOHZkJ+HIEPxahF5UZQ1SgGXYCX6rzHNZCqmxsoBjtO/WuTDDYxXBNCjbdl4s8Ph739Vq89YcI/pkmoombvocKo9YYyZb/EwdR32wByVXDtYoXaQh5Otpf5kyqQZQiSjphRulxhwumjCAHRLqpWzOAepPKJUGFvJl3c/mzn2+tGqbTgR2RUat0E4ffaL91fLHK1jp9seKRnacFV9qi6zO57irF5t/ZzsmLGv8LmARQjnNBzNR0e0i2FfdBQcR+f9QpzAjvBRCdaaG8QYu9bRZFpH8jKVWbJ3aTyBYF9ABwFBS3zMbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l98Te3BeCFmEmy0Ljj4cTqUiVI4W9Jb9DwMo6/RK6wE=;
 b=CyBeeJa370QK+jWXDbcgrZrL+ZPaWcjrGdy/eDZjVcJKH/BXY3QMfReqxtXGVx1rgzx+4E/Ul6zQTpqaOklmNgl2EqaRi5ZjWUp3laJ/ciMdqxS62RgEWh0jevzFcpiR74eb2oB+BYWYpb/T24UNkk6NVnc/644EBVaFv345kzihQTF2YysKWCCrh9jLmjqYtAsvlPFkqdXccYaBJWKKmDdtOcOvpMltmL4oWQpOCx9OMKqrhMy/WqYM2ewbGzB2XcsHdOwMppThDXzos4EKVm8U47HAXioA5ARxtOSjOJGmaMCtJHCWxmdLtZZADwFaF7m9Rv0SIL9CniqIxRBM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l98Te3BeCFmEmy0Ljj4cTqUiVI4W9Jb9DwMo6/RK6wE=;
 b=OQxwqR88uWADy62Wwy8gb6DMoj8fk8cg8rF4hHqxsa43sTe+ju/cBvOVBkxW+2PXdB/yHmQy/ijbOHI8Arz3CStrmIqXjxO9a63Us7yEnkyDH/nBUYnC/e/MJokryDxy3Pru8Cw6vfudBusCSecEKNfPnH/4EcrTRfoZCSafEME=
Received: from CH0PR04CA0099.namprd04.prod.outlook.com (2603:10b6:610:75::14)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:58:49 +0000
Received: from LV8PEPF0000005F.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::6e) by CH0PR04CA0099.outlook.office365.com
 (2603:10b6:610:75::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 22:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF0000005F.mail.protection.outlook.com (10.167.245.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 22:58:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 17:58:49 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 17:58:48 -0500
Message-ID: <85f2cfbe-2bc6-4f8d-8e52-a42b509c48d1@amd.com>
Date: Mon, 21 Sep 2026 17:58:48 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
To: Beleswar Prasad Padhi <b-padhi@ti.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s> <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
 <aqQW7eOsFE7jRTXT@p14s> <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
 <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
 <5431c713-22b8-41bc-94da-70d5a1ec6623@ti.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <5431c713-22b8-41bc-94da-70d5a1ec6623@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005F:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dec4439-3dd1-4879-da6c-08df1833e640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|13003099007|18002099003|4143699003|10067099003|3023799007|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	09DyrYaNXotxiqA/QHj+eu0xoCOQEOKFjsGSDO0dCfZ/AhvClKOXvzAJkz7wg70CWsstJcptSZiye2awznucaGZst+VEurMbk5fp81NVq9Et8Q25iaO1lwSvnY4X/EpXJL+a2u1+lU9F6Hduy3vPReIb/+DaK2h7gBRC6fwVEYirllmr5ooX7H+3xrmsNuWkpFpOks5p5CXh21RZVkQxJcG4PzJ+vv4qXOxKJKowaj2AlEgBMjN+CQz4GB/yqBuBcQpjW2iH+DSeyBvoHvr761QriyDSjyBdBYik2rKqTsJE1SVqxgqDDfXJKtNRkMK7empnsI1bSkiV+CtBGraItcCmv9es830SpyncWG9Pi9pjSIG0h+ImGNxJ5ym+Ou1pvEw4cffURjD9WNCcA8chPp97vgBD4xgysb1wd2dc36y07wMhF6SMVj/FHhe7uFG6iNavapMQ4bN7dBclssSXH+OYsAdGcPMwxeFBZL8eS2LI44GYL/eWprYi5S1KUfaDRRlnij+JGV5l6ShYitkKeaMprRImw/VQ+pImzGGzIcHVkvhCO8gdwUiAiphuDlLNAzNKfg97zATH2eq2Rt5JdFjJkU4kAS/SiyCn5Fu7wZEfML4RApQaynM1yVYrZrWUeXnDMJ3vvSYvcPN7U9YJrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(13003099007)(18002099003)(4143699003)(10067099003)(3023799007)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GKcgHGSoui7Cuof38AzoeygkZkZ1iuqC5FWaWu1iLVeHGQPg9ZhyiC3rAZqXbTjcmphYEz8aIfYDqWn+9m0daTWTVvpTeTMV+YMBz3Cf2xsASBZTtAjEUwEvjWaqpqC9w8jXMGWRSPKRi0aVqxRPlV/9pg0FRTMzaoO3EmlreDoGG2kkZDgzdj9O7IdXiNuQ2apKSH6N+0fD0lApbelYGIKfbK4SDI64l+5u7ZAL13Gb3N40L9LBQX70aYWYrsPB6jaqtrazTm3BG/LIt9RjEbTEk9OT8EowFvjfSbtCh/lZpOuSt5TZq5rMMr4WKjdbx+xt7AP2hcS7d3wJrkgctgzb89nGb3PBx7LGBazDhQeOndxCGQsqVGCQd1JtWbP8X/MC3+XZfpZSfvVoL0hjk604jjrsijn73HtyZL8j13e+ZHetBnEMsbJtrLkt94ui
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:58:49.4886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dec4439-3dd1-4879-da6c-08df1833e640
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857



On 9/17/2026 7:19 AM, Beleswar Prasad Padhi wrote:
> Hello!
> 
> On 14/09/26 22:17, Mathieu Poirier wrote:
>> On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
>>>
>>>
>>> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
>>>> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
>>>>> Hello,
>>>>>
>>>>> Thank you for the reviews.
>>>>>
>>>>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
>>>>>> Good day,
>>>>>>
>>>>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
>>>>>>> The existing remoteproc virtio reset path clears the vdev status locally
>>>>>>> without notifying the remote processor. As a result, the host cannot tell
>>>>>>> whether the remote side has observed the reset request or completed its
>>>>>>> cleanup.
>>>>>>>
>>>>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
>>>>>>> acknowledged reset protocol. For these resources, encode a reset request
>>>>>>> in the virtio status byte, kick the remote processor using the vdev notify
>>>>>>> ID, and wait for the remote side to clear the status back to 0.
>>>>>>>
>>>>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
>>>>>>> clearing the status locally. Also reset remoteproc-created virtio
>>>>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
>>>>>>> in debugfs.
>>>>>>>
>>>>>>> Assisted-by: Codex:GPT-5
>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>> ---
>>>>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>>>>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>>>>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>>>>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>>>>>>>  include/linux/rsc_table.h                |  5 ++-
>>>>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>>>> index 1ed406714849..31d79684977c 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>>>>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>>                         int offset, int avail)
>>>>>>>  {
>>>>>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
>>>>>> Spurious change.
>>>>>>
>>>>> Ack will remove it.
>>>>>
>>>>>>>    struct fw_rsc_vdev *rsc = ptr;
>>>>>>>    struct device *dev = &rproc->dev;
>>>>>>>    struct rproc_vdev *rvdev;
>>>>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>>            return -EINVAL;
>>>>>>>    }
>>>>>>>
>>>>>>> -  /* make sure reserved bytes are zeroes */
>>>>>> Same
>>>>> Ack, will be removed.
>>>>>
>>>>>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
>>>>>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>>>>>>>            return -EINVAL;
>>>>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>>>>>>>    [RSC_DEVMEM] = rproc_handle_devmem,
>>>>>>>    [RSC_TRACE] = rproc_handle_trace,
>>>>>>>    [RSC_VDEV] = rproc_handle_vdev,
>>>>>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
>>>>>>>  };
>>>>>>>
>>>>>>>  struct rproc_rsc_cb_data {
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>>> index b86c1d09c70c..1fe99749f5b4 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>>>>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>>>>>>>  /* Expose resource table content via debugfs */
>>>>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>>  {
>>>>>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
>>>>>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>>>>>>>    struct rproc *rproc = seq->private;
>>>>>>>    struct resource_table *table = rproc->table_ptr;
>>>>>>>    struct fw_rsc_carveout *c;
>>>>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>>>                               v->reserved[0], v->reserved[1]);
>>>>>>>
>>>>>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
>>>>>>> +                          seq_printf(seq, "  Vring %d\n", j);
>>>>>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
>>>>>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
>>>>>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
>>>>>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
>>>>>>> +                                     v->vring[j].pa);
>>>>>>> +                  }
>>>>>>> +                  break;
>>>>>>> +          case RSC_VDEV_V2:
>>>>>>> +                  v = rsc;
>>>>>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
>>>>>>> +
>>>>>>> +                  seq_printf(seq, "  ID %d\n", v->id);
>>>>>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
>>>>>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
>>>>>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
>>>>>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
>>>>>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
>>>>>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
>>>>>>> +                  seq_printf(seq, "  Reset request pending %s\n",
>>>>>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
>>>>>>> +                             "yes" : "no");
>>>>>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>>> +                             v->reserved[0], v->reserved[1]);
>>>>>>> +
>>>>>>>                    for (j = 0; j < v->num_of_vrings; j++) {
>>>>>>>                            seq_printf(seq, "  Vring %d\n", j);
>>>>>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>>>>> index 3a742ef6ef60..f07a96ff82a4 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>>>>> @@ -14,6 +14,7 @@
>>>>>>>
>>>>>>>  #include <linux/irqreturn.h>
>>>>>>>  #include <linux/firmware.h>
>>>>>>> +#include <linux/virtio_config.h>
>>>>>>>  #ifdef CONFIG_HAS_IOMEM
>>>>>>>  #include <linux/io.h>
>>>>>>>  #endif
>>>>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>>>  };
>>>>>>>
>>>>>>> +/*
>>>>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
>>>>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
>>>>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
>>>>>>> + */
>>>>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
>>>>>>> +{
>>>>>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
>>>>>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
>>>>>>> +
>>>>>>> +  return status;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
>>>>>>> +{
>>>>>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
>>>>>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
>>>>>>> +         (status & VIRTIO_CONFIG_S_FAILED);
>>>>>>> +}
>>>>>>> +
>>>>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>>>>>>>  {
>>>>>>>    return test_bit(feature, rproc->features);
>>>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> index d5e9ff045a28..e682caa546b2 100644
>>>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>  #include <linux/dma-map-ops.h>
>>>>>>>  #include <linux/dma-mapping.h>
>>>>>>>  #include <linux/export.h>
>>>>>>> +#include <linux/iopoll.h>
>>>>>>>  #include <linux/of_reserved_mem.h>
>>>>>>>  #include <linux/platform_device.h>
>>>>>>>  #include <linux/remoteproc.h>
>>>>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>>>>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
>>>>>>>  {
>>>>>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>>>>>>> +  struct rproc *rproc = rvdev->rproc;
>>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>>> +  struct fw_rsc_hdr *hdr;
>>>>>>> +  int ret;
>>>>>>> +  u8 val;
>>>>>>> +
>>>>>>> +  /*
>>>>>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
>>>>>>> +   * the device, as device is already crashed. In this case, reset becomes
>>>>>>> +   * no op.
>>>>>>> +   */
>>>>>>> +  if (rproc->state == RPROC_CRASHED)
>>>>>>> +          return;
>>>>>>>
>>>>>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>>>>>>> +  hdr = (void *)rsc - sizeof(*hdr);
>>>>>>> +
>>>>>>> +  if (hdr->type == RSC_VDEV_V2) {
>>>>>>> +          /*
>>>>>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
>>>>>>> +           * status byte. The remote is expected to complete the reset
>>>>>>> +           * and then clear status back to 0.
>>>>>>> +           */
>>>>>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
>>>>>>> +
>>>>>>> +          /* after setting reset request, kick the device */
>>>>>>> +          rproc->ops->kick(rproc, rsc->notifyid);
>>>>>>>
>>>>>>> -  rsc->status = 0;
>>>>>>> -  dev_dbg(&vdev->dev, "reset !\n");
>>>>>>> +          /*
>>>>>>> +           * When device completes reset, it is expected to set status
>>>>>>> +           * to 0.
>>>>>>> +           */
>>>>>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
>>>>>>> +                                   1000,      /* 1ms between reads */
>>>>>>> +                                   3000000);  /* 3s total timeout */
>>>>>>> +          if (ret)
>>>>>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
>>>>>> The problem here is that we are introducing behavior that is not compliant with
>>>>>> the virtio specifications.  One way to acheive the same behavior could be for
>>>>>> the remote processor to check rsc->status before sending a interrupt of using
>>>>>> the virtqueues.
>>>>>>
>>>>> That is what remote is supposed to do. But what if remote do not
>>>>> respond? If remote is deadlocked for some reason, then the Linux will
>>>>> hang at this point too. That is why we need some kind of timeout.
>>>> If the remote is dead then a watchdog timer should fire at some point.
>>>> Moreover, that situation won't be different from other circumstances where a
>>>> remote processor locks up.
>>>>
>>> There are few concerns:
>>>
>>> 1) Heterogeneous system where Linux is handling many remotes, the
>>> watchdog might not be available to all the remotes or watchdog mechanism
>>> is not implemented at all on the remote side.
>> If a watchdog is not available adding a timeout upon resetting
>> rsc-status won't help.
>>
>>> 2) Let's say watchdog is configured for 10s, or so then for that long
>>> Linux will be stuck too. I am trying to avoid this case where Linux gets
>>> stuck for long time.
>> Same resoning as above - if the remote processor dies and a watchdog
>> timeout is set for 10 seconds, adding a shorter timeout when
>> rsc->status is modified will do very little.
>>
>>>> Looking at your patch, sending a kick() won't do anything for a dead remote
>>>> processor.  If the remote processor is alive, it should monitor rsc->status and
>>>> take action when it is set to '0' by the host.  If it is locked-up, the normal
>>>> lockup procedure should apply.
>>>>
>>> Notifying virtio device on the status change is standard virtio
>>> mechanism. In the virtio statck it's done via virtqueue_notify
> 
> 
> I don't think virtio stack issues a notify on any status change[0][1],
> it's the virtio_rpmsg_bus that notifies[2] while starting up the
> remoteproc.
> 
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n573
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n280
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/rpmsg/virtio_rpmsg_bus.c?h=for-next#n1000
> 
>>>  so I am
>>> trying to do the same. 
> 
> 
> I see the point in trying to keep operations symmetric (on start and
> stop), but I have to ask: Why just virtio? Shouldn't all the layers
> notify of their respective teardown? (rpmsg channels, remoteproc
> platform teardown?)
> 
>>> It also helps remote to avoid polling on status.
>>>
>> Can you point me to that code?  Having the same mental picture will help.
>>
>>>> I'm not sure what problem this patch is trying to address.
>>>>
>>> Some platforms allow Linux and Remote boot independently.
>>>
>>> Let's say Linux reboots without reseting the remote then during next
>>> boot Linux will find virtio status is not in the reset state.
>>>
>> That should be handled via the attach()/detach() state machine.
>>
>>> In such case, linux need to issue virtio device reset, and wait until
>>> RPU completes the reset and start the device again. The virtio framework
>>> already issues the reset during boot here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
>>>
>>> However, the virtio_reset implementation for remoteproc_virtio simply
>>> set the status to 0, and doesn't wait for the remote to complete the
>>> reset. Due to this, attach operation becomes successfull, but the rpmsg
>>> channels are not created on the linux side.
>>>
>> I think this situation should be handled in driver code rather than
>> the remoteproc framework.
> 
> 
> I agree.
> 

HI Beleswar,

Thanks for the reviews.

I will implement the solution within the attach() callback of the driver
as discussed in the other patch.

>>   We can consider adding this to the
>> remoteproc framework if/when several platforms implement the same
>> logic.  Otherwise I fear we'll bloat the framework with something that
>> isn't generic.
> 
> 
> If and when we come back to this, I'd maybe try to make this
> teardown notification uniform across the layers and fix the
> existing implementation than introducing a new resource type.
> 

For now I will not address this as this is out of scope for me.

Thanks,
Tanmay

> Thanks,
> Beleswar
> 
>>
>>> This patch solves this issue. It changes the reset mechanism while
>>> maintaining the backward compatibility for old way of reseting the device.
>>>
>>> I had sent a different patch regarding this before:
>>> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
>>>
>>> Old patch was rejected because we decided to modify the reset mechanism
>>> instead:
>>> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
>>>
>>> Thank You,
>>> Tanmay
>>>
>>>
>>>>> I think timeout mechanism is better for AMP systems over waiting forever
>>>>> for remote to clear the status.
>>>>>
>>>>> Thanks,
>>>>> Tanmay
>>>>>
>>>>>
>>>>>>> +  } else {
>>>>>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
>>>>>>> +          rsc->status = 0;
>>>>>>> +  }
>>>>>>> +  dev_info(&vdev->dev, "reset !\n");
>>>>>>>  }
>>>>>>>
>>>>>>>  /* provide the vdev features as retrieved from the firmware */
>>>>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>>>>>>  {
>>>>>>>    struct virtio_device *vdev = dev_to_virtio(dev);
>>>>>>>
>>>>>>> +  /* reset virtio device before unregister */
>>>>>>> +  virtio_reset_device(vdev);
>>>>>>> +
>>>>>> Regardless of this feature, I think it is wise to reset the device before
>>>>>> unregistering with the virtio subsystem.
>>>>>>
>>>>> Agreed. I intend to keep this.
>>>>>
>>>>>> Thanks,
>>>>>> Mathieu
>>>>>>
>>>>>>>    unregister_virtio_device(vdev);
>>>>>>>    return 0;
>>>>>>>  }
>>>>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
>>>>>>> index 71b60125310e..2398a6d7033e 100644
>>>>>>> --- a/include/linux/rsc_table.h
>>>>>>> +++ b/include/linux/rsc_table.h
>>>>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>>>>>>>   *                    the remote processor will be writing logs.
>>>>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>>>>>>>   *                    virtio header.
>>>>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
>>>>>>> + *                    encoded in the virtio status byte.
>>>>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
>>>>>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
>>>>>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
>>>>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
>>>>>>>    RSC_DEVMEM              = 1,
>>>>>>>    RSC_TRACE               = 2,
>>>>>>>    RSC_VDEV                = 3,
>>>>>>> -  RSC_LAST                = 4,
>>>>>>> +  RSC_VDEV_V2             = 4,
>>>>>>> +  RSC_LAST                = 5,
>>>>>>>    RSC_VENDOR_START        = 128,
>>>>>>>    RSC_VENDOR_END          = 512,
>>>>>>>  };
>>>>>>>
>>>>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>>>>>>> --
>>>>>>> 2.43.0
>>>>>>>

