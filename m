Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8053DEFFC;
	Tue, 15 Sep 2026 17:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492845; cv=fail; b=MuOBzCgKv2hcPG/39PF3JGh/L87G6hTTfkF+CgHS7+RXj3iHiPmHKwClBwAirW9PS6YbCNRQdtXPT8dypIcCsHBVISG9lT4qFP+YUr9vzoP0rBSTus31VskTs0DQaeqYCJlMSk1aiSnMFbWvj7JU8Ww3vxFYt752Vs1UR2Q54ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492845; c=relaxed/simple;
	bh=Fe9/cMGs2jiHRGaI0GLz7Bqu+7haH1ke6LQ5Nn9+07c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a3tjJ4EpQ5NwPIZHheM5+qEm+pRg2Mv0/tprE//lzsiR+foIBElrXzCH7WeQAidEd2jCSjAsbKE8WAxgq9sNi5oNY9KILjtLmQ/uwC31mLHwkRHABClZAIVDf2WPNeVz7DTSaGIEov9ffoujqMMLd6HGgKrDKAW0K2iCh11ZFuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=njr0Tfpo; arc=fail smtp.client-ip=40.107.209.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="njr0Tfpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWa0Tog+oGgwujyH92AbL7vSpBLBXG3lFjbIqtYOJjtyKuiBbOAgQBdFnTl1zmBmBJ6JG9pOwAFG6T3oTTzZtMndSovY0QtHE6gK//WPvsiPphNOXxdN+riHyDJk3mdPWcVH3QvrVq4J31PcKaJXPKd9YQcQgc+QWB5xmu+kzQt7cdjzfqelPiWPSJE0RFSGYKjSxCkNUygr+Kc7s90NphOU9dxOE1DWe30Ma4VOIkEi/nfQe7DdFN5roCieV6dIhv0Vz6hoNrjxKZxHtuNjstW37iZkfqvWYREza4kYQErK+NCGTbNfhLbWLTJ+V7ptimIiXF0BjFqyA86CSzgxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISmcLST1aOvZcmZO7jWhAuO/G+CA6sQ2OpSbYa9fR4Q=;
 b=k14OsM+0kbGfaGQK3R3bCWEgfRRS6jQWmC22qSQO7Qs1ciMN8e3WwRDL3+L7xby0hE12QQNNl/Ure3LS3dGghnK/VLKzc4AjxXV442HkyN0SSHgjPCGsLMO/6fZ8dyudEl8AJvSgqaDKbVs2QHP6SNFeuztzcJf0veyFXeMgGJfU94HPp5VqnruD+uyGCnZiY419XxfnWvVwZuIIzPaxDQhuHi7AXkfjwra2akwr/Wzd63W3K/eC187YEr6TmV7RGgVPJkVDaBpF5p6ToVA8uyWjGVAQ4XeY5r1WYfn+OOiNH53uAFiyYgLGBXsYPV4CTr5j8gUJMwkDAvnqNpgXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISmcLST1aOvZcmZO7jWhAuO/G+CA6sQ2OpSbYa9fR4Q=;
 b=njr0Tfpodk0VZFkKpqb/irDIDBnKuclHrkG06vJ3BRKEkeUHFqLkEKUBwV9hT+57VZdaHq88aHA/3mB2aGl/epyxTXxaxTJwgnOGPcRbPSJBTJfTCZcoW9IeeJZKbdPQwMROFmcQrr+gw244v4qh0/dy+d8P5i9fxn2s1wFhchc=
Received: from CH0PR03CA0097.namprd03.prod.outlook.com (2603:10b6:610:cd::12)
 by IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 17:20:38 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::79) by CH0PR03CA0097.outlook.office365.com
 (2603:10b6:610:cd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 17:20:38 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 17:20:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 12:20:35 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 12:20:35 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 12:20:35 -0500
Message-ID: <bb84213f-0168-425c-9803-24eb82415b52@amd.com>
Date: Tue, 15 Sep 2026 12:20:34 -0500
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
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s> <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
 <aqQW7eOsFE7jRTXT@p14s> <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
 <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c4fc6b-43b7-4aff-38df-08df134da80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|13003099007|6133799003|4143699003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	anUewKnqaYT6O76gmRGXKNSkVhJ10HMCO2e1wZPe+kb2pa0mnfkff6cRpM5w6E1LwcZMaXtOKffJEe6GvxFJLQUOIcBF7d0UjJ0uQsMsNKa1oXgGZ73LypejKvMz66xy4XXblp+vhP98/Znti2RUyqH2zlwnIhvliCLg3i2wTqMPKqr8YLi/6cdvI34s/67UBvG/qjBOrEYF0VNtGPP+E6G7KbEiBcnYmrjBySc+yUolOaAsCNiuFbFPRulBWLwdURoe5bK4sQynBcUfp5LUga0BIwD/BP0vXK2ge49GqOyAbTBEOE7EHQ4vHjNn3lX0z6oA/kDfkJ7H/Sb3SPujtgFVXIkiYC9XmoQO3r59xcdFC6OQAny8TuKE8uNh742OXfldJQViuanlCvE3UaYtjrkhAmYnmy+iH6jy5xOfaIMVU8RD8OYzRx+8NatX6JhjIf3plekcQ92MCTRsQXVd8Q4B/QwmnrKZEKYZn+Fsz9ktoSDg7zfh3yBl+LUUUODIzXLVBSIaz5LWhR8ZnqooHSpssuFwJ5w8+LPLxjVG+sYevuGzhKBh5rq2x7bJ6+cMeIeqgRx3fdOkNdvZpyCvwKgLI4I1w8Ax5tdLTZey4J1ZsLIC01q3H6WRJ7TcG9Y56D51lVwjVuJ9AZwpJG5UiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(4143699003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/bNGM666q3Nku1qLRnP3KwcdQFJFBNmoez3nZZhqL2TR2+Zd0ESbXU6ipMYsgCEJ5P3qNwTC5Xd61zmg38S3MUH587T9nPdZMVdprBZ04JI9Jvr+f21fdY5qIu9qWgHAASI1Z8W5oTNPMQ9Q6H/NqDJpwFsFXG51J0Al9w3XjK220VAmnOS8IWU/4G8FsQ56ehmhRuIB5C18/kf+1ln6LTavO3z+V6bW4pRlmI231z5+A9FUTRnb8BkOFX8LApzWBJEiFOHp+yroqNvZkDmvtMfsAQQ7Mkm4+6o0e8jgLjJ7c6ao7FmdA3nTA7548mFJnbrcG5amyQbDQ309jmquhgiuhMb2AGJWMi+gmrqATXuvFKu91p1Fn/xDxjX54LRmMYdOP2XQPW4O2a74gwHmkrG84zm05l2o7Gp2RfNQWaqxbxzuQrBvPNwF5r8inPSE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:20:36.2440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c4fc6b-43b7-4aff-38df-08df134da80f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424



On 9/14/2026 11:47 AM, Mathieu Poirier wrote:
> On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>>
>> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
>>> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
>>>> Hello,
>>>>
>>>> Thank you for the reviews.
>>>>
>>>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
>>>>> Good day,
>>>>>
>>>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
>>>>>> The existing remoteproc virtio reset path clears the vdev status locally
>>>>>> without notifying the remote processor. As a result, the host cannot tell
>>>>>> whether the remote side has observed the reset request or completed its
>>>>>> cleanup.
>>>>>>
>>>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
>>>>>> acknowledged reset protocol. For these resources, encode a reset request
>>>>>> in the virtio status byte, kick the remote processor using the vdev notify
>>>>>> ID, and wait for the remote side to clear the status back to 0.
>>>>>>
>>>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
>>>>>> clearing the status locally. Also reset remoteproc-created virtio
>>>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
>>>>>> in debugfs.
>>>>>>
>>>>>> Assisted-by: Codex:GPT-5
>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>> ---
>>>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>>>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>>>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>>>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>>>>>>  include/linux/rsc_table.h                |  5 ++-
>>>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>>>> index 1ed406714849..31d79684977c 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>>>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>                         int offset, int avail)
>>>>>>  {
>>>>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
>>>>>
>>>>> Spurious change.
>>>>>
>>>>
>>>> Ack will remove it.
>>>>
>>>>>>    struct fw_rsc_vdev *rsc = ptr;
>>>>>>    struct device *dev = &rproc->dev;
>>>>>>    struct rproc_vdev *rvdev;
>>>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>>>            return -EINVAL;
>>>>>>    }
>>>>>>
>>>>>> -  /* make sure reserved bytes are zeroes */
>>>>>
>>>>> Same
>>>>
>>>> Ack, will be removed.
>>>>
>>>>>
>>>>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
>>>>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>>>>>>            return -EINVAL;
>>>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>>>>>>    [RSC_DEVMEM] = rproc_handle_devmem,
>>>>>>    [RSC_TRACE] = rproc_handle_trace,
>>>>>>    [RSC_VDEV] = rproc_handle_vdev,
>>>>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
>>>>>>  };
>>>>>>
>>>>>>  struct rproc_rsc_cb_data {
>>>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> index b86c1d09c70c..1fe99749f5b4 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>>>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>>>>>>  /* Expose resource table content via debugfs */
>>>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>  {
>>>>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
>>>>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>>>>>>    struct rproc *rproc = seq->private;
>>>>>>    struct resource_table *table = rproc->table_ptr;
>>>>>>    struct fw_rsc_carveout *c;
>>>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>>                               v->reserved[0], v->reserved[1]);
>>>>>>
>>>>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
>>>>>> +                          seq_printf(seq, "  Vring %d\n", j);
>>>>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
>>>>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
>>>>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
>>>>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
>>>>>> +                                     v->vring[j].pa);
>>>>>> +                  }
>>>>>> +                  break;
>>>>>> +          case RSC_VDEV_V2:
>>>>>> +                  v = rsc;
>>>>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
>>>>>> +
>>>>>> +                  seq_printf(seq, "  ID %d\n", v->id);
>>>>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
>>>>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
>>>>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
>>>>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
>>>>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
>>>>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
>>>>>> +                  seq_printf(seq, "  Reset request pending %s\n",
>>>>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
>>>>>> +                             "yes" : "no");
>>>>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>>> +                             v->reserved[0], v->reserved[1]);
>>>>>> +
>>>>>>                    for (j = 0; j < v->num_of_vrings; j++) {
>>>>>>                            seq_printf(seq, "  Vring %d\n", j);
>>>>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>>>> index 3a742ef6ef60..f07a96ff82a4 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>>>> @@ -14,6 +14,7 @@
>>>>>>
>>>>>>  #include <linux/irqreturn.h>
>>>>>>  #include <linux/firmware.h>
>>>>>> +#include <linux/virtio_config.h>
>>>>>>  #ifdef CONFIG_HAS_IOMEM
>>>>>>  #include <linux/io.h>
>>>>>>  #endif
>>>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>>  };
>>>>>>
>>>>>> +/*
>>>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
>>>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
>>>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
>>>>>> + */
>>>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
>>>>>> +{
>>>>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
>>>>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
>>>>>> +
>>>>>> +  return status;
>>>>>> +}
>>>>>> +
>>>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
>>>>>> +{
>>>>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
>>>>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
>>>>>> +         (status & VIRTIO_CONFIG_S_FAILED);
>>>>>> +}
>>>>>> +
>>>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>>>>>>  {
>>>>>>    return test_bit(feature, rproc->features);
>>>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>>>> index d5e9ff045a28..e682caa546b2 100644
>>>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>>>> @@ -13,6 +13,7 @@
>>>>>>  #include <linux/dma-map-ops.h>
>>>>>>  #include <linux/dma-mapping.h>
>>>>>>  #include <linux/export.h>
>>>>>> +#include <linux/iopoll.h>
>>>>>>  #include <linux/of_reserved_mem.h>
>>>>>>  #include <linux/platform_device.h>
>>>>>>  #include <linux/remoteproc.h>
>>>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>>>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
>>>>>>  {
>>>>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>>>>>> +  struct rproc *rproc = rvdev->rproc;
>>>>>>    struct fw_rsc_vdev *rsc;
>>>>>> +  struct fw_rsc_hdr *hdr;
>>>>>> +  int ret;
>>>>>> +  u8 val;
>>>>>> +
>>>>>> +  /*
>>>>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
>>>>>> +   * the device, as device is already crashed. In this case, reset becomes
>>>>>> +   * no op.
>>>>>> +   */
>>>>>> +  if (rproc->state == RPROC_CRASHED)
>>>>>> +          return;
>>>>>>
>>>>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>>>>>> +  hdr = (void *)rsc - sizeof(*hdr);
>>>>>> +
>>>>>> +  if (hdr->type == RSC_VDEV_V2) {
>>>>>> +          /*
>>>>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
>>>>>> +           * status byte. The remote is expected to complete the reset
>>>>>> +           * and then clear status back to 0.
>>>>>> +           */
>>>>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
>>>>>> +
>>>>>> +          /* after setting reset request, kick the device */
>>>>>> +          rproc->ops->kick(rproc, rsc->notifyid);
>>>>>>
>>>>>> -  rsc->status = 0;
>>>>>> -  dev_dbg(&vdev->dev, "reset !\n");
>>>>>> +          /*
>>>>>> +           * When device completes reset, it is expected to set status
>>>>>> +           * to 0.
>>>>>> +           */
>>>>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
>>>>>> +                                   1000,      /* 1ms between reads */
>>>>>> +                                   3000000);  /* 3s total timeout */
>>>>>> +          if (ret)
>>>>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
>>>>>
>>>>> The problem here is that we are introducing behavior that is not compliant with
>>>>> the virtio specifications.  One way to acheive the same behavior could be for
>>>>> the remote processor to check rsc->status before sending a interrupt of using
>>>>> the virtqueues.
>>>>>
>>>>
>>>> That is what remote is supposed to do. But what if remote do not
>>>> respond? If remote is deadlocked for some reason, then the Linux will
>>>> hang at this point too. That is why we need some kind of timeout.
>>>
>>> If the remote is dead then a watchdog timer should fire at some point.
>>> Moreover, that situation won't be different from other circumstances where a
>>> remote processor locks up.
>>>
>>
>> There are few concerns:
>>
>> 1) Heterogeneous system where Linux is handling many remotes, the
>> watchdog might not be available to all the remotes or watchdog mechanism
>> is not implemented at all on the remote side.
> 
> If a watchdog is not available adding a timeout upon resetting
> rsc-status won't help.
> 
>>
>> 2) Let's say watchdog is configured for 10s, or so then for that long
>> Linux will be stuck too. I am trying to avoid this case where Linux gets
>> stuck for long time.
> 
> Same resoning as above - if the remote processor dies and a watchdog
> timeout is set for 10 seconds, adding a shorter timeout when
> rsc->status is modified will do very little.
> 
>>> Looking at your patch, sending a kick() won't do anything for a dead remote
>>> processor.  If the remote processor is alive, it should monitor rsc->status and
>>> take action when it is set to '0' by the host.  If it is locked-up, the normal
>>> lockup procedure should apply.
>>>
>>
>> Notifying virtio device on the status change is standard virtio
>> mechanism. In the virtio statck it's done via virtqueue_notify so I am
>> trying to do the same. It also helps remote to avoid polling on status.
>>
> 
> Can you point me to that code?  Having the same mental picture will help.
> 
>>> I'm not sure what problem this patch is trying to address.
>>>
>>
>> Some platforms allow Linux and Remote boot independently.
>>
>> Let's say Linux reboots without reseting the remote then during next
>> boot Linux will find virtio status is not in the reset state.
>>
> 
> That should be handled via the attach()/detach() state machine.
> 
>> In such case, linux need to issue virtio device reset, and wait until
>> RPU completes the reset and start the device again. The virtio framework
>> already issues the reset during boot here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
>>
>> However, the virtio_reset implementation for remoteproc_virtio simply
>> set the status to 0, and doesn't wait for the remote to complete the
>> reset. Due to this, attach operation becomes successfull, but the rpmsg
>> channels are not created on the linux side.
>>
> 
> I think this situation should be handled in driver code rather than
> the remoteproc framework.  We can consider adding this to the
> remoteproc framework if/when several platforms implement the same
> logic.  Otherwise I fear we'll bloat the framework with something that
> isn't generic.
> 

Hi Mathieu,

The previous patch sent in this matter was doing the same:
https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/

If you are okay, can I resend it ? I think if that is accepted then we
don't need this patch atleast for now.

Thank You,
Tanmay

>> This patch solves this issue. It changes the reset mechanism while
>> maintaining the backward compatibility for old way of reseting the device.
>>
>> I had sent a different patch regarding this before:
>> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
>>
>> Old patch was rejected because we decided to modify the reset mechanism
>> instead:
>> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
>>
>> Thank You,
>> Tanmay
>>
>>
>>>>
>>>> I think timeout mechanism is better for AMP systems over waiting forever
>>>> for remote to clear the status.
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>
>>>>>> +  } else {
>>>>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
>>>>>> +          rsc->status = 0;
>>>>>> +  }
>>>>>> +  dev_info(&vdev->dev, "reset !\n");
>>>>>>  }
>>>>>>
>>>>>>  /* provide the vdev features as retrieved from the firmware */
>>>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>>>>>  {
>>>>>>    struct virtio_device *vdev = dev_to_virtio(dev);
>>>>>>
>>>>>> +  /* reset virtio device before unregister */
>>>>>> +  virtio_reset_device(vdev);
>>>>>> +
>>>>>
>>>>> Regardless of this feature, I think it is wise to reset the device before
>>>>> unregistering with the virtio subsystem.
>>>>>
>>>>
>>>> Agreed. I intend to keep this.
>>>>
>>>>> Thanks,
>>>>> Mathieu
>>>>>
>>>>>>    unregister_virtio_device(vdev);
>>>>>>    return 0;
>>>>>>  }
>>>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
>>>>>> index 71b60125310e..2398a6d7033e 100644
>>>>>> --- a/include/linux/rsc_table.h
>>>>>> +++ b/include/linux/rsc_table.h
>>>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>>>>>>   *                    the remote processor will be writing logs.
>>>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>>>>>>   *                    virtio header.
>>>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
>>>>>> + *                    encoded in the virtio status byte.
>>>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
>>>>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
>>>>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
>>>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
>>>>>>    RSC_DEVMEM              = 1,
>>>>>>    RSC_TRACE               = 2,
>>>>>>    RSC_VDEV                = 3,
>>>>>> -  RSC_LAST                = 4,
>>>>>> +  RSC_VDEV_V2             = 4,
>>>>>> +  RSC_LAST                = 5,
>>>>>>    RSC_VENDOR_START        = 128,
>>>>>>    RSC_VENDOR_END          = 512,
>>>>>>  };
>>>>>>
>>>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>>>>>> --
>>>>>> 2.43.0
>>>>>>
>>>>
>>

