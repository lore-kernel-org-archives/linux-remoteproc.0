Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A138332E;
	Thu, 21 May 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369821; cv=fail; b=AClw/ikW6murxaCO9btVctv0PwI7VvmiklQsG1I02md5jN71Hj5J16GnK/KaSdnhQGh5FpxpvVJUSiiuqsbaKhWpWlBH7rBLN+u6OmxTeTyjkYFNc/DOWqMEHa3+JwJlr5hRP1vatcr+OILJz100YrETm7JcGAgaTlQ2l6VB5PU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369821; c=relaxed/simple;
	bh=0Rq4VGdIOQ3E7fs0G7c4jalb864jxmrQMkd95eGSimE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IjxL1Kz9GJg6Du0sjOs87zx79XDlhNZEBNNf4WKCqAniZMjbSbQUtn/xKSOaDAl3qdxyCM/gWRYwtshT7cYFC2vH4bRmEK1s/SmzNnfzNvP0lVhi0be6VQq3g3BCePzcbEYNVdsxOvIgG6qaxjA5sMCmGVTd2r/DS8dc55H40oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EGcVcDor; arc=fail smtp.client-ip=52.101.57.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EGcVcDor"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMC2a0kqU+JPCFtHVYc1ASlvcHtHCBo4UisLK1CbBNbVdfR1pKZ0djiTB3AC5BAvXQu9N/p/LPzrorZBtX03WeGX5a9PEfMJvVxLjtk1xqiIaYSyE8IU1jqvCqfatYSgt8WK6kyNr80du2oKlvcjmsV+B5FjUo118DaYLXnfIeuZ3D/3xG6lsqKtdMfpGYM5SyiYm2ZDAyWrYoUC43h18pazyYZNpkFHj8HLbdiAY/dEpMlmSxf5p9EFU6BMbtNujPIzElXrjlW4b+OanYscDsXlKv5cvKmSVCAqwqvZDoz7ASkdKwLNfR4bO00gpNq+Fn8U7y5AaVQEJHZ9RdETag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPsf5/N9i2cXsox/eJ4JxSIpVS5ztPYrJ/zCGrcMrmU=;
 b=n4BMZ3uBD5R4arCtF0F3nZJHEpyo98A7Qv4umgGoDs8eVmXViMUwiibb4lw1GOVDkz/4DHrvfP0lBNxh6vG73qwQzQxUG6Lp5F8etKDbisLd4PLtY2E+t9hDsfwD5lhbv+QyNH5XM3E6qAzpOHg5jc4I+HvQdTehtjJNH0sSc39S2hahp8EED2cIa/3pmc53+30iyIt0rxZU+zr75OUH7IVxSnnlY1XVC3zTgWWaDuLgC0Iv3/0FbwVGI420MvAEf+K6nGzfyKI5+n1B20lDFYWgl63E0IofXXv8EcOZaBKb/Gp73cbNKG1HL243c92cUw90B8TTmxYqiZY20dBaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPsf5/N9i2cXsox/eJ4JxSIpVS5ztPYrJ/zCGrcMrmU=;
 b=EGcVcDorShkP6iTbIoDdeYxQrkQ0kfLkKjdT7HTNTqj84oFKDUf6yC5uVRtZstflU5ctVpMgOicnH8U2FnTyY6c1kEAnedepx/Pd2p9JxvRtGeAZ/lGKmkEYX4E/pGxGiu6uklt2c9yRw5VMJSQV5nfuT2LbLGVpwytZnHEg6yM=
Received: from DM6PR07CA0087.namprd07.prod.outlook.com (2603:10b6:5:337::20)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 13:23:31 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:337:cafe::5d) by DM6PR07CA0087.outlook.office365.com
 (2603:10b6:5:337::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 13:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 13:23:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 08:23:29 -0500
Received: from [10.254.67.213] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 08:23:29 -0500
Message-ID: <00e9bfa9-90b3-40b9-9c00-44b4dd17f3cf@amd.com>
Date: Thu, 21 May 2026 08:23:28 -0500
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
 <313c02dd-0a19-48d4-bdaf-c53e2be1131b@amd.com> <ag30vj5zRZwgWWTJ@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <ag30vj5zRZwgWWTJ@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: a2bfdddc-d50e-4254-8c69-08deb73c2659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|13003099007|18002099003|56012099003|22082099003|6133799003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	9S7+FETvuQ8ZhzglrRPMmcdXxMfS+D2bQPIUtOidMXIEfecwFE8cJcHoQis4kQ8BhF0YNi3y3RJrEw7xdDswEzF2qAkgyZBp5dZOyK21TC2LStB5VfqtewINrFRcdPZprkXAc+7TtUNyq94LFxBbcstXGpKlARaw+nSoAhCKs6SBygJyFy8dZXmSIdKR+GZ4dKaqosX2/Tr41rsqvRiuvWl6HB9qhIoNzgfU7/aLZE5Zhf5Ug5XNBOVRGnMHFCWaU5MB/xOMBOxLQWUy+K9acNYwkeO8kBRD3HDs1pwty0bvnqeBov/QB2FOI7ism5l1Si+SMSd8EKt3FrVgnyPk8XuMDZbgZvoQAAhjFhp4TWjG4IEKAadmTiEg44FM3TFsFPzUhKoDGcMd392sTmaVujh8Y+zvCWymbNiNxMBpgMunuV5MevPYbd/MTzjhTM1ev/wpCnEnCWfPpdRYSCahd/hLHJt3txk9QaQGiHlHV7uW3QvECf8ZSyinbGcWguDJx5sIJcode+ZZq/7qTPu39kYkyThq8lvGrebiXRGiqTS68lqHBcEB1yfC4Ev6nv6BbMqBsyS9mm2BCEsnkcnN+fziCtpjLCGEhA676kbR4YzcAMCk7YWpL7imkOAtng1UiChZHHOpt+0fsnGdatTLix5r1JLHXgoyYfFP9hYQWGcIzRK5Esb7ra2+FQXjFgPc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(13003099007)(18002099003)(56012099003)(22082099003)(6133799003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	597wSiEFoAWdfG2VqYCv4YAKLdfnrX221aGWf/PbVA348DMhGOmNiEpd3SN8okoINjysYV0nQnbm9KE7abPNqEMGq+kaPdWccAPQr/aCGTgD8BmoInQlMPjfvkQUS41Off1kUome671J93qWlgBkEQWaiWCcGFo4KZlekF0ynHbB5PKUIvVc/XKo0CQ3+NYEFpQ8N3f4Rk6g2+O+5dtiipuwfikJRIpnpxuaPcb/BnqnOqqCU5ncxfiMVWqYJptQbjGMZ0H+kWzmYAI7RIILaa1RlBYL3hrh/yOijnWfdqFQ7s8iOwhJj6U+r77VESG6PUxE7d+M7ChJSgb6T2k/hXz2AYqPU7L6VZMP1H3CWnzLyNUeHLm3CCKuSJh+Pjbedb3CcEcbxvI1zmKwsm0iC4oeJqTA3RWkOcK1PSLcjF8qAZ4GSoUSm5jN/y531gDD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 13:23:30.2157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2bfdddc-d50e-4254-8c69-08deb73c2659
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890



On 5/20/2026 12:51 PM, Mathieu Poirier wrote:
> On Wed, May 20, 2026 at 09:55:33AM -0500, Shah, Tanmay wrote:
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
>>>>>    - Verify this patch works with the existing firmware
>>>>>    - Verify this patch works with the firmware that configures
>>>>>      differt tx & rx buf size
>>>>>
>>>>> Changes in v2:
>>>>>    - %s/sbuf_size/tx_buf_size/
>>>>>    - %s/rbuf_size/rx_buf_size/
>>>>>    - fix typo
>>>>>    - do not use ALIGN on buf size, rely on allocator
>>>>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
>>>>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>>>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>>>>    - use __virtio32 over __u32
>>>>>    - add version field to virtio rpmsg config structure
>>>>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>>>>
>>>>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
>>>>>   include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>>>>   2 files changed, 79 insertions(+), 18 deletions(-)
>>>>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>>>>
>>>>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/
>>>>> virtio_rpmsg_bus.c
>>>>> index e59d8cf9b975..8116d94413cc 100644
>>>>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>>>>> @@ -20,6 +20,7 @@
>>>>>   #include <linux/rpmsg.h>
>>>>>   #include <linux/rpmsg/byteorder.h>
>>>>>   #include <linux/rpmsg/ns.h>
>>>>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>>>>   #include <linux/scatterlist.h>
>>>>>   #include <linux/slab.h>
>>>>>   #include <linux/sched.h>
>>>>> @@ -39,7 +40,8 @@
>>>>>    * @tx_bufs:    kernel address of tx buffers
>>>>>    * @num_rx_buf:    total number of buffers for rx
>>>>>    * @num_tx_buf:    total number of buffers for tx
>>>>> - * @buf_size:    size of one rx or tx buffer
>>>>> + * @rx_buf_size: size of one rx buffer
>>>>> + * @tx_buf_size: size of one tx buffer
>>>>>    * @last_sbuf:    index of last tx buffer used
>>>>>    * @bufs_dma:    dma base addr of the buffers
>>>>>    * @tx_lock:    protects svq and tx_bufs, to allow concurrent senders.
>>>>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>>>>       void *rx_bufs, *tx_bufs;
>>>>>       unsigned int num_rx_buf;
>>>>>       unsigned int num_tx_buf;
>>>>> -    unsigned int buf_size;
>>>>> +    unsigned int rx_buf_size;
>>>>> +    unsigned int tx_buf_size;
>>>>>       int last_sbuf;
>>>>>       dma_addr_t bufs_dma;
>>>>>       struct mutex tx_lock;
>>>>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>>>>       wait_queue_head_t sendq;
>>>>>   };
>>>>>   -/* The feature bitmap for virtio rpmsg */
>>>>> -#define VIRTIO_RPMSG_F_NS    0 /* RP supports name service
>>>>> notifications */
>>>>> -
>>>>>   /**
>>>>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>>>>    * @src: source address
>>>>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>>>>    * processor.
>>>>>    */
>>>>>   #define MAX_RPMSG_NUM_BUFS    (256)
>>>>> -#define MAX_RPMSG_BUF_SIZE    (512)
>>>>> +#define DEFAULT_RPMSG_BUF_SIZE    (512)
>>>>>     /*
>>>>>    * Local addresses are dynamically allocated on-demand.
>>>>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>>>>         /* either pick the next unused tx buffer */
>>>>>       if (vrp->last_sbuf < vrp->num_tx_buf)
>>>>> -        ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>>>> +        ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>>>>       /* or recycle a used one */
>>>>>       else
>>>>>           ret = virtqueue_get_buf(vrp->svq, &len);
>>>>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct
>>>>> rpmsg_device *rpdev,
>>>>>        * messaging), or to improve the buffer allocator, to support
>>>>>        * variable-length buffer sizes.
>>>>>        */
>>>>> -    if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>>>>> +    if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>>>>           dev_err(dev, "message is too big (%d)\n", len);
>>>>>           return -EMSGSIZE;
>>>>>       }
>>>>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct
>>>>> rpmsg_endpoint *ept)
>>>>>       struct rpmsg_device *rpdev = ept->rpdev;
>>>>>       struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>>>>   -    return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>>>>> +    return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>>>>   }
>>>>>     static int rpmsg_recv_single(struct virtproc_info *vrp, struct
>>>>> device *dev,
>>>>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>> *vrp, struct device *dev,
>>>>>        * We currently use fixed-sized buffers, so trivially sanitize
>>>>>        * the reported payload length.
>>>>>        */
>>>>> -    if (len > vrp->buf_size ||
>>>>> +    if (len > vrp->rx_buf_size ||
>>>>>           msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>>>>           dev_warn(dev, "inbound msg too big: (%d, %d)\n", len,
>>>>> msg_len);
>>>>>           return -EINVAL;
>>>>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info
>>>>> *vrp, struct device *dev,
>>>>>           dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>>>>         /* publish the real size of the buffer */
>>>>> -    rpmsg_sg_init(&sg, msg, vrp->buf_size);
>>>>> +    rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>>>>         /* add the buffer back to the remote processor's virtqueue */
>>>>>       err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>>>>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>       int err = 0, i;
>>>>>       size_t total_buf_space;
>>>>>       bool notify;
>>>>> +    u16 version;
>>>>>         vrp = kzalloc_obj(*vrp);
>>>>>       if (!vrp)
>>>>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>       else
>>>>>           vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>>>>   -    vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>>>> +    /*
>>>>> +     * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
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
> 
> I've been thinking about that and I agree it should be something else than '0'.
> Since we have a u16, I suggest to make bit 15-8 a magic number (surprise us!)
> and bit 7-0 the actual version number.
> 

Hi Mathieu,

For xlnx platform driver, one magic number is already used for the
resource table metadata structure which is used to retrieve the resource
table. We can use magic number for the virtio config strucutre, but
after that we should limit the introduction of the magic numbers to any
future structures. We don't want too many magic numbers.

So I wanted input on this: Do we want to use magic number for 'version'
field of this structure or we want to keep use of the 'magic number'
reserved for any future use case? If we use it now, the I prefer to not
introduce in the future, as there will be too many magic numbers at that
point.

Thanks,
Tanmay

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
>>>>>   -    total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp-
>>>>>> buf_size;
>>>>> +    total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>> +              (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>         /* allocate coherent memory for the buffers */
>>>>>       bufs_va = dma_alloc_coherent(vdev->dev.parent,
>>>>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>>>>       vrp->rx_bufs = bufs_va;
>>>>>         /* and second part is dedicated for TX */
>>>>> -    vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>>>> +    vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>>>>         /* set up the receive buffers */
>>>>>       for (i = 0; i < vrp->num_rx_buf; i++) {
>>>>>           struct scatterlist sg;
>>>>> -        void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>>>> +        void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>>>>   -        rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>>>> +        rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>>>>             err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>>>>                         GFP_KERNEL);
>>>>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device
>>>>> *dev, void *data)
>>>>>   static void rpmsg_remove(struct virtio_device *vdev)
>>>>>   {
>>>>>       struct virtproc_info *vrp = vdev->priv;
>>>>> -    unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>>>>> -    size_t total_buf_space = num_bufs * vrp->buf_size;
>>>>> +    size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>>>>> +                 (vrp->num_tx_buf * vrp->tx_buf_size);
>>>>>       int ret;
>>>>>         virtio_reset_device(vdev);
>>>>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>>>>     static unsigned int features[] = {
>>>>>       VIRTIO_RPMSG_F_NS,
>>>>> +    VIRTIO_RPMSG_F_BUFSZ,
>>>>>   };
>>>>>     static struct virtio_driver virtio_ipc_driver = {
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
>>>>> +    __virtio32 reserved[14]; /*: Reserve for the future use */
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
>> https://github.com/torvalds/linux/blob/27fa82620cbaa89a7fc11ac3057701d598813e87/include/linux/remoteproc.h#L275
>>
>>> struct virtio_rpmsg_config {
>>>     __virtio16 version;
>>>     __virtio16 size; /* size of the configuration space */
>>>     /* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>>>     __virtio32 txbuf_size;
>>>     __virtio32 rxbuf_size;
>>>     __u8 private[0]; /* customized config */
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

