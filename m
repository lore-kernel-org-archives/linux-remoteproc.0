Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5521E3DDE;
	Thu,  4 Jun 2026 20:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780605147; cv=fail; b=DnYfP/rueRjevZTtg16/SmyWUBa3+zN3NUfDMCinwYe0y6mbjWmKdlGFwgotfJESuZwNFCVR1tnWsekuUxqFi4dEycIW1y589xde0GRTSjXoeYZPtBl4LHS0XhKubSrvP+EQH7IeTIcrL9YMems6M2M4bIWLyDcipBWyc8tJB78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780605147; c=relaxed/simple;
	bh=wwVO+9WtglQhbJZOQWGaACbRmh5lczlKAxhNG+1Npr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H/yOompkJ7b2VhFJsJjr9jHpZjzlQxxg4xCSDDD183vPke7bnKtQKnRIV3kvpAY/iQu5hH1bhO2wRMl8R+4JYhA+Dq95bRwc4oPXlWIu06PFFSiaJS0XqMXPvbGQMyoXBVEG9/xbfoRFeQ3NuWwna0ARZDENL2Pi3JmP8MYSTCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p+0FZACM; arc=fail smtp.client-ip=52.101.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p+0FZACM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keZIQOqx7fKV1WGF15qWvM5SuUvTNOaxwy23+5OZZV9UqFzVlutcVdItR4QgKCiFbL5+MoZKdS5Igau+B2r3WORDO6twO24BhNzSYJzTES1ETXClbI3jqaLv25t3zH2FFirdkCErgCItCnqNO+BF9kV2WyNdWL37r0HmHgT2DnPqXtYaHC6Ydvrz9WV+siu2lhBNg0Em2bv6HgjEu0UeSDhwWRm+oV1dOUPtUCbT+Wc0VR5Ig2V8zJCfM5ce/V3roO1QJn8/9SXJHXEvDK4kmyWaAdjiS2AXuvcMeEd6HeBJTl+ZEIyB4vKNTRcTeu4PH12YjrZhZuymCfvj08w9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aM/eqkvXK9+Jjil69qNyVEvUvzya/TTTkb2fMfYqNA=;
 b=KcrOp7ovT2hQEhixK4vj/N3kIMaVWOJQdzMszOySN+aq2rYg495dInyx6NImnIWDPwhomwluk0nFF9yLLJX0aFlAzSCRtYYCYfGwUJ0WWF1TYrXAFkZsRgRwPB3xfOypLiDV2fVWbn+iacPp9bGF59LbjMSL5ofS5wk8FKDkfVVO+s/USY0jQDVrnjLSOVDOwgoJRlrkg9DIaAdMk4UI2ogJNF50fkccC0Bobw3uJA5npZC1muJDjqxhFbARIuVpOorJK97qQM77d7aLxNbi5s2EL1jglXGzlNaUA0EJ1IfkO0ZTHytwFt4gOoQkOdjGLQpilz0RWql3cs+C0upACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=foss.st.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aM/eqkvXK9+Jjil69qNyVEvUvzya/TTTkb2fMfYqNA=;
 b=p+0FZACMfBiqblRgsLmuMDYuwyk0hpjqtsu3LrRAlPFXEWVIQWbIz5UwiX/2bswXHOHOJIKnU/lbV1GJOMFj5t8WQiOyll6Rbs4WtptPG3lLCu/M0ZHkdeDcZo6CTVXrtTsnvF9xAI2YuqjpzslcXQ8Ef7wka/Gys9bLVgv6Wqk=
Received: from SA9PR10CA0025.namprd10.prod.outlook.com (2603:10b6:806:a7::30)
 by IA0PR12MB7774.namprd12.prod.outlook.com (2603:10b6:208:430::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 20:32:19 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::7b) by SA9PR10CA0025.outlook.office365.com
 (2603:10b6:806:a7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 20:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 20:32:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 15:32:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:31:40 -0700
Received: from [172.31.11.23] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 15:31:40 -0500
Message-ID: <8d59e741-4cfa-4042-bd45-35838641aa31@amd.com>
Date: Thu, 4 Jun 2026 15:31:40 -0500
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
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Tanmay Shah
	<tanmay.shah@amd.com>, <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-4-tanmay.shah@amd.com>
 <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|IA0PR12MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: c1452e64-4d41-4759-86b0-08dec2785f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099006|22082099003|18002099003|3023799007|11063799006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	JY4y6Sh8Od39NYLtCSzWpU7Aes7fCR/wmkPvFk6V+5GJ83IcvNAXv+bmVWJcqEH9yHauYOlMSrY6IMxCLH5F4rR+lEhbIgEAFLqBrBAPVGGFQ2bkQ/oLBGtSK3afupUc1ufmlCCvbrzhyq8hZB1QrNiN8ZCYldch1Fv0OFPEQKc6SJtxmhTBLce4z8XYRDrhszGGo48daRq8oJY5DoG3AFQa2WKU91UHLrcTnTGqagOBUdTqHCESY9fV0sRGlLVzkza/vV9QJLWI5PhRN7vhWheIeloZDWdC0fPChqlUTW5zt/nzaZ83AF6qsVGm06JA6flXIZzCuQ/Yd5HC8PQzpmtKMDmk90zot5Q9A8nItVN69f52dZadVKTCyVMRUj2hdCOzZ4tMzTnDeuhiCteTyvlcmW6IWh8VB4k+aHL/aE8tpuy/AtxJ2SxIwR96MuStD+Bzq60gsuYw74ju16nihXbbiFYBKFhs3vXhQzEwijOGl4AZzwiewkvOHkJaHvj2wq0FNcN9pEwxG1rGvkrtaF/3sOd6pIEE/tSzlo3JgnKZ10kDPHE8BAisgMmfYg+fwdjacn60hTp5PE2kastnZWUfezKKs3P4HTTURsJNxiYDlQ76vsVcGSxvLkdx7lqmrWpK4hTTnvhlgDyR6tmR88Wes6nRTYJr1V3aOyU5rn+Le4gDQF+cj5CW36CLVjaKLR/PoYbrGxznGNU3IHfDZgUUo/xuqcITgKw069iLR7Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sWgCVFTkG6dj4ZxxNuKjeld3RGbJPS3gC45GYdvLPzybUX2o2eiTQQnRANDUdvMHRWGPPWtz+GCNs0s+Gqsjn4QNnyoEQnD0nYn5zxaG8UToc7q6Abp8rrFJFbrsXx5kQQfjQ+uXSgcIFQFe5/ULaVw7UyRLYpgTaGOej9v+iSqIOuSeg6EVzq3cWaeMUhDSI/KuqEw6HIZpeoY/VwiSsTcIVC4+0cmLXx4LwFHypljzau2lPpy51uY8jAOHUo31uN86ZXjaf0ZfWxkSZr2RG1CXz4BkeiwKAFYtZLQb+vObmsBZ1ZbRf3faIi/WAcyDu9VTHvQUu+e/umB9TmNASDMozGgN863LUDyxgU9w7Oql04w3pmV0Ar+EHDxaGXP7sMkcGIdTgaHWjd0zQ4saLyrH0PkdIsz2FQZmIyOvs2HZFGNY1gQcSuonSI97l7fo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 20:32:18.2966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1452e64-4d41-4759-86b0-08dec2785f54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7774

Thank You for the reviews, please find my comments below:

On 6/2/2026 3:25 AM, Arnaud POULIQUEN wrote:
> Hi Tanmay,
> 
> On 5/29/26 18:43, Tanmay Shah wrote:
>> 512 bytes isn't always suitable for all case, let firmware
>> maker decide the best value from resource table.
>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Changes in v3:
>>    - change version field from u16 to u8
>>    - introduce size field in the rpmsg_virtio_config structure
>>    - check version field is set to any non-zero value.
>>    - check size field is not 0.
>>    - Remove field for private config, as not needed for now.
>>    - add documentation of rpmsg_virtio_config structure
>>
>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 90 ++++++++++++++++++++++++------
>>   include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
>>   2 files changed, 106 insertions(+), 18 deletions(-)
>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>> virtio_rpmsg_bus.c
>> index 99df1ae07055..f1ab8e792f3d 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/rpmsg.h>
>>   #include <linux/rpmsg/byteorder.h>
>>   #include <linux/rpmsg/ns.h>
>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>   #include <linux/scatterlist.h>
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>> @@ -39,7 +40,8 @@
>>    * @tx_bufs:    kernel address of tx buffers
>>    * @num_rx_buf: total number of rx buffers
>>    * @num_tx_buf: total number of tx buffers
>> - * @buf_size:   size of one rx or tx buffer
>> + * @rx_buf_size: size of one rx buffer
>> + * @tx_buf_size: size of one tx buffer
>>    * @last_tx_buf: index of last tx buffer used
>>    * @bufs_dma:    dma base addr of the buffers
>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>       void *rx_bufs, *tx_bufs;
>>       unsigned int num_rx_buf;
>>       unsigned int num_tx_buf;
>> -    unsigned int buf_size;
>> +    unsigned int rx_buf_size;
>> +    unsigned int tx_buf_size;
>>       int last_tx_buf;
>>       dma_addr_t bufs_dma;
>>       struct mutex tx_lock;
>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>       wait_queue_head_t sendq;
>>   };
>>   -/* The feature bitmap for virtio rpmsg */
>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>> notifications */
>> -
>>   /**
>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>    * @src: source address
>> @@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
>>    * processor.
>>    */
>>   #define MAX_RPMSG_NUM_BUFS    (256)
>> -#define MAX_RPMSG_BUF_SIZE    (512)
>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>> +
>> +#define RPMSG_VDEV_CONFIG_VER 1
> 
> I would rename it
> 
> #define RPMSG_VDEV_CONFIG_V1 1

We might not need this define at all. I should have removed it in this
patch. Please see below [1].

> 
>>     /*
>>    * Local addresses are dynamically allocated on-demand.
>> @@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>         /* either pick the next unused tx buffer */
>>       if (vrp->last_tx_buf < vrp->num_tx_buf)
>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>>       /* or recycle a used one */
>>       else
>>           ret = virtqueue_get_buf(vrp->svq, &len);
>> @@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct
>> rpmsg_device *rpdev,
>>        * messaging), or to improve the buffer allocator, to support
>>        * variable-length buffer sizes.
>>        */
>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>           dev_err(dev, "message is too big (%d)\n", len);
>>           return -EMSGSIZE;
>>       }
>> @@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>> rpmsg_endpoint *ept)
>>       struct rpmsg_device *rpdev = ept->rpdev;
>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>   }
>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>> device *dev,
>> @@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info
>> *vrp, struct device *dev,
>>        * We currently use fixed-sized buffers, so trivially sanitize
>>        * the reported payload length.
>>        */
>> -    if (len > vrp->buf_size ||
>> +    if (len > vrp->rx_buf_size ||
>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>           return -EINVAL;
>> @@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info
>> *vrp, struct device *dev,
>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>         /* publish the real size of the buffer */
>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>         /* add the buffer back to the remote processor's virtqueue */
>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>> @@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       int err = 0, i;
>>       size_t total_buf_space;
>>       bool notify;
>> +    u8 version;
>> +    u16 size;
>>         vrp = kzalloc_obj(*vrp);
>>       if (!vrp)
>> @@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       else
>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>> +    /*
>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>> +     * size from virtio device config space from the resource table.
>> +     * If the feature is not supported, then assign default buf size.
>> +     */
> 
> Seems to me that It would be nice to document the config space in rpmsg.rst
> 

Ack.

>> +    if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 version, &version);
>> +        if (version == 0) {
> 
>         if (version != RPMSG_VDEV_CONFIG_V1) {
> 

[1] Here we have to allow any non-zero version to be valid, and make
sure any future version is always backward compatible.

For example, if we need v2 of the structure, then that should be
compatible with v1. So, old kernel keeps working with the new firmware
with limited functionality supported by the kernel. And new kernel keep
working with the old firmware, with the limited functionality supported
by the firmware.

That is just my view. I am open to more ideas, thank you.

>> +            dev_err(&vdev->dev, "invalid version of vdev config\n");
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        /*
>> +         * The size field is not used for the remoteproc virtio
>> transport,
>> +         * but kept for any future transport to use
>> +         */
> 
> I suggest to not mention the virtio transport, indeed we should decouple
> the virtio device from the virtio transport.
> 

Ack.

>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 size, &size);
>> +        if (size == 0) {
> 
>     if (size != sizeof(virtio_rpmsg_config)) {
> 

So, I think sizeof(virtio_rpmsg_config) on the remote side may not be
the same as in the linux kernel. Remote side can have its private
variables which might not needed on the linux side:

For example, the open-amp library defines the structure differently than
linux:
https://github.com/OpenAMP/open-amp/blob/23d4c5d7a5c5dd08b74d4ba828243988592337cb/lib/include/openamp/rpmsg_virtio.h#L70

There is 'split_shpool' extra variable which is not needed by the linux.

That is why restriction on the size isn't needed IMHO.

>> +            dev_err(&vdev->dev, "invalid size of vdev config\n");
>> +            err = -EINVAL;
>> +            goto vqs_del;
>> +        }
>> +
>> +        /* note: tx and rx are defined from remote view */
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 txbuf_size, &vrp->rx_buf_size);
>> +        virtio_cread(vdev, struct virtio_rpmsg_config,
>> +                 rxbuf_size, &vrp->tx_buf_size);
> 
> I wonder if we should not impose a size aligned on 64-bits
> 

I think you mean size should be aligned to 64-bits.
Ack for that.

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
>> +        dev_dbg(&vdev->dev,
>> +            "vdev config: version=%d, rx buf sz = 0x%x, tx buf sz =
>> 0x%x\n",
>> +            version, vrp->rx_buf_size, vrp->tx_buf_size);
>> +    } else {
>> +        vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +        vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +    }
>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>> >buf_size;
>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>         /* allocate coherent memory for the buffers */
>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>       vrp->rx_bufs = bufs_va;
>>         /* and second part is dedicated for TX */
>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
> 
> 
> We should have a cache or 64-bit alignement here. or perhaps such
> constraints should be specified in the config space?
> 

I prefer to specify in the config space.

>>         /* set up the receive buffers */
>>       for (i = 0; i < vrp->num_rx_buf; i++) {
>>           struct scatterlist sg;
>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>                         GFP_KERNEL);
>> @@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device
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
>> @@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
>>     static unsigned int features[] = {
>>       VIRTIO_RPMSG_F_NS,
>> +    VIRTIO_RPMSG_F_BUFSZ,
>>   };
>>     static struct virtio_driver virtio_ipc_driver = {
>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/
>> virtio_rpmsg.h
>> new file mode 100644
>> index 000000000000..77a530514d86
>> --- /dev/null
>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) Pinecone Inc. 2019
>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>> + * Copyright (C) Advanced Micro Devices, Inc.
> 
> No year specified for AMD copyright?

Ack, will fix.

> 
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
>> +/**
>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>> + *
>> + * @version: version of this structure. current version is 1.
>> + * @size:    size of this structure. unused for the remoteproc virtio
>> backend.
> 
> reference to remoteproc to remove
> 

Ack.

>> + * @txbuf_size: Tx buf size from remote's view. For Linux this is rx
>> buf size.
>> + * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx
>> buf size.
>> + */
>> +struct virtio_rpmsg_config {
>> +    u8 version;
>> +    __virtio16 size;
>> +    /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>> +    __virtio32 txbuf_size;
>> +    __virtio32 rxbuf_size;
>> +} __packed;
> 
> 
> As mentioned above
> - The size should be be a multiple of four to ensure 64-bit alignment.
> - I would add an alignment field to align the address of the TX buffers
> to the cache line.
> 

Ok, I will change and test.

> Thanks,
> Arnaud
> 
> 
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
> 

