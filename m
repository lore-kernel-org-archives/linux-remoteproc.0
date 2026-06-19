Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013024.outbound.protection.outlook.com [40.93.201.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590D41F30BB;
	Fri, 19 Jun 2026 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883090; cv=fail; b=p+oPgsOk36kk5e0R6/FflGQGFQO22YP54AQXr7EUn9OxD0tXdJgkQDwNKLRLzKuHeTGfOnCQgl1kPAVnx5FzLTzAQ7pK2Pzr5xdX7MHrgGQP85ifgjBf+VDHpkNTBgXvEpAUMbiDzEI7hv0+5PpfPmTtfLXcCQ0KtMnKbZ1ZhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883090; c=relaxed/simple;
	bh=OjpajxLJ/sTGlao12sJ2zsK+hcznohEfcLmXjrqud3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=B9zGBkfpbwBFRWqauPTV3WhCnMG/H/VqRkZ7MfmsPJD+e2CLLE1e7ojkW7xcVAAEVgnXgXW2YqX+689hINFXDu3JC7AaYsvrGJ7X12cLQWkVISXexOtgW1XIajd68/6RkP9dXA+yxK8xQ5eGHJauKHe+QIsITCEYezZECO5RPAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oL38k/Er; arc=fail smtp.client-ip=40.93.201.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oL38k/Er"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyhC2P5KAPIVnnAizZ5xWySeSTyfRs2fYxGAk+bza80HFlSzraNW27IFvEbiHUHtroBhu4EUTsmHP0tsNE7iBoJt7EUn033YFpeB2DRpeJ9LWnvtm3GzFeddvHEYLOVUiAkVdhx29XT1vPPZUTy30mb7VEt5WuPf6j0+pfSWJ39gnYVH0Per+yeHaK9LeLj0zGdi6ROMLarm++1mV4PRzN5mo3+NXXjKeUM1qXoeef7gfjXdb91njASJj+Z+3HCAWn1zi3fc+bOUSAkwyNTJ+IJG+JUL/4ivMdtONxLLsJ843hYmDcgEYn7VIE3+2TIk9CLORpwhwzlT7Hm2IFPaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlWo/Z2rZl85/xZIc83A8Wu1W9ubO1MVPQCPbcpZmxQ=;
 b=QJ1To+r5bJu8OBes22TALnYWSiUTWAXfWwwqFO8HuSTANH/pWuAjGqjlGcaAQXwdUhpXopO57L0aQ18A2NAMs544Fgt6vaxv8Q2SZ1eQp+FMEDflz1xhZdZYlelcJ2+K0JAXUkCh0O49jIrFxjgkA87GbgUE/5+MvTfrHhF/O0Lh7SvzYOG11LLjl45x33A7TkQYWIw7rHudi4N77Vq3K3RwOYn/74Wc5aiPetpFQ3kbnkZ2qBcMIo7H83IFwEUuenajSl8nhJnEshUanHdxryLd6lU0A6d6XxutBWBgneyb20yn26nnWqxUPbtOBQM9aCR4rfGi4PxiV4RQPY5r5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlWo/Z2rZl85/xZIc83A8Wu1W9ubO1MVPQCPbcpZmxQ=;
 b=oL38k/Er/n37YAoIrXbrsYFuqXckX/lAmW7VSfvpE0kg002by3mLTDzGNmizlRg+abm63+JlnV8T66u13/0bet3vZw0luxUY/WUgsPcNtdrlz0AsnRkAblf8ItLl0cPJuZ7iK9V+Qzlm+IkPSsUqsWywfr5Z+hGjjP00wFsR1SU=
Received: from PH7P220CA0089.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::14)
 by CYYPR12MB8938.namprd12.prod.outlook.com (2603:10b6:930:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 15:31:21 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::5f) by PH7P220CA0089.outlook.office365.com
 (2603:10b6:510:32c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Fri,
 19 Jun 2026 15:31:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Fri, 19 Jun 2026 15:31:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 10:31:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 19 Jun
 2026 10:31:18 -0500
Received: from [172.31.134.241] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 19 Jun 2026 10:31:18 -0500
Message-ID: <90e0d23e-8aac-409d-97ff-d85b505f16f1@amd.com>
Date: Fri, 19 Jun 2026 10:31:12 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v4 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <tanmay.shah@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
 <20260615202007.3484668-4-tanmay.shah@amd.com>
 <5fba8065-c0e9-4514-863b-8c7c91fb79de@foss.st.com>
 <6b02c52d-5043-4bb8-b249-fa53e5bf53f6@amd.com>
 <a32b579f-232c-452e-abef-585a97b32839@foss.st.com>
 <1251e3e1-80fe-4146-a1f8-5eb251a323be@amd.com>
 <1c39fbbc-83d9-4ad2-bf79-fc2f64fe6e44@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <1c39fbbc-83d9-4ad2-bf79-fc2f64fe6e44@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CYYPR12MB8938:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bfec35a-d846-43ff-7231-08dece17d08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|5023799004|11063799006|6133799003|22082099003|3023799007|56012099006|18002099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	fJJoMZv7F9olPKKrosZuz2guDej3wfhI4aIg4Ecs0RaXdDab8OFlqOuC+ZZzh/n92RyavbdtnIRqJ9UNeLTwzi1hfHE0S+XapHZxL1KHOz0sGTkRGxjKnJDgKWNlHyqlf1LiqP7Rqn0Ar2jVfYq+yUe6qxIkctXHSUOdS3BrslF0fHNhNQITxoEULJXzGodmS4mx43TQ+rPmtT9DOuXAXxaM2g9aH0MZEYJLBBbEQUbxO+koPAZOIq4A3jTYI999OK2Y2qFkULZJh27AzgS65iF1+4eovSI8p5FGc8Bsl/FDxqdb3B6KsViotJjl16/96JmZGdT/GUX2l0tG9K9NZGOjAgBJKn1WcUI/PrNhXNIo1iHTJ7sYljunveskbY+j5xVhDhILFzt1zXdnM1a2NG2/F8lwcir9LQXv7CS9KOAjEwSf6NDcbgSOB4T2lgTA6Hy+cF58+KQXnT1zNqUzfKQ877ZOBoFYb0bumamsInbKa3yZ/PBHh8i1YbVZYdKu0qCXPjGtJaHIXDw/6hWx/aZGb28ZC/UxvrccpDDrrZBVS3KYNkpg0VHsxkI0c5Nm8cesRDBSt8F5T0PlOLPbfdBIEE8lJJz2/PXL30v4OCP4nb1hoM/fHoRjKEieja3EFrQcbZekGf+VDqrXmlflZmU9Wx3Nh/wtFDBlYQuv/qrR8/xon9FAmmxv+KdrqNJVkT9SSyxCmRW6/q7bJ5Do+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(5023799004)(11063799006)(6133799003)(22082099003)(3023799007)(56012099006)(18002099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9PuggFz/25jia7/subAvZqygRiRNmwAcjuDsX7t/4Cjb6qSDvc16tjUVE/0AM0Di6dsOfHjCRi64cC9z1151SwFiVcVDvtcVG1P10nKDRfcgMKQgu5+EKDTawXQYqY4pDUZcuFdaS3K29aPtEbgA0HB9QJ+NlH+zSdamwSo1TQRTzMpvNTmmDLaG5IjaHyVlThNDxUYNa59PJsA1wMw2Jo+4alTUpcpSCeKK3y8Mp90KXexld4Jl0DauPKpPbOZik8wmHRNHm/Ftks77PpJ4f5fpkQNn4sBEFp4L74jiCMGCw+jOgSq5s51q+ORGNQyF2ukmKb2uthYuoXZvmGiJcGCwHftlXyBUsLmZRYgVkI/ouBKmjgeLbB1rwbj6iaqmQIP+zxLiE6l+A+XAv5RlkdaoIh0ZpC4GcY7JrfJTH8CG9NXsRixbkyOmi7x+QNk+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 15:31:21.1085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfec35a-d846-43ff-7231-08dece17d08a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8938



On 6/19/2026 2:45 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 6/18/26 18:31, Shah, Tanmay wrote:
>>
>>
>> On 6/18/2026 3:32 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 6/17/26 19:41, Shah, Tanmay wrote:
>>>>
>>>>
>>>> On 6/17/2026 4:15 AM, Arnaud POULIQUEN wrote:
>>>>> Hi Tanmay,
>>>>>
>>>>> On 6/15/26 22:20, Tanmay Shah wrote:
>>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>>> maker decide the best value from resource table.
>>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>>
>>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v4: squash to virtio rpmsg config patch
>>>>>>      - Introduce new patch to modify rpmsg.rst documentation
>>>>>>      - check version is always 1.
>>>>>>      - check size field is same as size of struct virtio_rpmsg_config
>>>>>>      - introduce alignment field
>>>>>>      - check alignment field is power of 2
>>>>>>      - check tx and rx buf size is aligned with alignment passed
>>>>>> in the
>>>>>>        structure
>>>>>>
>>>>>> Changes in v3:
>>>>>>      - change version field from u16 to u8
>>>>>>      - introduce size field in the rpmsg_virtio_config structure
>>>>>>      - check version field is set to any non-zero value.
>>>>>>      - check size field is not 0.
>>>>>>      - Remove field for private config, as not needed for now.
>>>>>>      - add documentation of rpmsg_virtio_config structure
>>>>>>
>>>>>>     drivers/rpmsg/virtio_rpmsg_bus.c   | 129 +++++++++++++++++++++++
>>>>>> +-----
>>>>>>     include/linux/rpmsg/virtio_rpmsg.h |  50 +++++++++++
>>>>>>     2 files changed, 160 insertions(+), 19 deletions(-)
>>>>>>     create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>>>
>>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>>>> virtio_rpmsg_bus.c
>>>>>> index 99df1ae07055..a59925f870a4 100644
>>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>>> @@ -15,11 +15,13 @@
>>>>>>     #include <linux/idr.h>
>>>>>>     #include <linux/jiffies.h>
>>>>>>     #include <linux/kernel.h>
>>>>>> +#include <linux/log2.h>
>>>>>>     #include <linux/module.h>
>>>>>>     #include <linux/mutex.h>
>>>>>>     #include <linux/rpmsg.h>
>>>>>>     #include <linux/rpmsg/byteorder.h>
>>>>>>     #include <linux/rpmsg/ns.h>
>>>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>>>     #include <linux/scatterlist.h>
>>>>>>     #include <linux/slab.h>
>>>>>>     #include <linux/sched.h>
>>>>>> @@ -39,7 +41,8 @@
>>>>>>      * @tx_bufs:    kernel address of tx buffers
>>>>>>      * @num_rx_buf: total number of rx buffers
>>>>>>      * @num_tx_buf: total number of tx buffers
>>>>>> - * @buf_size:   size of one rx or tx buffer
>>>>>> + * @rx_buf_size: size of one rx buffer
>>>>>> + * @tx_buf_size: size of one tx buffer
>>>>>>      * @last_tx_buf: index of last tx buffer used
>>>>>>      * @bufs_dma:    dma base addr of the buffers
>>>>>>      * @tx_lock:    protects svq and tx_bufs, to allow concurrent
>>>>>> senders.
>>>>>> @@ -59,7 +62,8 @@ struct virtproc_info {
>>>>>>         void *rx_bufs, *tx_bufs;
>>>>>>         unsigned int num_rx_buf;
>>>>>>         unsigned int num_tx_buf;
>>>>>> -    unsigned int buf_size;
>>>>>> +    unsigned int rx_buf_size;
>>>>>> +    unsigned int tx_buf_size;
>>>>>>         int last_tx_buf;
>>>>>>         dma_addr_t bufs_dma;
>>>>>>         struct mutex tx_lock;
>>>>>> @@ -68,9 +72,6 @@ struct virtproc_info {
>>>>>>         wait_queue_head_t sendq;
>>>>>>     };
>>>>>>     -/* The feature bitmap for virtio rpmsg */
>>>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>>> notifications */
>>>>>> -
>>>>>>     /**
>>>>>>      * struct rpmsg_hdr - common header for all rpmsg messages
>>>>>>      * @src: source address
>>>>>> @@ -128,7 +129,7 @@ struct virtio_rpmsg_channel {
>>>>>>      * processor.
>>>>>>      */
>>>>>>     #define MAX_RPMSG_NUM_BUFS    (256)
>>>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>>>>       /*
>>>>>>      * Local addresses are dynamically allocated on-demand.
>>>>>> @@ -444,7 +445,7 @@ static void *get_a_tx_buf(struct virtproc_info
>>>>>> *vrp)
>>>>>>           /* either pick the next unused tx buffer */
>>>>>>         if (vrp->last_tx_buf < vrp->num_tx_buf)
>>>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>>>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>>>>>         /* or recycle a used one */
>>>>>>         else
>>>>>>             ret = virtqueue_get_buf(vrp->svq, &len);
>>>>>> @@ -514,7 +515,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>>>> rpmsg_device *rpdev,
>>>>>>          * messaging), or to improve the buffer allocator, to support
>>>>>>          * variable-length buffer sizes.
>>>>>>          */
>>>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>>             dev_err(dev, "message is too big (%d)\n", len);
>>>>>>             return -EMSGSIZE;
>>>>>>         }
>>>>>> @@ -647,7 +648,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>>>> rpmsg_endpoint *ept)
>>>>>>         struct rpmsg_device *rpdev = ept->rpdev;
>>>>>>         struct virtio_rpmsg_channel *vch =
>>>>>> to_virtio_rpmsg_channel(rpdev);
>>>>>>     -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>>>     }
>>>>>>       static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>>>> device *dev,
>>>>>> @@ -673,7 +674,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>>> *vrp, struct device *dev,
>>>>>>          * We currently use fixed-sized buffers, so trivially
>>>>>> sanitize
>>>>>>          * the reported payload length.
>>>>>>          */
>>>>>> -    if (len > vrp->buf_size ||
>>>>>> +    if (len > vrp->rx_buf_size ||
>>>>>>             msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>>>             dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>>>> msg_len);
>>>>>>             return -EINVAL;
>>>>>> @@ -706,7 +707,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>>> *vrp, struct device *dev,
>>>>>>             dev_warn_ratelimited(dev, "msg received with no
>>>>>> recipient\n");
>>>>>>           /* publish the real size of the buffer */
>>>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>>>           /* add the buffer back to the remote processor's
>>>>>> virtqueue */
>>>>>>         err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>>>> @@ -820,10 +821,13 @@ static int rpmsg_probe(struct virtio_device
>>>>>> *vdev)
>>>>>>         struct virtproc_info *vrp;
>>>>>>         struct virtio_rpmsg_channel *vch = NULL;
>>>>>>         struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
>>>>>> +    u16 rpmsg_buf_align = 0;
>>>>>>         void *bufs_va;
>>>>>>         int err = 0, i;
>>>>>>         size_t total_buf_space;
>>>>>>         bool notify;
>>>>>> +    u8 version;
>>>>>> +    u16 size;
>>>>>>           vrp = kzalloc_obj(*vrp);
>>>>>>         if (!vrp)
>>>>>> @@ -855,9 +859,90 @@ static int rpmsg_probe(struct virtio_device
>>>>>> *vdev)
>>>>>>         else
>>>>>>             vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>>>     -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>>>> +    /*
>>>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure
>>>>>> buf
>>>>>> +     * size from virtio device config space from the resource table.
>>>>>> +     * If the feature is not supported, then assign default buf
>>>>>> size.
>>>>>> +     */
>>>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>> +                 version, &version);
>>>>>> +
>>>>>> +        /* for now we support only v1 */
>>>>>> +        if (version != RPMSG_VDEV_CONFIG_V1) {
>>>>>> +            dev_err(&vdev->dev,
>>>>>> +                "unsupported vdev config version %u\n", version);
>>>>>> +            err = -EINVAL;
>>>>>> +            goto vqs_del;
>>>>>> +        }
>>>>>> +
>>>>>> +        /* size of the config space must match */
>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>> +                 size, &size);
>>>>>> +        if (size != sizeof(struct virtio_rpmsg_config)) {
>>>>>> +            dev_err(&vdev->dev, "invalid size of vdev config %u\n",
>>>>>> +                size);
>>>>>> +            err = -EINVAL;
>>>>>> +            goto vqs_del;
>>>>>> +        }
>>>>>>     -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>>>> buf_size;
>>>>>> +        /*
>>>>>> +         * Optional alignment applied to each buffer size and to
>>>>>> the TX
>>>>>> +         * buffer base address (e.g. to align buffers on a cache
>>>>>> line).
>>>>>> +         * It must be a power of two; zero means no extra alignment.
>>>>>> +         */
>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>> +                 rpmsg_buf_align, &rpmsg_buf_align);
>>>>>> +        if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
>>>>>> +            dev_err(&vdev->dev,
>>>>>> +                "bad vdev config: rpmsg_buf_align %u is not a power
>>>>>> of two\n",
>>>>>> +                rpmsg_buf_align);
>>>>>> +            err = -EINVAL;
>>>>>> +            goto vqs_del;
>>>>>> +        }
>>>>>> +
>>>>>> +        /* note: tx and rx are defined from remote view */
>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>> +                 txbuf_size, &vrp->rx_buf_size);
>>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>>>>> +
>>>>>> +        /* The buffers must hold at least the rpmsg header */
>>>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>>>>> +            dev_err(&vdev->dev,
>>>>>> +                "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>>>>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>>>>> +            err = -EINVAL;
>>>>>> +            goto vqs_del;
>>>>>> +        }
>>>>>> +
>>>>>> +        /*
>>>>>> +         * The buffer size must be aligned to the provided
>>>>>> alignment for
>>>>>> +         * so that the start address of tx bufs can be aligned.
>>>>>> +         */
>>>>>
>>>>> 'tx' to remove as  it also concerns Rx buffers
>>>>>
>>>>
>>>> Ack.
>>>>
>>>>>
>>>>> What about removing this check to manage alignment during buffer
>>>>> allocation?
>>>>>
>>>>> For example, if the alignment is on a 64-bit address and the tx_buffer
>>>>> and rx_buffer sizes are 40 bytes, 48 bytes can be allocated in memory
>>>>> for each buffer, and the virtio descriptor can be filled with aligned
>>>>> addresses.
>>>>>
>>>>> In other words, the rpmsg_buf_align field contains the alignment
>>>>> constraint from the remote processor. If the Linux kernel wants to
>>>>> impose another alignment constraint, it must test or update
>>>>> rpmsg_buf_align, but it must not impose alignment on the buffer size.
>>>>>
>>>>>
>>>>
>>>> This part I don't understand. `rpmsg_buf_align` is alignment for only
>>>> single buffer size. The linux kernel is checking that single rx buf
>>>> size
>>>> and tx buf size is aligned with `rpmsg_buf_align` as firmware has
>>>> claimed.
>>>>
>>>> For reference the openamp-system-reference PR:
>>>> https://github.com/OpenAMP/openamp-system-reference/pull/106/changes
>>>>
>>>>      .vdev_config = {
>>>>          .version = 1,
>>>>          .reserved = 0,
>>>>          .size = (uint16_t)(sizeof(struct rpmsg_virtio_config) -
>>>> sizeof(bool)),
>>>>          .alignment = RPMSG_BUF_ALIGN,
>>>>          .reserved1 = 0,
>>>>          /* Tx for host */
>>>>          .h2r_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
>>>>          /* Rx for host */
>>>>          .r2h_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
>>>>      },
>>>>
>>>> IIUC, The linux kernel is not really supposed to modify
>>>> `rpmsg_buf_align`. It only uses it to check that firmware has assigned
>>>> correct size of single rx and tx buffer.
>>>>
>>>>
>>>> When the linux kernel uses dma_alloc_coherent() API it aligns total
>>>> buffer size with page size. That is different than single tx buf size
>>>> and single rx buf size. The total buf size alignment to page size is
>>>> irrelevant to `rpmsg_buf_align` field.
>>>>
>>>> Please let me know if I am missing something or didn't understand your
>>>> comment. I prefer that `rpmsg_buf_align` should be only modified by the
>>>> firmware and not the linux kernel.
>>>
>>>
>>> Sorry it was unclear, let try to reexplain my suggestion:
>>>
>>> Two alignment constraints can apply:
>>> - The remote processor can require an alignment through
>>>    vdev_config::alignment.
>>> - The main processor, which runs Linux or another operating system (OS),
>>>    can require a different alignment, for example, for cache alignment.
>>> In current Linux implementation no constraint in Linux.
>>> nevertheless  I would be in favor of taking into account such future
>>> constraint without imposing constraint on the buffer sizes.
>>
>> Is this ever going to be ture? Is it ever possible that Linux and remote
>> has different cache alignment? IIUC, both will be using same cache and
>> so same alignment will be applicable. That is why only signle alignment
>> is required.
> 
> Some remote processors, for example, some Arm Cortex-M33, do not
> integrate cache. Even if cache exists, cache can be enabled on one
> processor, but not on the other.
> 

Okay, how about introducing two alignment in that case?
vdev_config::rpmsg_buf_align_remote, and vdev_config::rpmsg_buf_align_host ?

If remote doesn't have cache, then remote alignment will be 0, and the
*_host alignment can be applied. The rsc_table can provide both, and the
*_host will take priority over *_remote.


>>
>>> Based on that in short term the local 'rpmsg_buf_align' would still
>>> computed
>>> only from vdev_config::alignment (not update of vdev_config::alignment).
>>>
>>> virtio_cread(vdev, struct virtio_rpmsg_config,
>>>                   rpmsg_buf_align, &rpmsg_buf_align);
>>>
>>> Then you could use use ALIGN() helper:
>>>
>>> unsigned int rx_buf_align_size = ALIGN(vrp->rx_buf_size,
>>>                         rpmsg_buf_align);
>>> unsigned int tx_buf_align_size = ALIGN(vrp->tx_buf_size,
>>>                         rpmsg_buf_align);
>>>
>>
>> This is where I have different opinion. Instead of Linux using ALIGN()
>> macro, can we expect that firmware must assign the aligned buffer size
>> with vdev_config::rpmsg_buf_align? And so Linux will fail if the buffer
>> size is not aligned already from the firmware side. That is why I had
>> introduced checks instead of doing alignment by linux.
>>
>>> total_buf_space = (vrp->num_rx_buf * rx_buf_align_size) +
>>>            (vrp->num_tx_buf * tx_buf_align_size);
>>>
>>> vrp->tx_bufs = bufs_va + vrp->num_rx_buf * rx_buf_align_size;
>>>
>>> Apply the same rule to cpu_addr in the vring descriptor:
>>>
>>> void *cpu_addr = vrp->rx_bufs + i * rx_buf_align_size;
>>>
>>> rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>
>>> With this approach, the buffer addresses remain aligned
>>> independently of vdev_config::Rxbuf_size and vdev_config::txbuf_size.
>>> Don't hesitate if it is still not clear!
>>
>> How they remain aligned independent of tx/rx_buf_size? tx_bufs address
>> is still calculated based on rx_buf_align_size, so its alignment still
>> depends on rx_buf_align_size which is derived using
>> vdev_config::rpmsg_buf_align.>
>> I think we are trying to achive the same thing, but implementation is
>> differnt. We just need to decide where the alignment should be done?
>>
>> Either on the linux side? Or in the firmware resource table?
>>
>> I prefer that the firmware should already provide aligned buffer size,
>> and Linux should only check it. If alignment is not done, then simply
>> fail with error. That way, firmware also knows the correct size of the
>> buffer. If Linux does the alignment, then the firmware is not aware of
>> the correct size that is used by the linux.
>>
>> I am open to move the alignment operation to the linux side with the
>> reasonable justification.
> 
> That remains a suggestion. My main concern with the implementation is
> that RPMsg size should depend only on the max playlod size needed, not
> also on the memory alignment.

Okay, I think this is a good reason to apply alignment on the linux
side. If I understand correctly, the rpmsg buffer size will be used as
it is from the rsc table, but vdev_config::alignment will be used only
to decide the start address of the next buffer. If that is the
intention, then I agree, and I will refactor the patch accordingly.

> 
> If this constraint is kept, it must be imposed on all other non-Linux
> solutions. Otherwise, the remote implementation depends on the main
> processor implementation.
> 
> From my POV, It would be preferable not to impose such constraint when
> possible.
> 

Okay.

> Thanks,
> Arnaud
> 
>>
>> Thank You,
>> Tanmay
>>
>>>>
>>>>
>>>>>> +        if (rpmsg_buf_align &&
>>>>>> +            (!IS_ALIGNED(vrp->rx_buf_size, rpmsg_buf_align) ||
>>>>>> +             !IS_ALIGNED(vrp->tx_buf_size, rpmsg_buf_align))) {
>>>>>> +            dev_err(&vdev->dev,
>>>>>> +                "bad vdev config: buf sizes (rx %u, tx %u) not
>>>>>> aligned to %u\n",
>>>>>> +                vrp->rx_buf_size, vrp->tx_buf_size,
>>>>>> +                rpmsg_buf_align);
>>>>>> +            err = -EINVAL;
>>>>>> +            goto vqs_del;
>>>>>> +        }
>>>>>> +
>>>>>> +        dev_dbg(&vdev->dev,
>>>>>> +            "vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz =
>>>>>> 0x%x\n",
>>>>>> +            version, rpmsg_buf_align, vrp->rx_buf_size,
>>>>>> +            vrp->tx_buf_size);
>>>>>> +    } else {
>>>>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>>> +    }
>>>>>> +
>>>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>>           /* allocate coherent memory for the buffers */
>>>>>>         bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>>>> @@ -874,15 +959,20 @@ static int rpmsg_probe(struct virtio_device
>>>>>> *vdev)
>>>>>>         /* first part of the buffers is dedicated for RX */
>>>>>>         vrp->rx_bufs = bufs_va;
>>>>>>     -    /* and second part is dedicated for TX */
>>>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>>>> +    /*
>>>>>> +     * Here buf_va is aligned to a page. Also rx buf size is aligned
>>>>>> with
>>>>>> +     * cache line alignment provided by the firmware, so tx buf's
>>>>>> start
>>>>>> +     * address is guranteed to be aligned with the alignment
>>>>>> provided by
>>>>>> +     * the firmware.
>>>>>> +     */
>>>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>>>>           /* set up the receive buffers */
>>>>>>         for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>>>             struct scatterlist sg;
>>>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>>>     -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>>>               err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>>>                           GFP_KERNEL);
>>>>>> @@ -965,8 +1055,8 @@ static int rpmsg_remove_device(struct device
>>>>>> *dev, void *data)
>>>>>>     static void rpmsg_remove(struct virtio_device *vdev)
>>>>>>     {
>>>>>>         struct virtproc_info *vrp = vdev->priv;
>>>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>>         int ret;
>>>>>>           virtio_reset_device(vdev);
>>>>>> @@ -992,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>>>>>>       static unsigned int features[] = {
>>>>>>         VIRTIO_RPMSG_F_NS,
>>>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>>>     };
>>>>>>       static struct virtio_driver virtio_ipc_driver = {
>>>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
>>>>>> rpmsg/
>>>>>> virtio_rpmsg.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..7e14da68fd17
>>>>>> --- /dev/null
>>>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>>>> @@ -0,0 +1,50 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +/*
>>>>>> + * Copyright (C) Pinecone Inc. 2019
>>>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>>>>> + * Copyright (C) Advanced Micro Devices, Inc. 2026
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>>> +
>>>>>> +#include <linux/types.h>
>>>>>> +#include <linux/virtio_types.h>
>>>>>> +
>>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>>> notifications */
>>>>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>>>>>> space */
>>>>>> +
>>>>>> +/* Version of struct virtio_rpmsg_config understood by this
>>>>>> driver */
>>>>>> +#define RPMSG_VDEV_CONFIG_V1    1
>>>>>> +
>>>>>> +/**
>>>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>>>> + *
>>>>>> + * @version:    version of this structure, currently
>>>>>> %RPMSG_VDEV_CONFIG_V1.
>>>>>> + * @reserved:    reserved for padding, must be zero.
>>>>>> + * @size:    size of this structure in bytes.
>>>>>> + * @rpmsg_buf_align:    required alignment in bytes for each buffer.
>>>>>> Must be a
>>>>>> + *        power of two so that both the buffer sizes and the TX
>>>>>> buffer
>>>>>> + *        base address can be aligned (e.g. to a cache line).
>>>>>> + * @reserved1:    reserved for padding, must be zero. Keeps the
>>>>>> following 32-bit
>>>>>> + *        fields naturally aligned.
>>>>>> + * @txbuf_size:    Tx buf size from remote's view. For Linux this is
>>>>>> rx buf size.
>>>>>> + * @rxbuf_size:    Rx buf size from remote's view. For Linux this is
>>>>>> tx buf size.
>>>>>> + *
>>>>>> + * This is the configuration structure shared by the device and the
>>>>>> driver,
>>>>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are
>>>>>> laid
>>>>>> out so
>>>>>> + * the structure is naturally 32-bit aligned.
>>>>>> + */
>>>>>> +struct virtio_rpmsg_config {
>>>>>> +    u8 version;
>>>>>> +    u8 reserved;
>>>>>
>>>>> Why about defining the version type to u16 to avoid the reserved
>>>>> field?
>>>>>
>>>>>> +    __virtio16 size;
>>>>>> +    __virtio16 rpmsg_buf_align;
>>>>>> +    __virtio16 reserved1;
>>>>>
>>>>> Seems useless if __packed prevents the compiler from inserting extra
>>>>> padding
>>>>> bytes between fields,
>>>>>
>>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>>> +    __virtio32 txbuf_size;
>>>>>> +    __virtio32 rxbuf_size;
>>>>>> +} __packed;
>>>>>
>>>>> proposal
>>>>>
>>>>> +struct virtio_rpmsg_config {
>>>>> +    __virtio16 version;
>>>>> +    __virtio16 size;
>>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>>> +    __virtio32 txbuf_size;
>>>>> +    __virtio32 rxbuf_size;
>>>>> +    __virtio16 rpmsg_buf_align;
>>>>> +} __packed;
>>>>> +
>>>>>
>>>>
>>>> I am okay with the above proposal with minor difference:
>>>>
>>>> My proposal:
>>>>
>>>> +struct virtio_rpmsg_config {
>>>> +    u8 version;
>>>> +    __virtio16 size;
>>>> +    __virtio16 rpmsg_buf_align;
>>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>>> +    __virtio32 txbuf_size;
>>>> +    __virtio32 rxbuf_size;
>>>> +} __packed;
>>>>
>>>> I just want to keep version field 8-bit, as we will probably never use
>>>> upper byte of that field if we use 16-bit. Rest is okay. If the
>>>> strucutre is packed then reserved bytes are not needed.
>>>>
>>>> Please let me know your view.
>>>
>>> No strong opinion on that. In the end, this structure is read only one
>>> time.
>>> If it is acceptable to Mathieu, it is acceptable to me.
>>>
>>> Thanks,
>>> Arnaud
>>>
>>>>
>>>> Thanks,
>>>> Tanmay
>>>>
>>>>
>>>>> Regards,
>>>>> Arnaud
>>>>>
>>>>>> +
>>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>>
>>>>
>>>
>>
> 

