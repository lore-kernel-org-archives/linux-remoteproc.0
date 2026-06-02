Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D78E3C65E0;
	Tue,  2 Jun 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388752; cv=fail; b=jDXePcxBrAjiZKChbMpimLp1dn3zqeHxEWJIvMF7zEeVaeuCslYZneDwsnC0/T9s3s7TMe51XW3axpUue5SEbJPJdDk6K2dLJnc0ZrVCaiD3GH0MMMV1/c55ZpwazAYivnfhRJb3DNiwcdGviXPmIVluTrx69OFjiJ8n/QKb+/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388752; c=relaxed/simple;
	bh=IqtCwcWUm2YAVwZkkB9yr+nQxUiaU3aGTTbC/dUG4fM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WmpwhQMHMAqOjkcxSGEb1/Uv7TcVqUYDBQEczoEs97k05C9jVkDkGTLddUyJEU7bfo40MjDNVbKVCXaZYpGx8lUsEj7PbHDp56nWbtS7F8E0XZEb36KMeugQyvEtdf2H7e6jJTIC6m8DeEw6U9DJwVCbxmcBmOMcOSRq6UvLt9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KrvjfxX9; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KrvjfxX9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cX5l5TCnyzFYMyleZsd0PkAkNcQbbexslRgq3S2gHeuULN425b9XtUExVUryF1F/HF8ux5oc832mqutnZnrYeft2xRy1NQIdePcwnCpbN3fSZ+Ib2snb1w1LljSFvYFJLe1xsNfYOabC4vyRvtE24nlFJ7EMQCFvAjdlKP9ztI+clnuTLkjQdiiUeakPOifzswrTMo0Mni4umBJ9smRBZ6uGeyiYrG/9fORM76OVNTDa3rYxrh3JMf+pzQq+fjKH/VCg+miRWkXK4Ps8ZL8OaZ2Lqzd7KQxizmZHSHuU99Od1mXffdYBvyAwi+NQG/lq4Wvtk5EuXAu3y7rPJ0oSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKSIuWChWMYW4aFExru9O79ZhUfK2vFwx6q3cSiXsnI=;
 b=HUnqN5AHycuOJJsjS/d5KduLBuHpdADtJ83zESip7C7mWxX6xcmnWd+/h/Y2BvX4pgR5yf6rdup1pksa7Kqe5LFM0sVLRw55kI1pcBZRO7n20QvBYX8QU6Kt+p6kTTUpdvr5pTBYae7lAQYvK4h5SA0aTNRbqGXUuKodSWpwBjZ146b4z3uiUqcji1GoMbMZ9hM9OFutPbVnO6+tcwlYIodWafnZtFNpHGTskZhFT+zvfL/8GSOdZ4fpvOrC1yIR6bo7GiNYaQ27UZSpbtPqQ2GvchWIySE71GrPQHFVjP8q8tV/nLwYlML4WFu/CpRs749QxJJs3wFpTTEPjUsLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amd.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKSIuWChWMYW4aFExru9O79ZhUfK2vFwx6q3cSiXsnI=;
 b=KrvjfxX9zGT72K4OQspSI9+e9+ZCPqJkIAXVspKZNgs9zn4lMRxUtqwwx25g/zMt6G4ZMfC7GCMJglAt09HAmnc/MUrMalR3X9DMawDuDdmPuYi9MLYraCpqs4EdOamT3bvwGPUVgi/VVS1f72+ozcnWJRNdnlju6fXhUynTmHSy8Q4zKwPxtVdXIdOwDJVqxJcpszX1o8JRqTrpN/piae9YmF27UJfS4aeVvhXqBvIGCq9MUvJIozbFYQRDJ73te9zVCNJhgyPSZI8nr3qj0nOjS5O1p68lsxaKpVlOvErchLkjc2n3c8UkJ70I4rggwPuVhf0UqvVLc2IB3MVH6Q==
Received: from DB9PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:10:1d9::6)
 by PA6PR10MB9599.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 08:25:43 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::75) by DB9PR02CA0001.outlook.office365.com
 (2603:10a6:10:1d9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 08:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 2 Jun 2026 08:25:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 10:29:13 +0200
Received: from [10.252.30.132] (10.252.30.132) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 10:25:13 +0200
Message-ID: <2e4b5ce9-f106-4218-bf65-2fb675d99e66@foss.st.com>
Date: Tue, 2 Jun 2026 10:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Tanmay Shah <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<divin.raj@arm.com>
References: <20260529164327.1827121-1-tanmay.shah@amd.com>
 <20260529164327.1827121-4-tanmay.shah@amd.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260529164327.1827121-4-tanmay.shah@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C4:EE_|PA6PR10MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a778e6-9a08-4630-626a-08dec08089b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|4143699003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	zge357mdbMdyeMNNcW4cVo5RU7mMlmXJFu86jaU21Ff+Q+RvKXlJTIDVyeXFuGvUrbppVmucEeoYvLbFb3tQsnbK/JLui23LOv9sZzjRdwlob4G3E9ucI7meg3H+gX3LUN3WVdtwbAjlF6Cv1CNM2z14p3AejJDIFO06n6v2fGNAT1xBPOkPuJG9yRKeRh+wi3Cu3WCV/ycqu91Z/TAO5FbRkwnDZP7OjQVof6ZgWjAp7VT/ycc4nIU47B4yRsSSKrMW5JbUClRP0H7+4aeY4w2xL9nmu6Hva924x7S7idO0IU8hK/hd3DbGA5xpKHYel7r08IFnH+8FvS9nkk5AoVgnsglplt5cKkqnycmf7pAmLzbQKBii0MWq9C8SloaX5dXkALOafeYko+tPqqIgxGF0WPiW2AEVei2NMTMZOf1G9dLzKn12NrrGG8dKp2gED6FOU2KSF5TIWKAegXq2H9W59GyIWokjXJgGrHRcPhA+Nfjl3UN74yYiq76F+nF//Qf3uphVLFuJjhYhfIDawBgl1fisAZHhs7w/a/z9iGFU0UYXgQQOS7Ys8mDeJLfZYrLL5T8ir6m1Lr1Bnndo9sp/1t45DJPkSVr1sbwpAKZ0NjTEgjuIIbeb7oZ2J/gGZMaTIB2aOp4A4O5bylvPXrGhnFsjtaUaSY33mIqWZCusI6XhbBShzhdCff3Bv7vYlKkGYYQAzyRcjEYHZs6f//2YAhdNvVfXHAQcOsiCCwk=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xPFuvTI2ceYeuN4z7EnLT7dHt+8+CB2lEort4tAL9WUx4OAith5sGMV9biJ+zvN51adyr1krU5pTC5LR/y7JRGyGdrm6t/xNWS28Iqw1/shVYGslTDnW0IYJM7lj0cm1nWF140cVmgY19pqTvDbFRjIntxaILWKdSmtevM33PneuXB6cBGpXx8pexsV2Ip6kua2AhyhsMXnp+QXuwSQDKUB24Ot/fNtAWYPXj5Cbt5ed463MdPDsBqBncj4kMdq+dqpYbzc0LKqXlQJ9B1lx4rqcCbrjEz5w8wcPw7oIHC50SFa8qMMfhwzqGPIHl/afGH8zJdScl182xYskE0Ntf798XCPo4EgVq4y8IUJA1Jw2ev+7/iMqP65RmoE5e9kpHCS7mA3c2DB5GUH2mxgEofe7loqlgzNsJCgZg9bXkoDPok02Mlg9wIhhda19SHps
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:25:42.9733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a778e6-9a08-4630-626a-08dec08089b3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR10MB9599

Hi Tanmay,

On 5/29/26 18:43, Tanmay Shah wrote:
> 512 bytes isn't always suitable for all case, let firmware
> maker decide the best value from resource table.
> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>    - change version field from u16 to u8
>    - introduce size field in the rpmsg_virtio_config structure
>    - check version field is set to any non-zero value.
>    - check size field is not 0.
>    - Remove field for private config, as not needed for now.
>    - add documentation of rpmsg_virtio_config structure
> 
>   drivers/rpmsg/virtio_rpmsg_bus.c   | 90 ++++++++++++++++++++++++------
>   include/linux/rpmsg/virtio_rpmsg.h | 34 +++++++++++
>   2 files changed, 106 insertions(+), 18 deletions(-)
>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 99df1ae07055..f1ab8e792f3d 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -20,6 +20,7 @@
>   #include <linux/rpmsg.h>
>   #include <linux/rpmsg/byteorder.h>
>   #include <linux/rpmsg/ns.h>
> +#include <linux/rpmsg/virtio_rpmsg.h>
>   #include <linux/scatterlist.h>
>   #include <linux/slab.h>
>   #include <linux/sched.h>
> @@ -39,7 +40,8 @@
>    * @tx_bufs:	kernel address of tx buffers
>    * @num_rx_buf: total number of rx buffers
>    * @num_tx_buf: total number of tx buffers
> - * @buf_size:   size of one rx or tx buffer
> + * @rx_buf_size: size of one rx buffer
> + * @tx_buf_size: size of one tx buffer
>    * @last_tx_buf: index of last tx buffer used
>    * @bufs_dma:	dma base addr of the buffers
>    * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
> @@ -59,7 +61,8 @@ struct virtproc_info {
>   	void *rx_bufs, *tx_bufs;
>   	unsigned int num_rx_buf;
>   	unsigned int num_tx_buf;
> -	unsigned int buf_size;
> +	unsigned int rx_buf_size;
> +	unsigned int tx_buf_size;
>   	int last_tx_buf;
>   	dma_addr_t bufs_dma;
>   	struct mutex tx_lock;
> @@ -68,9 +71,6 @@ struct virtproc_info {
>   	wait_queue_head_t sendq;
>   };
>   
> -/* The feature bitmap for virtio rpmsg */
> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
> -
>   /**
>    * struct rpmsg_hdr - common header for all rpmsg messages
>    * @src: source address
> @@ -128,7 +128,9 @@ struct virtio_rpmsg_channel {
>    * processor.
>    */
>   #define MAX_RPMSG_NUM_BUFS	(256)
> -#define MAX_RPMSG_BUF_SIZE	(512)
> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
> +
> +#define RPMSG_VDEV_CONFIG_VER 1

I would rename it

#define RPMSG_VDEV_CONFIG_V1 1

>   
>   /*
>    * Local addresses are dynamically allocated on-demand.
> @@ -444,7 +446,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>   
>   	/* either pick the next unused tx buffer */
>   	if (vrp->last_tx_buf < vrp->num_tx_buf)
> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_tx_buf++;
>   	/* or recycle a used one */
>   	else
>   		ret = virtqueue_get_buf(vrp->svq, &len);
> @@ -514,7 +516,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>   	 * messaging), or to improve the buffer allocator, to support
>   	 * variable-length buffer sizes.
>   	 */
> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>   		dev_err(dev, "message is too big (%d)\n", len);
>   		return -EMSGSIZE;
>   	}
> @@ -647,7 +649,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>   	struct rpmsg_device *rpdev = ept->rpdev;
>   	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>   
> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>   }
>   
>   static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
> @@ -673,7 +675,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>   	 * We currently use fixed-sized buffers, so trivially sanitize
>   	 * the reported payload length.
>   	 */
> -	if (len > vrp->buf_size ||
> +	if (len > vrp->rx_buf_size ||
>   	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>   		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>   		return -EINVAL;
> @@ -706,7 +708,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>   		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>   
>   	/* publish the real size of the buffer */
> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>   
>   	/* add the buffer back to the remote processor's virtqueue */
>   	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
> @@ -824,6 +826,8 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	int err = 0, i;
>   	size_t total_buf_space;
>   	bool notify;
> +	u8 version;
> +	u16 size;
>   
>   	vrp = kzalloc_obj(*vrp);
>   	if (!vrp)
> @@ -855,9 +859,58 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	else
>   		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>   
> -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
> +	/*
> +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
> +	 * size from virtio device config space from the resource table.
> +	 * If the feature is not supported, then assign default buf size.
> +	 */

Seems to me that It would be nice to document the config space in rpmsg.rst

> +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     version, &version);
> +		if (version == 0) {

		if (version != RPMSG_VDEV_CONFIG_V1) {

> +			dev_err(&vdev->dev, "invalid version of vdev config\n");
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/*
> +		 * The size field is not used for the remoteproc virtio transport,
> +		 * but kept for any future transport to use
> +		 */

I suggest to not mention the virtio transport, indeed we should decouple 
the virtio device from the virtio transport.

> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     size, &size);
> +		if (size == 0) {

	if (size != sizeof(virtio_rpmsg_config)) {

> +			dev_err(&vdev->dev, "invalid size of vdev config\n");
> +			err = -EINVAL;
> +			goto vqs_del;
> +		}
> +
> +		/* note: tx and rx are defined from remote view */
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     txbuf_size, &vrp->rx_buf_size);
> +		virtio_cread(vdev, struct virtio_rpmsg_config,
> +			     rxbuf_size, &vrp->tx_buf_size);

I wonder if we should not impose a size aligned on 64-bits

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
> +		dev_dbg(&vdev->dev,
> +			"vdev config: version=%d, rx buf sz = 0x%x, tx buf sz = 0x%x\n",
> +			version, vrp->rx_buf_size, vrp->tx_buf_size);
> +	} else {
> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
> +	}
>   
> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>   
>   	/* allocate coherent memory for the buffers */
>   	bufs_va = dma_alloc_coherent(vdev->dev.parent,
> @@ -875,14 +928,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>   	vrp->rx_bufs = bufs_va;
>   
>   	/* and second part is dedicated for TX */
> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);


We should have a cache or 64-bit alignement here. or perhaps such 
constraints should be specified in the config space?

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
> @@ -965,8 +1018,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
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
> @@ -992,6 +1045,7 @@ static struct virtio_device_id id_table[] = {
>   
>   static unsigned int features[] = {
>   	VIRTIO_RPMSG_F_NS,
> +	VIRTIO_RPMSG_F_BUFSZ,
>   };
>   
>   static struct virtio_driver virtio_ipc_driver = {
> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> new file mode 100644
> index 000000000000..77a530514d86
> --- /dev/null
> +++ b/include/linux/rpmsg/virtio_rpmsg.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) Pinecone Inc. 2019
> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
> + * Copyright (C) Advanced Micro Devices, Inc.

No year specified for AMD copyright?

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
> +/**
> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
> + *
> + * @version: version of this structure. current version is 1.
> + * @size:    size of this structure. unused for the remoteproc virtio backend.

reference to remoteproc to remove

> + * @txbuf_size: Tx buf size from remote's view. For Linux this is rx buf size.
> + * @rxbuf_size: Rx buf size from remote's view. For Linux this is tx buf size.
> + */
> +struct virtio_rpmsg_config {
> +	u8 version;
> +	__virtio16 size;
> +	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
> +	__virtio32 txbuf_size;
> +	__virtio32 rxbuf_size;
> +} __packed;


As mentioned above
- The size should be be a multiple of four to ensure 64-bit alignment.
- I would add an alignment field to align the address of the TX buffers 
to the cache line.

Thanks,
Arnaud


> +
> +#endif /* _LINUX_VIRTIO_RPMSG_H */

