Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AC71F0995;
	Thu, 16 Jul 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189979; cv=fail; b=OUuJWJOqdjE7UwkzstaM0gHJYnwy+OviOedHe6diWz00P8eo3gf/o+7xrLObDmi2Uagkb+XFhLstxatOhc39YFvAUIvn+Jexjwn3MILjbZ/04tdvrZPaxL4CM3bE68WCfuaPlUxBImEid1eTuAcuXmr5uFgn1jaF0AY3UTt2feo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189979; c=relaxed/simple;
	bh=/Q0eStveZD0cMUnIIoIe1pzyOL/sgEHppOa5DOQFLC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RJFe5o2Vwmb0fyigRMe8Vk7eBKeIuONvAsZw5w+9Ohy1lNjfwznZcCbfxpOFGUbd9PLBNmWtIYmq27lwsBuRWEy4KTNyLxrLa3Z8smfDnzzOUh0LxajY+vRaPzbh29QjJLj5TfLW4z58WZY4Vn/H+4PXMxpmPEsPAon8IrpEsqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=PjXyQh2A; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="PjXyQh2A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbzI4alXPxATymg4QIFryhDsH85eJJrMEh3R5Y/kIyPtNlaeqAx+YyqEP8BipJ8dKA0h/3zhY6dbYPhO/MRjrxI3fRYHPOCgm2nneYSJ5Cl8H7uHZJQe5eMgehrEH/otVM3jzkaFs/SMn/Hf8BtjIY3MHwOwWox+lUI8UGzwkvyrUkosZdGoDnudYe6TbWC+jqdOkIQY5TS+j3maK4bOTRmVlC4XnaB8Oe5g85lzCjpHnnlHv0AUwtqpCB7Fw2K67q9UbslQaxo9Cm5JwLJ1i0P0LVR21JdVF5/3cNoWgmJUwycou9tTyWIsViXPRyrDEC9WedVjEJd1LssFlz7EYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2fL7CyoWwRbNerEIUZNVkLpk/mhLpUR8iqXV7PBSGA=;
 b=nMd7SjPLdFae/XwfszfCVBiiXAf4P2WQ/wofCw5n2mHwdk84kkYpRZLIUIyMKg0F7D65U09rG0BhWnpacj9RnjjdRSZcvB0AYxkKUugWpGA+uFWnk/eqcd2cfuOoEPR5bT22j24bSsj7ekOd4VLS4h6qPqW0CrFaqmKpnYqWj6i4Yit9nrV/CJXGnr6KDp1VEHOgxpO5s1smta/DpdmR35Ih/2vyaYum0MMfjtjWFhG/IA0pCj5EA5vJdapJxvE7YA5zrIuAV1trCqKUuY+3DadDs95GWsYO4VT+e/Rk+7uSw5WmqwZxzXh+nYmhj627y6Tk8zC2RfVC0UsGDgbycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2fL7CyoWwRbNerEIUZNVkLpk/mhLpUR8iqXV7PBSGA=;
 b=PjXyQh2Aj01fTJfPbUItJicTv9R9ziqcU/gzcMx461GrkdwZsPQ/pc6X2z3FhlNZMavxXpTxkCrfNJ7RrCx0xRugXqpnWpO3My07l0KlcJ2ad2Of5e8IM/ZtI2aiQj0gW007GM7JAM/72kNAqFKwE761CqYSaCddlLsabulqveWNwuHciy46ZpnCFubKALhBeWxNp6lBdbpzhskUGfLWPuZb3YxiE/cskhxHWB1xItcbUimBWEDeUvYFHzoFasvwsvk89lS5lUs2EPddp78Q7myylligKv/f1edX/Am16Zj1py9B3hGCt1OfajrAHZZ/EAfv8/99J7NmNiMELiekYg==
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by AS1PR10MB5698.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:47a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 08:19:33 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::a) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 08:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Thu, 16 Jul 2026 08:19:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 16 Jul
 2026 10:24:27 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 16 Jul
 2026 10:19:31 +0200
Message-ID: <697f5a2d-8682-4027-babf-4b1337fc94c6@foss.st.com>
Date: Thu, 16 Jul 2026 10:19:29 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260710192831.3440427-1-tanmay.shah@amd.com>
 <20260710192831.3440427-4-tanmay.shah@amd.com> <ale0KIu6hXNvN0q9@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <ale0KIu6hXNvN0q9@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|AS1PR10MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c4eece7-ee7c-4d51-27e1-08dee312f781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|4143699003|10067099003|6133799003|11063799006|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	hBWLE5vQ918jg7Q7r1fWPALvnxiGQu6y0CdDDwLbidynji1GafeXkk9l33jTD+3+852T93sPmAU14B1jmMNR+M0J0HW1SAM3zTfQSoa/i2gFFs3vCVn1ISJV8rPOybvL1oriaypZ8ZnPPQglc1wbKH4w7G9n61EohwzSj9I47RelPAgg5lliduYhi+WsQTwZiBScd8iZnx4ZDVvVMPKzdGwNYJZozPSQadjYooBVhZ9xUEezMSWj00eejpSmq5ySNpWCmKrbPupOSI6FkKpAt0rRLRaskZYYxvxfjJHQSFc7tZAxwtwdKJr6khcMnaVWXKw3epCQKPA9BlRpE6iIoiyEOUwDCrG6p4fKi9ACN5i/TRF0h7lCSHw0ljsebQHj4JSK6UI4k93BuIs2BQJ//bQsUMzj4yX7EDzvoEVLJttlzX4Ohl/aKOxJHKMWkx8J6vKngNl5qI5yCjjxIiUQmCNL5FCRVc5TL6mJcrJNMwZoYFSTSezDc050Xq4TrJeUd3kg90JGkHhaksFqemX3xqDd1BStChn4rEc0Sr7mxCGr0m3uUcAIvuy3fb51mmOm+MLAnsylaenEegmwwa9QA3IEKa7KckwCWI23i1U+D4b9lkWMBCd0MR69ttPdNaR70u/xUwZt1y7r6JBp5LhVhSXpcgaV6As9xsRFHQxFP0ShIFaEYILJ6KnYNiU7PTPdZ3NMUeN4ATeCHoijefbg7g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nY97U1P24oCMQo7isDWbLUaAplgG2g3HUTIB20YoJxxoft079IbA73S0QqwYyapH0ED6ZunEzCwJckz0z/9sI8WzKqssc5wzMgfrpoobwnqgEjgpgqM/pUuzVcIO4pbFkJJtmWyUzP3N6NLKG//XmfIh9WujjbhDiaqsPNkUVWaUgwqzyMltRlOqfkhcN8oLCKXL0Sj4oYP4+JSUtTO6oKOB5IdHTQxX7hU3YUCPIO8IVbhc3oqYQBNJGJV73ICGx+O4fzs8VbydCniGcMuT8iYHAdv5u/4L7hQ5BFJFlBHRwST2lHiLrhKl4GwR74b7lk+JD1AufdMR5vZe36CVePEof0EbRP15J1+i3/QBMfdVSf5wGVhU33TcmElGggRnFdJBOgdlVcxA3n4z4YWP3Jk1r3FgQqvYpLDDnsMueck6u+KbGZ+F7fvkbog59xtN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 08:19:33.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4eece7-ee7c-4d51-27e1-08dee312f781
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5698

Hello Mathieu,

On 7/15/26 18:24, Mathieu Poirier wrote:
> On Fri, Jul 10, 2026 at 12:28:29PM -0700, Tanmay Shah wrote:
>> 512 bytes isn't always suitable for all case, let firmware
>> maker decide the best value from resource table.
>> enable by VIRTIO_RPMSG_F_BUFSZ feature bit.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>> Changes in v5:
>>
>>    - fix documentation about alignment of the buffer size
>>    - change version field from u16 to u8
>>    - remove buffer alignment check
>>    - Separate buffer alignment vs MTU of a single buffer
>>    - Use buffer alignment only to get next buffer address at alignment
>>      boundary
>>
>> Changes in v4:
>>
>>    - Introduce new patch to modify rpmsg.rst documentation
>>    - check version is always 1.
>>    - check size field is same as size of struct virtio_rpmsg_config
>>    - introduce alignment field
>>    - check alignment field is power of 2
>>    - check tx and rx buf size is aligned with alignment passed in the
>>      structure
>>
>> Changes in v3:
>>
>>    - change version field from u16 to u8
>>    - introduce size field in the rpmsg_virtio_config structure
>>    - check version field is set to any non-zero value.
>>    - check size field is not 0.
>>    - Remove field for private config, as not needed for now.
>>    - add documentation of rpmsg_virtio_config structure
>>
>>   drivers/rpmsg/virtio_rpmsg_bus.c   | 130 ++++++++++++++++++++++++-----
>>   include/linux/rpmsg/virtio_rpmsg.h |  48 +++++++++++
>>   2 files changed, 159 insertions(+), 19 deletions(-)
>>   create mode 100644 include/linux/rpmsg/virtio_rpmsg.h
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index c84b6cec9caf..5e5473f4adeb 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -15,11 +15,13 @@
>>   #include <linux/idr.h>
>>   #include <linux/jiffies.h>
>>   #include <linux/kernel.h>
>> +#include <linux/log2.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/rpmsg.h>
>>   #include <linux/rpmsg/byteorder.h>
>>   #include <linux/rpmsg/ns.h>
>> +#include <linux/rpmsg/virtio_rpmsg.h>
>>   #include <linux/scatterlist.h>
>>   #include <linux/slab.h>
>>   #include <linux/sched.h>
>> @@ -39,7 +41,10 @@
>>    * @tx_bufs:	kernel address of tx buffers
>>    * @num_rx_buf: total number of rx buffers
>>    * @num_tx_buf: total number of tx buffers
>> - * @buf_size:   size of one rx or tx buffer
>> + * @rx_buf_size: size of one rx buffer
>> + * @tx_buf_size: size of one tx buffer
>> + * @rx_buf_size_aligned: aligned size of one rx buffer
>> + * @tx_buf_size_aligned: aligned size of one tx buffer
>>    * @last_tx_buf: index of last tx buffer used
>>    * @bufs_dma:	dma base addr of the buffers
>>    * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
>> @@ -59,7 +64,10 @@ struct virtproc_info {
>>   	void *rx_bufs, *tx_bufs;
>>   	unsigned int num_rx_buf;
>>   	unsigned int num_tx_buf;
>> -	unsigned int buf_size;
>> +	unsigned int rx_buf_size;
>> +	unsigned int tx_buf_size;
>> +	unsigned int rx_buf_size_aligned;
>> +	unsigned int tx_buf_size_aligned;
>>   	int last_tx_buf;
>>   	dma_addr_t bufs_dma;
>>   	struct mutex tx_lock;
>> @@ -68,9 +76,6 @@ struct virtproc_info {
>>   	wait_queue_head_t sendq;
>>   };
>>   
>> -/* The feature bitmap for virtio rpmsg */
>> -#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
>> -
>>   /**
>>    * struct rpmsg_hdr - common header for all rpmsg messages
>>    * @src: source address
>> @@ -128,7 +133,7 @@ struct virtio_rpmsg_channel {
>>    * processor.
>>    */
>>   #define MAX_RPMSG_NUM_BUFS	(256)
>> -#define MAX_RPMSG_BUF_SIZE	(512)
>> +#define DEFAULT_RPMSG_BUF_SIZE	(512)
>>   
>>   /*
>>    * Local addresses are dynamically allocated on-demand.
>> @@ -443,7 +448,7 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>   
>>   	/* either pick the next unused tx buffer */
>>   	if (vrp->last_tx_buf < vrp->num_tx_buf)
>> -		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_tx_buf++;
>> +		ret = vrp->tx_bufs + vrp->tx_buf_size_aligned * vrp->last_tx_buf++;
>>   	/* or recycle a used one */
>>   	else
>>   		ret = virtqueue_get_buf(vrp->svq, &len);
>> @@ -513,7 +518,7 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>>   	 * messaging), or to improve the buffer allocator, to support
>>   	 * variable-length buffer sizes.
>>   	 */
>> -	if (len > vrp->buf_size - sizeof(struct rpmsg_hdr)) {
>> +	if (len > vrp->tx_buf_size - sizeof(struct rpmsg_hdr)) {
>>   		dev_err(dev, "message is too big (%d)\n", len);
>>   		return -EMSGSIZE;
>>   	}
>> @@ -646,7 +651,7 @@ static ssize_t virtio_rpmsg_get_mtu(struct rpmsg_endpoint *ept)
>>   	struct rpmsg_device *rpdev = ept->rpdev;
>>   	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>>   
>> -	return vch->vrp->buf_size - sizeof(struct rpmsg_hdr);
>> +	return vch->vrp->tx_buf_size - sizeof(struct rpmsg_hdr);
>>   }
>>   
>>   static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>> @@ -672,7 +677,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>   	 * We currently use fixed-sized buffers, so trivially sanitize
>>   	 * the reported payload length.
>>   	 */
>> -	if (len > vrp->buf_size ||
>> +	if (len > vrp->rx_buf_size ||
>>   	    msg_len > (len - sizeof(struct rpmsg_hdr))) {
>>   		dev_warn(dev, "inbound msg too big: (%d, %d)\n", len, msg_len);
>>   		return -EINVAL;
>> @@ -705,7 +710,7 @@ static int rpmsg_recv_single(struct virtproc_info *vrp, struct device *dev,
>>   		dev_warn_ratelimited(dev, "msg received with no recipient\n");
>>   
>>   	/* publish the real size of the buffer */
>> -	rpmsg_sg_init(&sg, msg, vrp->buf_size);
>> +	rpmsg_sg_init(&sg, msg, vrp->rx_buf_size);
>>   
>>   	/* add the buffer back to the remote processor's virtqueue */
>>   	err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, msg, GFP_KERNEL);
>> @@ -819,10 +824,13 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>   	struct virtproc_info *vrp;
>>   	struct virtio_rpmsg_channel *vch = NULL;
>>   	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
>> +	u16 rpmsg_buf_align = 0;
>>   	void *bufs_va;
>>   	int err = 0, i;
>>   	size_t total_buf_space;
>>   	bool notify;
>> +	u8 version;
>> +	u16 size;
>>   
>>   	vrp = kzalloc_obj(*vrp);
>>   	if (!vrp)
>> @@ -854,9 +862,87 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     version, &version);
>> +
>> +		/* for now we support only v1 */
>> +		if (version != RPMSG_VDEV_CONFIG_V1) {
>> +			dev_err(&vdev->dev,
>> +				"unsupported vdev config version %u\n", version);
>> +			err = -EINVAL;
>> +			goto vqs_del;
>> +		}
>> +
>> +		/* size of the config space must match */
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     size, &size);
>> +		if (size != sizeof(struct virtio_rpmsg_config)) {
>> +			dev_err(&vdev->dev, "invalid size of vdev config %u\n",
>> +				size);
>> +			err = -EINVAL;
>> +			goto vqs_del;
>> +		}
>>   
>> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
>> +		/*
>> +		 * Optional alignment applied to each buffer size and to the TX
>> +		 * buffer base address (e.g. to align buffers on a cache line).
>> +		 * It must be a power of two; zero means no extra alignment.
>> +		 */
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     rpmsg_buf_align, &rpmsg_buf_align);
>> +		if (rpmsg_buf_align && !is_power_of_2(rpmsg_buf_align)) {
>> +			dev_err(&vdev->dev,
>> +				"bad vdev config: rpmsg_buf_align %u is not a power of 2\n",
>> +				rpmsg_buf_align);
>> +			err = -EINVAL;
>> +			goto vqs_del;
>> +		}
>> +
>> +		/* note: tx and rx are defined from remote view */
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     txbuf_size, &vrp->rx_buf_size);
>> +		virtio_cread(vdev, struct virtio_rpmsg_config,
>> +			     rxbuf_size, &vrp->tx_buf_size);
>> +
>> +		/* The buffers must hold at least the rpmsg header */
>> +		if (vrp->rx_buf_size < sizeof(struct rpmsg_hdr) ||
>> +		    vrp->tx_buf_size < sizeof(struct rpmsg_hdr)) {
>> +			dev_err(&vdev->dev,
>> +				"bad vdev config: rx buf sz = %u, tx buf sz = %u\n",
>> +				vrp->rx_buf_size, vrp->tx_buf_size);
>> +			err = -EINVAL;
>> +			goto vqs_del;
>> +		}
>> +
>> +		if (rpmsg_buf_align) {
>> +			vrp->rx_buf_size_aligned = ALIGN(vrp->rx_buf_size,
>> +							 rpmsg_buf_align);
>> +			vrp->tx_buf_size_aligned = ALIGN(vrp->tx_buf_size,
>> +							 rpmsg_buf_align);
>> +		} else {
>> +			vrp->rx_buf_size_aligned = vrp->rx_buf_size;
>> +			vrp->tx_buf_size_aligned = vrp->tx_buf_size;
>> +		}
>> +
>> +		dev_dbg(&vdev->dev,
>> +			"vdev config: ver=%u, align=0x%x, rx sz = 0x%x, tx sz = 0x%x\n",
>> +			version, rpmsg_buf_align, vrp->rx_buf_size,
>> +			vrp->tx_buf_size);
>> +	} else {
>> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +		vrp->rx_buf_size_aligned = vrp->rx_buf_size;
>> +		vrp->tx_buf_size_aligned = vrp->tx_buf_size;
>> +	}
>> +
>> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
>> +			  (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
>>   
>>   	/* allocate coherent memory for the buffers */
>>   	bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -873,15 +959,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>   	/* first part of the buffers is dedicated for RX */
>>   	vrp->rx_bufs = bufs_va;
>>   
>> -	/* and second part is dedicated for TX */
>> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>> +	/*
>> +	 * Here buf_va is aligned to a page. Also rx buf size is aligned with
>> +	 * cache line alignment provided by the firmware, so tx buf's start
>> +	 * address is guranteed to be aligned with the alignment provided by
>> +	 * the firmware.
>> +	 */
>> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size_aligned);
>>   
>>   	/* set up the receive buffers */
>>   	for (i = 0; i < vrp->num_rx_buf; i++) {
>>   		struct scatterlist sg;
>> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size_aligned;
>>   
>> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>   
>>   		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>   					  GFP_KERNEL);
>> @@ -964,8 +1055,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>>   static void rpmsg_remove(struct virtio_device *vdev)
>>   {
>>   	struct virtproc_info *vrp = vdev->priv;
>> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>> -	size_t total_buf_space = num_bufs * vrp->buf_size;
>> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size_aligned) +
>> +				 (vrp->num_tx_buf * vrp->tx_buf_size_aligned);
>>   	int ret;
>>   
>>   	virtio_reset_device(vdev);
>> @@ -991,6 +1082,7 @@ static struct virtio_device_id id_table[] = {
>>   
>>   static unsigned int features[] = {
>>   	VIRTIO_RPMSG_F_NS,
>> +	VIRTIO_RPMSG_F_BUFSZ,
>>   };
>>   
>>   static struct virtio_driver virtio_ipc_driver = {
>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>> new file mode 100644
>> index 000000000000..735a947d5582
>> --- /dev/null
>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>> @@ -0,0 +1,48 @@
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
>> +#define VIRTIO_RPMSG_F_NS	0 /* RP supports name service notifications */
>> +#define VIRTIO_RPMSG_F_BUFSZ	1 /* RP get buffer size from config space */
>> +
>> +/* Version of struct virtio_rpmsg_config understood by this driver */
>> +#define RPMSG_VDEV_CONFIG_V1	1
>> +
>> +/**
>> + * struct virtio_rpmsg_config - config space for rpmsg virtio device
>> + *
>> + * @version:	version of this structure, currently %RPMSG_VDEV_CONFIG_V1.
>> + * @size:	size of this structure in bytes.
>> + * @rpmsg_buf_align: alignment in bytes for each buffer. Must be a power of
>> + *		     two. If 0 then no alignment will be done. This alignment
>> + *		     will not decide actual size of the buffer but will be
>> + *		     used to decided the start address of the buffer. The
>> + *		     actual size of the buffer can be different than the
>> + *		     aligned size of the buffer.
> 
> Is there really a need to have a buffer size different from its alignment?  It's
> not like the (small) delta between the buffer size and its alignment will be
> used for something else.  I'm fine with a buffer alignment requirement but in
> those cases, the firmware should set the size of the buffer in accordance with
> its alignment requirement.  Otherwise, the complexity needed to manage the
> discrpancy between the two yields a driver that is hard to maintain and prone to
> bugs.

I would be in favor to keep it.

The remote processor could expose some alignment constraints. The Linux 
kernel
or another main processor OS can have its own constraints. As it 
allocates the
buffers, it can decide the final alignment independently of the buffer 
sizes.

An example is a remote processor without a cache and a main processor with a
cache. rpmsg_buf_align could be set to 0, but the main processor could 
decide to
align buffer addresses on a cache line.
Thanks,
Arnaud

> 
>> + * @txbuf_size:	Tx buf size from remote's view. For Linux this is rx buf size.
>> + * @rxbuf_size:	Rx buf size from remote's view. For Linux this is tx buf size.
>> + *
>> + * This is the configuration structure shared by the device and the driver,
>> + * read when %VIRTIO_RPMSG_F_BUFSZ is negotiated. The fields are laid out so
>> + * the structure is naturally 32-bit aligned.
>> + */
>> +struct virtio_rpmsg_config {
>> +	u8 version;
>> +	__virtio16 size;
>> +	__virtio16 rpmsg_buf_align;
>> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>> +	__virtio32 txbuf_size;
>> +	__virtio32 rxbuf_size;
>> +} __packed;
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>> -- 
>> 2.34.1
>>
> 

