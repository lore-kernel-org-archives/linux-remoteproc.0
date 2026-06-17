Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B463876BA;
	Wed, 17 Jun 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781687742; cv=fail; b=ZjDc5ZuyZ8nH15WDfpflxU7dWDZiJ1rSpvTx0sr3Ala/rHie29A46bA478hrFnpi7FuP8o2CTNdNXHF1g7j/GBtsiSyWVzI0s5XMdvmCIVTfXxEDh8vLVN5/R9o8xf7eL5BwW3aDy0ZZCqiyKwgZ2X+m2ErAav733QoatW9Snx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781687742; c=relaxed/simple;
	bh=gqBUPcleg+fy+1cOu6t2kE2JQKvXv+hQftVojBQFvQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JDjbdVdZ+gr2R/9nnZBDYY1gmslcYK8vJ++5t+5Ka0srpdxXJ6H5CCI94h19P6Cr+MN+IzYohWTeQ5tTqhVzw9zpfwft97mB9c7fjULnrLFsd803vMHW/yqtzzhsFOJ9CI5zxKJLmbmb/ncKK9DwiHIKECB/v59b6cf+8HLZ6O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ChSbFSK5; arc=fail smtp.client-ip=52.101.83.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ChSbFSK5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HImMZIZqCEkMKg3HuBQxDGzreQQXNTEtsooCHFoGqHFxYbVeNrTkSq7LbWUiooIWzoznrw7dMfb5Ys+4DnmnWVnILQ1shLVTxU3mNL1wYVO+7WHN+MdH/9vWddDjjNj5l2sRxtAYxkjQrE4dfTkMaHNLX4aiYC3NCXdExgAOcby5PwHwCfYWztcaxsBYnv7By5/jdQwZzHIEd6CVNBlUOyNrEKyBu3+vwderijMsS23OVX0mtBM5HyBX4RQwMCod365p2okiUVai7jiEwfvoqSDbStIwvOYXpUaJEmv/sNMqx1K7lodUGzbo8ciJShEnbfGUlpVlVO2c4V5aGKy2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yykKlAAXCVl8dlbaRkU9kWIH5QZO4ImXG/z15M7U2s=;
 b=UtYB6lSB4qYUwnoqE2o1wZ4DEMIwujxneb+O8m8fnT4zYlICRPXB8KUizK3tMNW2rzczuuOPPx3BBDOrLQivOb7JAE29ulPkh2Oxmub7jg9mPaycCISMtm/1bGNbGuOrT6k7QwFmfRghLl9P0bBxyQv5LOz/IyVKj6iBpP6j2ZI3nbxtjy0JWXog3szi2Z1NUhJ5SIxed0zza2OhYzkmIcWpkVDiU3KO4SPz3cggy/s6LLXVVbCg07PnDq2t1RFsIC958q3xg/LtZnqHn/2GyDSEAd5Nv+aAcsicX8aHcuC32qKDleA12HHmqFiDE/niOVfkunMNqeF18aHCIoVH9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7yykKlAAXCVl8dlbaRkU9kWIH5QZO4ImXG/z15M7U2s=;
 b=ChSbFSK5wALS4vE41DpIuPTKgEoG7tNNCYx8JLUbENo21Mp+Rnd/vWFjqDcJAL1sADuIWQa8MjhaudHwG4iGsB3A2BIZI6uOj3G1JYgYxakkFKp6QqCR2TsD/xdkbgudZDka7KhgF0DuPEkVXa4wSbOV9fu9t++mVaAC/PSszVnBE8Q6CVhHaAxC1chR79jIpn0PgtASLN4HiYNvrzeotjEHR3HEARjAR0ZP+1Trt9eBfa/vskw2phXQTTWcHvRmhm+HVSb2SMH/2R6qrYpaEq1/FCAqvrw2PfKrL9uuCWypz3f99mAmIznT6pA/Lhq9+mbfHT8YYKuvrZiZ1VK/fA==
Received: from DBBPR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:d4::13)
 by AS4PR10MB5944.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 09:15:37 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::79) by DBBPR09CA0025.outlook.office365.com
 (2603:10a6:10:d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 09:15:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 17 Jun 2026 09:15:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 11:19:54 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 11:15:35 +0200
Message-ID: <5fba8065-c0e9-4514-863b-8c7c91fb79de@foss.st.com>
Date: Wed, 17 Jun 2026 11:15:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260615202007.3484668-1-tanmay.shah@amd.com>
 <20260615202007.3484668-4-tanmay.shah@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260615202007.3484668-4-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|AS4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d5a9afd-8ea1-4c35-50d9-08decc50fe5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|56012099006|6133799003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KWG0mFVldvWStg/Qvls8r585bvyquFhoiVIIH2XyGfDizy7vkhMacJolHKmOaWddkVxw7ODNdwGgAyQGXGodInhZ9E0XabyF5R7pTQr1fIvAehfZBmBmTcchPjL99bLwcdrHMIgHDY2mqYOgIRcA1W0UMbJwvVOTmddvP0CVAmLTcnVdiwNhXdTFBDwLPW8mULRl9qIfsywOH9ZLfXuzlggXmWDXSBtkxp4fL5KT3HOVgZ8Ec62yIXWjmWZ2BFCkkAU3r0NuaDtC4tZEXRFNwYG3yTQFQYA69KKn56evzxLabfLyQrSzdkmWvotA106v1JkiPz3HtbO9Pjpq69+V8MIOc26AFClA+WSeURpwhSZg92axv+jk0uAigBzsLM8ggEe5XpjVx18PRXxMAA1riyp3Rrd4JtbcLtTd80xtf8e3K8IGFvRl0KlODoKxmNR7HEO8gm0qZaMto6sDs5IvCeFyG2iR99zZDoiAuX24kFiN2V6iae9fmwp+YcKAhdWox1hh7+U+eyhvUj72YtQyNaFQRxsSWvmwc6FFL03sTcrXJGGmWESfA/LHyCX0Wxdl1cGmako3La9iGdcIu2bdb4XsS70u0o1F46OfkAj12v557tcib0Up3JnkBjpXx/VxFv+nCNEXBe6bEOfbNv8pCiN7y28xX0RwXU86sdCtZe0x2vHG1SfSBXHWjyskUcEy+3ZMI22D9bFcsOCst++mju/d6MslajLp0DWbFxbGeoo=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(56012099006)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jcp8oE0K3yJu3egUSgLlrouB6rZNRsMl+R2wSDpAR2eE0nEGhQXBD9iV7PVqAv5NlIuXerOvPYpa3INUvjK191QTc7FFj4UVau0LnUbP6tn8TOY1Kta9zjkev9risfqV3Nk9M2vyJ+q8y1DXhOKGbNxqRGs480WTY149f1+lT4/ALpkfyRCX8KEbfMX+yRb3qU+Z8xjJjkLuUVwc7gQlQN/uhI3DBWTZRJ9AGkW0kHBa1ph9wGgQtsrGTbY/qF0Z72vbkRnCHpXFDyHBBcj7cVWGlJ2Lki+R54Qh3I5KD3Ahwhads72fCgbr/ETkP4MQckGlJEUrBMtH/CwYgq6T3BBOXJfaEVBnjmjt82AFIDyYdUkitIT4i2nMo9IdjtOxIq04NsWxun9SOQxhPHe4/CJz3b8sRZS/QL5JWkqucm64OQY8cgfI/3qYyDRmvsio
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:15:36.8964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d5a9afd-8ea1-4c35-50d9-08decc50fe5d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5944

Hi Tanmay,

On 6/15/26 22:20, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v4: squash to virtio rpmsg config patch
>    - Introduce new patch to modify rpmsg.rst documentation
>    - check version is always 1.
>    - check size field is same as size of struct virtio_rpmsg_config
>    - introduce alignment field
>    - check alignment field is power of 2
>    - check tx and rx buf size is aligned with alignment passed in the
>      structure
> 
> Changes in v3:
>    - change version field from u16 to u8
>    - introduce size field in the rpmsg_virtio_config structure
>    - check version field is set to any non-zero value.
>    - check size field is not 0.
>    - Remove field for private config, as not needed for now.
>    - add documentation of rpmsg_virtio_config structure
> 
>   drivers/rpmsg/virtio_rpmsg_bus.c   | 129 ++++++++++++++++++++++++-----
>   include/linux/rpmsg/virtio_rpmsg.h |  50 +++++++++++
>   2 files changed, 160 insertions(+), 19 deletions(-)
>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 99df1ae07055..a59925f870a4 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -15,11 +15,13 @@
>   #include <linux/idr.h>
>   #include <linux/jiffies.h>
>   #include <linux/kernel.h>
> +#include <linux/log2.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/rpmsg.h>
>   #include <linux/rpmsg/byteorder.h>
>   #include <linux/rpmsg/ns.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>   #include <linux/scatterlist.h>
>   #include <linux/slab.h>
>   #include <linux/sched.h>
> @@ -39,7 +41,8 @@
>    * @tx_bufs:	kernel address of tx buffers
>    * @num_rx_buf: total number of rx buffers
>    * @num_tx_buf: total number of tx buffers
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
>    * @last_tx_buf: index of last tx buffer used
>    * @bufs_dma:	dma base addr of the buffers
>    * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +62,8 @@ struct virtproc_info {
>   	void *rx_bufs, *tx_bufs;
>   	unsigned int num_rx_buf;
>   	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
>   	int last_tx_buf;
>   	dma_addr_t bufs_dma;
>   	struct mutex tx_lock;
> @@ -68,9 +72,6 @@ struct virtproc_info {
>   	wait_queue_head_t sendq;
>   };
>   
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
>   /**
>    * struct rpmsg_hdr - common header for all rpmsg messages
>    * @src: source address
> @@ -128,7 +129,7 @@ struct virtio_rpmsg_channel {
>    * processor.
>    */
>   #define MAX_RPMSG_NUM_BUFS	(256)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>   
>   /*
>    * Local addresses are dynamically allocated on-demand.
> @@ -444,7 +445,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>   
>   	/* either pick the next unused tx buffer */
>   	if (vrp->last_tx_buf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>   	/* or recycle a used one */
>   	else
>   		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -514,7 +515,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>   	 * messaging), or to improve the buffer allocator, to support
>   	 * variable-length buffer sizes.
>   	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>   		dev_err(dev, "message is too big (%d)\n", len);
>   		return -EMSGSIZE;
>   	}
> @@ -647,7 +648,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>   	struct rpmsg_device *rpdev = ept->rpdev;
>   	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>   
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>   }
>   
>   static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -673,7 +674,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>   	 * We currently use fixed-sized buffers, so trivially sanitize
>   	 * the reported payload length.
>   	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>   	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>   		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>   		return -EINVAL;
> @@ -706,7 +707,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>   		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>   
>   	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>   
>   	/* add the buffer back to the remote processor's virtqueue */
>   	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -820,10 +821,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	struct virtproc_info *vrp;
>   	struct virtio_rpmsg_channel *vch = NULL;
>   	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
> +	u16 rpmsg_buf_align = 0;
>   	void *bufs_va;
>   	int err = 0, i;
>   	size_t total_buf_space;
>   	bool notify;
> +	u8 version;
> +	u16 size;
>   
>   	vrp = kzalloc_obj(*vrp);
>   	if (!vrp)
> @@ -855,9 +859,90 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	else
>   		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>   
> -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> +	/*
> +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> +	 * size from virtio device config space from the resource table.
> +	 * If the feature is not supported, then assign default buf size.
> +	 */
> +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     version, &version);
> +
> +		/* for now we support only v1 */
> +		if (version != RPMSG_VDEV_CONFIG_V1) {
> +			dev_err(&vdev->dev,
> +				"unsupported vdev config version %u\n", version);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* size of the config space must match */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     size, &size);
> +		if (size != sizeof(struct virtio_rpmsg_config)) {
> +			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
> +				size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
>   
> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> +		/*
> +		 * Optional alignment applied to each buffer size and to the TX
> +		 * buffer base address (e.g. to align buffers on a cache line).
> +		 * It must be a power of two; zero means no extra alignment.
> +		 */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rpmsg_buf_align, &rpmsg_buf_align);
> +		if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rpmsg_buf_align %u is not a power of two\n",
> +				rpmsg_buf_align);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* note: tx and rx are defined from remote view */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     txbuf_size, &vrp->rx_buf_size);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rxbuf_size, &vrp->tx_buf_size);
> +
> +		/* The buffers must hold at least the rpmsg header */
> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
> +				vrp->rx_buf_size, vrp->tx_buf_size);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/*
> +		 * The buffer size must be aligned to the provided alignment for
> +		 * so that the start address of tx bufs can be aligned.
> +		 */

'tx' to remove as  it also concerns Rx buffers


What about removing this check to manage alignment during buffer allocation?

For example, if the alignment is on a 64-bit address and the tx_buffer 
and rx_buffer sizes are 40 bytes, 48 bytes can be allocated in memory 
for each buffer, and the virtio descriptor can be filled with aligned 
addresses.

In other words, the rpmsg_buf_align field contains the alignment 
constraint from the remote processor. If the Linux kernel wants to 
impose another alignment constraint, it must test or update 
rpmsg_buf_align, but it must not impose alignment on the buffer size.


> +		if (rpmsg_buf_align &&
> +		    (!IS_ALIGNED(vrp->rx_buf_size, rpmsg_buf_align) ||
> +		     !IS_ALIGNED(vrp->tx_buf_size, rpmsg_buf_align))) {
> +			dev_err(&vdev->dev,
> +				"bad vdev config: buf sizes (rx %u, tx %u) not aligned to %u\n",
> +				vrp->rx_buf_size, vrp->tx_buf_size,
> +				rpmsg_buf_align);
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		dev_dbg(&vdev->dev,
> +			"vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz = 0x%x\n",
> +			version, rpmsg_buf_align, vrp->rx_buf_size,
> +			vrp->tx_buf_size);
> +	} else {
> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +	}
> +
> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>   
>   	/* allocate coherent memory for the buffers */
>   	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -874,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	/* first part of the buffers is dedicated for RX */
>   	vrp->rx_bufs = bufs_va;
>   
> -	/* and second part is dedicated for TX */
> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> +	/*
> +	 * Here buf_va is aligned to a page. Also rx buf size is aligned with
> +	 * cache line alignment provided by the firmware, so tx buf's start
> +	 * address is guranteed to be aligned with the alignment provided by
> +	 * the firmware.
> +	 */
> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>   
>   	/* set up the receive buffers */
>   	for (i = 0; i < vrp->num_rx_buf; i++) {
>   		struct scatterlist sg;
> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>   
> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>   
>   		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>   					  GFP_KERNEL);
> @@ -965,8 +1055,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>   static void rpmsg_remove(struct virtio_device *vdev)
>   {
>   	struct virtproc_info *vrp = vdev->priv;
> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
> -	size_t total_buf_space = num_bufs * vrp->buf_size;
> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +				 (vrp->num_tx_buf * vrp->tx_buf_size);
>   	int ret;
>   
>   	virtio_reset_device(vdev);
> @@ -992,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>   
>   static unsigned int features[] = {
>   	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>   };
>   
>   static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..7e14da68fd17
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Pinecone Inc. 2019
> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> + * Copyright (C) Advanced Micro Devices, Inc. 2026
> + */
> +
> +#ifndef _LINUX_VIRTIO_RPMSG_H
> +#define _LINUX_VIRTIO_RPMSG_H
> +
> +#include <linux/types.h>
> +#include <linux/virtio_types.h>
> +
> +/* The feature bitmap for virtio rpmsg */
> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
> +
> +/* Version of struct virtio_rpmsg_config understood by this driver */
> +#define RPMSG_VDEV_CONFIG_V1	1
> +
> +/**
> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> + *
> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
> + * @reserved:	reserved for padding, must be zero.
> + * @size:	size of this structure in bytes.
> + * @rpmsg_buf_align:	required alignment in bytes for each buffer. Must be a
> + *		power of two so that both the buffer sizes and the TX buffer
> + *		base address can be aligned (e.g. to a cache line).
> + * @reserved1:	reserved for padding, must be zero. Keeps the following 32-bit
> + *		fields naturally aligned.
> + * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
> + * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
> + *
> + * This is the configuration structure shared by the device and the driver,
> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
> + * the structure is naturally 32-bit aligned.
> + */
> +struct virtio_rpmsg_config {
> +	u8 version;
> +	u8 reserved;

Why about defining the version type to u16 to avoid the reserved field?

> +	__virtio16 size;
> +	__virtio16 rpmsg_buf_align;
> +	__virtio16 reserved1;

Seems useless if __packed prevents the compiler from inserting extra padding
bytes between fields,

> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;

proposal

+struct virtio_rpmsg_config {
+	__virtio16 version;
+	__virtio16 size;
+	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
+	__virtio32 txbuf_size;
+	__virtio32 rxbuf_size;
+	__virtio16 rpmsg_buf_align;
+} __packed;
+

Regards,
Arnaud

> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */

