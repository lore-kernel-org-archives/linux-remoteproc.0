Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [RFC 02/18] remoteproc: Introduce virtio device add/remove
 functions in core.
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
 <20200416161331.7606-3-arnaud.pouliquen@st.com>
 <20200421204102.GA17676@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <20b31a48-60f8-96eb-98b1-4da2bd350209@st.com>
Date: Wed, 22 Apr 2020 14:30:50 +0200
MIME-Version: 1.0
In-Reply-To: <20200421204102.GA17676@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, t@xps15
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu

On 4/21/20 10:41 PM, Mathieu Poirier wrote:
> Hey Arnaud,
> 
> I have started to review this set. Comments will come in over the next few days
> and I will be sure to let you know when I'm done.

Take as much time you need, there is already a lot in your pipe.
This RFC could be probably split into a few series, but i preferred to keep all
together to have a whole picture. Aim of this RFC is to open the discussion on
the restructuring of the rproc_virtio and the use of components to synchronize child devices.

Thanks!

Arnaud 

> 
> On Thu, Apr 16, 2020 at 06:13:15PM +0200, Arnaud Pouliquen wrote:
>> In preparation of the migration of the management of rvdev in
>> rproc_virtio, this patch spins off new functions to manage the
>> virtio device.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 149 +++++++++++++++------------
>>  1 file changed, 83 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 2a0425ab82a7..5c90d569c0f7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -441,6 +441,86 @@ static void rproc_rvdev_release(struct device *dev)
>>  	kfree(rvdev);
>>  }
>>  
>> +static int rproc_rvdev_add_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +	struct fw_rsc_vdev *rsc = rvdev->rsc;
>> +	char name[16];
>> +	int ret, i;
>> +
>> +	/* Initialise vdev subdevice */
>> +	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> +	rvdev->dev.parent = &rproc->dev;
>> +	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>> +	rvdev->dev.release = rproc_rvdev_release;
>> +	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> +	dev_set_drvdata(&rvdev->dev, rvdev);
>> +
>> +	ret = device_register(&rvdev->dev);
>> +	if (ret) {
>> +		put_device(&rvdev->dev);
>> +		return ret;
>> +	}
>> +	/* Make device dma capable by inheriting from parent's capabilities */
>> +	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> +
>> +	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> +					   dma_get_mask(rproc->dev.parent));
>> +	if (ret) {
>> +		dev_warn(&rvdev->dev,
>> +			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
>> +			 dma_get_mask(rproc->dev.parent), ret);
>> +	}
>> +
>> +	/* parse the vrings */
>> +	for (i = 0; i < rsc->num_of_vrings; i++) {
>> +		ret = rproc_parse_vring(rvdev, rsc, i);
>> +		if (ret)
>> +			goto free_rvdev;
>> +	}
>> +
>> +	/* allocate the vring resources */
>> +	for (i = 0; i < rsc->num_of_vrings; i++) {
>> +		ret = rproc_alloc_vring(rvdev, i);
>> +		if (ret)
>> +			goto free_vg;
> 
> I don't get the "free_vg" part... At the moment this patch is only about
> refactoring and as such I would encourage you to keep things the same as
> much as possible.  It is certainly ok to make modifications but they should be
> done in an incremental patch.  Otherwise reviewers needlessly have to scrutinize
> the changes thinking there is something more to figure out.
> 
>> +	}
>> +
>> +	rvdev->subdev.start = rproc_vdev_do_start;
>> +	rvdev->subdev.stop = rproc_vdev_do_stop;
>> +
>> +	rproc_add_subdev(rproc, &rvdev->subdev);
>> +
>> +	return 0;
>> +
>> +free_vg:
>> +	for (i--; i >= 0; i--) {
>> +		struct rproc_vring *rvring = &rvdev->vring[i];
>> +
>> +		rproc_free_vring(rvring);
>> +	}
>> +
>> +free_rvdev:
>> +	device_unregister(&rvdev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static void rproc_rvdev_remove_device(struct rproc_vdev *rvdev)
>> +{
>> +	struct rproc *rproc = rvdev->rproc;
>> +	struct rproc_vring *rvring;
>> +	int id;
>> +
>> +	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> +		rvring = &rvdev->vring[id];
>> +		rproc_free_vring(rvring);
>> +	}
>> +
>> +	rproc_remove_subdev(rproc, &rvdev->subdev);
>> +	device_unregister(&rvdev->dev);
>> +}
>> +
>>  /**
>>   * rproc_handle_vdev() - handle a vdev fw resource
>>   * @rproc: the remote processor
>> @@ -473,8 +553,6 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>  {
>>  	struct device *dev = &rproc->dev;
>>  	struct rproc_vdev *rvdev;
>> -	int i, ret;
>> -	char name[16];
>>  
>>  	/* make sure resource isn't truncated */
>>  	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
>> @@ -505,83 +583,22 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>>  	kref_init(&rvdev->refcount);
>>  
>>  	rvdev->rsc = rsc;
>> +	rvdev->rsc_offset = offset;
>>  	rvdev->id = rsc->id;
>>  	rvdev->rproc = rproc;
>>  	rvdev->index = rproc->nb_vdev++;
>>  
>> -	/* Initialise vdev subdevice */
>> -	snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>> -	rvdev->dev.parent = rproc->dev.parent;
>> -	rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
>> -	rvdev->dev.release = rproc_rvdev_release;
>> -	dev_set_name(&rvdev->dev, "%s#%s", dev_name(rvdev->dev.parent), name);
>> -	dev_set_drvdata(&rvdev->dev, rvdev);
>> -
>> -	ret = device_register(&rvdev->dev);
>> -	if (ret) {
>> -		put_device(&rvdev->dev);
>> -		return ret;
>> -	}
>> -	/* Make device dma capable by inheriting from parent's capabilities */
>> -	set_dma_ops(&rvdev->dev, get_dma_ops(rproc->dev.parent));
>> -
>> -	ret = dma_coerce_mask_and_coherent(&rvdev->dev,
>> -					   dma_get_mask(rproc->dev.parent));
>> -	if (ret) {
>> -		dev_warn(dev,
>> -			 "Failed to set DMA mask %llx. Trying to continue... %x\n",
>> -			 dma_get_mask(rproc->dev.parent), ret);
>> -	}
>> -
>> -	/* parse the vrings */
>> -	for (i = 0; i < rsc->num_of_vrings; i++) {
>> -		ret = rproc_parse_vring(rvdev, rsc, i);
>> -		if (ret)
>> -			goto free_rvdev;
>> -	}
>> -
>> -	/* remember the resource offset*/
>> -	rvdev->rsc_offset = offset;
>> -
>> -	/* allocate the vring resources */
>> -	for (i = 0; i < rsc->num_of_vrings; i++) {
>> -		ret = rproc_alloc_vring(rvdev, i);
>> -		if (ret)
>> -			goto unwind_vring_allocations;
>> -	}
>> -
>>  	list_add_tail(&rvdev->node, &rproc->rvdevs);
>>  
>> -	rvdev->subdev.start = rproc_vdev_do_start;
>> -	rvdev->subdev.stop = rproc_vdev_do_stop;
>> -
>> -	rproc_add_subdev(rproc, &rvdev->subdev);
>> -
>> -	return 0;
>> -
>> -unwind_vring_allocations:
>> -	for (i--; i >= 0; i--)
>> -		rproc_free_vring(&rvdev->vring[i]);
>> -free_rvdev:
>> -	device_unregister(&rvdev->dev);
>> -	return ret;
>> +	return rproc_rvdev_add_device(rvdev);
>>  }
>>  
>>  void rproc_vdev_release(struct kref *ref)
>>  {
>>  	struct rproc_vdev *rvdev = container_of(ref, struct rproc_vdev, refcount);
>> -	struct rproc_vring *rvring;
>> -	struct rproc *rproc = rvdev->rproc;
>> -	int id;
>> -
>> -	for (id = 0; id < ARRAY_SIZE(rvdev->vring); id++) {
>> -		rvring = &rvdev->vring[id];
>> -		rproc_free_vring(rvring);
>> -	}
>>  
>> -	rproc_remove_subdev(rproc, &rvdev->subdev);
>> +	rproc_rvdev_remove_device(rvdev);
> 
> At this time I don't see how introducing rproc_rvdev_remore_device() is
> advantageous.  Maybe I'll find an answer as I review upcoming patches...
> 
> Thanks,
> Mathieu 
> 
>>  	list_del(&rvdev->node);
>> -	device_unregister(&rvdev->dev);
>>  }
>>  
>>  /**
>> -- 
>> 2.17.1
>>
