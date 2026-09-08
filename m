Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB649159F;
	Tue,  8 Sep 2026 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895332; cv=fail; b=InOjWc7++mU6yQEHKi4qKksx3NoDQ3MDd0EOgmj8jX5QRrIOqI2pSWUhh+aYGsrQQkeLWF1CuUBbqkls6JRkwxa7yfCw+0kUzpinqUZamdTa0kLyI0SlSxWyDMUh4VgetHrKvofsc1b937382toN1wuCnS85QC8ZJWwnTfueAX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895332; c=relaxed/simple;
	bh=YmwjADB5bcjS2nXCUlYtAy3Jns8SJ97gfuJD4ITGfYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WIYgr5L2Bph7txqM12idD/1cGew/FSEeAIQh1nSnjA+h/Jf0ZEY0UV1Mfi5PI43vuWv/QCia2tckvIiXSzu0dH9fSJGXN1hnRU7Lv63rh+QSOz1HerunvCq/1L8vfWC2ux5aZV92vFYzIA7kTC4858ayGewbif6fmSaXSVkeqs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BthbaR1S; arc=fail smtp.client-ip=52.101.193.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BthbaR1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg0+7GL33ZMjUIRzPTlGlNKH2dIL+0w2yi4B0+baY3AwxAu7yE01ARyD40Vi6OLzpIO3c6/QG9d4YlNqGEFnfV5s9yN478HYV78/+haRFkqFo2Ivuxn0BbxlLiL8RJciuTQtkMeFk5hWGSqEF3rJp5EnG29ZYLzX4Y3Ss6ZzZNZ9D7aRUTPon5ILxYVwOmB7fH7yIN0UfLZNyxlcG3cOAM1uuvy09DUsUcCjhq/06W5G0xhLJgQD+pxp/DIi9BYij5HR16Hsv4ZqAMWLmNNbdI7reZObb3v3eSMolalw2R5Nh/nMihvoRmGB2AE5qOLYGA2FwEYs3wGIoXlFs2yd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPSNaAFKZzrEoldVg1ehbTlIpKlWjeTISNwGkjNExKQ=;
 b=uMI8R7ZYDLQQYb7NFdytZqDKvUgfCirlsVQXzR+fx2Z/Ivz8v2qWuCQy1UDd7Y+h4G30CejdYUdpJn9GIFMnUrbFBemCc5qEnnLR0mfgVQeKGY8DHh6/UkfYxE9Utq0p5utJaREuWICTM8SqI0Rtal+C4ZB2OTnmJsES7PcteFWSZfAULTGbaG/wkAloKrWQGb6niKaxvtHaTk4CuuBNBAvFDrKAqQUMx7Vh7SUWHXqIi9Nr1MInkH33VV7N7Kd0ZBKmSxvoDClfD4syfvZpx0GP1mB+q+IrUtP8sZhI4coE7rATeF9Sx8VS/CusXSN3sjH+gVl8OSCb/U+bTtsUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPSNaAFKZzrEoldVg1ehbTlIpKlWjeTISNwGkjNExKQ=;
 b=BthbaR1SpSZ116DA+H5c1UCNmqYSPFVVnMDIadaUnzczLFpjOtpdyGQhP55G4beg0x6ie84wXhqr8MSRoTBevhruBm5kaaGtBLqlpH7DBBBB39LsVav3nZYTexWA4s2VKbBI4HcSmCwAjW+vQSyEIBXOuwQCagrxUIOuDgoa+8w=
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 19:22:02 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::25) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 19:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 19:22:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 14:21:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 14:21:53 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 14:21:53 -0500
Message-ID: <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
Date: Tue, 8 Sep 2026 14:21:53 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev
 reset
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Tanmay Shah
	<tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <aqBNoaF7m_JEiVYY@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|CY5PR12MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0ff199-9d68-4a00-a21a-08df0dde75bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	91ZT5R1gcrS+Kwp91UH9ELJcTIGZL4ShGwa4QgqqSLtiJ6eImHLd4o5g+hnrboOxjQ+rfGa5QzD8AMlHfZIXCi2uC35ltyxqMPlL2At3rFX1k84VhkHV92on2cJXWxtF41NiFHuDHuvuJwe+C0IT/a926uTB4YsrUF0qnpq/x8Cc3fqQAUpKRvujFi7eYx41WOpdTO+Qf37KH0fmTJ9EZ0aw/KVKPFbtsLJA1Ns4GnrcgJvdzfaQCsxC96IW6YGbB1JVj4rgO5h4yh84qMPtP8ilr3qJjnA1Lknf8dRSS0jqkVagTzv1I9UzI4dbTdtGMDwqy2DIwgSB4TC5BT6Q5ENoGu1CC9THAtSSmqdQOVrWK+hY3dCwZX63A895po+XvggJOLnxgyQgAhaFMtVZDGGsItCV5Sn8TrBduh03yWlKnrj4ljx2P9yKjAsNI1kgnn02ubPoxPcI21h/2WDYCl/Qb2/VdJ61wkOGyScJ1KUEYZ7NYy+c3WgX/qgQuxJuFBcr5Cm8TWsFnD6go2h5uwINTvOaqNIxJb41yk3FJgVm1s351GZ+Locq5ObBItyN+LRst4aZgCv8rfRhX7wufHtOFNCpdwsB4M4lToagZaTcU8IWfrZtHiZA80YFPKBZ3YcooWZxi88TqTNq+PuWDY5D7KCuorsW0q68pRQaG8/3/h1vFBdawI/ILFMFUMcmTDWtPaKhaF8iUxd8GaVfpQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yg0Cxr7ORWU4rfQgyJDb2DvyndFXzqbK5lxn8EcOyKja7GkaJm1Gxf3i13JJoIco15zjSzpb6/3ZfZUL1GxDTw+j/K8d53NHTAzC7Cm2NIEr/pEfvkmVyQavdYliCwQlHAatpZgJgLtkKAFjnS5I/syzhsK30adqeq8tcIhZesFlEyub5luKBnpzBNM1DlEv4NSQIoNgmrpwdO2vIcvhF9RdOa2C1YM1GqggiqKQ78reLkKSTuxvRR9LnslObafdehgX4zk2GVm0xdXstXsAEcuiumpamrOTOZUYd0zj50nZTnZaC4LB9YXP+qBZEs/ByoksNlBg7uw2HRxFQHGdCKequZx+/Ct4oIgKIo1s0X6ybxQM5kOnm5TLEwYrURFnRrxj+m0U4qiPQWzNYEZhxuaZCZaJM6Hnwg3YDeXnIWsyrTsxE5gwUGNY0ZOiTf/I
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:22:01.7939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0ff199-9d68-4a00-a21a-08df0dde75bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6526

Hello,

Thank you for the reviews.

On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
> Good day,
> 
> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
>> The existing remoteproc virtio reset path clears the vdev status locally
>> without notifying the remote processor. As a result, the host cannot tell
>> whether the remote side has observed the reset request or completed its
>> cleanup.
>>
>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
>> acknowledged reset protocol. For these resources, encode a reset request
>> in the virtio status byte, kick the remote processor using the vdev notify
>> ID, and wait for the remote side to clear the status back to 0.
>>
>> Keep the existing RSC_VDEV behavior for backwards compatibility by
>> clearing the status locally. Also reset remoteproc-created virtio
>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
>> in debugfs.
>>
>> Assisted-by: Codex:GPT-5
>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>>  include/linux/rsc_table.h                |  5 ++-
>>  5 files changed, 97 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 1ed406714849..31d79684977c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  			     int offset, int avail)
>>  {
>> +	struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
> 
> Spurious change.
> 

Ack will remove it.

>>  	struct fw_rsc_vdev *rsc = ptr;
>>  	struct device *dev = &rproc->dev;
>>  	struct rproc_vdev *rvdev;
>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  		return -EINVAL;
>>  	}
>>  
>> -	/* make sure reserved bytes are zeroes */
> 
> Same

Ack, will be removed.

> 
>>  	if (rsc->reserved[0] || rsc->reserved[1]) {
>>  		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>>  		return -EINVAL;
>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>>  	[RSC_DEVMEM] = rproc_handle_devmem,
>>  	[RSC_TRACE] = rproc_handle_trace,
>>  	[RSC_VDEV] = rproc_handle_vdev,
>> +	[RSC_VDEV_V2] = rproc_handle_vdev,
>>  };
>>  
>>  struct rproc_rsc_cb_data {
>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>> index b86c1d09c70c..1fe99749f5b4 100644
>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>>  /* Expose resource table content via debugfs */
>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>  {
>> -	static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
>> +	static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>>  	struct rproc *rproc = seq->private;
>>  	struct resource_table *table = rproc->table_ptr;
>>  	struct fw_rsc_carveout *c;
>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>  			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>  				   v->reserved[0], v->reserved[1]);
>>  
>> +			for (j = 0; j < v->num_of_vrings; j++) {
>> +				seq_printf(seq, "  Vring %d\n", j);
>> +				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>> +				seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
>> +				seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
>> +				seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
>> +				seq_printf(seq, "    Physical Address 0x%x\n\n",
>> +					   v->vring[j].pa);
>> +			}
>> +			break;
>> +		case RSC_VDEV_V2:
>> +			v = rsc;
>> +			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
>> +
>> +			seq_printf(seq, "  ID %d\n", v->id);
>> +			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
>> +			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
>> +			seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
>> +			seq_printf(seq, "  Config length 0x%x\n", v->config_len);
>> +			seq_printf(seq, "  Status 0x%x\n", v->status);
>> +			seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
>> +			seq_printf(seq, "  Reset request pending %s\n",
>> +				   rproc_rsc_vdev_reset_requested(v->status) ?
>> +				   "yes" : "no");
>> +			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>> +				   v->reserved[0], v->reserved[1]);
>> +
>>  			for (j = 0; j < v->num_of_vrings; j++) {
>>  				seq_printf(seq, "  Vring %d\n", j);
>>  				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 3a742ef6ef60..f07a96ff82a4 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -14,6 +14,7 @@
>>  
>>  #include <linux/irqreturn.h>
>>  #include <linux/firmware.h>
>> +#include <linux/virtio_config.h>
>>  #ifdef CONFIG_HAS_IOMEM
>>  #include <linux/io.h>
>>  #endif
>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>>  	struct fw_rsc_vdev *rsc;
>>  };
>>  
>> +/*
>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
>> + * impossible virtio status pattern: DRIVER and FAILED set while
>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
>> + */
>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
>> +{
>> +	status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
>> +	status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
>> +
>> +	return status;
>> +}
>> +
>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
>> +{
>> +	return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
>> +	       (status & VIRTIO_CONFIG_S_DRIVER) &&
>> +	       (status & VIRTIO_CONFIG_S_FAILED);
>> +}
>> +
>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>>  {
>>  	return test_bit(feature, rproc->features);
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>> index d5e9ff045a28..e682caa546b2 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/dma-map-ops.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/export.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/of_reserved_mem.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/remoteproc.h>
>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>>  static void rproc_virtio_reset(struct virtio_device *vdev)
>>  {
>>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>> +	struct rproc *rproc = rvdev->rproc;
>>  	struct fw_rsc_vdev *rsc;
>> +	struct fw_rsc_hdr *hdr;
>> +	int ret;
>> +	u8 val;
>> +
>> +	/*
>> +	 * During crash recovery, vdev can be stopped. But the driver can't reset
>> +	 * the device, as device is already crashed. In this case, reset becomes
>> +	 * no op.
>> +	 */
>> +	if (rproc->state == RPROC_CRASHED)
>> +		return;
>>  
>>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>> +	hdr = (void *)rsc - sizeof(*hdr);
>> +
>> +	if (hdr->type == RSC_VDEV_V2) {
>> +		/*
>> +		 * RSC_VDEV_V2 encodes an acknowledged reset request in the
>> +		 * status byte. The remote is expected to complete the reset
>> +		 * and then clear status back to 0.
>> +		 */
>> +		rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
>> +
>> +		/* after setting reset request, kick the device */
>> +		rproc->ops->kick(rproc, rsc->notifyid);
>>  
>> -	rsc->status = 0;
>> -	dev_dbg(&vdev->dev, "reset !\n");
>> +		/*
>> +		 * When device completes reset, it is expected to set status
>> +		 * to 0.
>> +		 */
>> +		ret = readb_poll_timeout(&rsc->status, val, val == 0,
>> +					 1000,      /* 1ms between reads */
>> +					 3000000);  /* 3s total timeout */
>> +		if (ret)
>> +			dev_warn(&vdev->dev, "vdev reset timed out\n");
> 
> The problem here is that we are introducing behavior that is not compliant with
> the virtio specifications.  One way to acheive the same behavior could be for
> the remote processor to check rsc->status before sending a interrupt of using
> the virtqueues.
> 

That is what remote is supposed to do. But what if remote do not
respond? If remote is deadlocked for some reason, then the Linux will
hang at this point too. That is why we need some kind of timeout.

I think timeout mechanism is better for AMP systems over waiting forever
for remote to clear the status.

Thanks,
Tanmay


>> +	} else {
>> +		/* back compatible for RSC_VDEV type of rsc vdev */
>> +		rsc->status = 0;
>> +	}
>> +	dev_info(&vdev->dev, "reset !\n");
>>  }
>>  
>>  /* provide the vdev features as retrieved from the firmware */
>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>  {
>>  	struct virtio_device *vdev = dev_to_virtio(dev);
>>  
>> +	/* reset virtio device before unregister */
>> +	virtio_reset_device(vdev);
>> +
> 
> Regardless of this feature, I think it is wise to reset the device before
> unregistering with the virtio subsystem.
> 

Agreed. I intend to keep this.

> Thanks,
> Mathieu 
> 
>>  	unregister_virtio_device(vdev);
>>  	return 0;
>>  }
>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
>> index 71b60125310e..2398a6d7033e 100644
>> --- a/include/linux/rsc_table.h
>> +++ b/include/linux/rsc_table.h
>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>>   *		    the remote processor will be writing logs.
>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>>   *		    virtio header.
>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
>> + *		    encoded in the virtio status byte.
>>   * @RSC_LAST:       just keep this one at the end of standard resources
>>   * @RSC_VENDOR_START:	start of the vendor specific resource types range
>>   * @RSC_VENDOR_END:	end of the vendor specific resource types range
>> @@ -83,7 +85,8 @@ enum fw_resource_type {
>>  	RSC_DEVMEM		= 1,
>>  	RSC_TRACE		= 2,
>>  	RSC_VDEV		= 3,
>> -	RSC_LAST		= 4,
>> +	RSC_VDEV_V2		= 4,
>> +	RSC_LAST		= 5,
>>  	RSC_VENDOR_START	= 128,
>>  	RSC_VENDOR_END		= 512,
>>  };
>>
>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>> -- 
>> 2.43.0
>>

