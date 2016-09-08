Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 11/19] remoteproc: core: Add function to get resource
 table spare bytes information
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-12-git-send-email-loic.pallardy@st.com>
 <20160908083251.GK4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <9cedf5fc-3f9f-3800-07b2-d25c566e1eb2@st.com>
Date: Thu, 8 Sep 2016 11:47:59 +0200
MIME-Version: 1.0
In-Reply-To: <20160908083251.GK4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/08/2016 10:32 AM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> Remoteproc needs to know if a resource table has spare resource
>> allowing resoure table extension.
>> This function parse resource table to detect spare resource.
>> If any, it returns available spare bytes and index of spare resource.
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 29 +++++++++++++++++++++++++++++
>>  1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index ffb56c0..30e9c70 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -951,6 +951,35 @@ int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *reso
>>  }
>>  EXPORT_SYMBOL(rproc_request_resource);
>>
>> +static int __get_rsc_tbl_spare_size(struct rproc *rproc,
>
> size_t?
ok
>
>> +					  struct resource_table *table_ptr, int len,
>> +					  int *spare_index)
>> +{
>> +	struct device *dev = &rproc->dev;
>> +	int i;
>> +
>> +	for (i = 0; i < table_ptr->num; i++) {
>> +		int offset = table_ptr->offset[i];
>> +		struct fw_rsc_hdr *hdr = (void *)table_ptr + offset;
>> +		struct fw_rsc_spare *spare = (void *)hdr + sizeof(*hdr);
>> +
>> +		dev_dbg(dev, "rsc: type %d\n", hdr->type);
>
> This doesn't need to be in upstream code.
Sure
>
>> +		if (hdr->type >= RSC_LAST) {
>> +			dev_warn(dev, "unsupported resource %d\n", hdr->type);
>> +			continue;
>> +		}
>
> If we're only interested in RSC_SPARE, I think we can omit this check.
>
> No need to police the resource table everywhere.
True and complete table sanity check done before.
I'll remove
Thanks,
Loic

>
>> +		if (hdr->type != RSC_SPARE)
>> +			continue;
>> +
>> +		*spare_index = i;
>> +		return spare->len;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int __verify_rsc_tbl_entry(struct rproc *rproc,
>>  				struct rproc_request_resource *request,
>>  				struct resource_table *table, int size)
>
