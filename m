Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E218378803;
	Wed, 20 May 2026 07:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263088; cv=fail; b=jvA4cxlKKG3x8DkPSVUubjPWZEKr6d238EehN/QvlPzOIajMbnEIDc5MQW9Gfqqj/OEk8u/ToMJkdaXi7gY9+jtaIbuwG0FgTFqJ/3JaWxPCStjEqiK2458GHfo794r8wiBcty74CccrF7K9KUF39FLM5P4ZXjENPWo+zoPOg+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263088; c=relaxed/simple;
	bh=jK0fLyiezfb4tPyysY52qsmMj0PiaOA9U4zUYvX6MNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SZ0bBmEur0ZwBYtgVWy+jXYh4aPGQPf1bw3SjcOeNcvuLXq+Hs7Ujuou7MluJtgycICtC3DXcS6qEkciBJJMf7jVORm6mnZzpNtRwr9wLFb/uq+PhQ3yVjKNr2Qro4MJydS6KbBbMautId2ocyXGWEAfr5G+Zqa6YfnSKYoHAPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lBuue8jD; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lBuue8jD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3S37PHWaHA5y5nlSgxyqAS/wnOWt+4JqqyLFiAaBoRePNCSRogEu1OCvFOyDYNjSgFmL3XDq509YDoyCcjZq+7CbYB1JBZYNMORpXjR5pTFwqsYM+sTLGHQtmHbhoiy52pW+CvfW75TDfCkOFbxd6MivCO5L7+wFA9sZ9Mef0waECRULMpM4rhElUAYWWZbuPBA/3EVMMrAoDArn23fEEInEJFsYoU7BmqGjEKq+941nCu8y3fyNSqVhxbZ/VUdQSnyKbkAQMA49VOFiyyAPZZ7Na1NmyOP6S/BDqJg1SArU8MxUMjcmQKDGcT+C19I5myKSGhsDW/weedj6Ds3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkGS5MhCVOKyZvgpGYrWVHhaA3FIEAwQaznbzAZt1aQ=;
 b=gci7h/vcb8889a9o3VPnrhbyN6o14kwhBIgqLR9bOg/8q9nqUoP/eXeKa3nMxb7tt7gJxZk3Szuc+fZHUTuv7Vm07a8EemtvdRPmyVABmdkzccgz41WS66sa4CrxnxJIu0lYcwbwbjYd+yORg8+lOIkAI+TE+VMi8KKhQ8PidoHdyCgWJ22n0dhgLyJ5GRFBBKFne10y3bSVbQQTg8z8NOBP8YVYKCT5FDne++sn7Kt+JcvOl2XQaOZtEoBsvQ4sQceMkzRKE7HScGK1WjoYfcNTCZkBYSiVXUZSc6TIHo4BBZN7j1yw2BsdTdh1EAN4pPJ07rGPXxK++qu2ySjMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkGS5MhCVOKyZvgpGYrWVHhaA3FIEAwQaznbzAZt1aQ=;
 b=lBuue8jDCRpAwJDd1iMmpqtHPkCHCfDyWU0twXKu0GEU4mHD7USKWixreM+D7eZQrSHDhBxK2P5h0iAamrO0bLFcGsWJXrWZTylmibn1zGofGQNek7Jp2J8CFecMJDJ+8PRG4Cz9kBVuK+fxz6J7UnQSInMowOAJ8RLIcYS999VAr7jifqNKqCT3v+bAavjHF3is/hGqK079BEFAANhUY7RDbxayw72WRnZfdUuKW7zsgQA4WOGGBDCUe8dRpD9RCMSTF7M6qfxj4w2rcnUvzkx5x1cH1WzNdUwB7+YDKgKAdHMDdMCex+YR8Y0GREWsP+K4xFs7iS2c9ivWNzp6vw==
Received: from AM4PR0302CA0006.eurprd03.prod.outlook.com (2603:10a6:205:2::19)
 by AS4PR10MB7615.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:44:38 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::f4) by AM4PR0302CA0006.outlook.office365.com
 (2603:10a6:205:2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 07:44:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:44:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:48:07 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:44:37 +0200
Message-ID: <0ea5801b-c435-4f67-b811-aed696bd64b7@foss.st.com>
Date: Wed, 20 May 2026 09:44:35 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-3-tanmay.shah@amd.com> <agyfr-pxwQ4oKMAF@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <agyfr-pxwQ4oKMAF@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|AS4PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: d9c6b148-e259-4f01-a048-08deb643a531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|56012099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	n4EfwlaN7UloyWpTWL7pe4OEdQhcGzdqmFN+pfl8hyMV35xGPfgYMuMmq2lGQDNkj/w+rLCYhah6FKbwi2L2/NkZSjAPGrm8AstRNXCsDMYfKm7CEeTtPXr+i3ELd2nzHEbyB0ao+TpHxPfhfL4kgWrdKNDwStfezda1XZu39p5nxH/V0gE1+KxJbXl1L6x9nuBFfyY8JcDKm3PQD0p6SxijTQyDYAbyNXDderIhv1l48PsjkNZgTXw3niZRZzbirGKsZC7UVUJHF8hEradF2LZcKr5lH28O71qERYgr7WMiNobLddP7EMiUbqVD7tKqmnq9auerevJkURfGReYUWF90FOBTvIz/6h8cwvDenMDUYVvu43ufTSvfzInGarhWcmN2czZurxeKvof9seLp7QlJGezGo5i4oc/2GyAfj+uQCc6b+Kt0pf6A0NjGMq9kKFBkZOAocThFIuptC56+u4EMnQvTRi/2ybjZBMCgCGtMml7fdhfFlK1hBwaI9onEYFFLzQOHyl1YS3PgHd/PF4Xn+5EPKkuBT/L4V/5oyktPFEL0PSFvVpVRJlhNCTS5ZPYEQ6FXg1mTHWIg5c2+x4X1SoakYmyMsZssiiqixVyibsObjDfB8YtB7BGWcVDaiHbW9t88CILfx+54EZRT+2PXs4/9iyaXlt9wvD2RpjLrY0Zy2GEEKjzhZxxgzivRbm5k7tDtHxVMC3YdLWooX8MT/HufY2y5tlPj80sMGqE=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vrl+ubNilQeZYwmH6t412InZdK7J85WlNaF5GA+sjd95GskhzyCRrzNJUrr+mvI41Qr0hsugSpQVvdrdJLjEuJdBB2x2mXYNOGlqL1s44COlqSsD+qyoPd6gWuc7rWEUZ4QDs5Yw51RErU1STSfS2R3yFcer7qPw0rHey/PHSs8rdNGo5eC4Iwj2ue+PYnAZmdK+Jq5udqg0IzJGzvfj6K1iT/c82nn591tYIt8QXfMvQoApbv2d4SYWSTCUBbLxNbcds2jOgyJkt8jVA22LZs0rKAt6vW/wMS41hoO3Q0LEt13XIh+C/yeWz57JHjzVl/v3y8hNxuGdVqMg3u6p6xiSVrMczPP/1lidXSF0a3FzjCeCFUWMSVF7b+jGnkuFJbe5hxuegf874WES+AiPyH8RaED4ooEm1TMkx+diOPtp3fsOmohPXtaMEcyyGnCZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:44:38.2860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c6b148-e259-4f01-a048-08deb643a531
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB7615



On 5/19/26 19:36, Mathieu Poirier wrote:
> On Wed, Apr 29, 2026 at 09:10:52AM -0700, Tanmay Shah wrote:
>> 512 bytes isn't always suitable for all case, let firmware
>> maker decide the best value from resource table.
>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Test done:
>>    - Verify this patch works with the existing firmware
>>    - Verify this patch works with the firmware that configures
>>      differt tx & rx buf size
>>
>> Changes in v2:
>>    - %s/sbuf_size/tx_buf_size/
>>    - %s/rbuf_size/rx_buf_size/
>>    - fix typo
>>    - do not use ALIGN on buf size, rely on allocator
>>    - make err msg more explicit, %s/vdev config:/bad vdev config/
>>    - fix license and add AMD copyrights in the header virtio_rpmsg.h
>>    - Assign bit 1 to VIRTIO_RPMSG_F_BUFSZ feature
>>    - use __virtio32 over __u32
>>    - add version field to virtio rpmsg config structure
>>    - move linux/virtio_rpmsg.h to linux/rpmsg/virtio_rpmsg.h
>>
>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 70 ++++++++++++++++++++++--------
>>   include/linux/rpmsg/virtio_rpmsg.h | 27 ++++++++++++
>>   2 files changed, 79 insertions(+), 18 deletions(-)
>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index e59d8cf9b975..8116d94413cc 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/rpmsg.h>
>>   #include <linux/rpmsg/byteorder.h>
>>   #include <linux/rpmsg/ns.h>
>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>   #include <linux/scatterlist.h>
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>> @@ -39,7 +40,8 @@
>>    * @tx_bufs:	kernel address of tx buffers
>>    * @num_rx_buf:	total number of buffers for rx
>>    * @num_tx_buf:	total number of buffers for tx
>> - * @buf_size:	size of one rx or tx buffer
>> + * @rx_buf_size: size of one rx buffer
>> + * @tx_buf_size: size of one tx buffer
>>    * @last_sbuf:	index of last tx buffer used
>>    * @bufs_dma:	dma base addr of the buffers
>>    * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
>> @@ -59,7 +61,8 @@ struct virtproc_info {
>>   	void *rx_bufs, *tx_bufs;
>>   	unsigned int num_rx_buf;
>>   	unsigned int num_tx_buf;
>> -	unsigned int buf_size;
>> +	unsigned int rx_buf_size;
>> +	unsigned int tx_buf_size;
>>   	int last_sbuf;
>>   	dma_addr_t bufs_dma;
>>   	struct mutex tx_lock;
>> @@ -68,9 +71,6 @@ struct virtproc_info {
>>   	wait_queue_head_t sendq;
>>   };
>>   
>> -/* The feature bitmap for virtio rpmsg */
>> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
>> -
>>   /**
>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>    * @src: source address
>> @@ -128,7 +128,7 @@ struct virtio_rpmsg_channel {
>>    * processor.
>>    */
>>   #define MAX_RPMSG_NUM_BUFS	(256)
>> -#define MAX_RPMSG_BUF_SIZE	(512)
>> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>>   
>>   /*
>>    * Local addresses are dynamically allocated on-demand.
>> @@ -444,7 +444,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>   
>>   	/* either pick the next unused tx buffer */
>>   	if (vrp->last_sbuf < vrp->num_tx_buf)
>> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>> +		ret = vrp->tx_bufs + vrp->tx_buf_size * vrp->last_sbuf++;
>>   	/* or recycle a used one */
>>   	else
>>   		ret = virtqueue_get_buf(vrp->svq, &len);
>> @@ -514,7 +514,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>>   	 * messaging), or to improve the buffer allocator, to support
>>   	 * variable-length buffer sizes.
>>   	 */
>> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>   		dev_err(dev, "message is too big (%d)\n", len);
>>   		return -EMSGSIZE;
>>   	}
>> @@ -647,7 +647,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>   	struct rpmsg_device *rpdev = ept->rpdev;
>>   	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>   
>> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>   }
>>   
>>   static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>> @@ -673,7 +673,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>   	 * We currently use fixed-sized buffers, so trivially sanitize
>>   	 * the reported payload length.
>>   	 */
>> -	if (len > vrp->buf_size ||
>> +	if (len > vrp->rx_buf_size ||
>>   	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>   		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>   		return -EINVAL;
>> @@ -706,7 +706,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>   		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>   
>>   	/* publish the real size of the buffer */
>> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
>> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>   
>>   	/* add the buffer back to the remote processor's virtqueue */
>>   	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>> @@ -824,6 +824,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>   	int err = 0, i;
>>   	size_t total_buf_space;
>>   	bool notify;
>> +	u16 version;
>>   
>>   	vrp = kzalloc_obj(*vrp);
>>   	if (!vrp)
>> @@ -855,9 +856,41 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>   	else
>>   		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>   
>> -	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>> +	/*
>> +	 * If VIRTIO_RPMSG_F_BUFSZ feature is supported, then configure buf
>> +	 * size from virtio device config space from the resource table.
>> +	 * If the feature is not supported, then assign default buf size.
>> +	 */
>> +	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_BUFSZ)) {
>> +		/* note: virtio_rpmsg_config is defined from remote view */
>> +		version = 0;
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     version, &version);
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     txbuf_size, &vrp->rx_buf_size);
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     rxbuf_size, &vrp->tx_buf_size);
>> +
> 
> A check is also needed to make sure the version received from the resource table
> is '0'.
> 
>> +		/* The buffers must hold at least the rpmsg header */
>> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>> +			dev_err(&vdev->dev,
>> +				"bad vdev config: rx buf sz = %d, tx buf sz = %d\n",
>> +				vrp->rx_buf_size, vrp->tx_buf_size);
>> +			err = -EINVAL;
>> +			goto vqs_del;
>> +		}
>> +
>> +		dev_dbg(&vdev->dev,
>> +			"vdev config: version=%d, rx buf sz = 0x%x, tx buf sz = 0x%x\n",
>> +			version, vrp->rx_buf_size, vrp->tx_buf_size);
>> +	} else {
>> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +	}
>>   
>> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
>> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>>   
>>   	/* allocate coherent memory for the buffers */
>>   	bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -875,14 +908,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>   	vrp->rx_bufs = bufs_va;
>>   
>>   	/* and second part is dedicated for TX */
>> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>   
>>   	/* set up the receive buffers */
>>   	for (i = 0; i < vrp->num_rx_buf; i++) {
>>   		struct scatterlist sg;
>> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>   
>> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>   
>>   		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>   					  GFP_KERNEL);
>> @@ -965,8 +998,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>>   static void rpmsg_remove(struct virtio_device *vdev)
>>   {
>>   	struct virtproc_info *vrp = vdev->priv;
>> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>> -	size_t total_buf_space = num_bufs * vrp->buf_size;
>> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +				 (vrp->num_tx_buf * vrp->tx_buf_size);
>>   	int ret;
>>   
>>   	virtio_reset_device(vdev);
>> @@ -992,6 +1025,7 @@ static struct virtio_device_id id_table[] = {
>>   
>>   static unsigned int features[] = {
>>   	VIRTIO_RPMSG_F_NS,
>> +	VIRTIO_RPMSG_F_BUFSZ,
>>   };
>>   
>>   static struct virtio_driver virtio_ipc_driver = {
>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>> new file mode 100644
>> index 000000000000..285918be68b9
>> --- /dev/null
>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) Pinecone Inc. 2019
>> + * Copyright (C) Xiang Xiao <xiaoxiang@pinecone.net>
>> + * Copyright (C) Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _LINUX_VIRTIO_RPMSG_H
>> +#define _LINUX_VIRTIO_RPMSG_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/virtio_types.h>
>> +
>> +/* The feature bitmap for virtio rpmsg */
>> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
>> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
>> +
>> +struct virtio_rpmsg_config {
>> +	__virtio16 version;
>> +	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
>> +	__virtio32 txbuf_size;
>> +	__virtio32 rxbuf_size;
>> +	__virtio32 reserved[14]; /* Reserve for the future use */
> 
> 66 byte for the configuratio space?  I'm puzzled about the reserved[14], how did
> you come up with that number?

Is it useful to define the reserved field?
The version should allow us to determine the content.
An other solution is to introduce a'size' field to determine the size of
the structure:
struct virtio_rpmsg_config {
	__virtio16 version;
	__virtio16 size; /* size of the configuration space */
	/* The tx/rx individual buffer size(if VIRTIO_RPMSG_F_BUFSZ) */
	__virtio32 txbuf_size;
	__virtio32 rxbuf_size;
	__u8 private[0]; /* customized config */
};

> 
> The rest looks good to me.
> 

Looks good to me too.

Thanks,
Arnaud

>> +	/* Put the customize config here */
>> +} __packed;
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>> -- 
>> 2.34.1
>>

