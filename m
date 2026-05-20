Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A83EEAE2;
	Wed, 20 May 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288944; cv=fail; b=ZSFdoLPh043xOaVCiCtbsMK5/wvvybqJ9KHXAaumJXGevghYmOLNrp8kNCYw9kEASQl5SbGr1I8XtjdQ0Y42VX9/SKHuso2+P1F/trczAQjtf/4eM0NLY1VfTFPcfC06OKyqhbOmu0yYBqDyVqaIxQE86WAB9F6hemv9Jb6lFUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288944; c=relaxed/simple;
	bh=Ox9yNjhwfYj2SpP3V3ONdYEhYNOzhCteGfSzAXAsJN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z+2oj7x+mBOu9KOAG9EfhGKGPZ6CJeIbG6VmFtoBeZa3M3xvIY3XPFm5zETnNMm/7ResrDbM1JriyESBI2kAoc8tEFrTSykysPXQDUV3oKmAQa3YSwB1SRGpk7Px+sp78c6pxpBjDmS2QQRlAMRSVhG8OC7m8N8VxlfdIibKvvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AtttuhvZ; arc=fail smtp.client-ip=40.107.209.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AtttuhvZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjI7DSY533c7pDfRjohUHTyIVWoDJI21me6cs6ctfrnJUYQeI/PD9ghmvbS5oHEaMVJANsBfXLTaK6Zt8AvnQtWFSIbQ9lcY/xrVWKoCBdpaMG44YdOhTEKfCaz1lCRekWnem7BG6ezeVTBteLNhasF4MBtjxQFvyzsxmtgL3sWASvlbdyUHUJ1iWPLiGvlf2ACDhhgwM7e2oPdowHvPuVHxFxRTDeXWPTAsEkrZ5hR9Gfe3H1fbKVizyLD9OxHMNNCfsXwwzKzVc6WzR4dGs5v1bYaJmMnIMEK+b1/5T4rwIO9xohqBC9LK+qlJlaHja5RovmDEud4nXWAnbHr80w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OLj19KXbYYUCzVp+RctzF64SXMplKY0VZvx64CIB50=;
 b=nN2rVJ88YqDSuFoJ4cjUZgDIBvCgtUQ+W5mTlnYVcVvhuBGQtc8SCYPddw7A3gojsXGrh5C81XgV9307x6mnMS+u8t04ydOAVHHWCu4mqNoEUHda4d30xQp6GtjeZTgj3ZmsQL4/1IiWNWLMPjoEwR5g6qGb0ezQYOQpj7Rn1VqXEwR7+dFRgaw2pAt+LcHJOY+9Obt9grTOt/SWK7D+oP+amDvoDvWKXl5TxDvuUu6eLLeeFXtR/08J/8mkNnJZkC8K+ElpbtRwiKQ+5SyDJWmtVQuJL9gVauPy8hR79Gn2begN6aspxI1ufEznRjH/OsdsWqaFBeyN0pPa2lBaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OLj19KXbYYUCzVp+RctzF64SXMplKY0VZvx64CIB50=;
 b=AtttuhvZTIAvDypVgV9mNI0fO8wcz5t4MjmuOm7Acd3VYhRRV8t3orwXx9A3L3tsGJLwb1PCpFVS74W4SS9VZePMQ3cj5MbVr1SzABigQpglS3z8iylm729/F4L9S0ySjpxxWx2zObXa2uGW6ZHlOJWwS3O03xC3XNp2Bu65uT8=
Received: from MN0P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::9)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:55:36 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::9e) by MN0P222CA0006.outlook.office365.com
 (2603:10b6:208:531::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 14:55:35 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 09:55:34 -0500
Received: from [10.252.226.156] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 09:55:33 -0500
Message-ID: <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
Date: Wed, 20 May 2026 09:55:33 -0500
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
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Tanmay Shah <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com> <agyfr-pxwQ4oKMAF@p14s>
 <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SJ2PR12MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ee5b3c-04e3-4a9d-7a34-08deb67fd91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|13003099007|11063799006|6133799003|22082099003|18002099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Pd/X1VXqTDD3IwPifmYtSUrIVpdOV9563oCsg6PnwGVfphVz7hh/AOCd2ST082No7PxFDL87y0t/B6KzIXurv1NLmGpnVHvmSHI+iVLW/ca8zEhTHQrL549+9PZrymatK6yOZPeZaQPydoc6BFwwJGqiFf6ggDa2WnYbQ6nYw4tn3fyz+1/cRSLAPM1VHUqyhu9Fgf0gZIemRYfD53rC0tU6sjGhgICJB2M8gxFS3qHv0Jvcnd5Fec8S7sn8XUPSz8yAmCgTCaftSdZme91oOZkp9FHuq6CsvoMxsOtDrQ/w1uq76NbkMSmZHC/KPVyL++MyEmiuMJo02zPy50/XAxmdbE6r2KpM6A+mWwmTu7uKCXot/0fx9WOgEY+wOQSmyTs6sEbnP4Si+wFfvtdcDIUcJgrqhEqrWDiGpchH5FIe2FThzZ2QbCKQsPaa+YN0PX63GLRzYALdg+3nwvMr0KFXAYr2OTAhqimsQ3YV1/B9kze8uhTA3V8j95U1t/HN5NWMChU7LMQFJAiQFaFNahxRTYgbenqgTRrKOqK7B5Syuc9yX37QYhhm8SGL1Vj7wIHFxLvSgIh+mBgUAflNUqKOmKtOIiPj7dMHpQrqZLX+G9hSp2dGMSKfZkF/g1SOvLRobHDMBaffgBSeKRm+G9++PKd6+ejne1bC5s74ZPfqk289Jb/BHd+nJziwUMd+
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(13003099007)(11063799006)(6133799003)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zRcPr+xqSXrLWNB+6iN6+eVOlrg9VZlfio7ltyclyZEp0OrQmSwzXp+/nW1JvhfYlLjaiqeXSVRUYM2UhabKtOFzzl7Uama/LPSATDOpEjNHe7ENpOUMrY18djKkPJEBMfzo9FmPgnhOlRQS9GFTn7r3UFfN2uDJHJO3A+3kdaIj76JCsRoJSWxvYJdqq/I8Xg8hLuijIRlGt+vPEDwj+BXl5ToK//qA7lVb6py5gGXHH5UeUGMZRaprtElEB9QyFogNApIuRVbLiOgoO4qolUWNzZM5L6OEXUHxVMNpI03o3tdp9yBvUhUzQHI630GVTdt1ApxpzbAnqpCkZNiv22zM39TFCiaI5JPAfuqhobn2xD1uDrjWBSiu+lf5R2OYbNwS1Km1dkJ548AOf9wBYt3Iv5MsA3+Oz8SU1jRKGzu9/69sOBcd+xu5m9b8qvHN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:55:35.2311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ee5b3c-04e3-4a9d-7a34-08deb67fd91b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805



On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 5/19/26 19:36, Mathieu Poirier wrote:
>> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
>>> 512 bytes isn't always suitable for all case, let firmware
>>> maker decide the best value from resource table.
>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> Test done:
>>>    - Verify this patch works with the existing firmware
>>>    - Verify this patch works with the firmware that configures
>>>      differt tx & rx buf size
>>>
>>> Changes in v2:
>>>    - %s/sbuf_size/tx_buf_size/
>>>    - %s/rbuf_size/rx_buf_size/
>>>    - fix typo
>>>    - do not use ALIGN on buf size, rely on allocator
>>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
>>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>>    - use __virtio32 over __u32
>>>    - add version field to virtio rpmsg config structure
>>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>>
>>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
>>>   include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>>   2 files changed, 79 insertions(+), 18 deletions(-)
>>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>> virtio_rpmsg_bus.c
>>> index e59d8cf9b975..8116d94413cc 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -20,6 +20,7 @@
>>>   #include <linux/rpmsg.h>
>>>   #include <linux/rpmsg/byteorder.h>
>>>   #include <linux/rpmsg/ns.h>
>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>   #include <linux/scatterlist.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/sched.h>
>>> @@ -39,7 +40,8 @@
>>>    * @tx_bufs:    kernel address of tx buffers
>>>    * @num_rx_buf:    total number of buffers for rx
>>>    * @num_tx_buf:    total number of buffers for tx
>>> - * @buf_size:    size of one rx or tx buffer
>>> + * @rx_buf_size: size of one rx buffer
>>> + * @tx_buf_size: size of one tx buffer
>>>    * @last_sbuf:    index of last tx buffer used
>>>    * @bufs_dma:    dma base addr of the buffers
>>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>       void *rx_bufs, *tx_bufs;
>>>       unsigned int num_rx_buf;
>>>       unsigned int num_tx_buf;
>>> -    unsigned int buf_size;
>>> +    unsigned int rx_buf_size;
>>> +    unsigned int tx_buf_size;
>>>       int last_sbuf;
>>>       dma_addr_t bufs_dma;
>>>       struct mutex tx_lock;
>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>       wait_queue_head_t sendq;
>>>   };
>>>   -/* The feature bitmap for virtio rpmsg */
>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>> notifications */
>>> -
>>>   /**
>>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>>    * @src: source address
>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>>    * processor.
>>>    */
>>>   #define MAX_RPMSG_NUM_BUFS    (256)
>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>     /*
>>>    * Local addresses are dynamically allocated on-demand.
>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>>         /* either pick the next unused tx buffer */
>>>       if (vrp->last_sbuf < vrp->num_tx_buf)
>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>>       /* or recycle a used one */
>>>       else
>>>           ret = virtqueue_get_buf(vrp->svq, &len);
>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
>>> rpmsg_device *rpdev,
>>>        * messaging), or to improve the buffer allocator, to support
>>>        * variable-length buffer sizes.
>>>        */
>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>           dev_err(dev, "message is too big (%d)\n", len);
>>>           return -EMSGSIZE;
>>>       }
>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>> rpmsg_endpoint *ept)
>>>       struct rpmsg_device *rpdev = ept->rpdev;
>>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>   }
>>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>> device *dev,
>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>        * We currently use fixed-sized buffers, so trivially sanitize
>>>        * the reported payload length.
>>>        */
>>> -    if (len > vrp->buf_size ||
>>> +    if (len > vrp->rx_buf_size ||
>>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>> msg_len);
>>>           return -EINVAL;
>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>>         /* publish the real size of the buffer */
>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>         /* add the buffer back to the remote processor's virtqueue */
>>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>       int err = 0, i;
>>>       size_t total_buf_space;
>>>       bool notify;
>>> +    u16 version;
>>>         vrp = kzalloc_obj(*vrp);
>>>       if (!vrp)
>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>       else
>>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>> +    /*
>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>>> +     * size from virtio device config space from the resource table.
>>> +     * If the feature is not supported, then assign default buf size.
>>> +     */
>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>> +        /* note: virtio_rpmsg_config is defined from remote view */
>>> +        version = 0;
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 version, &version);
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 txbuf_size, &vrp->rx_buf_size);
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>> +
>>
>> A check is also needed to make sure the version received from the
>> resource table
>> is '0'.

I think we should start with versaion = 1. So, can I check the version
number for 1 ?

>>
>>> +        /* The buffers must hold at least the rpmsg header */
>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>> +            dev_err(&vdev->dev,
>>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        dev_dbg(&vdev->dev,
>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>>> 0x%x\n",
>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>>> +    } else {
>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +    }
>>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>> >buf_size;
>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>         /* allocate coherent memory for the buffers */
>>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>       vrp->rx_bufs = bufs_va;
>>>         /* and second part is dedicated for TX */
>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>         /* set up the receive buffers */
>>>       for (i = 0; i < vrp->num_rx_buf; i++) {
>>>           struct scatterlist sg;
>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>                         GFP_KERNEL);
>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
>>> *dev, void *data)
>>>   static void rpmsg_remove(struct virtio_device *vdev)
>>>   {
>>>       struct virtproc_info *vrp = vdev->priv;
>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>       int ret;
>>>         virtio_reset_device(vdev);
>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>>     static unsigned int features[] = {
>>>       VIRTIO_RPMSG_F_NS,
>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>   };
>>>     static struct virtio_driver virtio_ipc_driver = {
>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
>>> rpmsg/virtio_rpmsg.h
>>> new file mode 100644
>>> index 000000000000..285918be68b9
>>> --- /dev/null
>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) Pinecone Inc. 2019
>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>> + */
>>> +
>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>> +#define _LINUX_VIRTIO_RPMSG_H
>>> +
>>> +#include <linux/types.h>
>>> +#include <linux/virtio_types.h>
>>> +
>>> +/* The feature bitmap for virtio rpmsg */
>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>> notifications */
>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>>> space */
>>> +
>>> +struct virtio_rpmsg_config {
>>> +    __virtio16 version;
>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>> +    __virtio32 txbuf_size;
>>> +    __virtio32 rxbuf_size;
>>> +    __virtio32 reserved[14]; /* Reserve for the future use */
>>
>> 66 byte for the configuratio space?  I'm puzzled about the
>> reserved[14], how did
>> you come up with that number?

I kept the reserved bytes from the original series as it is. The
original series did not contain version field. With version I don't
think we need reserved field at all. At best, if we want to append
padding bytes, then I think __virtio16 reserved; makes sense. That will
make the structure aligned to 4 byte.

> 
> Is it useful to define the reserved field?

I think reserved field is only useful to keep the structure size aligned
to 4 bytes.

> The version should allow us to determine the content.

Correct, but I think the structure can be aligned if used correct
reserved bytes.

> An other solution is to introduce a'size' field to determine the size of
> the structure:

I think, the resource table already contains config_len field which is
size of the structure:

https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/remoteproc.h#L275

> struct virtio_rpmsg_config {
>     __virtio16 version;
>     __virtio16 size; /* size of the configuration space */
>     /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>     __virtio32 txbuf_size;
>     __virtio32 rxbuf_size;
>     __u8 private[0]; /* customized config */

Do we need customized config? I think I should remove this comment from
the original patch as well.

Thanks,
Tanmay

> };
> 
>>
>> The rest looks good to me.
>>
> 
> Looks good to me too.
> 
> Thanks,
> Arnaud
> 
>>> +    /* Put the customize config here */
>>> +} __packed;
>>> +
>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>> -- 
>>> 2.34.1
>>>
> 

