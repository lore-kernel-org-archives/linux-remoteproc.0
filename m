Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 09/19] remoteproc: core: Finalize dump resource table
 function
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
 <1472676622-32533-10-git-send-email-loic.pallardy@st.com>
 <20160908082630.GJ4921@dell>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <5ca9dfb4-b26f-07b3-cec7-c154dedc3139@st.com>
Date: Thu, 8 Sep 2016 11:46:48 +0200
MIME-Version: 1.0
In-Reply-To: <20160908082630.GJ4921@dell>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 09/08/2016 10:26 AM, Lee Jones wrote:
> On Wed, 31 Aug 2016, Loic Pallardy wrote:
>
>> Diverse updates:
>> - add cfg field display of vdev struct
>> - add support of spare resource
>> - put rproc_dump_resource_table under DEBUG compilation flag
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 31 ++++++++++++++++++++++++++++---
>>  1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index cd64fae..345bdfb 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -791,15 +791,17 @@ static void rproc_resource_cleanup(struct rproc *rproc)
>>  		rproc_remove_virtio_dev(rvdev);
>>  }
>>
>> +#if defined(DEBUG)
>
> Yuk!  I hate #iferey in *.c files if it can be helped.
>
> Instead, just use if (IS_ENABLED(CONFIG_DEBUG)) at the call-site and
> let the compiler optimise it out.
Indeed looks better. I'll update in V3
>
>>  static void rproc_dump_resource_table(struct rproc *rproc,
>>  				      struct resource_table *table, int size)
>>  {
>> -	const char *types[] = {"carveout", "devmem", "trace", "vdev"};
>> +	static const char *types[] = {"carveout", "devmem", "trace", "vdev", "spare"};
>>  	struct device *dev = &rproc->dev;
>>  	struct fw_rsc_carveout *c;
>>  	struct fw_rsc_devmem *d;
>>  	struct fw_rsc_trace *t;
>>  	struct fw_rsc_vdev *v;
>> +	struct fw_rsc_spare *s;
>>  	int i, j;
>>
>>  	if (!table) {
>> @@ -814,6 +816,8 @@ static void rproc_dump_resource_table(struct rproc *rproc,
>>  		int offset = table->offset[i];
>>  		struct fw_rsc_hdr *hdr = (void *)table + offset;
>>  		void *rsc = (void *)hdr + sizeof(*hdr);
>> +		unsigned char *cfg;
>> +		int len;
>>
>>  		switch (hdr->type) {
>>  		case RSC_CARVEOUT:
>> @@ -867,14 +871,35 @@ static void rproc_dump_resource_table(struct rproc *rproc,
>>  				dev_dbg(dev, "    Reserved (should be zero) [%d]\n\n",
>>  					v->vring[j].reserved);
>>  			}
>> +
>> +			dev_dbg(dev, "  Config table\n");
>> +			cfg = (unsigned char *)(&v->vring[v->num_of_vrings]);
>> +			len = 0;
>> +			do {
>> +				j = min(16, v->config_len - len);
>> +				dev_dbg(dev, "    Config[%2d-%2d] = %*phC\n",
>> +					len, len + j - 1, j, cfg + len);
>> +				len += j;
>> +			} while (len < v->config_len);
>> +
>> +			break;
>> +		case RSC_SPARE:
>> +			s = rsc;
>> +			dev_dbg(dev, "Entry %d is of type %s\n", i, types[hdr->type]);
>> +			dev_dbg(dev, "  Spare size: 0x%x bytes\n\n", s->len);
>>  			break;
>>  		default:
>> -			dev_dbg(dev, "Invalid resource type found: %d [hdr: %p]\n",
>> -				hdr->type, hdr);
>> +			dev_dbg(dev, "Entry %d: Invalid resource type found: %d [hdr: %p]\n",
>> +				i, hdr->type, hdr);
>
> You're doing a lot of stuff in the patch.  If I were maintainer, I'd
> be asking you to separate the functionality into separate patches.
No problem to split in smaller patches
/Loic
>
>>  			return;
>>  		}
>>  	}
>>  }
>> +#else
>> +static inline void rproc_dump_resource_table(struct rproc *rproc,
>> +				      struct resource_table *table, int size)
>> +{}
>> +#endif
>>
>>  int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *resource)
>>  {
>
