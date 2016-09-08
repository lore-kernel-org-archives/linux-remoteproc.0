Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 13/19] remoteproc: core: Append resource only if spare
 resource present
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-14-git-send-email-loic.pallardy@st.com>
 <20160908093313.GM4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <41548132-246a-f6d0-473d-e2ab72a86e15@st.com>
Date: Thu, 8 Sep 2016 11:54:27 +0200
MIME-Version: 1.0
In-Reply-To: <20160908093313.GM4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/08/2016 11:33 AM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> This patch renames rproc_add_resource_table_entry in __add_rsc_tbl_entry
>> to have shorter function name and adds spare resource support.
>> To guarantee remoteproc won't overwrite firmware data when copying
>> back modified resource table, __add_rsc_tbl_entry verifies first that
>> resource table owns a spare resource and uses spare bytes to create
>> a new resource entry. Spare resource is updated according to changes.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 54 ++++++++++++++++++++----------------
>>  1 file changed, 30 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index aff1a00..25a429b 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1107,39 +1107,34 @@ static int __update_rsc_tbl_entry(struct rproc *rproc,
>>  	return !updated;
>>  }
>>
>> -static struct resource_table*
>> -rproc_add_resource_table_entry(struct rproc *rproc,
>> +static int __add_rsc_tbl_entry(struct rproc *rproc,
>
> Once again, I prefer plain English over cryptic abbreviations.  Makes
> things much more difficult for developers who are new to, or are just
> dipping into RemoteProc code.

OK
>
>>  			       struct rproc_request_resource *request,
>> -			       struct resource_table *old_table, int *tablesz)
>> +			       struct resource_table *table, int tablesz)
>>  {
>> -	struct resource_table *table;
>>  	struct fw_rsc_hdr h;
>> +	struct fw_rsc_spare spare;
>>  	void *new_rsc_loc;
>>  	void *fw_header_loc;
>>  	void *start_of_rscs;
>>  	int new_rsc_offset;
>> -	int size = *tablesz;
>> -	int i;
>> +	int new_spare_offset;
>> +	int i, spare_index = 0;
>>
>>  	h.type = request->type;
>>
>> -	new_rsc_offset = size;
>> +	/* check available spare size */
>
> In keeping with the existing comments, please use correct grammar.
>
> Capital letters to start and for names etc.
>
> Much more professional IMO.

I'll correct
>
>> +	spare.len = __get_rsc_tbl_spare_size(rproc, table, tablesz, &spare_index);
>> +	if (spare.len < (sizeof(h) + request->size + 4)) /* new offset entry */
>
> Not sure that comment makes the code any clearer?
>
> All you're doing here is checking if we have enough space, right?
>
> I think the 4 is a 'magic' number.  I'd either provide a comment (like
> I did below), or define it.
I'll add a comment as you did to explain the "4".

>
>> +		return -EPERM;
>
> What does this have to do with permissions?
Yes sure, I'll replaced by -EINVAL as resource too large compare to 
spare area capability.

>
>> -	/*
>> -	 * Allocate another contiguous chunk of memory, large enough to
>> -	 * contain the new, expanded resource table.
>> -	 *
>> -	 * The +4 is for the extra offset[] element in the top level header
>> -	 */
>> -	size += sizeof(struct fw_rsc_hdr) + request->size + 4;
>> -	table = devm_kmemdup(&rproc->dev, old_table, size, GFP_KERNEL);
>> -	if (!table)
>> -		return ERR_PTR(-ENOMEM);
>> +	new_rsc_offset = table->offset[spare_index];
>>
>>  	/* Shunt table by 4 Bytes to account for the extra offset[] element */
>>  	start_of_rscs = (void *)table + table->offset[0];
>>  	memmove(start_of_rscs + 4,
>>  		start_of_rscs, new_rsc_offset - table->offset[0]);
>> +
>> +	spare.len -= 4;
>
> This probably deserves a comment too.
I'll add a comment too
>
> /*
>  * The spare area is finite.  Since we are increasing the size of the
>  * header and shunting the tables, we need to reduce the size of the
>  * available 'spare' area by the shunt size.
>  */
>
>>  	new_rsc_offset += 4;
>>
>>  	/* Update existing resource entry's offsets */
>> @@ -1153,13 +1148,27 @@ rproc_add_resource_table_entry(struct rproc *rproc,
>>  	/* Copy new firmware header into table */
>>  	fw_header_loc = (void *)table + new_rsc_offset;
>>  	memcpy(fw_header_loc, &h, sizeof(h));
>> +	spare.len -= sizeof(h);
>>
>>  	/* Copy new resource entry into table */
>>  	new_rsc_loc = (void *)fw_header_loc + sizeof(h);
>>  	memcpy(new_rsc_loc, request->resource, request->size);
>> +	spare.len -= request->size;
>>
>> -	*tablesz = size;
>> -	return table;
>> +	/* create new rsc spare resource at the end of remaining spare */
>
> Same comment about using nice grammar in comments.
Ok
Thanks,
Loic
>
>> +	new_spare_offset = new_rsc_offset + sizeof(h) + request->size;
>> +	h.type = RSC_SPARE;
>> +
>> +	fw_header_loc = (void *)table + new_spare_offset;
>> +	memcpy(fw_header_loc, &h, sizeof(h));
>> +
>> +	new_rsc_loc = (void *)fw_header_loc + sizeof(h);
>> +	memcpy(new_rsc_loc, &spare, sizeof(spare));
>> +
>> +	/* update spare offset */
>> +	table->offset[spare_index] = new_spare_offset;
>> +
>> +	return 0;
>>  }
>>
>>  static struct resource_table*
>> @@ -1203,12 +1212,9 @@ rproc_apply_resource_overrides(struct rproc *rproc,
>>  			continue;
>>
>>  		/* Didn't find matching resource entry -- creating a new one. */
>> -		table = rproc_add_resource_table_entry(rproc, resource,
>> -						       table, &size);
>> -		if (IS_ERR(table))
>> +		updated = __add_rsc_tbl_entry(rproc, resource, table, size);
>> +		if (updated)
>>  			goto out;
>> -
>> -		*orig_table = table;
>>  	}
>>
>>  	rproc_dump_resource_table(rproc, table, size);
>
