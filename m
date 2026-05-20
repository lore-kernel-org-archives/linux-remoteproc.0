Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9863EAC8F;
	Wed, 20 May 2026 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286387; cv=fail; b=Rhx3tbGvct6pyuCwNoWOu3JJMxiYAlSeVLC6kObvlbH+QVGUhqSqPIuz3ARUtkDm3XZvCXMCwe/bVzEV+BSfdrZu04IlfodJJsytdtQVtgYgYOsq5cxVZA7wsAWSSUT7ruolqLs/tQ2Tq/vKHlp2Q64evScxCPsYfKU+yI1AEGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286387; c=relaxed/simple;
	bh=OyZvjNHdFnEjZfU24VUwHtPvpsAU4xZq7BrgF2rbGB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EBfxfw4Ev3M4Ds2eppelVLLS4Q2jKQ8IJiQ0O67UUerz4pGzO8XywrEkoAEPdmdWOPZQf62nXBHLw9PLAPHahdabFOiyHcC0DOAYP+fV1xL8zTZs+7qgL9s/Cu80CHQDn/RBqyNfDC8xclL/k4VgUAgGKPSQ0fhRvqvqf1GjhtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QPkMKeHp; arc=fail smtp.client-ip=52.101.56.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QPkMKeHp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WR9NhmTbQVrAjR/YOAJ6nudWSssqSH/2Mg9fJXxvKhpsKQuE7Y4UeTNu4Ql9N3SqtMOReMkFmR+8AvYLnSdEcP0O3HQLp1c3khr7FvSDf7Kw3h+NPkmemFNlW5i8nNOraW3hW9bNHgqseoRSVU701kxIbx8x/1MpCShfT7iHjjZkJHvQAFd6RckJep9Letm/MIbrI38KQRpXt40V0Rryp8fRg46ayRc+Q/6cRwQBYi2jW42BTiZ1qxdq/vJC+NTs1LTlWYQ71eUQnTmWHOugAX/bD1taTvgukSpnp6BV7UOZ8Kx+Icv4buJ4uUHTDwVbRprVwWHFIlhJA5RZwa7KBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu4KVQAiKJsHZplKe4IJKPtnojKoOf33S1den8G12Mw=;
 b=W0PjEV830H4rkjS/iiH+DcEA3FAPYlGM4WUdBN8NXcJIfKbFxAyyGH8KfMhGWXWquZvv++PRkn2GtfcP2TX00k1GM4OUfVuppaNPsJ4xOfsLvrtRw3dk0QGoE1BEvDePfI0kBM+2Wer0aDs2AdbL3iUQm8yYPGogypLFOtND1xCy5nMqKHTLIvxHVvzFV0begVHgO+HNBhJ0yf7uln6AghEOElvTA9tT/0gdOOsnA7ZLhH5R17LO6lBa0QkkFgGkiHJUzsxn9qwfBP+oB/IhTrw8o+v9BDUF8QjBtoxLIJ2oxUkjR6nGolRf8BqdAem67wVClGWwY3/qLqw6Fd2upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xu4KVQAiKJsHZplKe4IJKPtnojKoOf33S1den8G12Mw=;
 b=QPkMKeHpype5bclUqVB6OgAhuu9IUkCOu7fUo4ALeTjN9O7uiSF/t4k982KG92ziTuQ5bCvoRie0j/xTqMqIS4k4Ve816B5TDFVdqH2oidGI5+d1Upb0PjNuYmrosOmShJ79jdH8rpk8i+XkZYGn2e/YR8HhJv1fcKsue0j+1Tg=
Received: from PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::7)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:13:00 +0000
Received: from MW1PEPF0001615A.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::c4) by PH7P221CA0001.outlook.office365.com
 (2603:10b6:510:32a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 14:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF0001615A.mail.protection.outlook.com (10.167.249.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Wed, 20 May 2026 14:12:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 20 May
 2026 09:12:59 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 May
 2026 09:12:59 -0500
Received: from [10.252.226.156] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 20 May 2026 09:12:58 -0500
Message-ID: <e430925d-08ee-4e23-9912-5bf7132a7f62@amd.com>
Date: Wed, 20 May 2026 09:12:58 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v2 1/3] rpmsg: virtio_rpmsg_bus: allow different size of
 tx and rx bufs
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <arnaud.pouliquen@foss.st.com>,
	<linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
References: <20260429161052.528015-1-tanmay.shah@amd.com>
 <20260429161052.528015-2-tanmay.shah@amd.com> <agyWX-y2GShRXQ_J@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <agyWX-y2GShRXQ_J@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: tanmays@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615A:EE_|SA3PR12MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e3fbd8-3281-41a8-df97-08deb679e61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	13BHI6PmPdX2miFvhnmWqQK0HwKTO4NWqv/GmS0yl+LQeqBaevwdlLWHp4MuehQy5F0eKUR5NyGzcE10jpefCmACeDA4LhdWLQjzhiDKJh1JIZGP5GI8Yy8m156BLH/n4rgM0/CbsPD5Oia4R7gJnWjWf3Fn4kJzdjsfr6RcuWRgOONLFNuea565Qmyt4+/jwLVIU/VPNGq53TvZyqFIdzLm7oqY71VwBzrfuXTiEtkr1esAqMH5vk2A2BbRdZpFyaR3Xbljky9i7OKSAWRuV1DiW+7/TWbj438WNwJSQQ/obmDfXmXT5Iv0KOa+rKVOkCT4v6bkdcLWr8eRpPhO5iJOf28a1ZZz5LaOP7my5mGPKWWKvQmfhxs8VG1jfSCRJbsJjtXQamzMw9d81Umt20uPcuf/bXC6pdXM8p4nLrSj2gKSaW3POeyL1KzA/9k1F6PWIPV5prJqfk6f8qLku7hrBETMRa4JoN/OBuEfhAe2dlTrlPXrwrdrSEjXetyc3lnjufQ3XOYSQFtx/4Uoh3d81ESWA9jEuFp4Svd04HTgOAY3TujxHohuqeaTUTsXXkBsC33O6QPfcNv/CFEdiu/RG+CFrhoA5I8g6IHm4avNGBeaAaoYiZ9CWE+6nLkfvL2EgqSyuNCY2dO1BkyJEiRSM2LxurUOYwDWRvK7U1wtvqnAi7D8qXSGpuywnPXXFycd/8EOOBHP6V6xsMGIUmS9XJbSFflR/b/FbYPCCig=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rsO1gfbVy8u01hrdR60ld8xhfbA8Ofo5pnRkNX78S11DT/Cspp4p42zGlaCuKncgpditRuKzeYiRnbrG6q14cFmOmzKw4xqsv6P84Q8uA6gLt/yoyLjHqS5+Zly5SO0NHDDs6Lh/TTjEZINkVfc9k06F5Pyo5NN/1bL/BsPGqTUO6JqweurM3ib5A3LSAcGwfxwSYQ957FTz5JzqClRDmVK9WlVHmY0wHyl4VIdchC5+R+IGHJPxQGah56zV41UO+oj4c9J2sKUGzxOoOhmauQC6cbieWvYkdigI451njFqUNS67tzP0PV1smugVn45P2wMMIhLo91mcyiTQsZqtXI70vBTbKI/iWCVHFnC1e2NV/Duuj9MUbA8+J2hFcNDhv8yuF62Ct1JYSMFSfal1NQeht9m4PaoboulNLh1kwTkopmZksJqXnSwpuBq6rYRQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:12:59.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e3fbd8-3281-41a8-df97-08deb679e61c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762

Hello,

Thanks for the reviews.

On 5/19/2026 11:57 AM, Mathieu Poirier wrote:
> Hi Tanmay
> 
> (Apologies for the late review)
> 

No problem.

> On Wed, Apr 29, 2026 at 09:10:51AM -0700, Tanmay Shah wrote:
>> Current design allocates memory for tx and rx buffers equally. The
>> throughput can be increased if the user is allowed to configure number
>> of tx and rx buffers as required. Hence, do not split number of tx & rx
>> buffers into half, but decide based on respective vring size.
>>
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>
>> Test performed:
>>   - Test this patch with existing firmware as it is, rpmsg working.
>>
>> Changes in v2:
>>   - Change author
>>   - fix commit message with better explanation
>>   - %s/sbuf/tx_buf
>>   - %s/rbuf/rx_buf
>>   - %s/num_rbuf/num_rx_buf/
>>   - %s/num_sbuf/num_tx_buf/
> 
> Please split this patch in two parts - one to do the refactoring of the
> tx/rx_buf and another one for the varying size.

Ack.

> 
>>
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 68 ++++++++++++++++----------------
>>  1 file changed, 34 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index 5ae15111fb4f..e59d8cf9b975 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -35,13 +35,14 @@
>>   * @vdev:	the virtio device
>>   * @rvq:	rx virtqueue
>>   * @svq:	tx virtqueue
>> - * @rbufs:	kernel address of rx buffers
>> - * @sbufs:	kernel address of tx buffers
>> - * @num_bufs:	total number of buffers for rx and tx
>> - * @buf_size:   size of one rx or tx buffer
>> + * @rx_bufs:	kernel address of rx buffers
>> + * @tx_bufs:	kernel address of tx buffers
>> + * @num_rx_buf:	total number of buffers for rx
>> + * @num_tx_buf:	total number of buffers for tx
>> + * @buf_size:	size of one rx or tx buffer
>>   * @last_sbuf:	index of last tx buffer used
>>   * @bufs_dma:	dma base addr of the buffers
>> - * @tx_lock:	protects svq and sbufs, to allow concurrent senders.
>> + * @tx_lock:	protects svq and tx_bufs, to allow concurrent senders.
>>   *		sending a message might require waking up a dozing remote
>>   *		processor, which involves sleeping, hence the mutex.
>>   * @endpoints:	idr of local endpoints, allows fast retrieval
>> @@ -55,8 +56,9 @@
>>  struct virtproc_info {
>>  	struct virtio_device *vdev;
>>  	struct virtqueue *rvq, *svq;
>> -	void *rbufs, *sbufs;
>> -	unsigned int num_bufs;
>> +	void *rx_bufs, *tx_bufs;
>> +	unsigned int num_rx_buf;
>> +	unsigned int num_tx_buf;
>>  	unsigned int buf_size;
>>  	int last_sbuf;
>>  	dma_addr_t bufs_dma;
>> @@ -110,7 +112,7 @@ struct virtio_rpmsg_channel {
>>  /*
>>   * We're allocating buffers of 512 bytes each for communications. The
>>   * number of buffers will be computed from the number of buffers supported
>> - * by the vring, upto a maximum of 512 buffers (256 in each direction).
>> + * by the vring, up to a maximum of 256 in each direction.
>>   *
>>   * Each buffer will have 16 bytes for the msg header and 496 bytes for
>>   * the payload.
>> @@ -125,7 +127,7 @@ struct virtio_rpmsg_channel {
>>   * can change this without changing anything in the firmware of the remote
>>   * processor.
>>   */
>> -#define MAX_RPMSG_NUM_BUFS	(512)
>> +#define MAX_RPMSG_NUM_BUFS	(256)
>>  #define MAX_RPMSG_BUF_SIZE	(512)
>>  
>>  /*
>> @@ -440,12 +442,9 @@ static void *get_a_tx_buf(struct virtproc_info *vrp)
>>  
>>  	mutex_lock(&vrp->tx_lock);
>>  
>> -	/*
>> -	 * either pick the next unused tx buffer
>> -	 * (half of our buffers are used for sending messages)
>> -	 */
>> -	if (vrp->last_sbuf < vrp->num_bufs / 2)
>> -		ret = vrp->sbufs + vrp->buf_size * vrp->last_sbuf++;
>> +	/* either pick the next unused tx buffer */
>> +	if (vrp->last_sbuf < vrp->num_tx_buf)
>> +		ret = vrp->tx_bufs + vrp->buf_size * vrp->last_sbuf++;
>>  	/* or recycle a used one */
>>  	else
>>  		ret = virtqueue_get_buf(vrp->svq, &len);
>> @@ -631,11 +630,10 @@ static __poll_t virtio_rpmsg_poll(struct rpmsg_endpoint *ept, struct file *filp,
>>  
>>  	/*
>>  	 * check for a free buffer, either:
>> -	 * - we haven't used all of the available transmit buffers (half of the
>> -	 *   allocated buffers are used for transmit, hence num_bufs / 2), or,
>> +	 * - we haven't used all of the available transmit buffers or,
>>  	 * - we ask the virtqueue if there's a buffer available
>>  	 */
>> -	if (vrp->last_sbuf < vrp->num_bufs / 2 ||
>> +	if (vrp->last_sbuf < vrp->num_tx_buf ||
>>  	    !virtqueue_enable_cb(vrp->svq))
>>  		mask |= EPOLLOUT;
>>  
>> @@ -846,19 +844,20 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  	vrp->rvq = vqs[0];
>>  	vrp->svq = vqs[1];
>>  
>> -	/* we expect symmetric tx/rx vrings */
>> -	WARN_ON(virtqueue_get_vring_size(vrp->rvq) !=
>> -		virtqueue_get_vring_size(vrp->svq));
>> -
>>  	/* we need less buffers if vrings are small */
>> -	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS / 2)
>> -		vrp->num_bufs = virtqueue_get_vring_size(vrp->rvq) * 2;
>> +	if (virtqueue_get_vring_size(vrp->rvq) < MAX_RPMSG_NUM_BUFS)
>> +		vrp->num_rx_buf = virtqueue_get_vring_size(vrp->rvq);
>> +	else
>> +		vrp->num_rx_buf = MAX_RPMSG_NUM_BUFS;
>> +
>> +	if (virtqueue_get_vring_size(vrp->svq) < MAX_RPMSG_NUM_BUFS)
>> +		vrp->num_tx_buf = virtqueue_get_vring_size(vrp->svq);
>>  	else
>> -		vrp->num_bufs = MAX_RPMSG_NUM_BUFS;
>> +		vrp->num_tx_buf = MAX_RPMSG_NUM_BUFS;
>>  
>>  	vrp->buf_size = MAX_RPMSG_BUF_SIZE;
>>  
>> -	total_buf_space = vrp->num_bufs * vrp->buf_size;
>> +	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
>>  
>>  	/* allocate coherent memory for the buffers */
>>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -872,16 +871,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  	dev_dbg(&vdev->dev, "buffers: va %p, dma %pad\n",
>>  		bufs_va, &vrp->bufs_dma);
>>  
>> -	/* half of the buffers is dedicated for RX */
>> -	vrp->rbufs = bufs_va;
>> +	/* first part of the buffers is dedicated for RX */
>> +	vrp->rx_bufs = bufs_va;
>>  
>> -	/* and half is dedicated for TX */
>> -	vrp->sbufs = bufs_va + total_buf_space / 2;
>> +	/* and second part is dedicated for TX */
>> +	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>>  
>>  	/* set up the receive buffers */
>> -	for (i = 0; i < vrp->num_bufs / 2; i++) {
>> +	for (i = 0; i < vrp->num_rx_buf; i++) {
>>  		struct scatterlist sg;
>> -		void *cpu_addr = vrp->rbufs + i * vrp->buf_size;
>> +		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>>  
>>  		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>>  
>> @@ -966,7 +965,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>>  static void rpmsg_remove(struct virtio_device *vdev)
>>  {
>>  	struct virtproc_info *vrp = vdev->priv;
>> -	size_t total_buf_space = vrp->num_bufs * vrp->buf_size;
>> +	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>> +	size_t total_buf_space = num_bufs * vrp->buf_size;
>>  	int ret;
>>  
>>  	virtio_reset_device(vdev);
>> @@ -980,7 +980,7 @@ static void rpmsg_remove(struct virtio_device *vdev)
>>  	vdev->config->del_vqs(vrp->vdev);
>>  
>>  	dma_free_coherent(vdev->dev.parent, total_buf_space,
>> -			  vrp->rbufs, vrp->bufs_dma);
>> +			  vrp->rx_bufs, vrp->bufs_dma);
>>  
>>  	kfree(vrp);
>>  }
>> -- 
>> 2.34.1
>>

