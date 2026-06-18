Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82393B14DE;
	Thu, 18 Jun 2026 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771541; cv=fail; b=c4m5llrqzEwalrg84szCmLM2/q4zXOuN84WAuNIJu500VTXmo3oJlaBtmhg1WKpjZcS2qA5gBOrk1F0THtCcQUKq5x6e412eOM8lyd/Ked1CbWxpYyL/oVKr4Wx25CaKRjfl0TM1vAjk2LQgTu3ipVTP2Xsr2eZ0bEjG1xq7dCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771541; c=relaxed/simple;
	bh=uY3A5f8n2jAvLCNsMssZEne7srxnTpauMjc6A4BWEuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ihszG7qoQxzwyWm/UQcJz7za9zVvNCI3yn+8FP5XNRPTICgUv8T0NHzqRcPU32vUmgPq2E5zSK8+07nPMX5zku/VPFJqyz6s9p5YvLKccyE6/8EvUDlzFHnkFh2XZ8dBYIymbhMdUxp6KJgkJxPBNJ/nYdbKVrhL7/6/taLIaek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=m2ctZMcE; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="m2ctZMcE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGSm3O6B7KjfV3l4hgo45DalBo3BBMUoLsEPGpZyyvk+J7T3fMew+iFvVmPHUTiZX28TlAERJL4iQHy5gUQ9QThaTaDfnM5c7jQVu8Nw+wjchxKr9CJXHjk7Pm5LqnndWpxf28mAv54F3nse5HWKF+hCy73ZEcnc0rZlEZGB5VffBIB294iocNol2RGionpBbjtANSr4ZivL6z8c4fqw7NOssBFFAwOTsk6TJ41PidUcmNHhFh9LHuX6n8+hC/EtA8hr5vl4glJ0Q690MF22lUhkVHFpCUpGjOq37BH0sdGIOmda/wU3M0OlHHeU1P6bMhsbjF02OATzjKOK1cFdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwR7Pk3Ov5qwDAGBJguOKtS2J9RhIJ6dAiRGqDr7IPs=;
 b=mDxCk6Hac6KZhSELimXKk00moSmxSyMNCNNwH222jzCahVq6ZLH1dO8vOJzBjT8rgz7Fpa0qg6A4U/txUlNukCp15CwqaTT4wzfFiufJR3Wl0q/UsmU1ZXxuQrwLqg+66plEqRVwvYcxIka5jDHYVtGxI6+PUb0YfTTZsVXyrPJ4J+7dxJ2rPzPWx2pTl245rnSf4kMskxyw17/p9uUWpIF2BBRVBqCfssLasGTaiRaDHE9qoLJx2Na14BFPoNhmX02jaOgfMk58r7ns2lvwucV6e5pVtets9bsw5sGBj9X5RHolSNgwuv+bb27bBAtWx5t1BNkHdijKvzr/JSztEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwR7Pk3Ov5qwDAGBJguOKtS2J9RhIJ6dAiRGqDr7IPs=;
 b=m2ctZMcEiUr66sWiYzoLkcDe7AJJNdbN89Xy0KzHoE9jaD9rRBYk63JER5LMXNHfyYaYZqGiIY0k4B2/y3CaNLFTDajZq5q2TjiH/Y0b43LGh6zLsBG8Aw9MO+4BT31JshA3y0xiPOiUMangFxQ0emDDEXuxSukU20z51UDRw23Cw/ez4PSqH6GRi6f1SjicYYFgabh78an7iv2mGrGm30NQAFVOOqz6N5Vj8PAZsbQ3BEScIFSGID8tlUKqTb0ReM15qCOdGki8WhyzaMk8a4lCQL4YxdzCtkv4Zef3pYbwajpsk3VoFVRUkgIiNMocuwg3y0wK3rzrGxKYPctTQw==
Received: from CWLP123CA0101.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::17)
 by AS8PR10MB6529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:568::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 08:32:14 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:401:5f:cafe::53) by CWLP123CA0101.outlook.office365.com
 (2603:10a6:401:5f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Thu,
 18 Jun 2026 08:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 08:32:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 10:36:17 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 10:32:12 +0200
Message-ID: <a32b579f-232c-452e-abef-585a97b32839@foss.st.com>
Date: Thu, 18 Jun 2026 10:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
 <20260615202007.3484668-4-tanmay.shah@amd.com>
 <5fba8065-c0e9-4514-863b-8c7c91fb79de@foss.st.com>
 <6b02c52d-5043-4bb8-b249-fa53e5bf53f6@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <6b02c52d-5043-4bb8-b249-fa53e5bf53f6@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|AS8PR10MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a094771-fb23-4721-a8d6-08decd141979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|5023799004|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	Ye5UKxD7tKYvOUJ7oIakKVJDx0GEvGTH0sDKKw00EBYwoFSreDwvEnhD5ycJkgQrTfA2snLqgS9/EJCp5VglXkXd+vbASz2MEFdaUHWJL4QmXos+XTvTajfsaQkfIcwAxwhRb1N5/qfS9dwSyLck2lf/o7aoKkeLscNp8Y8P9SJ4bdpbLxVe6YS2XNVL7IfVyYeER1KLLdYkhuWFehWxeiaZAxGtHBnlaBln2UubImboUHAF2ojtsZh+uCu7jQ8TqA3yz1ykjRDnuo4SRAab871jJ/5DsFkRaV9Is+li7qDVl4trf59fF+doah4x1fHpigZMxZLTFC5lmr+P5zKsIrB9Q3TDR/Ox/vjsziClah9soTzKJTigJPMYXogwfCn0po9UceP7TeRDJH0J4dMLkaA1NK4XTvhg+GQ5v4luqnoLOov21mffIvbqJYvGu2lLzqEKl4e5EMjByVxSnjyDkRGzWDZSDJanp7cMDNPXgDoH6Bdq4V6sEUZ/4VEuMhWsduWkLHBGNc+600fF8RHLRrokztPay+DFmW39tHwTHZySWE1qAyEAutTNyscnetxhd4048eZn2Q+wLSW5obbLUe1xC8Aa6YfzBKAovaeFTuExpdfCN99pf/RLIt7xahqncLxGR3Hpa0CzCtKGFvnSPcNTFHXmDS2p51vzEEZyBTFzqihg5H4qdXfd9RPCso5CRUB0EA76XDBmq/RDdl3LCa9CFf4HWOXHTLESxdHRhoc=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(5023799004)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MUAj+JXT9Y6ebjP/25q0Z8DiM/XnsHOYSCFPyiLjcT+Jw4O0t+vDkLkTs0zgpIZEbe58AXPMCONX1wFU010qJlzjm4/7185Efh14G4AmjU60oka/gAXUoSz9fSK/xk3YAbjEbHcuYX0b8FJ6PzUJ5ERGslEMZgo9JOSW4LZ0yrcxeEmYDat8Wclka5FVEI+2r9sbtaio+VEQHfA6J2kL1YC7QdSB7xHcSSvTxPBpvzd10DqmTXbMdXCPES0c5ZdESVsNqT+psno6eHSEC0uEIPRkEFoZ4dPCV2daqB/yC0xCuYefC7KI8uqtAcubRY3qr0kzqA6IJ6UaAYYQOitvcenVi1h+vg8Hx4pG2Obf701FDwaK5F/RADQvZ8yLo6c1skMw+uVLYQaGclAwRd7ur/TnvJVzQNXp4ZvNMio/UHP3ZhYo86D8LThy4ToFy0+J
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:32:14.2815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a094771-fb23-4721-a8d6-08decd141979
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6529



On 6/17/26 19:41, Shah, Tanmay wrote:
> 
> 
> On 6/17/2026 4:15 AM, Arnaud POULIQUEN wrote:
>> Hi Tanmay,
>>
>> On 6/15/26 22:20, Tanmay Shah wrote:
>>> 512 bytes isn't always suitable for all case, let firmware
>>> maker decide the best value from resource table.
>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> Changes in v4: squash to virtio rpmsg config patch
>>>     - Introduce new patch to modify rpmsg.rst documentation
>>>     - check version is always 1.
>>>     - check size field is same as size of struct virtio_rpmsg_config
>>>     - introduce alignment field
>>>     - check alignment field is power of 2
>>>     - check tx and rx buf size is aligned with alignment passed in the
>>>       structure
>>>
>>> Changes in v3:
>>>     - change version field from u16 to u8
>>>     - introduce size field in the rpmsg_virtio_config structure
>>>     - check version field is set to any non-zero value.
>>>     - check size field is not 0.
>>>     - Remove field for private config, as not needed for now.
>>>     - add documentation of rpmsg_virtio_config structure
>>>
>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 129 ++++++++++++++++++++++++-----
>>>    include/linux/rpmsg/virtio_rpmsg.h |  50 +++++++++++
>>>    2 files changed, 160 insertions(+), 19 deletions(-)
>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>> virtio_rpmsg_bus.c
>>> index 99df1ae07055..a59925f870a4 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -15,11 +15,13 @@
>>>    #include <linux/idr.h>
>>>    #include <linux/jiffies.h>
>>>    #include <linux/kernel.h>
>>> +#include <linux/log2.h>
>>>    #include <linux/module.h>
>>>    #include <linux/mutex.h>
>>>    #include <linux/rpmsg.h>
>>>    #include <linux/rpmsg/byteorder.h>
>>>    #include <linux/rpmsg/ns.h>
>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>    #include <linux/scatterlist.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/sched.h>
>>> @@ -39,7 +41,8 @@
>>>     * @tx_bufs:    kernel address of tx buffers
>>>     * @num_rx_buf: total number of rx buffers
>>>     * @num_tx_buf: total number of tx buffers
>>> - * @buf_size:   size of one rx or tx buffer
>>> + * @rx_buf_size: size of one rx buffer
>>> + * @tx_buf_size: size of one tx buffer
>>>     * @last_tx_buf: index of last tx buffer used
>>>     * @bufs_dma:    dma base addr of the buffers
>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>>> @@ -59,7 +62,8 @@ struct virtproc_info {
>>>        void *rx_bufs, *tx_bufs;
>>>        unsigned int num_rx_buf;
>>>        unsigned int num_tx_buf;
>>> -    unsigned int buf_size;
>>> +    unsigned int rx_buf_size;
>>> +    unsigned int tx_buf_size;
>>>        int last_tx_buf;
>>>        dma_addr_t bufs_dma;
>>>        struct mutex tx_lock;
>>> @@ -68,9 +72,6 @@ struct virtproc_info {
>>>        wait_queue_head_t sendq;
>>>    };
>>>    -/* The feature bitmap for virtio rpmsg */
>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>> notifications */
>>> -
>>>    /**
>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>     * @src: source address
>>> @@ -128,7 +129,7 @@ struct virtio_rpmsg_channel {
>>>     * processor.
>>>     */
>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>      /*
>>>     * Local addresses are dynamically allocated on-demand.
>>> @@ -444,7 +445,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>>          /* either pick the next unused tx buffer */
>>>        if (vrp->last_tx_buf < vrp->num_tx_buf)
>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>>        /* or recycle a used one */
>>>        else
>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>> @@ -514,7 +515,7 @@ static int rpmsg_send_offchannel_raw(struct
>>> rpmsg_device *rpdev,
>>>         * messaging), or to improve the buffer allocator, to support
>>>         * variable-length buffer sizes.
>>>         */
>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>            return -EMSGSIZE;
>>>        }
>>> @@ -647,7 +648,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>> rpmsg_endpoint *ept)
>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>        struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>    }
>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>> device *dev,
>>> @@ -673,7 +674,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>         * the reported payload length.
>>>         */
>>> -    if (len > vrp->buf_size ||
>>> +    if (len > vrp->rx_buf_size ||
>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>>            return -EINVAL;
>>> @@ -706,7 +707,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>            dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>>          /* publish the real size of the buffer */
>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>          /* add the buffer back to the remote processor's virtqueue */
>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>> @@ -820,10 +821,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        struct virtproc_info *vrp;
>>>        struct virtio_rpmsg_channel *vch = NULL;
>>>        struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
>>> +    u16 rpmsg_buf_align = 0;
>>>        void *bufs_va;
>>>        int err = 0, i;
>>>        size_t total_buf_space;
>>>        bool notify;
>>> +    u8 version;
>>> +    u16 size;
>>>          vrp = kzalloc_obj(*vrp);
>>>        if (!vrp)
>>> @@ -855,9 +859,90 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        else
>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>> +    /*
>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>>> +     * size from virtio device config space from the resource table.
>>> +     * If the feature is not supported, then assign default buf size.
>>> +     */
>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 version, &version);
>>> +
>>> +        /* for now we support only v1 */
>>> +        if (version != RPMSG_VDEV_CONFIG_V1) {
>>> +            dev_err(&vdev->dev,
>>> +                "unsupported vdev config version %u\n", version);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        /* size of the config space must match */
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 size, &size);
>>> +        if (size != sizeof(struct virtio_rpmsg_config)) {
>>> +            dev_err(&vdev->dev, "invalid size of vdev config %u\n",
>>> +                size);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>> buf_size;
>>> +        /*
>>> +         * Optional alignment applied to each buffer size and to the TX
>>> +         * buffer base address (e.g. to align buffers on a cache line).
>>> +         * It must be a power of two; zero means no extra alignment.
>>> +         */
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 rpmsg_buf_align, &rpmsg_buf_align);
>>> +        if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
>>> +            dev_err(&vdev->dev,
>>> +                "bad vdev config: rpmsg_buf_align %u is not a power
>>> of two\n",
>>> +                rpmsg_buf_align);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        /* note: tx and rx are defined from remote view */
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 txbuf_size, &vrp->rx_buf_size);
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>> +
>>> +        /* The buffers must hold at least the rpmsg header */
>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>> +            dev_err(&vdev->dev,
>>> +                "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        /*
>>> +         * The buffer size must be aligned to the provided alignment for
>>> +         * so that the start address of tx bufs can be aligned.
>>> +         */
>>
>> 'tx' to remove as  it also concerns Rx buffers
>>
> 
> Ack.
> 
>>
>> What about removing this check to manage alignment during buffer
>> allocation?
>>
>> For example, if the alignment is on a 64-bit address and the tx_buffer
>> and rx_buffer sizes are 40 bytes, 48 bytes can be allocated in memory
>> for each buffer, and the virtio descriptor can be filled with aligned
>> addresses.
>>
>> In other words, the rpmsg_buf_align field contains the alignment
>> constraint from the remote processor. If the Linux kernel wants to
>> impose another alignment constraint, it must test or update
>> rpmsg_buf_align, but it must not impose alignment on the buffer size.
>>
>>
> 
> This part I don't understand. `rpmsg_buf_align` is alignment for only
> single buffer size. The linux kernel is checking that single rx buf size
> and tx buf size is aligned with `rpmsg_buf_align` as firmware has claimed.
> 
> For reference the openamp-system-reference PR:
> https://github.com/OpenAMP/openamp-system-reference/pull/106/changes
> 
> 	.vdev_config = {
> 		.version = 1,
> 		.reserved = 0,
> 		.size = (uint16_t)(sizeof(struct rpmsg_virtio_config) - sizeof(bool)),
> 		.alignment = RPMSG_BUF_ALIGN,
> 		.reserved1 = 0,
> 		/* Tx for host */
> 		.h2r_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
> 		/* Rx for host */
> 		.r2h_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
> 	},
> 
> IIUC, The linux kernel is not really supposed to modify
> `rpmsg_buf_align`. It only uses it to check that firmware has assigned
> correct size of single rx and tx buffer.
> 
> 
> When the linux kernel uses dma_alloc_coherent() API it aligns total
> buffer size with page size. That is different than single tx buf size
> and single rx buf size. The total buf size alignment to page size is
> irrelevant to `rpmsg_buf_align` field.
> 
> Please let me know if I am missing something or didn't understand your
> comment. I prefer that `rpmsg_buf_align` should be only modified by the
> firmware and not the linux kernel.


Sorry it was unclear, let try to reexplain my suggestion:

Two alignment constraints can apply:
- The remote processor can require an alignment through
   vdev_config::alignment.
- The main processor, which runs Linux or another operating system (OS),
   can require a different alignment, for example, for cache alignment.
In current Linux implementation no constraint in Linux.
nevertheless  I would be in favor of taking into account such future
constraint without imposing constraint on the buffer sizes.
Based on that in short term the local 'rpmsg_buf_align' would still 
computed
only from vdev_config::alignment (not update of vdev_config::alignment).

virtio_cread(vdev, struct virtio_rpmsg_config,
                  rpmsg_buf_align, &rpmsg_buf_align);

Then you could use use ALIGN() helper:

unsigned int rx_buf_align_size = ALIGN(vrp->rx_buf_size,
				       rpmsg_buf_align);
unsigned int tx_buf_align_size = ALIGN(vrp->tx_buf_size,
				       rpmsg_buf_align);

total_buf_space = (vrp->num_rx_buf * rx_buf_align_size) +
		  (vrp->num_tx_buf * tx_buf_align_size);

vrp->tx_bufs = bufs_va + vrp->num_rx_buf * rx_buf_align_size;

Apply the same rule to cpu_addr in the vring descriptor:

void *cpu_addr = vrp->rx_bufs + i * rx_buf_align_size;

rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);

With this approach, the buffer addresses remain aligned
independently of vdev_config::Rxbuf_size and vdev_config::txbuf_size.
Don't hesitate if it is still not clear!
> 
> 
>>> +        if (rpmsg_buf_align &&
>>> +            (!IS_ALIGNED(vrp->rx_buf_size, rpmsg_buf_align) ||
>>> +             !IS_ALIGNED(vrp->tx_buf_size, rpmsg_buf_align))) {
>>> +            dev_err(&vdev->dev,
>>> +                "bad vdev config: buf sizes (rx %u, tx %u) not
>>> aligned to %u\n",
>>> +                vrp->rx_buf_size, vrp->tx_buf_size,
>>> +                rpmsg_buf_align);
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        dev_dbg(&vdev->dev,
>>> +            "vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz =
>>> 0x%x\n",
>>> +            version, rpmsg_buf_align, vrp->rx_buf_size,
>>> +            vrp->tx_buf_size);
>>> +    } else {
>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +    }
>>> +
>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>          /* allocate coherent memory for the buffers */
>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>> @@ -874,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        /* first part of the buffers is dedicated for RX */
>>>        vrp->rx_bufs = bufs_va;
>>>    -    /* and second part is dedicated for TX */
>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>> +    /*
>>> +     * Here buf_va is aligned to a page. Also rx buf size is aligned
>>> with
>>> +     * cache line alignment provided by the firmware, so tx buf's start
>>> +     * address is guranteed to be aligned with the alignment provided by
>>> +     * the firmware.
>>> +     */
>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>          /* set up the receive buffers */
>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>            struct scatterlist sg;
>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>                          GFP_KERNEL);
>>> @@ -965,8 +1055,8 @@ static int rpmsg_remove_device(struct device
>>> *dev, void *data)
>>>    static void rpmsg_remove(struct virtio_device *vdev)
>>>    {
>>>        struct virtproc_info *vrp = vdev->priv;
>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>        int ret;
>>>          virtio_reset_device(vdev);
>>> @@ -992,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>>>      static unsigned int features[] = {
>>>        VIRTIO_RPMSG_F_NS,
>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>    };
>>>      static struct virtio_driver virtio_ipc_driver = {
>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
>>> virtio_rpmsg.h
>>> new file mode 100644
>>> index 000000000000..7e14da68fd17
>>> --- /dev/null
>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>> @@ -0,0 +1,50 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) Pinecone Inc. 2019
>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>> + * Copyright (C) Advanced Micro Devices, Inc. 2026
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
>>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>>> +#define RPMSG_VDEV_CONFIG_V1    1
>>> +
>>> +/**
>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>> + *
>>> + * @version:    version of this structure, currently
>>> %RPMSG_VDEV_CONFIG_V1.
>>> + * @reserved:    reserved for padding, must be zero.
>>> + * @size:    size of this structure in bytes.
>>> + * @rpmsg_buf_align:    required alignment in bytes for each buffer.
>>> Must be a
>>> + *        power of two so that both the buffer sizes and the TX buffer
>>> + *        base address can be aligned (e.g. to a cache line).
>>> + * @reserved1:    reserved for padding, must be zero. Keeps the
>>> following 32-bit
>>> + *        fields naturally aligned.
>>> + * @txbuf_size:    Tx buf size from remote's view. For Linux this is
>>> rx buf size.
>>> + * @rxbuf_size:    Rx buf size from remote's view. For Linux this is
>>> tx buf size.
>>> + *
>>> + * This is the configuration structure shared by the device and the
>>> driver,
>>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid
>>> out so
>>> + * the structure is naturally 32-bit aligned.
>>> + */
>>> +struct virtio_rpmsg_config {
>>> +    u8 version;
>>> +    u8 reserved;
>>
>> Why about defining the version type to u16 to avoid the reserved field?
>>
>>> +    __virtio16 size;
>>> +    __virtio16 rpmsg_buf_align;
>>> +    __virtio16 reserved1;
>>
>> Seems useless if __packed prevents the compiler from inserting extra
>> padding
>> bytes between fields,
>>
>>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>>> +    __virtio32 txbuf_size;
>>> +    __virtio32 rxbuf_size;
>>> +} __packed;
>>
>> proposal
>>
>> +struct virtio_rpmsg_config {
>> +    __virtio16 version;
>> +    __virtio16 size;
>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>> +    __virtio32 txbuf_size;
>> +    __virtio32 rxbuf_size;
>> +    __virtio16 rpmsg_buf_align;
>> +} __packed;
>> +
>>
> 
> I am okay with the above proposal with minor difference:
> 
> My proposal:
> 
> +struct virtio_rpmsg_config {
> +	u8 version;
> +	__virtio16 size;
> +	__virtio16 rpmsg_buf_align;
> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;
> 
> I just want to keep version field 8-bit, as we will probably never use
> upper byte of that field if we use 16-bit. Rest is okay. If the
> strucutre is packed then reserved bytes are not needed.
> 
> Please let me know your view.

No strong opinion on that. In the end, this structure is read only one time.
If it is acceptable to Mathieu, it is acceptable to me.

Thanks,
Arnaud

> 
> Thanks,
> Tanmay
> 
> 
>> Regards,
>> Arnaud
>>
>>> +
>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>
> 

