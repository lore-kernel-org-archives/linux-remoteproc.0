Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011021.outbound.protection.outlook.com [40.107.130.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8386E3F1AA8;
	Wed, 20 May 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291798; cv=fail; b=lvzxfVQXDZPmtjCPUVRELb65kPfHloNThKJsUQJEOe3aIU0P1CEgdMribtU1ZrrBTFU/3sZMWjw8zdGLmAICgBwKh84e2FIYhqsRWYI0h+S0MS0kFzOLoyMow8f5X71uLlhfdwKnF1CFrpTeg5BOLVHc3n/t5mUgOIjAPO/8+5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291798; c=relaxed/simple;
	bh=iz2Bz/n8ZMTToYLvZ1fImFg1lpLSzjgPvIQKbc6iYLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DtTxf1NSecQPaBani86twQD0sJuIUkxLvOCIrSoju6dwhP4G5Dl+nooR7b8t+HILFZh3mm2zh9tSl1SMAsa85rkLAkaFliOxL3bjtNGhgxAZAoKsc1Kf0EPZcEaTtNfZ+P1I7g/aVgiNMinmTiIlAgwoA8emfGQNci3A1OmpgUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eQyOF4ih; arc=fail smtp.client-ip=40.107.130.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eQyOF4ih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1DZ5L2Wusdl6Hhk6r71HQcLGEu0wK4mg+3YuU7BK4tHMZ2Hvh8qoRvDooWnFw4YAGML+C2tE+f/+3BaCUA5AB75h/FW9TKOwPTkJnmmifIyHDFobXYLcOwBqq+8moKLpey+mFJM9vZ+YP1LuN+EYngdCOp0MIdwI199eSPL5s/1h7EGBXroWv+B8uFj9HDcGrJsTeVSj19eUh0fYC52TS/uuNOiIc3bzReS2ZvL+CqLGgqkDi0CLiiqq/Ja7WvDVIG63OKAEB/8+XSJH0ld+cVhPWm4MWRgLQfCaW2YWLEnHfKD66H1otC7yOw6h8/PbdEGPYHY/kDnynr1vs07yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3OmxvLxkRBF48zes0X1Kx/4uk8zh8J0nTmCYrjltEE=;
 b=fWLQCgCa1C4rRgP/r5zGBV/FXSsSpnNvPrqw8+Jf5Et5uj5a5MdPS61tmfBm2/O65jEDxGctQPuTp2OoGjQvz8uCCmKu93+mFZ9jONCn4jwk3W7k/RMM6Tzo0XmexhzfyMRroQ1e7uRphpH6EzPmlmX8F8ivzdERI2evLN37aV9ZGOPB9oB6dm0W4UK60I5XoJdgE8X3i0lWEoM10dFopQQnEg+vcx7Qqw4LGMYynzvESiy/Bn0eazE93N7jx8kiSBuY3wqnaR23U6PTB9j+/jH15je8Hk26niVjAbENHBxVmY87Fg2Zr8PZmuR+3B7rqn4Jt+nTyw0rYOzE6TW3fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3OmxvLxkRBF48zes0X1Kx/4uk8zh8J0nTmCYrjltEE=;
 b=eQyOF4ihfD0uofQUBYXG+D0mWxP3GhmtX7h/J9Ku9T9H5vARDj04RCfAvrKkjbsELijSa+9CHe4NgEFE9jetMsbh66ktVkCvnhUYBVlplhDLfO7TVItOOA5wLtEmpfn/BxCGiexmJbC99T6cyc/+c2t5f+c0B2Z6DGomsxdn2nh+iJKbMYzElyu9LPWBP9yO+ePHVhzHPyKAu73y9+ey/DseZf8aXnr8KYjw4NdeMLTe/OiYvztBslCWiDRMbIwUI/C3F7m0rKu1FH5u8MIDcB0k79QBgarAQ3sh2fRrT5K7PcyGOSM9qq7IJ1Dc99Ma+8nrsyssJRjG/7E9770I2w==
Received: from DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) by PAWPR10MB7221.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2e4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 15:43:09 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::ad) by DUZPR01CA0329.outlook.office365.com
 (2603:10a6:10:4ba::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 15:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 15:43:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 17:47:02 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 17:43:08 +0200
Message-ID: <e9b697dc-52b8-482a-8d54-da3c4700f049@foss.st.com>
Date: Wed, 20 May 2026 17:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: <tanmay.shah@amd.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com> <agyfr-pxwQ4oKMAF@p14s>
 <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B99:EE_|PAWPR10MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 624036e9-a4fd-4fd9-08f7-08deb6867e2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003|13003099007|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	7/uKn7gHHCEEaQCkdHx4nIT9RGPJTdzEeDfAzyIkCmuorwIoCBbTsDBbLPBV5ScWyNQYhib3GWEt8YP9qRX34y3/RS/jCFa1UqQOqJHsOCIHpwCoib7cUIv4ZkXqoKjTzySe4mux75lL+tViAGlvwV/zc44dy0Y/YCNPxQ7FGDFh7nB8foLayICfodk18SIZVnESLk1IepI/i2HnUE3VQ9q9Iy7Y3UGFt7RdCYGhShHDOcpo/EbWGE7GkIZ6ZuIhQBYdYChJQaJxTfwInK6DR1s4T/Mu0nu7pgAcawseQFvvjSnpn0c6+0GYNKT1KXmJGqQgaGG8xaFy6NJg+e51suRp1dpZHf3cSmH6bj5puv7/K+/kSfoa+LE2p/qkSVXjSUbvEyGZJWigh4WK1H6kqEOG71NFEubkdG1MmHAA/mcz4aOhImpeJuhbUAusXiqBXNT+e6gxxXl4ag42VGIsYD4qnF+sHG3Uo6shi4y1gT+xhAleFbfLJIVLyZs5kKWonnfm1W3kqhLSUb30vnBAjqkhLuaCczT/Sjif0bxCPZ7mfveVOa4kHqLC+3zLCQVVUxYjdXhsaKGk/8eptoE9oNQuHKRnLm5e9USiMsp5n5rP4P5WgBX0MzG++plfRf1rf7xcUncOpJ76gB3pCfgiMHjA1KGSmsIV6vtLc6gxZoRrYtPUjkXSeIwBOdtmtkAS
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003)(13003099007)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2zWxYTxG1UBFL+QxyNHSncT81IwSId1cQUPLOw6uMziaIf+A850hLqw9/unqJVf/mnNkKyf1Mtuc9wzYCbszyz5L6ZJAOOhi5L5QrR1pzFhQBvzcWXAwibJer1Lu+mx6Nx+gWu7+sy2qKRzeg6irk2mLOuHxhevcldqf4o9XigukVSfigqyr5XPM531uuBWvhue5imaoKVe8kZ5vKLt+E/Hjx/kU1bPws+V9OlN5OwV5DysiIgdvTWXBmJ3SG3+AnHUFX6brnVmhtmxfhm4nuBQdMBXbRI5BLsnst7jKG/4bYug5FRPe7HkpdjNMMq97Vx1JP8+4Ty/yAu0r8BieuAOOr09MiCsNruvfnJ9mnskIs1FRDeQ46+qNnOl+txsmPrjeyQgTvaBgzF4ZiZRj5AoGCwM8g3T6akHXyC4fXIKPVSDssrFyHtga6PKDNutV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:43:09.0873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 624036e9-a4fd-4fd9-08f7-08deb6867e2e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7221



On 5/20/26 16:55, Shah, Tanmay wrote:
> 
> 
> On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
>>
>>
>> On 5/19/26 19:36, Mathieu Poirier wrote:
>>> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
>>>> 512 bytes isn't always suitable for all case, let firmware
>>>> maker decide the best value from resource table.
>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Test done:
>>>>     - Verify this patch works with the existing firmware
>>>>     - Verify this patch works with the firmware that configures
>>>>       differt tx & rx buf size
>>>>
>>>> Changes in v2:
>>>>     - %s/sbuf_size/tx_buf_size/
>>>>     - %s/rbuf_size/rx_buf_size/
>>>>     - fix typo
>>>>     - do not use ALIGN on buf size, rely on allocator
>>>>     - make err msg more explicit, %s/vdev config:/bad vdev config/
>>>>     - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>>>     - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>>>     - use __virtio32 over __u32
>>>>     - add version field to virtio rpmsg config structure
>>>>     - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>>>
>>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
>>>>    include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>>>    2 files changed, 79 insertions(+), 18 deletions(-)
>>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>
>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>> virtio_rpmsg_bus.c
>>>> index e59d8cf9b975..8116d94413cc 100644
>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> @@ -20,6 +20,7 @@
>>>>    #include <linux/rpmsg.h>
>>>>    #include <linux/rpmsg/byteorder.h>
>>>>    #include <linux/rpmsg/ns.h>
>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>    #include <linux/scatterlist.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/sched.h>
>>>> @@ -39,7 +40,8 @@
>>>>     * @tx_bufs:    kernel address of tx buffers
>>>>     * @num_rx_buf:    total number of buffers for rx
>>>>     * @num_tx_buf:    total number of buffers for tx
>>>> - * @buf_size:    size of one rx or tx buffer
>>>> + * @rx_buf_size: size of one rx buffer
>>>> + * @tx_buf_size: size of one tx buffer
>>>>     * @last_sbuf:    index of last tx buffer used
>>>>     * @bufs_dma:    dma base addr of the buffers
>>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>>        void *rx_bufs, *tx_bufs;
>>>>        unsigned int num_rx_buf;
>>>>        unsigned int num_tx_buf;
>>>> -    unsigned int buf_size;
>>>> +    unsigned int rx_buf_size;
>>>> +    unsigned int tx_buf_size;
>>>>        int last_sbuf;
>>>>        dma_addr_t bufs_dma;
>>>>        struct mutex tx_lock;
>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>>        wait_queue_head_t sendq;
>>>>    };
>>>>    -/* The feature bitmap for virtio rpmsg */
>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>> notifications */
>>>> -
>>>>    /**
>>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>>     * @src: source address
>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>>>     * processor.
>>>>     */
>>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>>      /*
>>>>     * Local addresses are dynamically allocated on-demand.
>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>>>          /* either pick the next unused tx buffer */
>>>>        if (vrp->last_sbuf < vrp->num_tx_buf)
>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>>>        /* or recycle a used one */
>>>>        else
>>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>> rpmsg_device *rpdev,
>>>>         * messaging), or to improve the buffer allocator, to support
>>>>         * variable-length buffer sizes.
>>>>         */
>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>>            return -EMSGSIZE;
>>>>        }
>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>> rpmsg_endpoint *ept)
>>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>>        struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>    }
>>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>> device *dev,
>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>> *vrp, struct device *dev,
>>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>>         * the reported payload length.
>>>>         */
>>>> -    if (len > vrp->buf_size ||
>>>> +    if (len > vrp->rx_buf_size ||
>>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>> msg_len);
>>>>            return -EINVAL;
>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>> *vrp, struct device *dev,
>>>>            dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>>>          /* publish the real size of the buffer */
>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>          /* add the buffer back to the remote processor's virtqueue */
>>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>        int err = 0, i;
>>>>        size_t total_buf_space;
>>>>        bool notify;
>>>> +    u16 version;
>>>>          vrp = kzalloc_obj(*vrp);
>>>>        if (!vrp)
>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>        else
>>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>> +    /*
>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>>>> +     * size from virtio device config space from the resource table.
>>>> +     * If the feature is not supported, then assign default buf size.
>>>> +     */
>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>>> +        /* note: virtio_rpmsg_config is defined from remote view */
>>>> +        version = 0;
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 version, &version);
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 txbuf_size, &vrp->rx_buf_size);
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>>> +
>>>
>>> A check is also needed to make sure the version received from the
>>> resource table
>>> is '0'.
> 
> I think we should start with versaion = 1. So, can I check the version
> number for 1 ?
> 
>>>
>>>> +        /* The buffers must hold at least the rpmsg header */
>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>>> +            dev_err(&vdev->dev,
>>>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
>>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>>> +            err = -EINVAL;
>>>> +            goto vqs_del;
>>>> +        }
>>>> +
>>>> +        dev_dbg(&vdev->dev,
>>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>>>> 0x%x\n",
>>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>>>> +    } else {
>>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>> +    }
>>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>> buf_size;
>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>          /* allocate coherent memory for the buffers */
>>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>        vrp->rx_bufs = bufs_va;
>>>>          /* and second part is dedicated for TX */
>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>>          /* set up the receive buffers */
>>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>            struct scatterlist sg;
>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>                          GFP_KERNEL);
>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
>>>> *dev, void *data)
>>>>    static void rpmsg_remove(struct virtio_device *vdev)
>>>>    {
>>>>        struct virtproc_info *vrp = vdev->priv;
>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>        int ret;
>>>>          virtio_reset_device(vdev);
>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>>>      static unsigned int features[] = {
>>>>        VIRTIO_RPMSG_F_NS,
>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>    };
>>>>      static struct virtio_driver virtio_ipc_driver = {
>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
>>>> rpmsg/virtio_rpmsg.h
>>>> new file mode 100644
>>>> index 000000000000..285918be68b9
>>>> --- /dev/null
>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>> @@ -0,0 +1,27 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (C) Pinecone Inc. 2019
>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>> +
>>>> +#include <linux/types.h>
>>>> +#include <linux/virtio_types.h>
>>>> +
>>>> +/* The feature bitmap for virtio rpmsg */
>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>> notifications */
>>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>>>> space */
>>>> +
>>>> +struct virtio_rpmsg_config {
>>>> +    __virtio16 version;
>>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>> +    __virtio32 txbuf_size;
>>>> +    __virtio32 rxbuf_size;
>>>> +    __virtio32 reserved[14]; /* Reserve for the future use */
>>>
>>> 66 byte for the configuratio space?  I'm puzzled about the
>>> reserved[14], how did
>>> you come up with that number?
> 
> I kept the reserved bytes from the original series as it is. The
> original series did not contain version field. With version I don't
> think we need reserved field at all. At best, if we want to append
> padding bytes, then I think __virtio16 reserved; makes sense. That will
> make the structure aligned to 4 byte.
> 
>>
>> Is it useful to define the reserved field?
> 
> I think reserved field is only useful to keep the structure size aligned
> to 4 bytes.
> 
>> The version should allow us to determine the content.
> 
> Correct, but I think the structure can be aligned if used correct
> reserved bytes.
> 
>> An other solution is to introduce a'size' field to determine the size of
>> the structure:
> 
> I think, the resource table already contains config_len field which is
> size of the structure:
> 
> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/remoteproc.h#L275


The resource table is the solution for the remoteproc virtio backend, 
The solution should be able to work with some other virtio backends.
In such case we can not rely on the resource table.

The resource table is a solution for the remoteproc virtio backend. 
However, the solution should also be able to work with other virtio 
backends.
In that case, it may not be possible to rely on the resource table.

Regards,
Arnaud

> 
>> struct virtio_rpmsg_config {
>>      __virtio16 version;
>>      __virtio16 size; /* size of the configuration space */
>>      /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>      __virtio32 txbuf_size;
>>      __virtio32 rxbuf_size;
>>      __u8 private[0]; /* customized config */
> 
> Do we need customized config? I think I should remove this comment from
> the original patch as well.
> 
> Thanks,
> Tanmay
> 
>> };
>>
>>>
>>> The rest looks good to me.
>>>
>>
>> Looks good to me too.
>>
>> Thanks,
>> Arnaud
>>
>>>> +    /* Put the customize config here */
>>>> +} __packed;
>>>> +
>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>> -- 
>>>> 2.34.1
>>>>
>>
> 

