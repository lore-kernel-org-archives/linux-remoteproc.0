Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 18/19] remoteproc: core: Add function to create
 remoteproc local resource table
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-19-git-send-email-loic.pallardy@st.com>
 <20160908102007.GO4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <c6344597-ae92-a19c-7ee2-a28606871912@st.com>
Date: Thu, 8 Sep 2016 15:15:34 +0200
MIME-Version: 1.0
In-Reply-To: <20160908102007.GO4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/08/2016 12:20 PM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> Rproc driver has now the capability to add resources dynamically
>> thanks to rproc_request_resource API.
>> Depending on associated action, resource request could impact
>> firmware resource table or define new local resource.
>>
>> In order to preserve current remoteproc resource handling
>> mechanism, all local resources are gathered in a local resource
>> table which won't be shared with firmware and proceed by
>> remoteproc core as firmware one.
>>
>> It is rproc driver responsibility to provide the right resource
>> information using rproc_request_resource API.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 80 +++++++++++++++++++++++++++++++++++-
>>  include/linux/remoteproc.h           |  1 +
>>  2 files changed, 80 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index cbfbdf8..73b460a 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1270,6 +1270,65 @@ static int rproc_apply_resource_overrides(struct rproc *rproc,
>>  	return ret;
>>  }
>>
>> +static struct resource_table*
>> +rproc_local_resource_create(struct rproc *rproc, int *tablesz)
>
> Oh, you're happy to use "resource" (instead of rsc) in function names
> that *you* introduce! ;)
In fact I changed only rproc_apply_resource_overrides sub functions, 
don't touch to other. But as mentioned previously, I'll revert name 
changing and come back to original naming in v3
>
>> +{
>> +	struct fw_rsc_hdr *hdr;
>> +	struct fw_rsc_spare *spare_rsc;
>> +	struct rproc_request_resource *resource;
>> +	struct resource_table *table = NULL;
>> +	int size = 0, ret;
>> +
>> +	/* compute total request size */
>
> Grammar.
ok
>
>> +	list_for_each_entry(resource, &rproc->override_resources, node) {
>> +		if (resource->action == RSC_ACT_LOCAL)
>> +			size += resource->size + sizeof(hdr) + 4; /* entry offset */
>> +	}
>
> The {} are superfluous.
>
> Still non sure if that comment helps at all.
>
>> +	/* any extra resource ? */
>
> /* If there isn't any resource remaining, don't ... XXX */
>
>> +	if (!size)
>> +		goto out;
>> +
>> +	/* add table header and spare resource */
>> +	size += sizeof(*table);
>> +	size += sizeof(*hdr) + sizeof(*spare_rsc) + 4;
>> +
>> +	/* create new rsc tbl with only a spare resource */
>
> I would be as forthcoming as possible in comments.  Use
> full/descriptive names for things.
ok
>
>> +	table = devm_kzalloc(&rproc->dev, size, GFP_KERNEL);
>> +	if (!table) {
>> +		table = ERR_PTR(-ENOMEM);
>> +		goto out;
>> +	}
>
> '\n'
ok
>
>> +	table->ver = 1;
>> +	table->num = 1;
>> +	table->offset[0] = sizeof(*table) + 4;
>> +
>> +	hdr = (void *)table + table->offset[0];
>> +	hdr->type = RSC_SPARE;
>> +
>> +	spare_rsc = (void *)hdr + sizeof(*hdr);
>> +	spare_rsc->len = size - table->offset[0] - sizeof(*hdr) - sizeof(*spare_rsc);
>> +
>> +	/* add new resource one by one */
>
> "resources"
thanks
>
>> +	list_for_each_entry(resource, &rproc->override_resources, node) {
>> +		if (resource->action == RSC_ACT_LOCAL) {
>> +			/* Create a new enty */
>
> This comment doesn't add any more information than the function name.
I'll remove
>
>> +			ret = __add_rsc_tbl_entry(rproc, resource,
>> +					table, size);
>> +			if (ret) {
>> +				table = ERR_PTR(ret);
>> +				goto out;
>> +			}
>> +		}
>> +	}
>> +
>> +	*tablesz = size;
>> +	rproc_dump_resource_table(rproc, table, *tablesz);
>
> This is going to add up to a lot of dumps of the resource table?
No only once when the complete table is populated
>
>> +out:
>> +	return table;
>> +}
>> +
>> +
>
> Superfluous '\n'.
ok

Thanks for your review Lee, I'll prepare a V3 including your remarks

Regards,
Loic
>
>>  /*
>>   * take a firmware and boot a remote processor with it.
>>   */
>> @@ -1278,7 +1337,7 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  	struct device *dev = &rproc->dev;
>>  	const char *name = rproc->firmware;
>>  	struct resource_table *table, *loaded_table;
>> -	int ret, tablesz;
>> +	int ret, tablesz, local_tablesz;
>>
>>  	ret = rproc_fw_sanity_check(rproc, fw);
>>  	if (ret)
>> @@ -1335,6 +1394,11 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  			goto clean_up;
>>  		}
>>
>> +		rproc->local_table = rproc_local_resource_create(rproc, &local_tablesz);
>> +		if (IS_ERR(rproc->local_table)) {
>> +			dev_err(dev, "Failed to create local resource table\n");
>> +			goto clean_up;
>> +		}
>>  	}
>>
>>  	/* reset max_notifyid */
>> @@ -1348,6 +1412,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up;
>>  	}
>>
>> +	ret = rproc_handle_resources(rproc, rproc->local_table,
>> +				     local_tablesz, rproc_vdev_handler);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to handle vdev resources: %d\n", ret);
>> +		goto clean_up;
>> +	}
>> +
>>  	/* handle fw resources which are required to boot rproc */
>>  	ret = rproc_handle_resources(rproc, rproc->cached_table, tablesz,
>>  				     rproc_loading_handlers);
>> @@ -1356,6 +1427,13 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up;
>>  	}
>>
>> +	ret = rproc_handle_resources(rproc, rproc->local_table,
>> +				     local_tablesz, rproc_loading_handlers);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to handle vdev resources: %d\n", ret);
>> +		goto clean_up;
>> +	}
>> +
>>  	/* load the ELF segments to memory */
>>  	ret = rproc_load_segments(rproc, fw);
>>  	if (ret) {
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 2b0f1d7..653e6f3 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -495,6 +495,7 @@ struct rproc {
>>  	int max_notifyid;
>>  	struct resource_table *table_ptr;
>>  	struct resource_table *cached_table;
>> +	struct resource_table *local_table;
>>  	bool has_iommu;
>>  	bool auto_boot;
>>  };
>
