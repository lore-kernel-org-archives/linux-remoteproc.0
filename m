Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF21C4A842E;
	Fri, 11 Sep 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149819; cv=fail; b=t0EOGddGS4at9+p/HQr1J0lstgwbgco5cckSiPEmyWI+ockWrEVyGqT995aYNXivGCgEN9q1a3pLYw31eG8j/aJaalQRLfz1R0xpck6Wg1Ip8lkciEuvIgoMaXUwZ3B9h7pz4qnIcixW/4Yre3ZZg2rSkJHKqIUaVNBFGCGSqnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149819; c=relaxed/simple;
	bh=T8smvoYfNgEslBnrdpeHfs5pv91czUkdCZrmdGUzxwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QkpLBfVgYCN2xQkAEEFwnodb++tlkaMuBSF2Ew6LKYrg6vB7+ESh8iWuQOoU2bfpJ5wOo1+rXC5qaTK7lbqv4oZofaikT1qPjZ09SlOht8p2TF/xzid4rZmB5ZP9BhuWjmSnjHcgkzuOf6CAyyHg0Y97crs2eBeS9SJKTEk+Qr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ee3A9DI2; arc=fail smtp.client-ip=40.93.195.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ee3A9DI2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPETMN625WwxFDymGzI2bhe7kOvww5GiFsOawPfARnoCov1qznA63ttUEifxl6naqNCTSRjMErkbHU7r24Sitd5/H66PCWeGefGdsCZumzvDU15VT4jJ2spTGRm2GJ9p6zKh/py9t4+rR0B8vwHtXg1khJFKXteo1aYUW7ZDNo0WQRlwp7Wa9b1xbEqrftQQRpq7I2iZy/GrO8h2RNOB6J/xvgLMdvBFfbGuVQ4km/SC5v1itFGjYPg2ZkRRKNoOYAuB33eMGG/RN51xqFGXG4cFYZohOl4jqsVqertjhe9PPYQynjnaGY70rvvXopr25w4LGjqwS2OWFRwfFCwC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQoEn1mvT8bDuZ46tnjm7hHoMlHCWx9vA+afURcte/c=;
 b=s0dlU2bv7T/1eRbWwNvW93MSokJ1LP7dQZVeb7lKsaqQSRw3EQqtkQfVAjgnhDn3R+jlFhwZ+IRXIuMbzdVk4XyFeIWWIiu57sX46xVGnJSiQrYdPkpU3BbWuSSqPEUjc3DlVnjq4Wco1CIBhBUiPEaiqOerQf1ch4amvKUojf6DdrjdEzwmVoiO9CO3YoDh9NEuq7ppLhoEPElCLrZEtkPf4iisjZXR9LoUvc/XHtpC7cQyYp1AK+TZi84BGRyuyM4Epnh6pb8Larw5/hRfV7xSIWJOvxKkO7woa0VueSYNWOccnAl2+MN2RhXU+8HhCOuRd0m5vBSVhXuxVjF5VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQoEn1mvT8bDuZ46tnjm7hHoMlHCWx9vA+afURcte/c=;
 b=Ee3A9DI2T+sF9oGNdBNzFu3rh9AtrHKZkFC+SglnLM+5H5+T6XLPNChuQkjC4XJoTOLb7ITAgKePFQ6jnf23lBdiCmwWMmZSAgkDMJLwJHaGv326yU54Ct2jqiweVFtDzTKqLbypGry+brjgtBnjmEI5OqinI5hDY98nXS8ofh4=
Received: from SJ0PR03CA0216.namprd03.prod.outlook.com (2603:10b6:a03:39f::11)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 18:03:28 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::84) by SJ0PR03CA0216.outlook.office365.com
 (2603:10b6:a03:39f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 18:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 18:03:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 13:03:26 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 13:03:26 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 11 Sep 2026 13:03:26 -0500
Message-ID: <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
Date: Fri, 11 Sep 2026 13:03:21 -0500
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
To: Mathieu Poirier <mathieu.poirier@linaro.org>, <tanmay.shah@amd.com>
CC: <andersson@kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260902214453.634339-2-tanmay.shah@amd.com>
 <aqBNoaF7m_JEiVYY@p14s> <281ad636-7963-43ad-b88a-8a196eab217b@amd.com>
 <aqQW7eOsFE7jRTXT@p14s>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <aqQW7eOsFE7jRTXT@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9dfb38-e597-4982-cd8b-08df102efac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|6133799003|10067099003|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	atPKQmy3GKEDADmKRMujopX8l6TKRrhbKuXltT5yb+WnwXbjcApB5Z1aFya30KuEtp0/RA58ybEyUswp/8PJ3cr5Q+hhwu9xLlq4l4pcNT4X+5EZBG6H3ZLp4ZnthvMZxeOobH04rWfoousqMqlyK4Z0FUBJOXGGwB8hN+wNv+AHBdwIrDBc5xeB3y0zTsNOiCKkIIEr525o57jeqpLCiXWoPoKz2bIpKVDqEyI5cz4vU/Lo1uBoXatXRnEDOHkEn3iKNz4NLnAv+4QXQ3vf7M6BMy430MplwfyUAKMwCJWACvFkTT5MxNW666FUnmauaBlsKbB85Lek9227S4ugIMYcX2HxjL8KxOQYHZOhWcpEXbJXC7weO1Mc7sI88dUKC5VRQLXw1gtr3uVtMPGS7RVAcYDB57FVqHTsNUNa72LnjMPTfJGbefOLvx1Y8MibEvLLnG+I11atp/q6dCeJhM8A0UZSpavC/uDnl23XtQfV9K83rE+Dqjj+nImFH6M6Ybqn5d/FsfVyUKX6PRD2RfsgLBe9S4CBvF0GK7g2e0IlziCEGZ3cVHKnU1ghTwwsQBRCVbBcgNOPmwZ8dvVWc0qxnkTnh8JBCPMLH1N1WwfM2GUaRvsdV9nCHy0vCcPV+CsIab7Rlgh2YZ9dk6QjxyGYhVBuxL9MPJNbFTdfn6o=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	drFmGeqjO2VL0Ky1U8GN1Gg1g9xFEPjww2y32FSCfgPXpeeMwmyfnewIOUnt07jBh+A98l+81QaBnHd7R+fmLWDbQVhmj7tCp9AVTCv0QbzQygEbsz8rVq2LVJPID7XbafOH2S8eNI2P/YlLqItCjxBxvVYnKIps7TRAKyukSd6SGWmE2C4CtlozImp2sXa9iWStDg+xHX/8fogV5e1xMrJeyL4Ymm8UBXgpT1U0twLreBYpfrl1NCVbZNq43fDsmgwjwwcrnDZwgpt6w/bcKhlM9+A/jhG5AHh5QsT31tCMdO9hgCOl8yidGAOPO5sjVihRbAZNff/eArGHi57Z5ETuSAJGXl91ZBFzNpLNfwYtrBuf/7vcaJqv81lckkDFU1Y1PX32pPPQrIbB7j7Ks8ahVgVJZJyF4/r84A3l9f4vU6V4qEfer8JPGf2zHrjX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:03:27.0698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9dfb38-e597-4982-cd8b-08df102efac9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224



On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
> On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
>> Hello,
>>
>> Thank you for the reviews.
>>
>> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
>>> Good day,
>>>
>>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
>>>> The existing remoteproc virtio reset path clears the vdev status locally
>>>> without notifying the remote processor. As a result, the host cannot tell
>>>> whether the remote side has observed the reset request or completed its
>>>> cleanup.
>>>>
>>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
>>>> acknowledged reset protocol. For these resources, encode a reset request
>>>> in the virtio status byte, kick the remote processor using the vdev notify
>>>> ID, and wait for the remote side to clear the status back to 0.
>>>>
>>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
>>>> clearing the status locally. Also reset remoteproc-created virtio
>>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
>>>> in debugfs.
>>>>
>>>> Assisted-by: Codex:GPT-5
>>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>>>> ---
>>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
>>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
>>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
>>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
>>>>  include/linux/rsc_table.h                |  5 ++-
>>>>  5 files changed, 97 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>>>> index 1ed406714849..31d79684977c 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
>>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>  			     int offset, int avail)
>>>>  {
>>>> +	struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
>>>
>>> Spurious change.
>>>
>>
>> Ack will remove it.
>>
>>>>  	struct fw_rsc_vdev *rsc = ptr;
>>>>  	struct device *dev = &rproc->dev;
>>>>  	struct rproc_vdev *rvdev;
>>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>>>  		return -EINVAL;
>>>>  	}
>>>>  
>>>> -	/* make sure reserved bytes are zeroes */
>>>
>>> Same
>>
>> Ack, will be removed.
>>
>>>
>>>>  	if (rsc->reserved[0] || rsc->reserved[1]) {
>>>>  		dev_err(dev, "vdev rsc has non zero reserved bytes\n");
>>>>  		return -EINVAL;
>>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
>>>>  	[RSC_DEVMEM] = rproc_handle_devmem,
>>>>  	[RSC_TRACE] = rproc_handle_trace,
>>>>  	[RSC_VDEV] = rproc_handle_vdev,
>>>> +	[RSC_VDEV_V2] = rproc_handle_vdev,
>>>>  };
>>>>  
>>>>  struct rproc_rsc_cb_data {
>>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
>>>> index b86c1d09c70c..1fe99749f5b4 100644
>>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
>>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
>>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
>>>>  /* Expose resource table content via debugfs */
>>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>  {
>>>> -	static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
>>>> +	static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
>>>>  	struct rproc *rproc = seq->private;
>>>>  	struct resource_table *table = rproc->table_ptr;
>>>>  	struct fw_rsc_carveout *c;
>>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
>>>>  			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>>  				   v->reserved[0], v->reserved[1]);
>>>>  
>>>> +			for (j = 0; j < v->num_of_vrings; j++) {
>>>> +				seq_printf(seq, "  Vring %d\n", j);
>>>> +				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>> +				seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
>>>> +				seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
>>>> +				seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
>>>> +				seq_printf(seq, "    Physical Address 0x%x\n\n",
>>>> +					   v->vring[j].pa);
>>>> +			}
>>>> +			break;
>>>> +		case RSC_VDEV_V2:
>>>> +			v = rsc;
>>>> +			seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
>>>> +
>>>> +			seq_printf(seq, "  ID %d\n", v->id);
>>>> +			seq_printf(seq, "  Notify ID %d\n", v->notifyid);
>>>> +			seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
>>>> +			seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
>>>> +			seq_printf(seq, "  Config length 0x%x\n", v->config_len);
>>>> +			seq_printf(seq, "  Status 0x%x\n", v->status);
>>>> +			seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
>>>> +			seq_printf(seq, "  Reset request pending %s\n",
>>>> +				   rproc_rsc_vdev_reset_requested(v->status) ?
>>>> +				   "yes" : "no");
>>>> +			seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
>>>> +				   v->reserved[0], v->reserved[1]);
>>>> +
>>>>  			for (j = 0; j < v->num_of_vrings; j++) {
>>>>  				seq_printf(seq, "  Vring %d\n", j);
>>>>  				seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>>>> index 3a742ef6ef60..f07a96ff82a4 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -14,6 +14,7 @@
>>>>  
>>>>  #include <linux/irqreturn.h>
>>>>  #include <linux/firmware.h>
>>>> +#include <linux/virtio_config.h>
>>>>  #ifdef CONFIG_HAS_IOMEM
>>>>  #include <linux/io.h>
>>>>  #endif
>>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
>>>>  	struct fw_rsc_vdev *rsc;
>>>>  };
>>>>  
>>>> +/*
>>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
>>>> + * impossible virtio status pattern: DRIVER and FAILED set while
>>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
>>>> + */
>>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
>>>> +{
>>>> +	status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
>>>> +	status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
>>>> +
>>>> +	return status;
>>>> +}
>>>> +
>>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
>>>> +{
>>>> +	return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
>>>> +	       (status & VIRTIO_CONFIG_S_DRIVER) &&
>>>> +	       (status & VIRTIO_CONFIG_S_FAILED);
>>>> +}
>>>> +
>>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
>>>>  {
>>>>  	return test_bit(feature, rproc->features);
>>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>>>> index d5e9ff045a28..e682caa546b2 100644
>>>> --- a/drivers/remoteproc/remoteproc_virtio.c
>>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>>>> @@ -13,6 +13,7 @@
>>>>  #include <linux/dma-map-ops.h>
>>>>  #include <linux/dma-mapping.h>
>>>>  #include <linux/export.h>
>>>> +#include <linux/iopoll.h>
>>>>  #include <linux/of_reserved_mem.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/remoteproc.h>
>>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
>>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
>>>>  {
>>>>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>>>> +	struct rproc *rproc = rvdev->rproc;
>>>>  	struct fw_rsc_vdev *rsc;
>>>> +	struct fw_rsc_hdr *hdr;
>>>> +	int ret;
>>>> +	u8 val;
>>>> +
>>>> +	/*
>>>> +	 * During crash recovery, vdev can be stopped. But the driver can't reset
>>>> +	 * the device, as device is already crashed. In this case, reset becomes
>>>> +	 * no op.
>>>> +	 */
>>>> +	if (rproc->state == RPROC_CRASHED)
>>>> +		return;
>>>>  
>>>>  	rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
>>>> +	hdr = (void *)rsc - sizeof(*hdr);
>>>> +
>>>> +	if (hdr->type == RSC_VDEV_V2) {
>>>> +		/*
>>>> +		 * RSC_VDEV_V2 encodes an acknowledged reset request in the
>>>> +		 * status byte. The remote is expected to complete the reset
>>>> +		 * and then clear status back to 0.
>>>> +		 */
>>>> +		rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
>>>> +
>>>> +		/* after setting reset request, kick the device */
>>>> +		rproc->ops->kick(rproc, rsc->notifyid);
>>>>  
>>>> -	rsc->status = 0;
>>>> -	dev_dbg(&vdev->dev, "reset !\n");
>>>> +		/*
>>>> +		 * When device completes reset, it is expected to set status
>>>> +		 * to 0.
>>>> +		 */
>>>> +		ret = readb_poll_timeout(&rsc->status, val, val == 0,
>>>> +					 1000,      /* 1ms between reads */
>>>> +					 3000000);  /* 3s total timeout */
>>>> +		if (ret)
>>>> +			dev_warn(&vdev->dev, "vdev reset timed out\n");
>>>
>>> The problem here is that we are introducing behavior that is not compliant with
>>> the virtio specifications.  One way to acheive the same behavior could be for
>>> the remote processor to check rsc->status before sending a interrupt of using
>>> the virtqueues.
>>>
>>
>> That is what remote is supposed to do. But what if remote do not
>> respond? If remote is deadlocked for some reason, then the Linux will
>> hang at this point too. That is why we need some kind of timeout.
> 
> If the remote is dead then a watchdog timer should fire at some point.
> Moreover, that situation won't be different from other circumstances where a
> remote processor locks up.
> 

There are few concerns:

1) Heterogeneous system where Linux is handling many remotes, the
watchdog might not be available to all the remotes or watchdog mechanism
is not implemented at all on the remote side.

2) Let's say watchdog is configured for 10s, or so then for that long
Linux will be stuck too. I am trying to avoid this case where Linux gets
stuck for long time.
> Looking at your patch, sending a kick() won't do anything for a dead remote
> processor.  If the remote processor is alive, it should monitor rsc->status and
> take action when it is set to '0' by the host.  If it is locked-up, the normal
> lockup procedure should apply.
> 

Notifying virtio device on the status change is standard virtio
mechanism. In the virtio statck it's done via virtqueue_notify so I am
trying to do the same. It also helps remote to avoid polling on status.

> I'm not sure what problem this patch is trying to address.
> 

Some platforms allow Linux and Remote boot independently.

Let's say Linux reboots without reseting the remote then during next
boot Linux will find virtio status is not in the reset state.

In such case, linux need to issue virtio device reset, and wait until
RPU completes the reset and start the device again. The virtio framework
already issues the reset during boot here:
https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570

However, the virtio_reset implementation for remoteproc_virtio simply
set the status to 0, and doesn't wait for the remote to complete the
reset. Due to this, attach operation becomes successfull, but the rpmsg
channels are not created on the linux side.

This patch solves this issue. It changes the reset mechanism while
maintaining the backward compatibility for old way of reseting the device.

I had sent a different patch regarding this before:
https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/

Old patch was rejected because we decided to modify the reset mechanism
instead:
https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/

Thank You,
Tanmay


>>
>> I think timeout mechanism is better for AMP systems over waiting forever
>> for remote to clear the status.
>>
>> Thanks,
>> Tanmay
>>
>>
>>>> +	} else {
>>>> +		/* back compatible for RSC_VDEV type of rsc vdev */
>>>> +		rsc->status = 0;
>>>> +	}
>>>> +	dev_info(&vdev->dev, "reset !\n");
>>>>  }
>>>>  
>>>>  /* provide the vdev features as retrieved from the firmware */
>>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
>>>>  {
>>>>  	struct virtio_device *vdev = dev_to_virtio(dev);
>>>>  
>>>> +	/* reset virtio device before unregister */
>>>> +	virtio_reset_device(vdev);
>>>> +
>>>
>>> Regardless of this feature, I think it is wise to reset the device before
>>> unregistering with the virtio subsystem.
>>>
>>
>> Agreed. I intend to keep this.
>>
>>> Thanks,
>>> Mathieu 
>>>
>>>>  	unregister_virtio_device(vdev);
>>>>  	return 0;
>>>>  }
>>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
>>>> index 71b60125310e..2398a6d7033e 100644
>>>> --- a/include/linux/rsc_table.h
>>>> +++ b/include/linux/rsc_table.h
>>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
>>>>   *		    the remote processor will be writing logs.
>>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
>>>>   *		    virtio header.
>>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
>>>> + *		    encoded in the virtio status byte.
>>>>   * @RSC_LAST:       just keep this one at the end of standard resources
>>>>   * @RSC_VENDOR_START:	start of the vendor specific resource types range
>>>>   * @RSC_VENDOR_END:	end of the vendor specific resource types range
>>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
>>>>  	RSC_DEVMEM		= 1,
>>>>  	RSC_TRACE		= 2,
>>>>  	RSC_VDEV		= 3,
>>>> -	RSC_LAST		= 4,
>>>> +	RSC_VDEV_V2		= 4,
>>>> +	RSC_LAST		= 5,
>>>>  	RSC_VENDOR_START	= 128,
>>>>  	RSC_VENDOR_END		= 512,
>>>>  };
>>>>
>>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
>>>> -- 
>>>> 2.43.0
>>>>
>>

