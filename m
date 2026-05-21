Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB81A267;
	Thu, 21 May 2026 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376088; cv=fail; b=Cg9EoN2YUx/lxVn3hUAyq72B8TsRZhILWVWNTvPS6HXrRBTLyE0w0q3GW21WSgkShf06fceHlTZiI6dKh9fMn/iQmR0EviCOW7pHiHfZ9f8pFN76P5glVb+VNaHcQulKG6DEbw/QWX1RBi0B5MyB7NiZ0hDTwoPJ9fq8nbNY/oE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376088; c=relaxed/simple;
	bh=npZrRLVqlpmirFKB9VgaD9LKLTYik1bzl//+xPgqLms=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aeQl4X42Oahv6YQTWfla0AFgZtNLIJpw9+tWy4/znxRZq9coZ7omVCn9TL5QbtB0ic5+0kxSqyFXjb4PGt4KfobIPuT8pwh2/Oo9Noe/nwhOCccUryG+EtKnnDCaejuZpFB6W78AUAjzPaQ3mYe0pGBvNZj2RO1CTbQuYOWPHZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3KiJmk35; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3KiJmk35"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzI+68j1ipafBFKIyWgoqs1ZplUaIj19nt3prHVQGCp33U5QYULM4xLnt+MRskovHQWdEMhkKQG/SVckYPeqojQqakKJkc+9d0Vix0vSpcCqx7ueHqea0wHaUbdx33PqwNkr5WR30XV9Ir8/7XM/AcDV1lkP9x9Bl4kQXYax0AjZ/Rv7QbSmOISiLXgdbCYf0uM7aPpXCZZBX7VF4eEHMaZU8Phd0GV2gcV2B60oYFJU1UqBxeuGfmJ9lBy/N3lNXQ157hug1WmUmpY41dhHLlCPAgYPKliPp8pg73uEc3nbbxwhsuoYTxdzYr/LC7/HkYQfF6qVscG0fk9HbzZmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qXo3Qu4mREEexWpRoffse6LCuyYavtQPfECrS47cDE=;
 b=eLifUw0TDxhjdPx1T3LoaiDEHKR0uGbTmF+B1uznZVRnNTFelKArdBnDxRWZ8GJ6irBWQq67ep3Pp1XfSwFdQH+TjNTfVpvHY2zgES5p/A4XGEJUZSjs3QVryihGbUbEV3t0j5XG8Rof0jL+RfPIa7AwMmb7ZjZ8ii/+v/MFFSSJxOXqTR5EirInQxTVAQfU3fVTvAiXIMtDNwANNlW5X4TgvzpS1388V+JEZk6Awg1L8zfRFK9wq7pYOCasZVKWyCyRVb/ScfiWYE93Ez1IGuVs7QrzruQ/ZvBJhHNc0PKhUN/VuL1yaD2WY/zmAgFXMCHLqEZyhZhzjurYw2t97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qXo3Qu4mREEexWpRoffse6LCuyYavtQPfECrS47cDE=;
 b=3KiJmk35tMS2wl5Ov3q7CGFJ9LEFE6e4qy5rOLq1Yq8MpZ3Ismd+z1Tx7zSHw1uC29sRt0wi5/G6ETN9k/A0AQIcGT5q6mSwzZu8qIsdudz1Pz1lqlSMGARtoGhWrOIzVhmSp+qrjJsXFFLFhMhgDpvQhj8PYB2AV7rk/atEC/M=
Received: from BY3PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:39b::12)
 by SJ2PR12MB8808.namprd12.prod.outlook.com (2603:10b6:a03:4d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 15:07:59 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::21) by BY3PR05CA0037.outlook.office365.com
 (2603:10b6:a03:39b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.6 via Frontend Transport; Thu, 21
 May 2026 15:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 15:07:58 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 10:07:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 10:07:57 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 10:07:57 -0500
Message-ID: <649f461a-58ff-4246-8839-e0c852be2931@amd.com>
Date: Thu, 21 May 2026 10:07:56 -0500
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
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, <tanmay.shah@amd.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com> <agyfr-pxwQ4oKMAF@p14s>
 <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com>
 <e9b697dc-52b8-482a-8d54-da3c4700f049@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <e9b697dc-52b8-482a-8d54-da3c4700f049@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|SJ2PR12MB8808:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5befb7-7336-450c-5434-08deb74abeb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|6133799003|11063799006|4143699003|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hlqrSTMtBhAFe9rnspQnbV8BaZ1wQ5Xql/+UyPZAw2abnp/x49j/wxaUHBmXJ5IusBM0rH3bF5tCaBO6nZkDTLzvyoy8999xFTb4a6gTB30xYwFQK8qbaME8FnFnyqIN6pyvNppxSx8PUIvpJGkTwZWmP7FRckBcoke1drVDI3LcZwm1Os/U+Ol+Q5qpIufpoxNVarIzTw+Tyjh+owzW5S46SeY7ReqMnbkir4YLudl3bC6Wg6zS1BOhXP+xqLAD5NjvmmJtZoAubRBR6tMoblXbBTnx1ubQlSftvfBqnkqfNH68CmCZmDbEdckMACFXMsQbINri6nLovMkqmhprE1qxD/VVnnJ3c9wtYgY2o0Esgzbe3nWagZoxGjBnCvgB8yQ5v+Io1zuwhGsTZ0F7fEnhFlBjKu5qxCQI2M9/AUyZ+K9Cc1U0wfmD11f+5Qc8MlrghY+sWXrQXtbLIgPUdwuLKZoOH8IGS4dSOHydVPB/sgdh3VJxXy5YD8HdGIHNMx3JIo74UqbKuNqmMFSSZgJ2iN/qJuMVdx9jRGgj97jnc5RvjCy5A64Q92sYVYPGti7DFRvtkD/Ubqtibd+CYpTma0hoxosHl1wJSD0jH6JOeKVv6/tJbEKtbFu5ogi4TUuxeCFk1daN0oXIyFEhGIeEJgxdrwV2r/Z9CJuwZTxjJvYDgila6Uv9GYF7e+BM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(6133799003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HF2m5FxLbEJTnZ8cqdz9EZqAYg9y/gbVDz/grRlsmQDsGugiuinM0Q1XIjCSfYKsLBdXu1BszOD9aFSjVfYtJyTfd3m1coMInjtfnMsMHGLSjQNFpTPBKIGFtt/N2pBMlMyDmZmT12dPSe/p3zM/5yXWJbFOsf/Aqy3DqAN29psJ184EFNR9GH3TQvFIdfA+mvy622/OEMqe3HB70agZSB6j6Gob3bm4KdEvap7ptOEwTvzIakMmM7+5S/Rk+i9V/n6hpfoCE6M0ygiKCzSMRI+0Wn3+8DTywpvEiVdAlnK4dfDde2+hcgFs6I+nVVNrBm80aEprjtlivty/N0Om7ODTjlBOULHYJb4pjXqcPVZ34cHESh/jca2mDNGQXn2PkTBijeHeJ8+Jo8ZO63/1nTpORot6ZpL9PpKbPr+3AG5NSLsJjgA95nS1uB/+AxwZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 15:07:58.7042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5befb7-7336-450c-5434-08deb74abeb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8808



On 5/20/2026 10:43 AM, Arnaud POULIQUEN wrote:
> 
> 
> On 5/20/26 16:55, Shah, Tanmay wrote:
>>
>>
>> On 5/20/2026 2:44 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 5/19/26 19:36, Mathieu Poirier wrote:
>>>> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
>>>>> 512 bytes isn't always suitable for all case, let firmware
>>>>> maker decide the best value from resource table.
>>>>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>>>>
>>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>>> ---
>>>>>
>>>>> Test done:
>>>>>     - Verify this patch works with the existing firmware
>>>>>     - Verify this patch works with the firmware that configures
>>>>>       differt tx & rx buf size
>>>>>
>>>>> Changes in v2:
>>>>>     - %s/sbuf_size/tx_buf_size/
>>>>>     - %s/rbuf_size/rx_buf_size/
>>>>>     - fix typo
>>>>>     - do not use ALIGN on buf size, rely on allocator
>>>>>     - make err msg more explicit, %s/vdev config:/bad vdev config/
>>>>>     - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>>>>     - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>>>>     - use __virtio32 over __u32
>>>>>     - add version field to virtio rpmsg config structure
>>>>>     - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>>>>
>>>>>    drivers/rpmsg/virtio_rpmsg_bus.c   | 70 +++++++++++++++++++++
>>>>> +--------
>>>>>    include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>>>>    2 files changed, 79 insertions(+), 18 deletions(-)
>>>>>    create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>>
>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>>> virtio_rpmsg_bus.c
>>>>> index e59d8cf9b975..8116d94413cc 100644
>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>> @@ -20,6 +20,7 @@
>>>>>    #include <linux/rpmsg.h>
>>>>>    #include <linux/rpmsg/byteorder.h>
>>>>>    #include <linux/rpmsg/ns.h>
>>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>>    #include <linux/scatterlist.h>
>>>>>    #include <linux/slab.h>
>>>>>    #include <linux/sched.h>
>>>>> @@ -39,7 +40,8 @@
>>>>>     * @tx_bufs:    kernel address of tx buffers
>>>>>     * @num_rx_buf:    total number of buffers for rx
>>>>>     * @num_tx_buf:    total number of buffers for tx
>>>>> - * @buf_size:    size of one rx or tx buffer
>>>>> + * @rx_buf_size: size of one rx buffer
>>>>> + * @tx_buf_size: size of one tx buffer
>>>>>     * @last_sbuf:    index of last tx buffer used
>>>>>     * @bufs_dma:    dma base addr of the buffers
>>>>>     * @tx_lock:    protects svq and tx_bufs, to allow concurrent
>>>>> senders.
>>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>>>        void *rx_bufs, *tx_bufs;
>>>>>        unsigned int num_rx_buf;
>>>>>        unsigned int num_tx_buf;
>>>>> -    unsigned int buf_size;
>>>>> +    unsigned int rx_buf_size;
>>>>> +    unsigned int tx_buf_size;
>>>>>        int last_sbuf;
>>>>>        dma_addr_t bufs_dma;
>>>>>        struct mutex tx_lock;
>>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>>>        wait_queue_head_t sendq;
>>>>>    };
>>>>>    -/* The feature bitmap for virtio rpmsg */
>>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>> notifications */
>>>>> -
>>>>>    /**
>>>>>     * struct rpmsg_hdr - common header for all rpmsg messages
>>>>>     * @src: source address
>>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>>>>     * processor.
>>>>>     */
>>>>>    #define MAX_RPMSG_NUM_BUFS    (256)
>>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>>>      /*
>>>>>     * Local addresses are dynamically allocated on-demand.
>>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info
>>>>> *vrp)
>>>>>          /* either pick the next unused tx buffer */
>>>>>        if (vrp->last_sbuf < vrp->num_tx_buf)
>>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>>>>        /* or recycle a used one */
>>>>>        else
>>>>>            ret = virtqueue_get_buf(vrp->svq, &len);
>>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>>> rpmsg_device *rpdev,
>>>>>         * messaging), or to improve the buffer allocator, to support
>>>>>         * variable-length buffer sizes.
>>>>>         */
>>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>            dev_err(dev, "message is too big (%d)\n", len);
>>>>>            return -EMSGSIZE;
>>>>>        }
>>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>>> rpmsg_endpoint *ept)
>>>>>        struct rpmsg_device *rpdev = ept->rpdev;
>>>>>        struct virtio_rpmsg_channel *vch =
>>>>> to_virtio_rpmsg_channel(rpdev);
>>>>>    -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>>    }
>>>>>      static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>>> device *dev,
>>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>> *vrp, struct device *dev,
>>>>>         * We currently use fixed-sized buffers, so trivially sanitize
>>>>>         * the reported payload length.
>>>>>         */
>>>>> -    if (len > vrp->buf_size ||
>>>>> +    if (len > vrp->rx_buf_size ||
>>>>>            msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>>            dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>>> msg_len);
>>>>>            return -EINVAL;
>>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>> *vrp, struct device *dev,
>>>>>            dev_warn_ratelimited(dev, "msg received with no
>>>>> recipient\n");
>>>>>          /* publish the real size of the buffer */
>>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>>          /* add the buffer back to the remote processor's virtqueue */
>>>>>        err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>        int err = 0, i;
>>>>>        size_t total_buf_space;
>>>>>        bool notify;
>>>>> +    u16 version;
>>>>>          vrp = kzalloc_obj(*vrp);
>>>>>        if (!vrp)
>>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device
>>>>> *vdev)
>>>>>        else
>>>>>            vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>>    -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>>> +    /*
>>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then
>>>>> configure buf
>>>>> +     * size from virtio device config space from the resource table.
>>>>> +     * If the feature is not supported, then assign default buf size.
>>>>> +     */
>>>>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>>>>> +        /* note: virtio_rpmsg_config is defined from remote view */
>>>>> +        version = 0;
>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>> +                 version, &version);
>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>> +                 txbuf_size, &vrp->rx_buf_size);
>>>>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>>>>> +                 rxbuf_size, &vrp->tx_buf_size);
>>>>> +
>>>>
>>>> A check is also needed to make sure the version received from the
>>>> resource table
>>>> is '0'.
>>
>> I think we should start with versaion = 1. So, can I check the version
>> number for 1 ?
>>
>>>>
>>>>> +        /* The buffers must hold at least the rpmsg header */
>>>>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>>>>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>>>>> +            dev_err(&vdev->dev,
>>>>> +                "bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
>>>>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>>>>> +            err = -EINVAL;
>>>>> +            goto vqs_del;
>>>>> +        }
>>>>> +
>>>>> +        dev_dbg(&vdev->dev,
>>>>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>>>>> 0x%x\n",
>>>>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>>>>> +    } else {
>>>>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>>>>> +    }
>>>>>    -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>>> buf_size;
>>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>          /* allocate coherent memory for the buffers */
>>>>>        bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device
>>>>> *vdev)
>>>>>        vrp->rx_bufs = bufs_va;
>>>>>          /* and second part is dedicated for TX */
>>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>>>          /* set up the receive buffers */
>>>>>        for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>>            struct scatterlist sg;
>>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>>    -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>>              err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>>                          GFP_KERNEL);
>>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
>>>>> *dev, void *data)
>>>>>    static void rpmsg_remove(struct virtio_device *vdev)
>>>>>    {
>>>>>        struct virtproc_info *vrp = vdev->priv;
>>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>        int ret;
>>>>>          virtio_reset_device(vdev);
>>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>>>>      static unsigned int features[] = {
>>>>>        VIRTIO_RPMSG_F_NS,
>>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>>    };
>>>>>      static struct virtio_driver virtio_ipc_driver = {
>>>>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/
>>>>> rpmsg/virtio_rpmsg.h
>>>>> new file mode 100644
>>>>> index 000000000000..285918be68b9
>>>>> --- /dev/null
>>>>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>>>>> @@ -0,0 +1,27 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/*
>>>>> + * Copyright (C) Pinecone Inc. 2019
>>>>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>>>>> + * Copyright (C) Advanced Micro Devices, Inc.
>>>>> + */
>>>>> +
>>>>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>>>>> +#define _LINUX_VIRTIO_RPMSG_H
>>>>> +
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/virtio_types.h>
>>>>> +
>>>>> +/* The feature bitmap for virtio rpmsg */
>>>>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>> notifications */
>>>>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>>>>> space */
>>>>> +
>>>>> +struct virtio_rpmsg_config {
>>>>> +    __virtio16 version;
>>>>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>>> +    __virtio32 txbuf_size;
>>>>> +    __virtio32 rxbuf_size;
>>>>> +    __virtio32 reserved[14]; /* Reserve for the future use */
>>>>
>>>> 66 byte for the configuratio space?  I'm puzzled about the
>>>> reserved[14], how did
>>>> you come up with that number?
>>
>> I kept the reserved bytes from the original series as it is. The
>> original series did not contain version field. With version I don't
>> think we need reserved field at all. At best, if we want to append
>> padding bytes, then I think __virtio16 reserved; makes sense. That will
>> make the structure aligned to 4 byte.
>>
>>>
>>> Is it useful to define the reserved field?
>>
>> I think reserved field is only useful to keep the structure size aligned
>> to 4 bytes.
>>
>>> The version should allow us to determine the content.
>>
>> Correct, but I think the structure can be aligned if used correct
>> reserved bytes.
>>
>>> An other solution is to introduce a'size' field to determine the size of
>>> the structure:
>>
>> I think, the resource table already contains config_len field which is
>> size of the structure:
>>
>> https://github.com/torvalds/linux/
>> blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/
>> remoteproc.h#L275
> 
> 
> The resource table is the solution for the remoteproc virtio backend,
> The solution should be able to work with some other virtio backends.
> In such case we can not rely on the resource table.
> 

For now we have only the remoteproc virtio backend. If we ever introduce
new backend, then can we update this structure with new 'version' num
and include size field at that time? Since, now there is no real use of it.

> The resource table is a solution for the remoteproc virtio backend.
> However, the solution should also be able to work with other virtio
> backends.
> In that case, it may not be possible to rely on the resource table.
> 

Another concern is, do we need the size of the structure in the
first-place even to retrieve the 'size' field from the structure or
verify the integrity of the structure?

For example:
https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/drivers/remoteproc/remoteproc_virtio.c#L301


Here to verify the integrity of the resource table, we are using virtio
config space size.

If we do then it's better to provide the 'size' field some other way
before parsing of the rpmsg config space in any virtio backend. Like in
the remoteproc virtio backend it's provided via the resource table.

Let me know if I am overthinking :-) and we want the 'size' field in the
config space. I am just trying to make it as minimal as possible.

Thanks,
Tanmay

> Regards,
> Arnaud
> 
>>
>>> struct virtio_rpmsg_config {
>>>      __virtio16 version;
>>>      __virtio16 size; /* size of the configuration space */
>>>      /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>      __virtio32 txbuf_size;
>>>      __virtio32 rxbuf_size;
>>>      __u8 private[0]; /* customized config */
>>
>> Do we need customized config? I think I should remove this comment from
>> the original patch as well.
>>
>> Thanks,
>> Tanmay
>>
>>> };
>>>
>>>>
>>>> The rest looks good to me.
>>>>
>>>
>>> Looks good to me too.
>>>
>>> Thanks,
>>> Arnaud
>>>
>>>>> +    /* Put the customize config here */
>>>>> +} __packed;
>>>>> +
>>>>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>
>>
> 

