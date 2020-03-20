Return-Path: <s-anna@ti.com>
Subject: Re: [PATCHv8 RESEND 03/15] remoteproc/omap: Add a sanity check for
 DSP boot address alignment
References: <20200313081718.30612-4-t-kristo@ti.com>
 <20200314004334.26509-1-s-anna@ti.com> <20200320203409.GC16145@xps15>
From: Suman Anna <s-anna@ti.com>
Message-ID: <2d186bf1-db04-5f69-62a8-d1970e0592a4@ti.com>
Date: Fri, 20 Mar 2020 16:38:23 -0500
MIME-Version: 1.0
In-Reply-To: <20200320203409.GC16145@xps15>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On 3/20/20 3:34 PM, Mathieu Poirier wrote:
> On Fri, Mar 13, 2020 at 07:43:34PM -0500, Suman Anna wrote:
>> The DSP remote processors on OMAP SoCs require a boot register to
>> be programmed with a boot address, and this boot address needs to
>> be on a 1KB boundary. The current code is simply masking the boot
>> address appropriately without performing any sanity checks before
>> releasing the resets. An unaligned boot address results in an
>> undefined execution behavior and can result in various bus errors
>> like MMU Faults or L3 NoC errors. Such errors are hard to debug and
>> can be easily avoided by adding a sanity check for the alignment
>> before booting a DSP remote processor.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Andrew F. Davis <afd@ti.com>
>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> ---
>> v8-Resend: Updated to fix compilation issues against rproc-next
>>
>>  drivers/remoteproc/omap_remoteproc.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
>> index d47d5ded651a..fe11cb709770 100644
>> --- a/drivers/remoteproc/omap_remoteproc.c
>> +++ b/drivers/remoteproc/omap_remoteproc.c
>> @@ -121,14 +121,23 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
>>   * @rproc: handle of a remote processor
>>   *
>>   * Set boot address for a supported DSP remote processor.
>> + *
>> + * Return: 0 on success, or -EINVAL if boot address is not aligned properly
>>   */
>> -static void omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>> +static int omap_rproc_write_dsp_boot_addr(struct rproc *rproc)
>>  {
>> +	struct device *dev = rproc->dev.parent;
>>  	struct omap_rproc *oproc = rproc->priv;
>>  	struct omap_rproc_boot_data *bdata = oproc->boot_data;
>>  	u32 offset = bdata->boot_reg;
>>  
>> -	regmap_write(bdata->syscon, offset, rproc->bootaddr);
>> +	if (rproc->bootaddr & (SZ_1K - 1)) {
>> +		dev_err(dev, "invalid boot address 0x%llx, must be aligned on a 1KB boundary\n",
>> +			rproc->bootaddr);
> 
> Yes it does fix the compilation problem but after that patch 7 doesn't apply
> anymore.

git am -3 should apply the patch. I didn't resend that one since there
were no code changes.

regards
Suman

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	return regmap_write(bdata->syscon, offset, rproc->bootaddr);
>>  }
>>  
>>  /*
>> @@ -145,8 +154,11 @@ static int omap_rproc_start(struct rproc *rproc)
>>  	int ret;
>>  	struct mbox_client *client = &oproc->client;
>>  
>> -	if (oproc->boot_data)
>> -		omap_rproc_write_dsp_boot_addr(rproc);
>> +	if (oproc->boot_data) {
>> +		ret = omap_rproc_write_dsp_boot_addr(rproc);
>> +		if (ret)
>> +			return ret;
>> +	}
>>  
>>  	client->dev = dev;
>>  	client->tx_done = NULL;
>> -- 
>> 2.23.0
>>
