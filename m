Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 08 Apr 2020 17:50:14 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: map/unmap mpss region
 before/after use
In-Reply-To: <20200408021026.GP20625@builder.lan>
References: <20200317191918.4123-1-sibis@codeaurora.org>
 <20200408021026.GP20625@builder.lan>
Message-ID: <940b74388c744ef5bbfcf15709c4ae05@codeaurora.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, evgreen@chromium.org, linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Bjorn,
Thanks for review!

On 2020-04-08 07:40, Bjorn Andersson wrote:
> On Tue 17 Mar 12:19 PDT 2020, Sibi Sankar wrote:
> 
>> The application processor accessing the mpss region when the Q6 modem
>> is running will lead to an XPU violation. Fix this by un-mapping the
>> mpss region post copy during processor out of reset sequence and
>> coredumps.
>> 
> 
> Does this problem not apply to the "mba" region?

For mba region, memcpy is expected
to be completed before bringing
the Q6 out of reset. Downstream they
seem to use a wmb() to accomplish
this. Since we havn't observed any
issues until now, we can defer adding
any fixes related to mba region.

> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 53 
>> ++++++++++++++++--------------
>>  1 file changed, 29 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index ce49c3236ff7c..b1ad4de179019 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -196,7 +196,6 @@ struct q6v5 {
>> 
>>  	phys_addr_t mpss_phys;
>>  	phys_addr_t mpss_reloc;
>> -	void *mpss_region;
>>  	size_t mpss_size;
>> 
>>  	struct qcom_rproc_glink glink_subdev;
>> @@ -1061,6 +1060,18 @@ static int q6v5_reload_mba(struct rproc *rproc)
>>  	return ret;
>>  }
>> 
>> +static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
>> +{
>> +	struct q6v5 *qproc = rproc->priv;
>> +	int offset;
>> +
>> +	offset = da - qproc->mpss_reloc;
>> +	if (offset < 0 || offset + len > qproc->mpss_size)
>> +		return NULL;
>> +
>> +	return devm_ioremap_wc(qproc->dev, qproc->mpss_phys + offset, len);
> 
> This function isn't expected to have side effects.

unfortunately doing ioremap/iounmap
for the entire region isn't sufficient,
while testing I found per region remap
/unmap was required i.e after we moved to
away from the validating the entire blog
in a single pass.

Now with the mpss_region out of the picture
da_to_va really made no sense without having
ioremap function in it. Let me know what you
think.

> 
> So I think you should add the ioremap/iounmap to the beginning/end of
> mpss_load and the dump_segment directly instead.
> 
>> +}
>> +
>>  static int q6v5_mpss_load(struct q6v5 *qproc)
>>  {
>>  	const struct elf32_phdr *phdrs;
>> @@ -1156,7 +1167,11 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			goto release_firmware;
>>  		}
>> 
>> -		ptr = qproc->mpss_region + offset;
>> +		ptr = q6v5_da_to_va(qproc->rproc, phdr->p_paddr, phdr->p_memsz);
> 
> rproc_da_to_va() here.

sure

> 
>> +		if (!ptr) {
>> +			dev_err(qproc->dev, "failed to map memory\n");
> 
> Now this will be able to fail, so you should add this error handling
> snippet, just with a slightly different message.

sure

> 
>> +			goto release_firmware;
>> +		}
>> 
>>  		if (phdr->p_filesz && phdr->p_offset < fw->size) {
>>  			/* Firmware is large enough to be non-split */
>> @@ -1165,6 +1180,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  					"failed to load segment %d from truncated file %s\n",
>>  					i, fw_name);
>>  				ret = -EINVAL;
>> +				devm_iounmap(qproc->dev, ptr);
>>  				goto release_firmware;
>>  			}
>> 
>> @@ -1175,6 +1191,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
>>  			if (ret) {
>>  				dev_err(qproc->dev, "failed to load %s\n", fw_name);
>> +				devm_iounmap(qproc->dev, ptr);
>>  				goto release_firmware;
>>  			}
>> 
>> @@ -1187,6 +1204,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>>  			memset(ptr + phdr->p_filesz, 0,
>>  			       phdr->p_memsz - phdr->p_filesz);
>>  		}
>> +		devm_iounmap(qproc->dev, ptr);
> 
> Move this to the end an unmap the entire thing.
> 
> And generally, please avoid devm for things where you manually unmap.

will take care of ^^ in the next re-spin.

> 
> Regards,
> Bjorn
> 
>>  		size += phdr->p_memsz;
>> 
>>  		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
>> @@ -1236,7 +1254,7 @@ static void qcom_q6v5_dump_segment(struct rproc 
>> *rproc,
>>  	int ret = 0;
>>  	struct q6v5 *qproc = rproc->priv;
>>  	unsigned long mask = BIT((unsigned long)segment->priv);
>> -	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> +	void *ptr = NULL;
>> 
>>  	/* Unlock mba before copying segments */
>>  	if (!qproc->dump_mba_loaded) {
>> @@ -1250,10 +1268,15 @@ static void qcom_q6v5_dump_segment(struct 
>> rproc *rproc,
>>  		}
>>  	}
>> 
>> -	if (!ptr || ret)
>> -		memset(dest, 0xff, segment->size);
>> -	else
>> +	if (!ret)
>> +		ptr = rproc_da_to_va(rproc, segment->da, segment->size);
>> +
>> +	if (ptr) {
>>  		memcpy(dest, ptr, segment->size);
>> +		devm_iounmap(qproc->dev, ptr);
>> +	} else {
>> +		memset(dest, 0xff, segment->size);
>> +	}
>> 
>>  	qproc->dump_segment_mask |= mask;
>> 
>> @@ -1327,18 +1350,6 @@ static int q6v5_stop(struct rproc *rproc)
>>  	return 0;
>>  }
>> 
>> -static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
>> -{
>> -	struct q6v5 *qproc = rproc->priv;
>> -	int offset;
>> -
>> -	offset = da - qproc->mpss_reloc;
>> -	if (offset < 0 || offset + len > qproc->mpss_size)
>> -		return NULL;
>> -
>> -	return qproc->mpss_region + offset;
>> -}
>> -
>>  static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
>>  					    const struct firmware *mba_fw)
>>  {
>> @@ -1595,12 +1606,6 @@ static int q6v5_alloc_memory_region(struct q6v5 
>> *qproc)
>> 
>>  	qproc->mpss_phys = qproc->mpss_reloc = r.start;
>>  	qproc->mpss_size = resource_size(&r);
>> -	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, 
>> qproc->mpss_size);
>> -	if (!qproc->mpss_region) {
>> -		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
>> -			&r.start, qproc->mpss_size);
>> -		return -EBUSY;
>> -	}
>> 
>>  	return 0;
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
