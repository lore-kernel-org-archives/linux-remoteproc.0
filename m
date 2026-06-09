Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8AA4C957B;
	Tue,  9 Jun 2026 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026444; cv=fail; b=Ripp8LLn/4Zu0WtTJtxJRcJ9pJ4UiWsWLDffXpMEwsWaqTdJFjxFcJxrbYmx+f76IPwoewpWKYyXQfbWtYxw5juKnjK+JVRaadszgD76uWkPP73Eexx92yBpmkljp6A/nR2VpWdrmyDDTHUdVpvYbzXMZaFg278+KUUOXln4YII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026444; c=relaxed/simple;
	bh=ZdirwuG6paClzO8eE3OhxVtDxnlFQWWsTOu3r2Yorno=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CQ3n6/Yw6CnP9sL/GOVTYeuPLyfH6agZHbzBrlbBkRZ0NsM6PxKm6RYVvlVvkHA705xjvNwYaRRMMXxuM+E9MA/1SWHOjrcUGmZvZb0v6MYl67LKNETXUlBma8vfhJFMMapMMc28Fw/sEWfF6m7yRg0DgPQgLLSmZdMkDzQYzpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XKzZ4wih; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XKzZ4wih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtgAwv0iD04+8wuSAqFtfIf1emxYde4bD0gp1Whilmzt7iTSXCXohu/extbJG98pjvupFC3wNA758VWzKWXkoF3LIX2SrHDtXEzIR0hxZpAdZlHtSTmpUcDEnZc0++qoLAR6eLUjX8noX1fXMEcZNyPcoTJPYOlLAHO7tHSeYZUR2nocWYABITwCc+Os6LTX13iTm/hgNOHcDYGslUBHH8C+mSnOs/oQGcvbZMnMLKOOivihwX/O4Zjw4FMYApw25+RuZcw+BLqexmcrkuJDBJ/GdEDuGm73XuWk8bxps2XmtLB68f/SFtQtRTUfKm8zZ48B+p0LP7cKEz/1SRz9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGh95Zii4vGElCGPiJGmVZEsV6wicqrkmou0d2xx7cg=;
 b=dLett5sUvpUcUDgQUyTu9NQTyei3Gfhs63ROGeUOr6n1kPShJc41o9nZv6zVNxU7M1Oe8nk53GNQr7ZWYX+ud1OiMSxwcl/7/LOvdiWJmcEN5LDaEN1xXyWcYP02APyR7fMCkp1DTEj8Jkzd+huhgeyAEMYo6Lh1IiBeM1xfFlayujdc9CxudmS99KTJvKgPZQQBPVkB2JLmnr6yqrNkOX0dsTse+vhVcQgc+h2LjQCcgij5p3cdW/N1XJulCXB9Zxv08hdipuk9tp0gysk9anxB4C+UnpgijRVwnFM3jLTmBjlC0PKctKd7Cg776LOE8oWsVCnHYrrrQklhvC/dtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGh95Zii4vGElCGPiJGmVZEsV6wicqrkmou0d2xx7cg=;
 b=XKzZ4wih2gbCn1qurG+kf6RZZtBgr31yeCmKpibi1LdbJXg/pW5Q7Rb6K3YhymN1stxGxjJ0GweJc5+MHGgFyFg6Itz9h5j55fmahO1ZnRv9/sw2KGO4WxTMYzW6UaklZ6NyIm4FOp8QrIi9/X+bQmN4X5JhU8Kd5trXzLkxplY=
Received: from SN7PR04CA0003.namprd04.prod.outlook.com (2603:10b6:806:f2::8)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Tue, 9 Jun 2026
 17:33:49 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:806:f2:cafe::27) by SN7PR04CA0003.outlook.office365.com
 (2603:10b6:806:f2::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Tue, 9
 Jun 2026 17:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 17:33:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 12:33:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 12:33:48 -0500
Received: from [172.31.11.23] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 9 Jun 2026 12:33:47 -0500
Message-ID: <ccf95382-f219-45ed-8880-38166ab1f66f@amd.com>
Date: Tue, 9 Jun 2026 12:33:47 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v3 3/4] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <tanmay.shah@amd.com>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-4-tanmay.shah@amd.com>
 <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
 <8d59e741-4cfa-4042-bd45-35838641aa31@amd.com>
 <b87ceda3-a021-46e3-83d2-d4e6207142fd@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <b87ceda3-a021-46e3-83d2-d4e6207142fd@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: b33b88d2-dbb5-4a7d-3cef-08dec64d4411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|11063799006|4143699003|56012099006|3023799007|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	wPakKi/ygMVPtzAPl9x6KMITjtEOdjO5RKSBCr8i6WBY+VIF7rEZxEFBFhJGJ1QAA36UvQyGc2JSKD019zEP1mHDrl4kQWQzdZrPR+5iVDZo3JMSk02dXaT9b2a/QNtfmofTzZ0uw4FflApm0PNo91tU/FoSz7+PYgnqVYWZKK2gpl0Bw/IpRa8LqHPtOKQBhr31eTYHjR039fqmeDbuzoftV3KW8zgjgWkm6siAsRfOgNyKYfpX9aJgcykNSe4JAyZmszLT0hUabNcqmcrUkC9IeHPpnypIZ731FLRfhgddkqAMV/6tuDB0Fb9JQmqzKW4FVTFDo3RtQEITReNKcWO5KQIMMi0WoPFy+vGMeeUzXgpaAxP3/wZaatUjIZbG05cbZlLhyvqg50x4wwDVeOhOaIsmOBKa1QmC8VYX81WOqxXCNRlf2B/TsUC3UvQEwrOMdlOh1BeqoQgPqMINy5sWphhTt29oWplelp2FZMCMoAvXxudlKISjzqxvBPLze8tTLwBxAYWIs7hT4Hptvlwo76DEgFzJyfKpbdkD5od2cw78qmMstHe5lmJbknmFVESY7v5Sk2vgSEj0WwYJyw73F3nUP6W8AUM9U2e2MhroxapO3I+Up/QQYYFgi5b+GznIj4AsujMx4opw84DHRd5zTdqVdYKNAZ5aPs+kzxX+BRQI9Kzvzkaxf0MQj2Jz2xH33dvVILq3Ri/ORWA8eWLnmbXkqmS6w8IuqWdYvsY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CxCoN0Nw2qvm+5gi8/V55I8zoT5SHhKUCclYQCQrEl1iO6ooiFhyi4ry+9SL4bBJ4VzKUXAe/77L8bkz47OR5pU0K0z8dNoah0NU0bi6rpnU9a8QWVX4MBwl390VzUbJP6IXLOwpe7hD1s7KlSmXNHSqBV0GCkJu+9VozIVS3X5KBlVd8BT4gj2tlQ9cXntWZKTzmnCvgzbDSeJs0v/6mx50v7c1RV5pGt+B595MqaHaIT9KDNDaY5zcKluFYso89x67qn0LaPDw4wk35c2kjPc31hxoZwVqT/+uVXoC0vkuOVTdtYBJOz64Z97kAcY4BV41c0EMxFsr89xw29qq2CP1PxKHdlCnH2m4K9gppxgIJAhRIi1p+CADcN1sTDOdMtUM7fI09KduyfNI6jgse6HAyEQa522C/luHVxkCSeJdTG3z4EBu1PrJcxJD47CZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 17:33:48.9328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b33b88d2-dbb5-4a7d-3cef-08dec64d4411
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755



On 6/5/2026 3:25 AM, Arnaud POULIQUEN wrote:
> Hi Tanmay,
> 
> On 6/4/26 22:31, Shah, Tanmay wrote:
>> Thank You for the reviews, please find my comments below:
>>
>> On 6/2/2026 3:25 AM, Arnaud POULIQUEN wrote:
>>> Hi Tanmay,
>>>
>>> On 5/29/26 18:43, Tanmay Shah wrote:
>>>> 512 bytes isn't always suitable for all case, let firmware
>>>> maker decide the best value from resource table.
>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>
>>>> Changes in v3:
>>>>     - change version field from u16 to u8
>>>>     - introduce size field in the rpmsg_virtio_config structure
>>>>     - check version field is set to any non-zero value.
>>>>     - check size field is not 0.
>>>>     - Remove field for private config, as not needed for now.
>>>>     - add documentation of rpmsg_virtio_config structure
>>>>
>>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 90 +++++++++++++++++++++++
>>>> +------
>>>>    include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
>>>>    2 files changed, 106 insertions(+), 18 deletions(-)
>>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>
>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>> virtio_rpmsg_bus.c
>>>> index 99df1ae07055..f1ab8e792f3d 100644
>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>> @@ -20,6 +20,7 @@
>>>>    #include <linux/rpmsg.h>
>>>>    #include <linux/rpmsg/byteorder.h>
>>>>    #include <linux/rpmsg/ns.h>
>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>    #include <linux/scatterlist.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/sched.h>
>>>> @@ -39,7 +40,8 @@
>>>>     * @tx_bufs:    kernel address of tx buffers
>>>>     * @num_rx_buf: total number of rx buffers
>>>>     * @num_tx_buf: total number of tx buffers
>>>> - * @buf_size:   size of one rx or tx buffer
>>>> + * @rx_buf_size: size of one rx buffer
>>>> + * @tx_buf_size: size of one tx buffer
>>>>     * @last_tx_buf: index of last tx buffer used
>>>>     * @bufs_dma:    dma base addr of the buffers
>>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent
>>>> senders.
>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>>        void *rx_bufs, *tx_bufs;
>>>>        unsigned int num_rx_buf;
>>>>        unsigned int num_tx_buf;
>>>> -    unsigned int buf_size;
>>>> +    unsigned int rx_buf_size;
>>>> +    unsigned int tx_buf_size;
>>>>        int last_tx_buf;
>>>>        dma_addr_t bufs_dma;
>>>>        struct mutex tx_lock;
>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>>        wait_queue_head_t sendq;
>>>>    };
>>>>    -/* The feature bitmap for virtio rpmsg */
>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>> notifications */
>>>> -
>>>>    /**
>>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>>     * @src: source address
>>>> @@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
>>>>     * processor.
>>>>     */
>>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>> +
>>>> +#define RPMSG_VDEV_CONFIG_VER 1
>>>
>>> I would rename it
>>>
>>> #define RPMSG_VDEV_CONFIG_V1 1
>>
>> We might not need this define at all. I should have removed it in this
>> patch. Please see below [1].
>>
>>>
>>>>      /*
>>>>     * Local addresses are dynamically allocated on-demand.
>>>> @@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info
>>>> *vrp)
>>>>          /* either pick the next unused tx buffer */
>>>>        if (vrp->last_tx_buf < vrp->num_tx_buf)
>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>>>        /* or recycle a used one */
>>>>        else
>>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>>> @@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>> rpmsg_device *rpdev,
>>>>         * messaging), or to improve the buffer allocator, to support
>>>>         * variable-length buffer sizes.
>>>>         */
>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>>            return -EMSGSIZE;
>>>>        }
>>>> @@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>> rpmsg_endpoint *ept)
>>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>>        struct virtio_rpmsg_channel *vch =
>>>> to_virtio_rpmsg_channel(rpdev);
>>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>    }
>>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>> device *dev,
>>>> @@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>> *vrp, struct device *dev,
>>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>>         * the reported payload length.
>>>>         */
>>>> -    if (len > vrp->buf_size ||
>>>> +    if (len > vrp->rx_buf_size ||
>>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>> msg_len);
>>>>            return -EINVAL;
>>>> @@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>> *vrp, struct device *dev,
>>>>            dev_warn_ratelimited(dev, "msg received with no
>>>> recipient\n");
>>>>          /* publish the real size of the buffer */
>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>          /* add the buffer back to the remote processor's virtqueue */
>>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>> @@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>        int err = 0, i;
>>>>        size_t total_buf_space;
>>>>        bool notify;
>>>> +    u8 version;
>>>> +    u16 size;
>>>>          vrp = kzalloc_obj(*vrp);
>>>>        if (!vrp)
>>>> @@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>        else
>>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>> +    /*
>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure
>>>> buf
>>>> +     * size from virtio device config space from the resource table.
>>>> +     * If the feature is not supported, then assign default buf size.
>>>> +     */
>>>
>>> Seems to me that It would be nice to document the config space in
>>> rpmsg.rst
>>>
>>
>> Ack.
>>
>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 version, &version);
>>>> +        if (version == 0) {
>>>
>>>          if (version != RPMSG_VDEV_CONFIG_V1) {
>>>
>>
>> [1] Here we have to allow any non-zero version to be valid, and make
>> sure any future version is always backward compatible.
>>
>> For example, if we need v2 of the structure, then that should be
>> compatible with v1. So, old kernel keeps working with the new firmware
>> with limited functionality supported by the kernel. And new kernel keep
>> working with the old firmware, with the limited functionality supported
>> by the firmware.
>>
>> That is just my view. I am open to more ideas, thank you.
> 
> My concern is that you allow any version here, while we define only a V1.
> If we need a V2 we will probably have to modify this part of the code.
> 

So that means, the firmware that has v2, will never work with the old
kernel that supports only v1. I would like to design in a way, where
firmware has v2, but it is back compatible with v1. New firmware can
still work with old kernel with only functionality that was supported in
v1.

Mathieu do you have any opinion on this? I don't know if there is any
standard accepted design pattern for this type of compatibility.


use  | Linux  | firmware |
case | kernel | version  |  Note    |
     |        |          |          |
  1  |    v1  |    v1    |   works  |
  2  |    v2  |    v1    |  old firmware features work.
  3  |    v1  |    v2    |  new firmware features won't work.

In use-case 3, Do we want to fail completely and say old Linux will not
support new firmware at all ?

Thanks,
Tanmay


>>
>>>> +            dev_err(&vdev->dev, "invalid version of vdev config\n");
>>>> +            err = -EINVAL;
>>>> +            goto vqs_del;
>>>> +        }
>>>> +
>>>> +        /*
>>>> +         * The size field is not used for the remoteproc virtio
>>>> transport,
>>>> +         * but kept for any future transport to use
>>>> +         */
>>>
>>> I suggest to not mention the virtio transport, indeed we should decouple
>>> the virtio device from the virtio transport.
>>>
>>
>> Ack.
>>
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 size, &size);
>>>> +        if (size == 0) {
>>>
>>>      if (size != sizeof(virtio_rpmsg_config)) {
>>>
>>
>> So, I think sizeof(virtio_rpmsg_config) on the remote side may not be
>> the same as in the linux kernel. Remote side can have its private
>> variables which might not needed on the linux side:
>>
>> For example, the open-amp library defines the structure differently than
>> linux:
>> https://github.com/OpenAMP/open-amp/
>> blob/23d4c5d7a5c5dd08b74d4ba828243988592337cb/lib/include/openamp/
>> rpmsg_virtio.h#L70
>>
>> There is 'split_shpool' extra variable which is not needed by the linux.
> 
> The 'split_shpool' setting is currently an internal OpenAMP configuration
> and is not part of a configuration space. If there is a need to split
> memory regions for RX and TX buffers, the implementation should use another
> method, perhaps with DA and PA addresses that specify the RX and TX buffer
> locations, as for the vrings in the resource table.
> I would suggest to not address this in version 1.
> 
> From my perspective, the configuration space is a common structure that
> the device and the driver share. In that case, checking the size makes
> sense.

Ack.

> Thanks,
> Arnaud
> 
>>
>> That is why restriction on the size isn't needed IMHO.
>>
>>>> +            dev_err(&vdev->dev, "invalid size of vdev config\n");
>>>> +            err = -EINVAL;
>>>> +            goto vqs_del;
>>>> +        }
>>>> +
>>>> +        /* note: tx and rx are defined from remote view */
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 txbuf_size, &vrp->rx_buf_size);
>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>>
>>> I wonder if we should not impose a size aligned on 64-bits
>>>
>>
>> I think you mean size should be aligned to 64-bits.
>> Ack for that.
>>
>>>> +
>>>> +        /* The buffers must hold at least the rpmsg header */
>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>>> +            dev_err(&vdev->dev,
>>>> +                "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
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
>>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>> buf_size;
>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>          /* allocate coherent memory for the buffers */
>>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>> @@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device
>>>> *vdev)
>>>>        vrp->rx_bufs = bufs_va;
>>>>          /* and second part is dedicated for TX */
>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>
>>>
>>> We should have a cache or 64-bit alignement here. or perhaps such
>>> constraints should be specified in the config space?
>>>
>>
>> I prefer to specify in the config space.
>>
>>>>          /* set up the receive buffers */
>>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>            struct scatterlist sg;
>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>                          GFP_KERNEL);
>>>> @@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device
>>>> *dev, void *data)
>>>>    static void rpmsg_remove(struct virtio_device *vdev)
>>>>    {
>>>>        struct virtproc_info *vrp = vdev->priv;
>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>        int ret;
>>>>          virtio_reset_device(vdev);
>>>> @@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
>>>>      static unsigned int features[] = {
>>>>        VIRTIO_RPMSG_F_NS,
>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>    };
>>>>      static struct virtio_driver virtio_ipc_driver = {
>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
>>>> virtio_rpmsg.h
>>>> new file mode 100644
>>>> index 000000000000..77a530514d86
>>>> --- /dev/null
>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>> @@ -0,0 +1,34 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * Copyright (C) Pinecone Inc. 2019
>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>>
>>> No year specified for AMD copyright?
>>
>> Ack, will fix.
>>
>>>
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
>>>> +/**
>>>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>>>> + *
>>>> + * @version: version of this structure. current version is 1.
>>>> + * @size:    size of this structure. unused for the remoteproc virtio
>>>> backend.
>>>
>>> reference to remoteproc to remove
>>>
>>
>> Ack.
>>
>>>> + * @txbuf_size: Tx buf size from remote's view. For Linux this is rx
>>>> buf size.
>>>> + * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx
>>>> buf size.
>>>> + */
>>>> +struct virtio_rpmsg_config {
>>>> +    u8 version;
>>>> +    __virtio16 size;
>>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>> +    __virtio32 txbuf_size;
>>>> +    __virtio32 rxbuf_size;
>>>> +} __packed;
>>>
>>>
>>> As mentioned above
>>> - The size should be be a multiple of four to ensure 64-bit alignment.

Here, do you mean to document that size should be a multiple of 4 ? How
to enforce the alignment to 4? We can only document right?

Thanks,
Tanmay

>>> - I would add an alignment field to align the address of the TX buffers
>>> to the cache line.
>>>
>>
>> Ok, I will change and test.
>>
>>> Thanks,
>>> Arnaud
>>>
>>>
>>>> +
>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>
>>
> 

