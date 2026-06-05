Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9A30F803;
	Fri,  5 Jun 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647933; cv=fail; b=GtWWd1gS9WcupOdPjd6OSTbXkRpB51lI+wfvLVnn3IDIJFKmUj0QBVfJFTNCgVuGuX1BD0wigtyywlx7RAyhamlOjN5TIEXic4ZPGmAuZQ4k2VaNJn+gQsjL26v8dYFo95F5Lp9XLNE1uXjM17SoKZ1amFAsWBCkzBHaLDQ2c00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647933; c=relaxed/simple;
	bh=whNEPVIjjn7hQ0+qxHVPyD+/OQOLRmW7KTDSS6LEf3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=U5rQMwVW+0clJWTB0bCoxcG4qlVBslTzX0wuJ1d1dFKFypJJVUa9YDgo2WIuN7bUzvdkv9mEwiyS93gW9xmVCBhqxcOZEv+HgSrOeLo2jbYd1uRpTxFxC8FCUBs7roygO4QilI3GI9qezCKZE+SEvdMbAvRMh19ptCpVuqk87nI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=okbyVj/h; arc=fail smtp.client-ip=40.107.159.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="okbyVj/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbMy56toXNGZz0Cyg70MVVOFSZsqDRrLt1H1Hx6/ZfRoddsokdPs7TotbGKYrcj7Lh06WG6HulfJjmXzIZkFJ+rKbyMzfbh6ys026d6aBAkBkII0RUjiZDdkFhz3otCegAyE1tgzXI+w5Slv1bwXHO4f/P8vaiWig4IMs4r3lIn/8L0xv/dLZGtww0T052+b0zKQvAah8MI5vNWp+ZLHDdTKuoH+q4CRgYu0wnvSD91IOYD4IBYuo4s9zhdfK5JRuL/3z0xeoAs6t/OT1kib2tB0BMHBoCQ24/PGAG0sw3unLHdbp0cOnRgq7NuNkRLSRzVgZ3RRpSGEg/38ZzBo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M97ftXA5yMV8jlL8TRUWYU2ArDATs4prisrN/lmS6KA=;
 b=S0wgwFqVlOHsblwZOOHs8c8vbfVYbqFEovurANaCRZOp0TBqhafFafdqAn0UgErUXpBcOGsCe1VUEfVcRyoGXKUXOMVgB2ZGBFpWmEVGWiwPFRut+NeWeAMvyThSX6MY9vq3MKFc2QLEX6gb1RlUTCKGXdeNYA04sg/6winwBUqdQ9soxdKCLN7MPifoV3EN6wE8nggBeXZapS5NVv9ew8pUeId8znl/3eenKHgtToz9M2JC6V+XT0yv+r0M/eAvd9+4QZYW0lsi1JDaBZaIUiR1erc2hGrTmCzbvXjLHC9B0Goz755MnOhiXs6PZZDSbSR5Hk/feWy6q+tutZocVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M97ftXA5yMV8jlL8TRUWYU2ArDATs4prisrN/lmS6KA=;
 b=okbyVj/h2+nezgC/5fLeaPtF7nP+8h/pVotYiArSW8vMtTVMvPOrhuOXUwOHDT7FCL2Y1K+W+maO+uxQqgCvJzVbjNeSlfWEWzThRjtfyZt788ImcS2u+02/4z/T9PPbriwvtiXtTiuqE0JFkZwc4jXU9rCZaOpg3mBLq2hcf6+ou+E1B1Lihm90xOs+dvoKPIrLl2hffaRSoTtQhURyW6ssIY4DkqOTsCXArWLn9UxK0NyXkfJF3y/trhWBM6NWutta976lrd8e5Od7D0I5NftWKQ5MwYNW4jY3z5xwWMPzZtC1fZ/5rDqDL162xBlzmm7WNARjxoo5SRtOIZ/dTw==
Received: from DU7PR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::8) by DB9PR10MB7340.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:460::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:25:26 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::6d) by DU7PR01CA0032.outlook.office365.com
 (2603:10a6:10:50e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 08:25:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 08:25:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 5 Jun
 2026 10:29:22 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 5 Jun
 2026 10:25:10 +0200
Message-ID: <b87ceda3-a021-46e3-83d2-d4e6207142fd@foss.st.com>
Date: Fri, 5 Jun 2026 10:25:10 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-4-tanmay.shah@amd.com>
 <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
 <8d59e741-4cfa-4042-bd45-35838641aa31@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <8d59e741-4cfa-4042-bd45-35838641aa31@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9E:EE_|DB9PR10MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 98331db7-0234-4994-2713-08dec2dbfef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|11063799006|4143699003|56012099006|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	/RKITt6q6/9Jxq23Sbi+AnrX4AK+/1RiyRZBOT+WNRipc546KUW6w9pmVgeCY9G4c7K4r8EbCM04R2sLxkWBYwM9tAPljwY0MKUH/MGrbiC/OYvxgMVCbsx+5WtDOx0XtsSHCs48nUvIOommm9vyq1e/CXL5FeIJykWBqOmeiKQaKW3WeEgjQ1LEp6oexUBWPNoZOE/p0yTlSor0v4jP5N5A2t9R4E5Pf4yCnQbY2SIFI/kuOjjQJlkw+igeKDdZfeiXpZF7EUIGN28jeAqrKfYJdL1P/QzgFDxEcwQyQJ/ftTU3o3xh8etVryioSPci+4AR3YJ1U8NP9Yk/g3AxW5ClhrMFSMf8efOLgNNzt0KqPJVIWAjAZst+YYzDRbkDjgB4mj/mXExfj5k/CvrvarxPMXlvvYPqs62dfrevxXz0AKbMzZRJMFjIAbpQzNdh0fmZ6B2hKvc+pZZTFr5ynrW1+TWWXG0jRq7IC7Qwpkf/o3tJmAAMBGo98ZHPsXmE0KHsHtzj+/CyI+YD11/xOvBCA0Naj2hT46Hharwkq5gcaZ6f8Tt2KpWBBDnNV9uGpmOWiwHN3fynCET6eY5vHhQBXzefnN4MU+9jezkhhhCdVzbFjC3s5hQiFTryaTIkz1SibJKD12ZfVxHYaetNpiOHojly4GC46T68wZD0hsXZVg6AIMVnqhY1qjNRFnd/M9JBD5SogzjAFpVpFlSadQNS9OrhBxiHnbhuCuIgcOY=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g4dkaQOBePc6mgp1M/6oMZIca19j3ng1tpdYyihp3CgDG/4nPp7KIRV4guwAehNSchRi6RpQCRJW/TC5WegI8/riMDkE0p6Uqvr7U4weEJENCrT+Hj5nCKgbxjExpfMYD0VZ9aZqtZiw9wBDodRwXBeSnU961vsNOWLHFyVKuWwLwo8NRZwh2dkDPT3eyKlVJNrkB+mHdqsafHlmYQnPeZrdv3PHi9KH/WGixye8uFSR3Edb4kB1d0vJ7BDw3JGrgn4r6r1ECCqcTmYq9JAHw3569yAoA7puPKdnkrHI7IJBkVR/kqiHudirxP8+owszgRd7TD9rGd5i3RaP3/no+SqsPzTpCKY3hqozyo3XD9xjVXpM33gf9ezqvTHKCFcfSgDUPOWe7i2UQKFUeCO2FdYzC5Bx9/kMpfLCymxAX6l0KHh98L1NoiyhJuT9Kliy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:25:26.3324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98331db7-0234-4994-2713-08dec2dbfef8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7340

Hi Tanmay,

On 6/4/26 22:31, Shah, Tanmay wrote:
> Thank You for the reviews, please find my comments below:
> 
> On 6/2/2026 3:25 AM, Arnaud POULIQUEN wrote:
>> Hi Tanmay,
>>
>> On 5/29/26 18:43, Tanmay Shah wrote:
>>> 512 bytes isn't always suitable for all case, let firmware
>>> maker decide the best value from resource table.
>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>
>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>> ---
>>>
>>> Changes in v3:
>>>     - change version field from u16 to u8
>>>     - introduce size field in the rpmsg_virtio_config structure
>>>     - check version field is set to any non-zero value.
>>>     - check size field is not 0.
>>>     - Remove field for private config, as not needed for now.
>>>     - add documentation of rpmsg_virtio_config structure
>>>
>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 90 ++++++++++++++++++++++++------
>>>    include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
>>>    2 files changed, 106 insertions(+), 18 deletions(-)
>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>
>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>> virtio_rpmsg_bus.c
>>> index 99df1ae07055..f1ab8e792f3d 100644
>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>> @@ -20,6 +20,7 @@
>>>    #include <linux/rpmsg.h>
>>>    #include <linux/rpmsg/byteorder.h>
>>>    #include <linux/rpmsg/ns.h>
>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>    #include <linux/scatterlist.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/sched.h>
>>> @@ -39,7 +40,8 @@
>>>     * @tx_bufs:    kernel address of tx buffers
>>>     * @num_rx_buf: total number of rx buffers
>>>     * @num_tx_buf: total number of tx buffers
>>> - * @buf_size:   size of one rx or tx buffer
>>> + * @rx_buf_size: size of one rx buffer
>>> + * @tx_buf_size: size of one tx buffer
>>>     * @last_tx_buf: index of last tx buffer used
>>>     * @bufs_dma:    dma base addr of the buffers
>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>        void *rx_bufs, *tx_bufs;
>>>        unsigned int num_rx_buf;
>>>        unsigned int num_tx_buf;
>>> -    unsigned int buf_size;
>>> +    unsigned int rx_buf_size;
>>> +    unsigned int tx_buf_size;
>>>        int last_tx_buf;
>>>        dma_addr_t bufs_dma;
>>>        struct mutex tx_lock;
>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>        wait_queue_head_t sendq;
>>>    };
>>>    -/* The feature bitmap for virtio rpmsg */
>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>> notifications */
>>> -
>>>    /**
>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>     * @src: source address
>>> @@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
>>>     * processor.
>>>     */
>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>> +
>>> +#define RPMSG_VDEV_CONFIG_VER 1
>>
>> I would rename it
>>
>> #define RPMSG_VDEV_CONFIG_V1 1
> 
> We might not need this define at all. I should have removed it in this
> patch. Please see below [1].
> 
>>
>>>      /*
>>>     * Local addresses are dynamically allocated on-demand.
>>> @@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>>          /* either pick the next unused tx buffer */
>>>        if (vrp->last_tx_buf < vrp->num_tx_buf)
>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>>        /* or recycle a used one */
>>>        else
>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>> @@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct
>>> rpmsg_device *rpdev,
>>>         * messaging), or to improve the buffer allocator, to support
>>>         * variable-length buffer sizes.
>>>         */
>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>            return -EMSGSIZE;
>>>        }
>>> @@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>> rpmsg_endpoint *ept)
>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>        struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>    }
>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>> device *dev,
>>> @@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>         * the reported payload length.
>>>         */
>>> -    if (len > vrp->buf_size ||
>>> +    if (len > vrp->rx_buf_size ||
>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>>            return -EINVAL;
>>> @@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>> *vrp, struct device *dev,
>>>            dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>>          /* publish the real size of the buffer */
>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>          /* add the buffer back to the remote processor's virtqueue */
>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>> @@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        int err = 0, i;
>>>        size_t total_buf_space;
>>>        bool notify;
>>> +    u8 version;
>>> +    u16 size;
>>>          vrp = kzalloc_obj(*vrp);
>>>        if (!vrp)
>>> @@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        else
>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>> +    /*
>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>>> +     * size from virtio device config space from the resource table.
>>> +     * If the feature is not supported, then assign default buf size.
>>> +     */
>>
>> Seems to me that It would be nice to document the config space in rpmsg.rst
>>
> 
> Ack.
> 
>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 version, &version);
>>> +        if (version == 0) {
>>
>>          if (version != RPMSG_VDEV_CONFIG_V1) {
>>
> 
> [1] Here we have to allow any non-zero version to be valid, and make
> sure any future version is always backward compatible.
> 
> For example, if we need v2 of the structure, then that should be
> compatible with v1. So, old kernel keeps working with the new firmware
> with limited functionality supported by the kernel. And new kernel keep
> working with the old firmware, with the limited functionality supported
> by the firmware.
> 
> That is just my view. I am open to more ideas, thank you.

My concern is that you allow any version here, while we define only a V1.
If we need a V2 we will probably have to modify this part of the code.

> 
>>> +            dev_err(&vdev->dev, "invalid version of vdev config\n");
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        /*
>>> +         * The size field is not used for the remoteproc virtio
>>> transport,
>>> +         * but kept for any future transport to use
>>> +         */
>>
>> I suggest to not mention the virtio transport, indeed we should decouple
>> the virtio device from the virtio transport.
>>
> 
> Ack.
> 
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 size, &size);
>>> +        if (size == 0) {
>>
>>      if (size != sizeof(virtio_rpmsg_config)) {
>>
> 
> So, I think sizeof(virtio_rpmsg_config) on the remote side may not be
> the same as in the linux kernel. Remote side can have its private
> variables which might not needed on the linux side:
> 
> For example, the open-amp library defines the structure differently than
> linux:
> https://github.com/OpenAMP/open-amp/blob/23d4c5d7a5c5dd08b74d4ba828243988592337cb/lib/include/openamp/rpmsg_virtio.h#L70
> 
> There is 'split_shpool' extra variable which is not needed by the linux.

The 'split_shpool' setting is currently an internal OpenAMP configuration
and is not part of a configuration space. If there is a need to split
memory regions for RX and TX buffers, the implementation should use another
method, perhaps with DA and PA addresses that specify the RX and TX buffer
locations, as for the vrings in the resource table.
I would suggest to not address this in version 1.

 From my perspective, the configuration space is a common structure that
the device and the driver share. In that case, checking the size makes
sense.
Thanks,
Arnaud

> 
> That is why restriction on the size isn't needed IMHO.
> 
>>> +            dev_err(&vdev->dev, "invalid size of vdev config\n");
>>> +            err = -EINVAL;
>>> +            goto vqs_del;
>>> +        }
>>> +
>>> +        /* note: tx and rx are defined from remote view */
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 txbuf_size, &vrp->rx_buf_size);
>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>
>> I wonder if we should not impose a size aligned on 64-bits
>>
> 
> I think you mean size should be aligned to 64-bits.
> Ack for that.
> 
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
>>> +        dev_dbg(&vdev->dev,
>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>>> 0x%x\n",
>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>>> +    } else {
>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>> +    }
>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>> buf_size;
>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>          /* allocate coherent memory for the buffers */
>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>> @@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>        vrp->rx_bufs = bufs_va;
>>>          /* and second part is dedicated for TX */
>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>
>>
>> We should have a cache or 64-bit alignement here. or perhaps such
>> constraints should be specified in the config space?
>>
> 
> I prefer to specify in the config space.
> 
>>>          /* set up the receive buffers */
>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>            struct scatterlist sg;
>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>                          GFP_KERNEL);
>>> @@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device
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
>>> @@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
>>>      static unsigned int features[] = {
>>>        VIRTIO_RPMSG_F_NS,
>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>    };
>>>      static struct virtio_driver virtio_ipc_driver = {
>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
>>> virtio_rpmsg.h
>>> new file mode 100644
>>> index 000000000000..77a530514d86
>>> --- /dev/null
>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>> @@ -0,0 +1,34 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright (C) Pinecone Inc. 2019
>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>
>> No year specified for AMD copyright?
> 
> Ack, will fix.
> 
>>
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
>>> +/**
>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>> + *
>>> + * @version: version of this structure. current version is 1.
>>> + * @size:    size of this structure. unused for the remoteproc virtio
>>> backend.
>>
>> reference to remoteproc to remove
>>
> 
> Ack.
> 
>>> + * @txbuf_size: Tx buf size from remote's view. For Linux this is rx
>>> buf size.
>>> + * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx
>>> buf size.
>>> + */
>>> +struct virtio_rpmsg_config {
>>> +    u8 version;
>>> +    __virtio16 size;
>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>> +    __virtio32 txbuf_size;
>>> +    __virtio32 rxbuf_size;
>>> +} __packed;
>>
>>
>> As mentioned above
>> - The size should be be a multiple of four to ensure 64-bit alignment.
>> - I would add an alignment field to align the address of the TX buffers
>> to the cache line.
>>
> 
> Ok, I will change and test.
> 
>> Thanks,
>> Arnaud
>>
>>
>>> +
>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>
> 

