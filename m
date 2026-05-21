Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901AF366067;
	Thu, 21 May 2026 17:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779384564; cv=fail; b=E/eC3Gbreyck38H4mj/KH5/rwTcWTBm0DXGYMVTlPbyGPXEK2ZSFqadf7b7P3H3lrpC3dVXsQg1LifPeHdcQqlQwgMLKl/WPT9Nqm+OqKEd/iouPZZo76aicYH2IfpH3L7RUZ4Atogw00g5ecOHJu6AasmEwFGdOE0GsTDV/seM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779384564; c=relaxed/simple;
	bh=eY/k1ILTpjIdKQoN7C7LiYzJqjE3NY0eiKZsyoMB3QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QefQZ2z9E6fnjpy5Vqyf8HmS+rR3MpyvD6xf5zw2Usn5D8KigLLukLwJdRCeDDdPrt13JNpneM3JPg4peClSjnwAPc2nZAFUlJBpkVNRCmRZzYxTdgUzsrs4+10Y0AYgkssg9wS9V+QJYdgK+oy8isfYISE1X5gBbSBicoyjTCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o8gmcpFC; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o8gmcpFC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwCc5e7C0+VELx6yWNaPKPaWRHLdqly9+CiMbrC8T2trXV8tXaL8zEhuX6r95aCU2PwxiVmrdnGHHGi8tSShEvRKdWU5mppg9k7yhETC7W8cW0cbDpiqYn0plMwY9VetI06TFZmabFU4gc8Q8QRugqO3u1ZR/mGo1ZWK5CxiJ7o3v5s0QBED2BftOppVlv4wYxSRYrZNFCxfp/lmfDnRVsxoYyXELGgCKXkseYFbG1PgzqwN7L3p1pGNG+pLtc5x9ZT+NV+V4dImQmOiMaIgQznLXH6/fAhGow6Wnkk3IsaYfE01YmEwrp2Fz7/MZzRDWPFWiRWukU7bha8XaegYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pygAiScrp/cWk6bPJB0OWr4qX2RDavH49cOppBklo0E=;
 b=dKbfJ/LmwVdJa5i24bw3c7MG6LMrYMsFroFvfsBgpliTZ1QzdudO2vqCTDCKKn4td6asxXJjXCExBWBCbkkcsFbsWW0hR/SurreVJt8ZXxZWKvDW/3jwABuvTfSxMvZn1XQNa62z/CWUIPsWwDiqPcpsPr5zmQoxLAmMF9Cb845xTQlJ2f1ebCtd/qz4kWWbl4BzRCDjuW6CMwbKKUn/hZAbtiesdKxwpGCaN4L8iWEPO6vatQmqJXNOhagAksZbIJOjXm5wIeR2f6ZAqjj16SR5obVSpISR6bBy86yTqyYmndcteBkr3VoFxUOkDLTxAMr+IVyxYuVfgYMpRcVdkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pygAiScrp/cWk6bPJB0OWr4qX2RDavH49cOppBklo0E=;
 b=o8gmcpFCFHI9SffjbAoo9nPdMV8QuVQv6WDT02X7hHpGr3Qi7iDwlXNt6kxF/edjP8f7aF4RCH0yg68E5B+TBNSML69iXautNHsZU7hZE+N5Y0svxuwZT/ZedKp/z/j8cEpJAk679BfdwFuOJP9JbwaVxeDpxqQA3NgNnor5a1k=
Received: from CH0PR03CA0306.namprd03.prod.outlook.com (2603:10b6:610:118::35)
 by PH7PR12MB6980.namprd12.prod.outlook.com (2603:10b6:510:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 17:29:12 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::8f) by CH0PR03CA0306.outlook.office365.com
 (2603:10b6:610:118::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 17:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 17:29:11 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 12:29:10 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 12:29:09 -0500
Message-ID: <a633022f-11cc-4712-a49d-425cd688341d@amd.com>
Date: Thu, 21 May 2026 12:29:09 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <andersson@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com> <agyfr-pxwQ4oKMAF@p14s>
 <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
 <e9b697dc-52b8-482a-8d54-da3c4700f049@foss.st.com>
 <649f461a-58ff-4246-8839-e0c852be2931@amd.com>
 <CANLsYkyKxaMi1nLGrFviepqQee7W=ULDn+RZ2-h=sTpGBWZ4tg@mail.gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <CANLsYkyKxaMi1nLGrFviepqQee7W=ULDn+RZ2-h=sTpGBWZ4tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|PH7PR12MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4a790f-48fb-4603-d969-08deb75e78cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	mWzIfqkRlbSmXWIxdKbFjt+ebxF0U6oWT2Cy32JAhouaVxuHjwcgTvw8PwoU+OHA7j6PgUeBfh5xSXCuxQ+AtOkBK1PP3vwiyQS/XmXrGfC3jQJN+qytDVo+4ZJoY0u+Zx3vzcGQqdJtfL/B6FwxbFyxGsFAV/pQx91ysXDRZT4OWpS3/9hA2mqPMn+0PXz12O96YUuta0G+vkFI0/68g8xDLIJrt73vEqp4w/6Anz1hdH6n0RH16+M9UdWkkEGBQreJk0ryGCJGQCDERbJR/z+rBrOB6tVmECrtqURnQPUDfuKlb0oN9R2oVyu5pwmhLjDkevRGe3i5WUNktXWVWLHyBlzBP9xoQbd1GZ32Zqb3WHZBaw4vhtqCdxLvVUMypYlOnBW8Y7xXUDQ5TYBcxN54HA0PWnacbwCy/1PGRP00h+6tgEoTfyyPmv6nYkkzFo6Nrn3HLwcLJB58Bucs4ogM89imOMiA+v5h6GzpGWHjMtMMUdFIGQ3vZ5mTwcjpxq2dpgbT0BN020oWXtgTHCFq+cDvJldFdRCvtNEz2nHUK9O5cAo2GWYPVcv2JAHXa6T+sAzUzExPwMp1K7QBL6Mv4Zu8qQGMtBe5al6qFLyJSfQj3m1kpJA62aQUmvf5+lYqS46eD4Kxh4RGb5rla+XI+PsfvGECyUeVQON13pAPl6Cx1E5JANOIkubYf1FI
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PbQJIBuKLBHlwzBtaA5GTgVgfRYNFzLWiJmZbeIhB4PxZirifDScggRK6vu7L1oQD92cJku+PD5eN1B9boHRTld0OTe50a4Az8E1jsC2ZuudQZQCVD4zm6WzYWkPxnYoVvCqPZAqN/IUNsoarVJO0grVM+3PwB6UH1At2ln51Hcuz3HlAN6Kms3smnnbCrIDKSnARjZpUyXwsASWEcPku2F7X+XcBFVu48tqXfmRWjceEZbIdDzn6ifwkD/pM9TNk7Mu3Rt9T35rFx5JpL/YqPspOobq000WSzMPmXC+Eugd397vi7HBVyGOrWLz/a8w8hogFqKgzakFE9odm/TZHNKkLx/RFKI9hKlsbKJynfCCmudgbEv5S395MoT39Pyk28iurA6zhff3BlCd/cpbaQAyhvWTuIzxIAyNvPB+Q+CqWlNhaunyvBK7osVb9hLa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 17:29:11.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4a790f-48fb-4603-d969-08deb75e78cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6980



On 5/21/2026 11:58 AM, Mathieu Poirier wrote:
> On Thu, 21 May 2026 at 09:08, Shah, Tanmay <tanmays@amd.com> wrote:
>>
>>
>>
>> On 5/20/2026 10:43 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 5/20/26 16:55, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
>>>>>
>>>>>
>>>>> On 5/19/26 19:36, Mathieu Poirier wrote:
>>>>>> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
>>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>>> maker decide the best value from resource table.
>>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>>
>>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>>> ---
>>>>>>>
>>>>>>> Test done:
>>>>>>>     - Verify this patch works with the existing firmware
>>>>>>>     - Verify this patch works with the firmware that configures
>>>>>>>       differt tx & rx buf size
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>     - %s/sbuf_size/tx_buf_size/
>>>>>>>     - %s/rbuf_size/rx_buf_size/
>>>>>>>     - fix typo
>>>>>>>     - do not use ALIGN on buf size, rely on allocator
>>>>>>>     - make err msg more explicit, %s/vdev config:/bad vdev config/
>>>>>>>     - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>>>>>>     - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>>>>>>     - use __virtio32 over __u32
>>>>>>>     - add version field to virtio rpmsg config structure
>>>>>>>     - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>>>>>>
>>>>>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 70 +++++++++++++++++++++
>>>>>>> +--------
>>>>>>>    include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>>>>>>    2 files changed, 79 insertions(+), 18 deletions(-)
>>>>>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>>>>
>>>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>>>>> virtio_rpmsg_bus.c
>>>>>>> index e59d8cf9b975..8116d94413cc 100644
>>>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>>> @@ -20,6 +20,7 @@
>>>>>>>    #include <linux/rpmsg.h>
>>>>>>>    #include <linux/rpmsg/byteorder.h>
>>>>>>>    #include <linux/rpmsg/ns.h>
>>>>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>>>>    #include <linux/scatterlist.h>
>>>>>>>    #include <linux/slab.h>
>>>>>>>    #include <linux/sched.h>
>>>>>>> @@ -39,7 +40,8 @@
>>>>>>>     * @tx_bufs:    kernel address of tx buffers
>>>>>>>     * @num_rx_buf:    total number of buffers for rx
>>>>>>>     * @num_tx_buf:    total number of buffers for tx
>>>>>>> - * @buf_size:    size of one rx or tx buffer
>>>>>>> + * @rx_buf_size: size of one rx buffer
>>>>>>> + * @tx_buf_size: size of one tx buffer
>>>>>>>     * @last_sbuf:    index of last tx buffer used
>>>>>>>     * @bufs_dma:    dma base addr of the buffers
>>>>>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent
>>>>>>> senders.
>>>>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>>>>>        void *rx_bufs, *tx_bufs;
>>>>>>>        unsigned int num_rx_buf;
>>>>>>>        unsigned int num_tx_buf;
>>>>>>> -    unsigned int buf_size;
>>>>>>> +    unsigned int rx_buf_size;
>>>>>>> +    unsigned int tx_buf_size;
>>>>>>>        int last_sbuf;
>>>>>>>        dma_addr_t bufs_dma;
>>>>>>>        struct mutex tx_lock;
>>>>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>>>>>        wait_queue_head_t sendq;
>>>>>>>    };
>>>>>>>    -/* The feature bitmap for virtio rpmsg */
>>>>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>>>> notifications */
>>>>>>> -
>>>>>>>    /**
>>>>>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>>>>>     * @src: source address
>>>>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>>>>>>     * processor.
>>>>>>>     */
>>>>>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>>>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>>>>>      /*
>>>>>>>     * Local addresses are dynamically allocated on-demand.
>>>>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info
>>>>>>> *vrp)
>>>>>>>          /* either pick the next unused tx buffer */
>>>>>>>        if (vrp->last_sbuf < vrp->num_tx_buf)
>>>>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>>>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>>>>>>        /* or recycle a used one */
>>>>>>>        else
>>>>>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>>>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>>>>> rpmsg_device *rpdev,
>>>>>>>         * messaging), or to improve the buffer allocator, to support
>>>>>>>         * variable-length buffer sizes.
>>>>>>>         */
>>>>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>>>>>            return -EMSGSIZE;
>>>>>>>        }
>>>>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>>>>> rpmsg_endpoint *ept)
>>>>>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>>>>>        struct virtio_rpmsg_channel *vch =
>>>>>>> to_virtio_rpmsg_channel(rpdev);
>>>>>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>>>>    }
>>>>>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>>>>> device *dev,
>>>>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>>>> *vrp, struct device *dev,
>>>>>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>>>>>         * the reported payload length.
>>>>>>>         */
>>>>>>> -    if (len > vrp->buf_size ||
>>>>>>> +    if (len > vrp->rx_buf_size ||
>>>>>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>>>>> msg_len);
>>>>>>>            return -EINVAL;
>>>>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>>>> *vrp, struct device *dev,
>>>>>>>            dev_warn_ratelimited(dev, "msg received with no
>>>>>>> recipient\n");
>>>>>>>          /* publish the real size of the buffer */
>>>>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>>>>          /* add the buffer back to the remote processor's virtqueue */
>>>>>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>>>        int err = 0, i;
>>>>>>>        size_t total_buf_space;
>>>>>>>        bool notify;
>>>>>>> +    u16 version;
>>>>>>>          vrp = kzalloc_obj(*vrp);
>>>>>>>        if (!vrp)
>>>>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device
>>>>>>> *vdev)
>>>>>>>        else
>>>>>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>>>>> +    /*
>>>>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then
>>>>>>> configure buf
>>>>>>> +     * size from virtio device config space from the resource table.
>>>>>>> +     * If the feature is not supported, then assign default buf size.
>>>>>>> +     */
>>>>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>>>>>> +        /* note: virtio_rpmsg_config is defined from remote view */
>>>>>>> +        version = 0;
>>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>>> +                 version, &version);
>>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>>> +                 txbuf_size, &vrp->rx_buf_size);
>>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>>>>>> +
>>>>>>
>>>>>> A check is also needed to make sure the version received from the
>>>>>> resource table
>>>>>> is '0'.
>>>>
>>>> I think we should start with versaion = 1. So, can I check the version
>>>> number for 1 ?
>>>>
>>>>>>
>>>>>>> +        /* The buffers must hold at least the rpmsg header */
>>>>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>>>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>>>>>> +            dev_err(&vdev->dev,
>>>>>>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
>>>>>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>>>>>> +            err = -EINVAL;
>>>>>>> +            goto vqs_del;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        dev_dbg(&vdev->dev,
>>>>>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>>>>>>> 0x%x\n",
>>>>>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>>>>>>> +    } else {
>>>>>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>>>> +    }
>>>>>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>>>>> buf_size;
>>>>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>>>          /* allocate coherent memory for the buffers */
>>>>>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device
>>>>>>> *vdev)
>>>>>>>        vrp->rx_bufs = bufs_va;
>>>>>>>          /* and second part is dedicated for TX */
>>>>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>>>>>          /* set up the receive buffers */
>>>>>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>>>>            struct scatterlist sg;
>>>>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>>>>                          GFP_KERNEL);
>>>>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
>>>>>>> *dev, void *data)
>>>>>>>    static void rpmsg_remove(struct virtio_device *vdev)
>>>>>>>    {
>>>>>>>        struct virtproc_info *vrp = vdev->priv;
>>>>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>>>        int ret;
>>>>>>>          virtio_reset_device(vdev);
>>>>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>>>>>>      static unsigned int features[] = {
>>>>>>>        VIRTIO_RPMSG_F_NS,
>>>>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>>>>    };
>>>>>>>      static struct virtio_driver virtio_ipc_driver = {
>>>>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
>>>>>>> rpmsg/virtio_rpmsg.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..285918be68b9
>>>>>>> --- /dev/null
>>>>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>>>>> @@ -0,0 +1,27 @@
>>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>>> +/*
>>>>>>> + * Copyright (C) Pinecone Inc. 2019
>>>>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>>>>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>>> +
>>>>>>> +#include <linux/types.h>
>>>>>>> +#include <linux/virtio_types.h>
>>>>>>> +
>>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>>>> notifications */
>>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>>>>>>> space */
>>>>>>> +
>>>>>>> +struct virtio_rpmsg_config {
>>>>>>> +    __virtio16 version;
>>>>>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>>> +    __virtio32 txbuf_size;
>>>>>>> +    __virtio32 rxbuf_size;
>>>>>>> +    __virtio32 reserved[14]; /* Reserve for the future use */
>>>>>>
>>>>>> 66 byte for the configuratio space?  I'm puzzled about the
>>>>>> reserved[14], how did
>>>>>> you come up with that number?
>>>>
>>>> I kept the reserved bytes from the original series as it is. The
>>>> original series did not contain version field. With version I don't
>>>> think we need reserved field at all. At best, if we want to append
>>>> padding bytes, then I think __virtio16 reserved; makes sense. That will
>>>> make the structure aligned to 4 byte.
>>>>
>>>>>
>>>>> Is it useful to define the reserved field?
>>>>
>>>> I think reserved field is only useful to keep the structure size aligned
>>>> to 4 bytes.
>>>>
>>>>> The version should allow us to determine the content.
>>>>
>>>> Correct, but I think the structure can be aligned if used correct
>>>> reserved bytes.
>>>>
>>>>> An other solution is to introduce a'size' field to determine the size of
>>>>> the structure:
>>>>
>>>> I think, the resource table already contains config_len field which is
>>>> size of the structure:
>>>>
>>>> https://github.com/torvalds/linux/
>>>> blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/
>>>> remoteproc.h#L275
>>>
>>>
>>> The resource table is the solution for the remoteproc virtio backend,
>>> The solution should be able to work with some other virtio backends.
>>> In such case we can not rely on the resource table.
>>>
>>
>> For now we have only the remoteproc virtio backend. If we ever introduce
>> new backend, then can we update this structure with new 'version' num
>> and include size field at that time? Since, now there is no real use of it.
>>
>>> The resource table is a solution for the remoteproc virtio backend.
>>> However, the solution should also be able to work with other virtio
>>> backends.
>>> In that case, it may not be possible to rely on the resource table.
>>>
>>
>> Another concern is, do we need the size of the structure in the
>> first-place even to retrieve the 'size' field from the structure or
>> verify the integrity of the structure?
>>
>> For example:
>> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/drivers/remoteproc/remoteproc_virtio.c#L301
>>
>>
>> Here to verify the integrity of the resource table, we are using virtio
>> config space size.
>>
>> If we do then it's better to provide the 'size' field some other way
>> before parsing of the rpmsg config space in any virtio backend. Like in
>> the remoteproc virtio backend it's provided via the resource table.
>>
>> Let me know if I am overthinking :-) and we want the 'size' field in the
>> config space. I am just trying to make it as minimal as possible.
> 
> I think it is better to have a 'size' field in the structure.
> 

Ack. I will work on new revision as per our conversation here, and send v3.

Thanks.

>>
>> Thanks,
>> Tanmay
>>
>>> Regards,
>>> Arnaud
>>>
>>>>
>>>>> struct virtio_rpmsg_config {
>>>>>      __virtio16 version;
>>>>>      __virtio16 size; /* size of the configuration space */
>>>>>      /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>      __virtio32 txbuf_size;
>>>>>      __virtio32 rxbuf_size;
>>>>>      __u8 private[0]; /* customized config */
>>>>
>>>> Do we need customized config? I think I should remove this comment from
>>>> the original patch as well.
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>> };
>>>>>
>>>>>>
>>>>>> The rest looks good to me.
>>>>>>
>>>>>
>>>>> Looks good to me too.
>>>>>
>>>>> Thanks,
>>>>> Arnaud
>>>>>
>>>>>>> +    /* Put the customize config here */
>>>>>>> +} __packed;
>>>>>>> +
>>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>>
>>>>
>>>
>>

