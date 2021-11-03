Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B171C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 09:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67A1361101
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 09:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhKCJTW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Nov 2021 05:19:22 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:43652 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230463AbhKCJTW (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Nov 2021 05:19:22 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A38cIo1021313;
        Wed, 3 Nov 2021 10:16:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XJcs38o+tTuQNa7N2XtrSoHl3yz1DXdWEW/Va0sveVQ=;
 b=WSE5CajRoM3VtvDxjXhHzn+nEG41Oevg/wG4VzlORE2xL29IxRTfVwqxmQ5jBBeCF2gK
 cwEG2C+CTQbp5Sc2oHSZPOEcCYTOPNEWCvlVLJggSbmLxNT///AxSLna8kZflccd10hg
 24j8vIoHJYc64L+kasB6OENgdedVQpVuzJI0ufVyZzGZ3qLDdgrVGP1bQx6w0D7w1KgD
 080Yh9JvMcxaK4Z6qHQO5kQig5a1SKGpd0a2UL3lPnjICQtKRSGyIWMGISSvbbjZF5Ut
 RhT4HlmVoZRfOqf70mbeXMan8E1kbLMy3J9FuFjt96AtKrbodd/3mbeuwo2oW8h/wtw2 Kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c3db9321t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Nov 2021 10:16:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A32C10002A;
        Wed,  3 Nov 2021 10:16:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 787E421ED25;
        Wed,  3 Nov 2021 10:16:35 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 10:16:34 +0100
Subject: Re: [RFC PATCH 7/7] remoteproc: Instantiate the new remoteproc virtio
 platform device
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
 <20211001101234.4247-8-arnaud.pouliquen@foss.st.com>
 <20211022175857.GD3659113@p14s>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <76582f13-9be8-60b6-21c9-7e45569e90d8@foss.st.com>
Date:   Wed, 3 Nov 2021 10:16:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022175857.GD3659113@p14s>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

On 10/22/21 7:58 PM, Mathieu Poirier wrote:
> On Fri, Oct 01, 2021 at 12:12:34PM +0200, Arnaud Pouliquen wrote:
>> Migrate from the rvdev device to the rvdev platform device.
>> From this patch, when a vdev resource is found in the resource table
>> the remoteproc core register a platform device.
>>
>> All reference to the rvdev->dev has been updated to rvdev-pdev->dev
>>
>> The use of kref counter is replaced by get/put_device on the remoteproc
>> virtio device.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c     | 49 +++++++------
>>  drivers/remoteproc/remoteproc_internal.h | 16 ----
>>  drivers/remoteproc/remoteproc_virtio.c   | 93 ++++++------------------
>>  include/linux/remoteproc.h               |  4 -
>>  4 files changed, 50 insertions(+), 112 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 67ccd088db8f..d9256db8b130 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -467,6 +467,8 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  {
>>  	struct fw_rsc_vdev *rsc = ptr;
>>  	struct device *dev = &rproc->dev;
>> +	struct rproc_vdev_data vdev_data;
>> +	struct platform_device *pdev;
>>  	struct rproc_vdev *rvdev;
>>  	int i, ret;
>>  
>> @@ -486,28 +488,34 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  	dev_dbg(dev, "vdev rsc: id %d, dfeatures 0x%x, cfg len %d, %d vrings\n",
>>  		rsc->id, rsc->dfeatures, rsc->config_len, rsc->num_of_vrings);
>>  
>> -	/* we currently support only two vrings per rvdev */
>> -	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
>> -		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
>> -		return -EINVAL;
>> -	}
>> +	/* platform data of the new rvdev platform */
>> +	vdev_data.rsc_offset = offset;
>> +	vdev_data.id  = rsc->id;
>> +	vdev_data.index  = rproc->nb_vdev;
>>  
>> -	rvdev = kzalloc(sizeof(*rvdev), GFP_KERNEL);
>> -	if (!rvdev)
>> -		return -ENOMEM;
>> -
>> -	kref_init(&rvdev->refcount);
>> -
>> -	rvdev->id = rsc->id;
>> -	rvdev->rproc = rproc;
>> -	rvdev->index = rproc->nb_vdev;
>> +	pdev = rproc_virtio_register_device(rproc, &vdev_data);
>> +	if (PTR_ERR_OR_ZERO(pdev)) {
>> +		dev_err(rproc->dev.parent,
>> +			"failed to create rproc-virtio device\n");
>> +		return PTR_ERR_OR_ZERO(pdev);
>> +	}
>>  
>> -	ret = rproc_rvdev_add_device(rvdev);
>> -	if (ret)
>> -		return ret;
>> +	/* If we made it to this point the remote proc virtio platform at been probed */
>> +	rvdev = platform_get_drvdata(pdev);
>> +	if (WARN_ON(!rvdev)) {
>> +		ret = -EINVAL;
>> +		goto free_rvdev;
>> +	}
>>  
>>  	rproc->nb_vdev++;
>>  
>> +	/* we currently support only two vrings per rvdev */
>> +	if (rsc->num_of_vrings > ARRAY_SIZE(rvdev->vring)) {
>> +		dev_err(dev, "too many vrings: %d\n", rsc->num_of_vrings);
>> +		ret = -EINVAL;
>> +		goto free_rvdev;
>> +	}
>> +
>>  	/* parse the vrings */
>>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>>  		ret = rproc_parse_vring(rvdev, rsc, i);
>> @@ -515,9 +523,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  			goto free_rvdev;
>>  	}
>>  
>> -	/* remember the resource offset*/
>> -	rvdev->rsc_offset = offset;
>> -
>>  	/* allocate the vring resources */
>>  	for (i = 0; i < rsc->num_of_vrings; i++) {
>>  		ret = rproc_alloc_vring(rvdev, i);
>> @@ -531,7 +536,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>>  	for (i--; i >= 0; i--)
>>  		rproc_free_vring(&rvdev->vring[i]);
>>  free_rvdev:
>> -	device_unregister(&rvdev->dev);
>> +	rproc_virtio_unregister_device(rvdev);
>>  	return ret;
>>  }
> 
> I have made it up to here but running out of time for this patchset.  I will review
> the rest in another revision.  I haven't found a justification for
> rproc_register_rvdev() and rproc_unregister_rvdev().  Am I missing something or
> they can simply be removed and the list manipulations done in the code as it
> currently is?
> 

You are right, it seems unnecessary. I need to double check why I introduced
these functions, but this needs at least a rational in the commit.

I will send a new revision taking into account your and Bjorn's remarks.

Thanks,
Arnaud


> Thanks,
> Mathieu
> 
>>  
>> @@ -1270,7 +1275,7 @@ void rproc_resource_cleanup(struct rproc *rproc)
>>  
>>  	/* clean up remote vdev entries */
>>  	list_for_each_entry_safe(rvdev, rvtmp, &rproc->rvdevs, node)
>> -		kref_put(&rvdev->refcount, rproc_vdev_release);
>> +		rproc_virtio_unregister_device(rvdev);
>>  
>>  	rproc_coredump_cleanup(rproc);
>>  }
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 0bb1b14e5136..2f68e7380c77 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -38,12 +38,10 @@ int rproc_of_parse_firmware(struct device *dev, int index,
>>  /* from remoteproc_virtio.c */
>>  #if IS_ENABLED(CONFIG_REMOTEPROC_VIRTIO)
>>  
>> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev);
>>  struct platform_device *
>>  rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_data);
>>  void rproc_virtio_unregister_device(struct rproc_vdev *rvdev);
>>  irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id);
>> -void rproc_vdev_release(struct kref *ref);
>>  
>>  #else
>>  
>> @@ -59,14 +57,6 @@ static inline void rproc_virtio_unregister_device(struct rproc_vdev *rvdev)
>>  	WARN_ON(1);
>>  }
>>  
>> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> -{
>> -	/* This shouldn't be possible */
>> -	WARN_ON(1);
>> -
>> -	return -ENXIO;
>> -}
>> -
>>  static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
>>  {
>>  	/* This shouldn't be possible */
>> @@ -75,12 +65,6 @@ static inline irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int vq_id)
>>  	return IRQ_NONE;
>>  }
>>  
>> -static inline void rproc_vdev_release(struct kref *ref)
>> -{
>> -	/* This shouldn't be possible */
>> -	WARN_ON(1);
>> -}
>> -
>>  #endif
>>  
>>  /* from remoteproc_debugfs.c */
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
>> index 7188fb8ce40f..34781a2136e6 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -29,7 +29,11 @@
>>  
>>  static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
>>  {
>> -	return container_of(vdev->dev.parent, struct rproc_vdev, dev);
>> +	struct platform_device *pdev;
>> +
>> +	pdev = container_of(vdev->dev.parent, struct platform_device, dev);
>> +
>> +	return platform_get_drvdata(pdev);
>>  }
>>  
>>  static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
>> @@ -343,13 +347,10 @@ static void rproc_virtio_dev_release(struct device *dev)
>>  {
>>  	struct virtio_device *vdev = dev_to_virtio(dev);
>>  	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
>> -	struct rproc *rproc = vdev_to_rproc(vdev);
>>  
>>  	kfree(vdev);
>>  
>> -	kref_put(&rvdev->refcount, rproc_vdev_release);
>> -
>> -	put_device(&rproc->dev);
>> +	put_device(&rvdev->pdev->dev);
>>  }
>>  
>>  /**
>> @@ -365,7 +366,7 @@ static void rproc_virtio_dev_release(struct device *dev)
>>  static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>  {
>>  	struct rproc *rproc = rvdev->rproc;
>> -	struct device *dev = &rvdev->dev;
>> +	struct device *dev = &rvdev->pdev->dev;
>>  	struct virtio_device *vdev;
>>  	struct rproc_mem_entry *mem;
>>  	int ret;
>> @@ -436,17 +437,15 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>>  	vdev->dev.release = rproc_virtio_dev_release;
>>  
>>  	/*
>> -	 * We're indirectly making a non-temporary copy of the rproc pointer
>> +	 * We're indirectly making a non-temporary copy of the rvdev pointer
>>  	 * here, because drivers probed with this vdev will indirectly
>>  	 * access the wrapping rproc.
>>  	 *
>> -	 * Therefore we must increment the rproc refcount here, and decrement
>> +	 * Therefore we must increment the rvdev refcount here, and decrement
>>  	 * it _only_ when the vdev is released.
>>  	 */
>> -	get_device(&rproc->dev);
>> +	get_device(dev);
>>  
>> -	/* Reference the vdev and vring allocations */
>> -	kref_get(&rvdev->refcount);
>>  
>>  	ret = register_virtio_device(vdev);
>>  	if (ret) {
>> @@ -488,57 +487,33 @@ static int rproc_vdev_do_start(struct rproc_subdev *subdev)
>>  static void rproc_vdev_do_stop(struct rproc_subdev *subdev, bool crashed)
>>  {
>>  	struct rproc_vdev *rvdev = container_of(subdev, struct rproc_vdev, subdev);
>> +	struct device *dev = &rvdev->pdev->dev;
>>  	int ret;
>>  
>> -	ret = device_for_each_child(&rvdev->dev, NULL, rproc_remove_virtio_dev);
>> +	ret = device_for_each_child(dev, NULL, rproc_remove_virtio_dev);
>>  	if (ret)
>> -		dev_warn(&rvdev->dev, "can't remove vdev child device: %d\n", ret);
>> -}
>> -
>> -/**
>> - * rproc_rvdev_release() - release the existence of a rvdev
>> - *
>> - * @dev: the subdevice's dev
>> - */
>> -static void rproc_rvdev_release(struct device *dev)
>> -{
>> -	struct rproc_vdev *rvdev = container_of(dev, struct rproc_vdev, dev);
>> -
>> -	of_reserved_mem_device_release(dev);
>> -
>> -	kfree(rvdev);
>> +		dev_warn(dev, "can't remove vdev child device: %d\n", ret);
>>  }
>>  
>> -int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>>  {
>>  	struct rproc *rproc = rvdev->rproc;
>> -	char name[16];
>> +	struct device *dev = &rvdev->pdev->dev;
>>  	int ret;
>>  
>> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> -	rvdev->dev.parent = &rproc->dev;
>> -	ret = copy_dma_range_map(&rvdev->dev, rproc->dev.parent);
>> +	ret = copy_dma_range_map(dev, rproc->dev.parent);
>>  	if (ret)
>>  		return ret;
>>  
>> -	rvdev->dev.release = rproc_rvdev_release;
>> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> -	dev_set_drvdata(&rvdev->dev, rvdev);
>>  
>> -	ret = device_register(&rvdev->dev);
>> -	if (ret) {
>> -		put_device(&rvdev->dev);
>> -		return ret;
>> -	}
>>  	/* Make device dma capable by inheriting from parent's capabilities */
>> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> +	set_dma_ops(dev, get_dma_ops(rproc->dev.parent));
>>  
>> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> -					   dma_get_mask(rproc->dev.parent));
>> +	ret = dma_coerce_mask_and_coherent(dev, dma_get_mask(rproc->dev.parent));
>>  	if (ret) {
>> -		dev_warn(&rvdev->dev,
>> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
>> +		dev_warn(dev, "Failed to set DMA mask %llx. Trying to continue... %x\n",
>>  			 dma_get_mask(rproc->dev.parent), ret);
>> +		return ret;
>>  	}
>>  
>>  	rproc_register_rvdev(rvdev);
>> @@ -548,30 +523,9 @@ int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>>  
>>  	rproc_add_subdev(rproc, &rvdev->subdev);
>>  
>> -	return 0;
>> -}
>> -
>> -static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>> -{
>> -	struct rproc *rproc = rvdev->rproc;
>> -
>> -	rproc_remove_subdev(rproc, &rvdev->subdev);
>> -	rproc_unregister_rvdev(rvdev);
>> -	device_unregister(&rvdev->dev);
>> -}
>> -
>> -void rproc_vdev_release(struct kref *ref)
>> -{
>> -	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>> -	struct rproc_vring *rvring;
>> -	int id;
>> +	dev_dbg(dev, "virtio dev %d added\n",  rvdev->index);
>>  
>> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> -		rvring = &rvdev->vring[id];
>> -		rproc_free_vring(rvring);
>> -	}
>> -
>> -	rproc_rvdev_remove_device(rvdev);
>> +	return 0;
>>  }
>>  
>>  /**
>> @@ -590,8 +544,7 @@ rproc_virtio_register_device(struct rproc *rproc, struct rproc_vdev_data *vdev_d
>>  	pdev = platform_device_register_data(dev, "rproc-virtio", vdev_data->index, vdev_data,
>>  					     sizeof(*vdev_data));
>>  	if (PTR_ERR_OR_ZERO(pdev)) {
>> -		dev_err(rproc->dev.parent,
>> -			"failed to create rproc-virtio device\n");
>> +		dev_err(rproc->dev.parent, "failed to create rproc-virtio device\n");
>>  	}
>>  
>>  	return  pdev;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 542a3d4664f2..7951a3e2b62a 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -614,10 +614,8 @@ struct rproc_vring {
>>  
>>  /**
>>   * struct rproc_vdev - remoteproc state for a supported virtio device
>> - * @refcount: reference counter for the vdev and vring allocations
>>   * @subdev: handle for registering the vdev as a rproc subdevice
>>   * @pdev: remoteproc virtio platform device
>> - * @dev: device struct used for reference count semantics
>>   * @id: virtio device id (as in virtio_ids.h)
>>   * @node: list node
>>   * @rproc: the rproc handle
>> @@ -626,11 +624,9 @@ struct rproc_vring {
>>   * @index: vdev position versus other vdev declared in resource table
>>   */
>>  struct rproc_vdev {
>> -	struct kref refcount;
>>  
>>  	struct rproc_subdev subdev;
>>  	struct platform_device *pdev;
>> -	struct device dev;
>>  
>>  	unsigned int id;
>>  	struct list_head node;
>> -- 
>> 2.17.1
>>
