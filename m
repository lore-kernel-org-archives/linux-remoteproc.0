Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC817C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 15:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9591760F4B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 15:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbhJKQA7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 12:00:59 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:44152 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237889AbhJKQA5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 12:00:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BFw3Zm022059;
        Mon, 11 Oct 2021 17:58:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CnMS7sWvNtPoeahbHIT/Bn6Sfuf+aHiKojwJDlniVBI=;
 b=ICIQQyDxEPswX6mBL/uC6mb08IaG7KlzDX4B8vqekCmtgLeQGQa6xU+XVWrCUlg/B7UC
 zSpV32zzrJwb/FbxyatKBex5vBfOCfLScPD4BtYfdG4bD+HwcSShAVWIQj3DO+5TpV3R
 4D+LXrNipeifM2QkyGyOVqfz7emBvO4r/KvjhJHygEjYYihJQ9zLD9URicHn5Hlid/UF
 uGqZaFAFEfal96RHzhp+4z6JD9Jr+P/usvcvXi/bK/uzcaDq8Ht1xF5PzOFNntVrwrz7
 8Jzl8d4PltkePjyv9IXrPlEuSgQ9AijcXDEU2YNyPxxL4GFU+RIVswyFnqtF975Q68bG xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmd35v348-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 17:58:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EC1510002A;
        Mon, 11 Oct 2021 17:58:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1201B231DE0;
        Mon, 11 Oct 2021 17:58:50 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 17:58:49 +0200
Subject: Re: [RFC PATCH 4/7] remoteproc: create the REMOTEPROC_VIRTIO config
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-5-arnaud.pouliquen@foss.st.com>
 <YWEOIHrp4Z8+MHaE@builder.lan>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <c16ca06a-96da-ac04-5ae7-bbbdf4b48ee5@foss.st.com>
Date:   Mon, 11 Oct 2021 17:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWEOIHrp4Z8+MHaE@builder.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/9/21 5:36 AM, Bjorn Andersson wrote:
> On Fri 01 Oct 05:12 CDT 2021, Arnaud Pouliquen wrote:
> 
>> Create the config to associate to the remoteproc virtio.
>>
>> Notice that the REMOTEPROC_VIRTIO config can not set to m. the reason
>> is that it defines API that is used by the built-in remote proc core.
>> Functions such are rproc_add_virtio_dev can be called during the
>> Linux boot phase.
>>
> 
> Please don't introduce new Kconfig options for everything. Consider that
> the expectation should be that everyone runs the default defconfig on
> their boards - and if someone actually needs this level of control, they
> are welcome to present patches with numbers showing the benefit of the
> savings.

My goal here was to decorrelate the remote virtio from the remote proc,
so that platforms based on a non-virtio solution do not embed the code.
By reading your commentary it jumps out at me that that's stupid. The
REMOTEPROC_VIRTIO config is useless as the remoteproc_virtio must be kept
built-in for legacy compatibility.

Thanks,
Arnaud

> 
> Thanks,
> Bjorn
> 
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/Kconfig               | 11 +++++++++-
>>  drivers/remoteproc/Makefile              |  2 +-
>>  drivers/remoteproc/remoteproc_internal.h | 28 ++++++++++++++++++++++++
>>  3 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 9a6eedc3994a..f271552c0d84 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -6,7 +6,7 @@ config REMOTEPROC
>>  	depends on HAS_DMA
>>  	select CRC32
>>  	select FW_LOADER
>> -	select VIRTIO
>> +	select REMOTEPROC_VIRTIO
>>  	select WANT_DEV_COREDUMP
>>  	help
>>  	  Support for remote processors (such as DSP coprocessors). These
>> @@ -14,6 +14,15 @@ config REMOTEPROC
>>  
>>  if REMOTEPROC
>>  
>> +config REMOTEPROC_VIRTIO
>> +	bool "Remoteproc virtio device "
>> +	select VIRTIO
>> +	help
>> +	  Say y here to have a virtio device support for the remoteproc
>> +	  communication.
>> +
>> +	  It's safe to say N if you don't use the virtio for the IPC.
>> +
>>  config REMOTEPROC_CDEV
>>  	bool "Remoteproc character device interface"
>>  	help
>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>> index bb26c9e4ef9c..73d2384a76aa 100644
>> --- a/drivers/remoteproc/Makefile
>> +++ b/drivers/remoteproc/Makefile
>> @@ -8,8 +8,8 @@ remoteproc-y				:= remoteproc_core.o
>>  remoteproc-y				+= remoteproc_coredump.o
>>  remoteproc-y				+= remoteproc_debugfs.o
>>  remoteproc-y				+= remoteproc_sysfs.o
>> -remoteproc-y				+= remoteproc_virtio.o
>>  remoteproc-y				+= remoteproc_elf_loader.o
>> +obj-$(CONFIG_REMOTEPROC_VIRTIO)		+= remoteproc_virtio.o
>>  obj-$(CONFIG_REMOTEPROC_CDEV)		+= remoteproc_cdev.o
>>  obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
>>  obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 152fe2e8668a..4ce012c353c0 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -30,10 +30,38 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>>  			    const char **fw_name);
>>  
>>  /* from remoteproc_virtio.c */
>> +#if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
>> +
>>  int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
>>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>>  void rproc_vdev_release(struct kref *ref);
>>  
>> +#else
>> +
>> +int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return -ENXIO;
>> +}
>> +
>> +static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return IRQ_NONE;
>> +}
>> +
>> +static inline void rproc_vdev_release(struct kref *ref)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +}
>> +
>> +#endif
>> +
>>  /* from remoteproc_debugfs.c */
>>  void rproc_remove_trace_file(struct dentry *tfile);
>>  struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>> -- 
>> 2.17.1
>>
