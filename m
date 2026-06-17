Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E00A1ACED5;
	Wed, 17 Jun 2026 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718116; cv=fail; b=l9Lp0uPzYddglxR1iH2w/0P7MZx33ZUl5Ow9nEMf4Ub79CqCAwvoGjVy506eDUb/N7LNPHToSkyLp/pXY8LLwxXI/Ht5d7fy/enL6hHFcL7QCV/BbbYCZAQIONLOAgFyNRm9d+0uhrPK3wV6It2avjXoypAh9/Em7dUbinL7xxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718116; c=relaxed/simple;
	bh=lYarh5BLgKqTNR1xzHop58tWSzACanYVssf0aoFDsaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pB+hZ1qisinb8OltvYBH1b+dq+GrlhicqkG7eKTkbqIcHzJiB0YcqSPh+JceEsrTjVKp/TtXhbs+TO20N959Q4sIiPzlDabwU9xozj2UPh9rC6WlzXybqJ34lc+dSzmcpjGOKJiLzgNP1yTXFpxIfuMOUJM3Vq06BUJes7Kafpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j2YbTXD3; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j2YbTXD3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCjumtbkGLfhk7+gPBIhCIiCAONilu+nlkMXUH4YmCRSgjarKz6pK3rPWhkyKXNJU8hYJDqO7nk99j4JfC063A7EMalypfWta+/N9hyBjwsyjnndcTW7QxBtQ84xMPYJJ+5TMiJGYUA8LW92tIFg2KqqJH0aWEmLuPRH47yyz5xa4GgQTDVGIOuAYCcTOUD0aOZeNcVewqqVScJs1fk6ygvyp+duRINs9F8FX4OwDX14Wq3EJTKP6+vG9EsF/g7kYscaH1xdA0S7i02CyHQVaijg1+B019DkDG/lhCh4t+APhm4F+SJWyWawlVX22DmIltZ2m51lZkFYQjcG6FbeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9tMJa5oLpU+SSqHDW4HprmjdzkcNqW1QPvR8o0UnYw=;
 b=ygfi62DBGDQBIACfU14+C9nMnh3Kv9DHZYWhWSkpoCkh8nTFSUY5ljNxbyjZwBh5Q2dKK8NM5s65Dng7HbhQDUiIdpoWgJmCJYFJux5zWNpbnY9so1nKlIPfjstOowU880YNRnlaJ2WYpHu5kFlwVfK/BhRXQNrDZSaOpFNgO7u8THojknQRbUOLXjt+aAWf+wSA+jMXSTvSe2SvgLXM1FXBS5RRDm89Ubmq3IdcMd/WXOHl7MVdWOrTCECW6jCpW8Fm694SoBuPNiE+h4wpeIfOP0HzV60d/DDV+RKD1p6gLdLDPSTmpDr/qfHT/JlZSkdEGPc1cTdXMmzc86X5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9tMJa5oLpU+SSqHDW4HprmjdzkcNqW1QPvR8o0UnYw=;
 b=j2YbTXD3nhtpZZoZW3dSPPKlnpw/szpy7MX6Cl/rVKmnyVDXjIlBrUfRzYaclrzFWxZpCqXOLDMu6g2S1Z0fHL7gwHo/XbIWCtEfKz3iTGmNcwswcvi9Ljp7qvLdnY8cXS2aL7bsunglsT3gIwdXeZHNXkPjY5Kb27V46DwrG70=
Received: from SJ0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:2c2::7)
 by SJ1PR12MB6146.namprd12.prod.outlook.com (2603:10b6:a03:45b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 17:41:47 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::63) by SJ0PR13CA0032.outlook.office365.com
 (2603:10b6:a03:2c2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 17:41:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 17:41:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 12:41:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 17 Jun
 2026 10:41:45 -0700
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 17 Jun 2026 12:41:45 -0500
Message-ID: <6b02c52d-5043-4bb8-b249-fa53e5bf53f6@amd.com>
Date: Wed, 17 Jun 2026 12:41:45 -0500
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
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Tanmay Shah
	<tanmay.shah@amd.com>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
 <20260615202007.3484668-4-tanmay.shah@amd.com>
 <5fba8065-c0e9-4514-863b-8c7c91fb79de@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <5fba8065-c0e9-4514-863b-8c7c91fb79de@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SJ1PR12MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e8c2c8-3ff4-4a48-4b4d-08decc97b433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	b1PXGXDLikU3xLcZraPOCkb0RIw9EyrFBG21QiTyVk44ynyxlci0rRwWV8MIEgWoYZbOLoBdtdi8py74SDEmbjTJWe1GfYszGdPYQHkft8GtPtPu2xQiE2whKlSPdlsNpU2KS1T5SIx0p9SeEd9+nbUK5X/AXNqrSaXfmkYC5cV9Kw1+pfyD5B0EIg/Qi+C1at+Y1sxZCbeIggtuOiTwsyTxmRcyPsAla7W8w++r5bwKqd+DM6wj2Q0f7YDZ7NAohRKCqEdtImP/EoDctHar2oLTnDIYxm/ZdWZ1gl72EJdHhZL5SrgVkfub5r0VyEx0dGel/fIJD7v7ra2WTK21CUyvnvY5/bBUyKxa6wpVNEbD6zrDBjIVY6TZj+WZFnJU3vPM/Gpr8dTTA0Pnk+FykE3oAX0zVvbVLnGmKRC+HlCXfaV6lq6B8TRApWcXc/rCheqFOW5VlqNDdogGL2jYKp80FRNfWyjBJ3/Y+FIotBf1TQ5FsohP0KniXSSVBx4gySp5uXhRwSnJFKCCm370sKQed8o4LTS8vUPZJiZqQdUuKzp/64pPbC1O2LUBPs1xFSq3emuBJESfqD/Kh6sBZUnfn3OxPdKA48JciXYdwENt61CiydlfkL8NEiN18CiRLBCpB6k2u7zNrdzAazMRA+C3PE1mRXCq3w+2/gvzjVpNh7l3PP/O+Z0mZ+YP8XBUhw+aZc9ZzAsVAg5/QK0a7/NJJW505W4PCSsPCDJ2gEk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2duAtafx4FeAU6zrq9zQ/ZrYCMP3wrQouq5hIWZQyXqzZTSq25XClovT/+XcEVdHds6Gfa6m7Ps3l1phKjomnORovD/kl0yyyjzODVdumfBubihINCq0C0BqAWmx5gHlh9lHcER7leSGRqJp1sC5BP0RhBCJBI2egMSfXRUiAHPVcDNxUgid9eRUyqFDZHe5H27cfDt8rY0AxOhF1yVEKKzfClHP5wCWNCpa29lMx0rvDSZaiwb+xLCSY8yBQftQClkYF4n25uRt7CkglR5u/htyh2Tv66MzvJiqOuhr61O1mRsn+z/JVXaqZ/xVChP2pFHpKKdu7FYi3FOLLPk28Q1aBDG3YAIKpgKLBq0i8IOMDFfl/b64SNCKOGTGTcFmpAIpnLTgbiV2d8npQE/IvjuhZhc6bM7NGDgGHtTvtTBhZ8NWAUQf2gqqREijgb2D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 17:41:46.7485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e8c2c8-3ff4-4a48-4b4d-08decc97b433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6146



On 6/17/2026 4:15 AM, Arnaud POULIQUEN wrote:
> Hi Tanmay,
> 
> On 6/15/26 22:20, Tanmay Shah wrote:
>> 512 bytes isn't always suitable for all case, let firmware
>> maker decide the best value from resource table.
>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v4: squash to virtio rpmsg config patch
>>    - Introduce new patch to modify rpmsg.rst documentation
>>    - check version is always 1.
>>    - check size field is same as size of struct virtio_rpmsg_config
>>    - introduce alignment field
>>    - check alignment field is power of 2
>>    - check tx and rx buf size is aligned with alignment passed in the
>>      structure
>>
>> Changes in v3:
>>    - change version field from u16 to u8
>>    - introduce size field in the rpmsg_virtio_config structure
>>    - check version field is set to any non-zero value.
>>    - check size field is not 0.
>>    - Remove field for private config, as not needed for now.
>>    - add documentation of rpmsg_virtio_config structure
>>
>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 129 ++++++++++++++++++++++++-----
>>   include/linux/rpmsg/virtio_rpmsg.h |  50 +++++++++++
>>   2 files changed, 160 insertions(+), 19 deletions(-)
>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>> virtio_rpmsg_bus.c
>> index 99df1ae07055..a59925f870a4 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -15,11 +15,13 @@
>>   #include <linux/idr.h>
>>   #include <linux/jiffies.h>
>>   #include <linux/kernel.h>
>> +#include <linux/log2.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/rpmsg.h>
>>   #include <linux/rpmsg/byteorder.h>
>>   #include <linux/rpmsg/ns.h>
>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>   #include <linux/scatterlist.h>
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>> @@ -39,7 +41,8 @@
>>    * @tx_bufs:    kernel address of tx buffers
>>    * @num_rx_buf: total number of rx buffers
>>    * @num_tx_buf: total number of tx buffers
>> - * @buf_size:   size of one rx or tx buffer
>> + * @rx_buf_size: size of one rx buffer
>> + * @tx_buf_size: size of one tx buffer
>>    * @last_tx_buf: index of last tx buffer used
>>    * @bufs_dma:    dma base addr of the buffers
>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>> @@ -59,7 +62,8 @@ struct virtproc_info {
>>       void *rx_bufs, *tx_bufs;
>>       unsigned int num_rx_buf;
>>       unsigned int num_tx_buf;
>> -    unsigned int buf_size;
>> +    unsigned int rx_buf_size;
>> +    unsigned int tx_buf_size;
>>       int last_tx_buf;
>>       dma_addr_t bufs_dma;
>>       struct mutex tx_lock;
>> @@ -68,9 +72,6 @@ struct virtproc_info {
>>       wait_queue_head_t sendq;
>>   };
>>   -/* The feature bitmap for virtio rpmsg */
>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>> notifications */
>> -
>>   /**
>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>    * @src: source address
>> @@ -128,7 +129,7 @@ struct virtio_rpmsg_channel {
>>    * processor.
>>    */
>>   #define MAX_RPMSG_NUM_BUFS    (256)
>> -#define MAX_RPMSG_BUF_SIZE    (512)
>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>     /*
>>    * Local addresses are dynamically allocated on-demand.
>> @@ -444,7 +445,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>         /* either pick the next unused tx buffer */
>>       if (vrp->last_tx_buf < vrp->num_tx_buf)
>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>       /* or recycle a used one */
>>       else
>>           ret = virtqueue_get_buf(vrp->svq, &len);
>> @@ -514,7 +515,7 @@ static int rpmsg_send_offchannel_raw(struct
>> rpmsg_device *rpdev,
>>        * messaging), or to improve the buffer allocator, to support
>>        * variable-length buffer sizes.
>>        */
>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>           dev_err(dev, "message is too big (%d)\n", len);
>>           return -EMSGSIZE;
>>       }
>> @@ -647,7 +648,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>> rpmsg_endpoint *ept)
>>       struct rpmsg_device *rpdev = ept->rpdev;
>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>   }
>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>> device *dev,
>> @@ -673,7 +674,7 @@ static int rpmsg_recv_single(struct virtproc_info
>> *vrp, struct device *dev,
>>        * We currently use fixed-sized buffers, so trivially sanitize
>>        * the reported payload length.
>>        */
>> -    if (len > vrp->buf_size ||
>> +    if (len > vrp->rx_buf_size ||
>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>           return -EINVAL;
>> @@ -706,7 +707,7 @@ static int rpmsg_recv_single(struct virtproc_info
>> *vrp, struct device *dev,
>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>         /* publish the real size of the buffer */
>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>         /* add the buffer back to the remote processor's virtqueue */
>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>> @@ -820,10 +821,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       struct virtproc_info *vrp;
>>       struct virtio_rpmsg_channel *vch = NULL;
>>       struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
>> +    u16 rpmsg_buf_align = 0;
>>       void *bufs_va;
>>       int err = 0, i;
>>       size_t total_buf_space;
>>       bool notify;
>> +    u8 version;
>> +    u16 size;
>>         vrp = kzalloc_obj(*vrp);
>>       if (!vrp)
>> @@ -855,9 +859,90 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       else
>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>> +    /*
>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>> +     * size from virtio device config space from the resource table.
>> +     * If the feature is not supported, then assign default buf size.
>> +     */
>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 version, &version);
>> +
>> +        /* for now we support only v1 */
>> +        if (version != RPMSG_VDEV_CONFIG_V1) {
>> +            dev_err(&vdev->dev,
>> +                "unsupported vdev config version %u\n", version);
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        /* size of the config space must match */
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 size, &size);
>> +        if (size != sizeof(struct virtio_rpmsg_config)) {
>> +            dev_err(&vdev->dev, "invalid size of vdev config %u\n",
>> +                size);
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>> >buf_size;
>> +        /*
>> +         * Optional alignment applied to each buffer size and to the TX
>> +         * buffer base address (e.g. to align buffers on a cache line).
>> +         * It must be a power of two; zero means no extra alignment.
>> +         */
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 rpmsg_buf_align, &rpmsg_buf_align);
>> +        if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
>> +            dev_err(&vdev->dev,
>> +                "bad vdev config: rpmsg_buf_align %u is not a power
>> of two\n",
>> +                rpmsg_buf_align);
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        /* note: tx and rx are defined from remote view */
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 txbuf_size, &vrp->rx_buf_size);
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 rxbuf_size, &vrp->tx_buf_size);
>> +
>> +        /* The buffers must hold at least the rpmsg header */
>> +        if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>> +            vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>> +            dev_err(&vdev->dev,
>> +                "bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>> +                vrp->rx_buf_size, vrp->tx_buf_size);
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        /*
>> +         * The buffer size must be aligned to the provided alignment for
>> +         * so that the start address of tx bufs can be aligned.
>> +         */
> 
> 'tx' to remove as  it also concerns Rx buffers
> 

Ack.

> 
> What about removing this check to manage alignment during buffer
> allocation?
> 
> For example, if the alignment is on a 64-bit address and the tx_buffer
> and rx_buffer sizes are 40 bytes, 48 bytes can be allocated in memory
> for each buffer, and the virtio descriptor can be filled with aligned
> addresses.
> 
> In other words, the rpmsg_buf_align field contains the alignment
> constraint from the remote processor. If the Linux kernel wants to
> impose another alignment constraint, it must test or update
> rpmsg_buf_align, but it must not impose alignment on the buffer size.
> 
> 

This part I don't understand. `rpmsg_buf_align` is alignment for only
single buffer size. The linux kernel is checking that single rx buf size
and tx buf size is aligned with `rpmsg_buf_align` as firmware has claimed.

For reference the openamp-system-reference PR:
https://github.com/OpenAMP/openamp-system-reference/pull/106/changes

	.vdev_config = {
		.version = 1,
		.reserved = 0,
		.size = (uint16_t)(sizeof(struct rpmsg_virtio_config) - sizeof(bool)),
		.alignment = RPMSG_BUF_ALIGN,
		.reserved1 = 0,
		/* Tx for host */
		.h2r_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
		/* Rx for host */
		.r2h_buf_size = metal_align_up(4096, RPMSG_BUF_ALIGN),
	},

IIUC, The linux kernel is not really supposed to modify
`rpmsg_buf_align`. It only uses it to check that firmware has assigned
correct size of single rx and tx buffer.


When the linux kernel uses dma_alloc_coherent() API it aligns total
buffer size with page size. That is different than single tx buf size
and single rx buf size. The total buf size alignment to page size is
irrelevant to `rpmsg_buf_align` field.

Please let me know if I am missing something or didn't understand your
comment. I prefer that `rpmsg_buf_align` should be only modified by the
firmware and not the linux kernel.



>> +        if (rpmsg_buf_align &&
>> +            (!IS_ALIGNED(vrp->rx_buf_size, rpmsg_buf_align) ||
>> +             !IS_ALIGNED(vrp->tx_buf_size, rpmsg_buf_align))) {
>> +            dev_err(&vdev->dev,
>> +                "bad vdev config: buf sizes (rx %u, tx %u) not
>> aligned to %u\n",
>> +                vrp->rx_buf_size, vrp->tx_buf_size,
>> +                rpmsg_buf_align);
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        dev_dbg(&vdev->dev,
>> +            "vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz =
>> 0x%x\n",
>> +            version, rpmsg_buf_align, vrp->rx_buf_size,
>> +            vrp->tx_buf_size);
>> +    } else {
>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +    }
>> +
>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>         /* allocate coherent memory for the buffers */
>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -874,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       /* first part of the buffers is dedicated for RX */
>>       vrp->rx_bufs = bufs_va;
>>   -    /* and second part is dedicated for TX */
>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>> +    /*
>> +     * Here buf_va is aligned to a page. Also rx buf size is aligned
>> with
>> +     * cache line alignment provided by the firmware, so tx buf's start
>> +     * address is guranteed to be aligned with the alignment provided by
>> +     * the firmware.
>> +     */
>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>         /* set up the receive buffers */
>>       for (i = 0; i < vrp->num_rx_buf; i++) {
>>           struct scatterlist sg;
>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>                         GFP_KERNEL);
>> @@ -965,8 +1055,8 @@ static int rpmsg_remove_device(struct device
>> *dev, void *data)
>>   static void rpmsg_remove(struct virtio_device *vdev)
>>   {
>>       struct virtproc_info *vrp = vdev->priv;
>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>       int ret;
>>         virtio_reset_device(vdev);
>> @@ -992,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>>     static unsigned int features[] = {
>>       VIRTIO_RPMSG_F_NS,
>> +    VIRTIO_RPMSG_F_BUFSZ,
>>   };
>>     static struct virtio_driver virtio_ipc_driver = {
>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
>> virtio_rpmsg.h
>> new file mode 100644
>> index 000000000000..7e14da68fd17
>> --- /dev/null
>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) Pinecone Inc. 2019
>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>> + * Copyright (C) Advanced Micro Devices, Inc. 2026
>> + */
>> +
>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>> +#define _LINUX_VIRTIO_RPMSG_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/virtio_types.h>
>> +
>> +/* The feature bitmap for virtio rpmsg */
>> +#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>> notifications */
>> +#define VIRTIO_RPMSG_F_BUFSZ    1 /* RP get buffer size from config
>> space */
>> +
>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>> +#define RPMSG_VDEV_CONFIG_V1    1
>> +
>> +/**
>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>> + *
>> + * @version:    version of this structure, currently
>> %RPMSG_VDEV_CONFIG_V1.
>> + * @reserved:    reserved for padding, must be zero.
>> + * @size:    size of this structure in bytes.
>> + * @rpmsg_buf_align:    required alignment in bytes for each buffer.
>> Must be a
>> + *        power of two so that both the buffer sizes and the TX buffer
>> + *        base address can be aligned (e.g. to a cache line).
>> + * @reserved1:    reserved for padding, must be zero. Keeps the
>> following 32-bit
>> + *        fields naturally aligned.
>> + * @txbuf_size:    Tx buf size from remote's view. For Linux this is
>> rx buf size.
>> + * @rxbuf_size:    Rx buf size from remote's view. For Linux this is
>> tx buf size.
>> + *
>> + * This is the configuration structure shared by the device and the
>> driver,
>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid
>> out so
>> + * the structure is naturally 32-bit aligned.
>> + */
>> +struct virtio_rpmsg_config {
>> +    u8 version;
>> +    u8 reserved;
> 
> Why about defining the version type to u16 to avoid the reserved field?
> 
>> +    __virtio16 size;
>> +    __virtio16 rpmsg_buf_align;
>> +    __virtio16 reserved1;
> 
> Seems useless if __packed prevents the compiler from inserting extra
> padding
> bytes between fields,
> 
>> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>> +    __virtio32 txbuf_size;
>> +    __virtio32 rxbuf_size;
>> +} __packed;
> 
> proposal
> 
> +struct virtio_rpmsg_config {
> +    __virtio16 version;
> +    __virtio16 size;
> +    /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +    __virtio32 txbuf_size;
> +    __virtio32 rxbuf_size;
> +    __virtio16 rpmsg_buf_align;
> +} __packed;
> +
> 

I am okay with the above proposal with minor difference:

My proposal:

+struct virtio_rpmsg_config {
+	u8 version;
+	__virtio16 size;
+	__virtio16 rpmsg_buf_align;
+	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+} __packed;

I just want to keep version field 8-bit, as we will probably never use
upper byte of that field if we use 16-bit. Rest is okay. If the
strucutre is packed then reserved bytes are not needed.

Please let me know your view.

Thanks,
Tanmay


> Regards,
> Arnaud
> 
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> 

