Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 08/19] remoteproc: core: Associate action to resource
 request
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-9-git-send-email-loic.pallardy@st.com>
 <20160901072304.GC4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <a271e6ac-d713-c637-a6c6-462aa726a576@st.com>
Date: Thu, 8 Sep 2016 11:43:33 +0200
MIME-Version: 1.0
In-Reply-To: <20160901072304.GC4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/01/2016 09:23 AM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> With new rproc_request_resource API, rproc driver has now the
>> capability to provide resources to remoteproc in order to modify
>> firmware resource table.
>> But in some cases, other operations are needed like compatibility
>> check between resources defined at firmware level and those handled
>> by rproc driver, or remoteproc local resource management when firmware
>> has no resource table.
>>
>> This patch associates action to each resource request to:
>> - verify a resource
>> - update/amend a resource in firmware resource table
>> - handle locally a resource
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 13 ++++++++++++-
>>  include/linux/remoteproc.h           | 26 +++++++++++++++++++++++++-
>>  2 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 3282a4e..cd64fae 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -876,16 +876,20 @@ static void rproc_dump_resource_table(struct rproc *rproc,
>>  	}
>>  }
>>
>> -int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
>> +int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *resource)
>>  {
>>  	struct device *dev = &rproc->dev;
>>  	struct rproc_request_resource *request;
>> +	struct fw_rsc_vdev *v;
>>  	int size;
>>
>>  	request = devm_kzalloc(dev, sizeof(*request), GFP_KERNEL);
>>  	if (!request)
>>  		return -ENOMEM;
>>
>> +	if (action > RSC_ACT_LAST)
>
> ">=".  *_LAST is not a valid request.
True, thanks

>
>> +		return -EINVAL;
>
> The switch() statement below should ha
>
>>  	switch (type) {
>>  	case RSC_CARVEOUT:
>>  		size = sizeof(struct fw_rsc_carveout);
>> @@ -896,6 +900,12 @@ int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
>>  	case RSC_TRACE:
>>  		size = sizeof(struct fw_rsc_trace);
>>  		break;
>> +	case RSC_VDEV:
>> +		v = resource;
>> +		size = sizeof(struct fw_rsc_vdev);
>> +		size += v->num_of_vrings * sizeof(struct fw_rsc_vdev_vring);
>> +		size += v->config_len;
>> +		break;
>>  	default:
>>  		dev_err(dev, "Unsupported resource type: %d\n", type);
>>  		return -EINVAL;
>> @@ -908,6 +918,7 @@ int rproc_request_resource(struct rproc *rproc, u32 type, void *resource)
>>  	memcpy(request->resource, resource, size);
>>  	request->type = type;
>>  	request->size = size;
>> +	request->action = action;
>>
>>  	list_add_tail(&request->node, &rproc->override_resources);
>>
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 4e2f822..2b0f1d7 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -335,11 +335,34 @@ struct rproc_mem_entry {
>>  };
>>
>>  /**
>> + * enum rproc_request_action - types of actions associated to a resource
>> + * request
>> + *
>> + * @RSC_ACT_CHECK:	  request to verify this resource with firmware one
>> + * @RSC_ACT_UPDATE:	  request to update firmware resource table with associated
>> + *			  resource if possible
>> + * @RSC_ACT_FORCE_UPDATE: force firmware resource table update with associated
>> + *		          resource
>> + * @RSC_ACT_LOCAL:        request to handle this resource localy but not to update
>> + *			  firmware resource table
>> + * @RSC_ACT_LAST:         just keep this one at the end
>> + */
>> +enum rproc_request_action {
>> +	RSC_ACT_VERIFY		= 0,
>> +	RSC_ACT_UPDATE		= 1,
>> +	RSC_ACT_FORCE_UPDATE	= 2,
>> +	RSC_ACT_LOCAL		= 3,
>
> For reviewing purposes I suggest adding these entries as you start to
> support them.  Then we have the code and the suggested comment in one
> patch for easy comparison.
RSC_ACT_LAST need in this patch, that's why action enum defined here.

Regards,
Loic
>
>> +	RSC_ACT_LAST		= 4,
>> +};
>> +
>> +/**
>>   * struct rproc_requested_resources - add a resource to the resource table
>>   *
>>   * @resource:	pointer to a 'struct fw_rsc_*' resource
>>   * @type:	'fw_resource_type' resource type
>>   * @size:	size of resource
>> + * @action:	action associated the resource
>>   * @node:	list node
>>   *
>>   * Resources can be added by platform-specific rproc drivers calling
>> @@ -350,6 +373,7 @@ struct rproc_request_resource {
>>  	void *resource;
>>  	u32 type;
>>  	u32 size;
>> +	u32 action;
>>  	struct list_head node;
>>  };
>>
>> @@ -517,7 +541,7 @@ struct rproc_vdev {
>>  	u32 rsc_offset;
>>  };
>>
>> -int rproc_request_resource(struct rproc *rproc, u32 type, void *res);
>> +int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *res);
>>  struct rproc *rproc_get_by_phandle(phandle phandle);
>>  struct rproc *rproc_alloc(struct device *dev, const char *name,
>>  			  const struct rproc_ops *ops,
>
