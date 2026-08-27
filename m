Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013024.outbound.protection.outlook.com [40.93.196.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C4140E5F;
	Thu, 27 Aug 2026 20:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860884; cv=fail; b=JFWioK4Z7ldv/2Xc64nYVzPm2KB3y3ufnCruSojkvBqJN4UUEPmOgPuN9jpifj23s6abvZh5Y4Z5CnLDYuEwExIWoaRoINWHR8FbJbBDAjKkukNKjHIwyhhzTtQ13Dv4hU96aUKzc608WW5UySCTq0Tj+PD54cVmWxDAKuvjCNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860884; c=relaxed/simple;
	bh=d/SlU8DWYaSTpPYtGu+6AnfAVth2bf3EUVm6BN/HxDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kg/GMcwXx+laQApgsLlCR2pJvR+k4lUalhsW5/Uly/akZNzbRQXqHP+RloZ+CHllGjGu9Pw2O6VuhoeGER6HdsQK+DrZshI0b7XhUrCzL6T/uDWFOLmyFlpIelV8bGWOyp93SS0SoPvd3zQHOZZwRwdSqekXhMqJvBn/vAeD0oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ti+uauxr; arc=fail smtp.client-ip=40.93.196.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ti+uauxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE7wUoxcf+iGLZQSQxuNW9zQFs9J9rHQ8ACh9uRrWUt6GMrNKpXLEHHM4nOGrtR+ECnUG/R774obLHb2jgOhZb+KB3trYFtOuQQcyFqbW8N7DZan3P1HLWEVC/eOepOuWgUbx6fI0zqFhd1Skn+YxPEySst/rm5z0AMzW8+ht1JQr9i601N/ACtbbbkqaus7Lma0EZ+6wrW3FOqUoBYXHkhGFGz9Av9ZqBCado0mb7Yel72oASix3Kj7EnIm5R1WXk2XbtffbomYKZbRDEYVcsO5Ra5iPe7iNUe+JASyxzSiFB7LHnsmxy3YH1/FkVdlI5rU2J56fC8CGE+5aoHUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TqS+OXWk9z7ecsFV6+SxTeEsshU6oAb9aJdlqk8Hc0=;
 b=q7gLVYOgl2CU3H+EWShHusI72Fmsn139wZW5D5QlR7lJmD2hSbRanMRxkRH9NyVzZT8NC4woAsCiJUswCYJIfGZd6+NpjPjfuMbt7lD1LDfMryVsb3INsRdbYpeoeqCdqxHQfgosUUQ5SSLWg5wvni/mJTl1PnyTc/gmD3D9XbrdSADvKCCBTtweUnj4sM1nPHrj3WWCEb6+qRjj1NMvfOtZjyVTGDReYfxHxVCb21WnOJPDuiWbVOOSYuoMq/WPpxcxG/+og7gntvWH/9RNbEfergjC0eF/KQC0zdcS0co0Lw6/sWX1al+/yMQgWn8Z0qL6mZEZ0uY32cPlVAswCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TqS+OXWk9z7ecsFV6+SxTeEsshU6oAb9aJdlqk8Hc0=;
 b=ti+uauxrsU4vlRr25LTjOcajuvhX1b1BdRiilAwvK/SPPYL7AgHxJUrOttid/1SZOxmCbm/VvzTpxez+fuTEljrUQS3p9i0zJaiOUE0JuOdvQXTtkbOnGe0wjrIdLhvYgf//Gh01jqW8ZjZYBZCh56UjfvVwqAcTUSOkt98xVjY=
Received: from BN1PR10CA0002.namprd10.prod.outlook.com (2603:10b6:408:e0::7)
 by SJ1PR12MB6052.namprd12.prod.outlook.com (2603:10b6:a03:489::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 20:01:08 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::44) by BN1PR10CA0002.outlook.office365.com
 (2603:10b6:408:e0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 20:01:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Thu, 27 Aug 2026 20:01:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 15:01:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 15:01:07 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 15:01:07 -0500
Message-ID: <b17047b9-ae6a-460a-b806-ba78e454674a@amd.com>
Date: Thu, 27 Aug 2026 15:01:01 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH v6 3/5] rpmsg: virtio_rpmsg_bus: get buffer size from
 config space
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260814044238.518296-1-tanmay.shah@amd.com>
 <20260814044238.518296-4-tanmay.shah@amd.com> <aoxywkQPy7VPaIFm@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <aoxywkQPy7VPaIFm@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|SJ1PR12MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: bab01074-2ed7-4d29-5d08-08df0475ef36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|4143699003|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	avRy3tkWwc2aFDqUggjt4KnOvIn6Od0GtKJw5fSppgoW6m4pmC7KBbpeYe2Tz0YHPmLMoNbHucOI/GLW4NIvWEAWr5mwiLvVwcbR1lmAizedkbH9V+ovm3FIJAi0lNpK9pPxjrXehD1JGRZ589Kzf0CdRgZ7JN59TsyI7qJlfW5gEtB8ZPe7ERjdGe9hmyiEkFBUb7iIQW56avR0tNfVcbWgSe3BGyX0+RmTgWCOajbhNYeoVbHDDVE3udFs4KCbIOJENQH5BWFMRYZweDPoHrCYERti5p+eEo9K/iZl+tiMa55a0MmN9y+oHW/acCemDXrCkxi0OcasCrqAphPunnsbn1aEvUf88OTcz2n9pk9mrhdQFzsOjk5i4rmRsSEvLPx49sv2YiAkIk3UBS1L7UaDsjocvlTxLk6c+hNJovCOhccoA0VQJ3Je+dyxizqXOYqRGtB6fguHDHWJg8QQ6AVHkClyrOFZUWQgKoIi1Q/CrPCk2avl2t3QcZ77Wn/D0BWThu3bIPOTvJ9hh0UFx/wANEjSiXbRG5WttyyOGBcoE6lfy9E4fT6VUs4s02Yg60UO0hnTQPXTrIKM6Jpp4anAWfVg+W4jRQjH3iPE4cGyAIRr5Kb+bZzm/pUkiWlf/CqjNNIbQvk/+CZ/r6QzRzAieplel1x+SUYx7+YndKQoKtJBEEyTD0yeesy0+k0Z
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OhEhWpGth8m7YmKO5T5u2eroy7ilQq9Fo6/+E+C5bvBxmijc9k/z2tMTJKqvtowsbz6AluGpsWAIt0mJUXTSWmLmW36tJ6NeCTCn9c+ZNDLfHkFIiiUffK4TPEbo5n77oS/iaVHlBpE7gUotvXbKB6X6mI5SHLcZ4KyAeUXOLOat6igBAXRmPUgRXEZ08fScAHk4fGcNTBLpZlRdGReBUfLIG/HyLGGUEfo0EXBGQ/DqRIzlsXxebTclbrG7VFL4WbF0qFx571tGgVCHsX4CC7AcAc6o70EM/A86ZSA3QXSWNe2LA8mNhoHGXNMHdsgqI112NKGyx1balBphTJ8AT6vedljVgCdFu08rL57ZBEhshPqaAw3lDm/M/aMmxDiCAsB6JvYovuETRKcMBQ91EtaMnArtlr+ZwdNZTJHAHXDZas2jLqEX5dPaz8fPt331
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:01:07.9600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab01074-2ed7-4d29-5d08-08df0475ef36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6052



On 8/24/2026 11:35 AM, Mathieu Poirier wrote:

>> +		dev_dbg(&vdev->dev,
>> +			"vdev config: ver=%u, rx sz = 0x%x, tx sz = 0x%x\n",
>> +			version, vrp->rx_buf_size, vrp->tx_buf_size);
>> +	} else {
>> +		vrp->rx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +		vrp->tx_buf_size = DEFAULT_RPMSG_BUF_SIZE;
>> +	}
>>
> 
> Please move the above to a distinct funtion.
> 
> I am done reviewing this set.
> 
> Thanks,
> Mathieu
>   

Thank You Mathieu.

I started addressing the comments, but missed to ack here. I agree to
all the comments and will be addressed in the next revision.

Tanmay

>> -	total_buf_space = (vrp->num_rx_buf + vrp->num_tx_buf) * vrp->buf_size;
>> +	total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +			  (vrp->num_tx_buf * vrp->tx_buf_size);
>>  
>>  	/* allocate coherent memory for the buffers */
>>  	bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> @@ -873,15 +925,14 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  	/* first part of the buffers is dedicated for RX */
>>  	vrp->rx_bufs = bufs_va;
>>  
>> -	/* and second part is dedicated for TX */
>> -	vrp->tx_bufs = bufs_va + vrp->num_rx_buf * vrp->buf_size;
>> +	vrp->tx_bufs = bufs_va + (vrp->num_rx_buf * vrp->rx_buf_size);
>>  
>>  	/* set up the receive buffers */
>>  	for (i = 0; i < vrp->num_rx_buf; i++) {
>>  		struct scatterlist sg;
>> -		void *cpu_addr = vrp->rx_bufs + i * vrp->buf_size;
>> +		void *cpu_addr = vrp->rx_bufs + i * vrp->rx_buf_size;
>>  
>> -		rpmsg_sg_init(&sg, cpu_addr, vrp->buf_size);
>> +		rpmsg_sg_init(&sg, cpu_addr, vrp->rx_buf_size);
>>  
>>  		err = virtqueue_add_inbuf(vrp->rvq, &sg, 1, cpu_addr,
>>  					  GFP_KERNEL);
>> @@ -964,8 +1015,8 @@ static int rpmsg_remove_device(struct device *dev, void *data)
>>  static void rpmsg_remove(struct virtio_device *vdev)
>>  {
>>  	struct virtproc_info *vrp = vdev->priv;
>> -	unsigned int num_bufs = vrp->num_rx_buf + vrp->num_tx_buf;
>> -	size_t total_buf_space = num_bufs * vrp->buf_size;
>> +	size_t total_buf_space = (vrp->num_rx_buf * vrp->rx_buf_size) +
>> +				 (vrp->num_tx_buf * vrp->tx_buf_size);
>>  	int ret;
>>  
>>  	virtio_reset_device(vdev);
>> @@ -991,6 +1042,7 @@ static struct virtio_device_id id_table[] = {
>>  
>>  static unsigned int features[] = {
>>  	VIRTIO_RPMSG_F_NS,
>> +	VIRTIO_RPMSG_F_BUFSZ,
>>  };
>>  
>>  static struct virtio_driver virtio_ipc_driver = {
>> diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
>> new file mode 100644
>> index 000000000000..e28144253a12
>> --- /dev/null
>> +++ b/include/linux/rpmsg/virtio_rpmsg.h
>> @@ -0,0 +1,41 @@
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
>> +	/* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
>> +	__virtio32 txbuf_size;
>> +	__virtio32 rxbuf_size;
>> +} __packed;
>> +
>> +#endif /* _LINUX_VIRTIO_RPMSG_H */
>> -- 
>> 2.43.0
>>

