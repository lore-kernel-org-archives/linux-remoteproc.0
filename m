Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v5 1/3] remoteproc: add support for co-processor loaded
 and booted before kernel
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com> <20200214025512.GQ1443@yoga>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <ff04e4ed-201a-877f-7500-f594820cab15@st.com>
Date: Fri, 14 Feb 2020 17:34:19 +0100
MIME-Version: 1.0
In-Reply-To: <20200214025512.GQ1443@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 2/14/20 3:55 AM, Bjorn Andersson wrote:
> On Tue 11 Feb 09:42 PST 2020, Arnaud Pouliquen wrote:
> 
>> From: Loic Pallardy <loic.pallardy@st.com>
>>
>> Remote processor could boot independently or be loaded/started before
>> Linux kernel by bootloader or any firmware.
>> This patch introduces a new property in rproc core, named skip_fw_load,
>> to be able to allocate resources and sub-devices like vdev and to
>> synchronize with current state without loading firmware from file system.
> 
> This sentence describes the provided patch.
> 
> As I expressed in the earlier version, in order to support remoteprocs
> that doesn't need firmware loading, e.g. running from some ROM or
> dedicated flash storage etc, this patch looks really good.
> 
>> It is platform driver responsibility to implement the right firmware
>> load ops according to HW specificities.
> 
> But this last sentence describes a remoteproc that indeed needs
> firmware and that the purpose of this patch is to work around the core's
> handling of the firmware.

I will update or suppress the last sentence.

> 
>>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 67 ++++++++++++++++++++++------
>>  include/linux/remoteproc.h           |  2 +
>>  2 files changed, 55 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> [..]
>> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
>>  
>>  	dev_info(dev, "powering up %s\n", rproc->name);
>>  
>> -	/* load firmware */
>> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> -	if (ret < 0) {
>> -		dev_err(dev, "request_firmware failed: %d\n", ret);
>> -		goto downref_rproc;
>> +	if (!rproc->skip_fw_load) {
>> +		/* load firmware */
>> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
>> +		if (ret < 0) {
>> +			dev_err(dev, "request_firmware failed: %d\n", ret);
>> +			goto downref_rproc;
>> +		}
>> +	} else {
>> +		/*
>> +		 * Set firmware name pointer to null as remoteproc core is not
>> +		 * in charge of firmware loading
>> +		 */
>> +		kfree(rproc->firmware);
>> +		rproc->firmware = NULL;
> 
> As stated before, I think it would be more appropriate to allow a
> remoteproc driver for hardware that shouldn't have firmware loaded to
> never set rproc->firmware.
> 
> And I'm still curious how you're dealing with a crash or a restart on
> this remoteproc. Don't you need to reload your firmware in these
> circumstances? Do you perhaps have a remoteproc that's both
> "already_booted" and "skip_fw_load"?

Yes the crash management is the main point here. Even if the firmware has been 
preloaded and started by the bootloader, a crash can occur (e.g. watchdog) and have to be be treated.
In this case on stm32 platform we trig a crash recovery to shutdown the firmware.
Then application has possibility to reload the same firmware (copy of the fw in FS),
to load a new firmware(e.g.for diagnostic or a clean shutdown), reset the platform.

Implementing a specific driver would not give such flexibility.

> 
>>  	}
>>  
>>  	ret = rproc_fw_boot(rproc, firmware_p);
>> @@ -1916,8 +1946,17 @@ int rproc_add(struct rproc *rproc)
>>  	/* create debugfs entries */
>>  	rproc_create_debug_dir(rproc);
>>  
>> -	/* if rproc is marked always-on, request it to boot */
>> -	if (rproc->auto_boot) {
>> +	if (rproc->skip_fw_load) {
>> +		/*
>> +		 * If rproc is marked already booted, no need to wait
>> +		 * for firmware.
>> +		 * Just handle associated resources and start sub devices
>> +		 */
> 
> Again, this describes a system where the remoteproc is already booted,
> not a remoteproc that doesn't need firmware loading.

Right, i will change the comment.

Thanks,
Arnaud
> 
> Regards,
> Bjorn
> 
