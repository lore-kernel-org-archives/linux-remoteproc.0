Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH v4 3/5] remoteproc: Add prepare/unprepare callbacks
References: <20191210164014.50739-1-paul@crapouillou.net>
 <20191210164014.50739-3-paul@crapouillou.net> <20191221202039.GG549437@yoga>
 <1579122951.3.2@crapouillou.net> <20200120201944.GO1511@yoga>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <894685c4-e5e7-f860-4fe7-b0e3637ed3bb@st.com>
Date: Tue, 21 Jan 2020 11:24:03 +0100
MIME-Version: 1.0
In-Reply-To: <20200120201944.GO1511@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,Paul,

On 1/20/20 9:19 PM, Bjorn Andersson wrote:
> On Wed 15 Jan 13:15 PST 2020, Paul Cercueil wrote:
> 
>> Hi Bjorn,
>>
>>
>> Le sam., déc. 21, 2019 at 12:20, Bjorn Andersson
>> <bjorn.andersson@linaro.org> a écrit :
>>> On Tue 10 Dec 08:40 PST 2019, Paul Cercueil wrote:
>>>
>>>>  The .prepare() callback is called before the firmware is loaded to
>>>>  memory. This is useful for instance in the case where some setup is
>>>>  required for the memory to be accessible.
>>>>
>>>
>>> Would it make sense to somehow tie this prepare/unprepare to the actual
>>> struct rproc_mem_entry that needs the resource enabled?
>>
>> Do you need such granularity?
>>
> 
> I don't have such needs, but given some of the memory structure that
> Suman and Loic has been talking about I would expect that such need
> exists
> 
>> In my case, the three memories need the same clock to be enabled.
>>
> 
> But we can update your driver to associate your one clock with the
> memory objects if/when we end up implementing this later.

IMHO, as mention Fabien the prepare/unprepare should probably not in the stop/start
but in rproc_fw_boot and rproc_resource_cleanup. This should cover more usecases (such as power domain) and
avoid a unprepare/prepare on crash recovery.

Nevertheless I'm wondering if it's more like PM runtime that should be implemented here...?

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> -Paul
>>
>>
>>>
>>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>>  ---
>>>>
>>>>  Notes:
>>>>      v2-v4: No change
>>>>
>>>>   drivers/remoteproc/remoteproc_core.c | 16 +++++++++++++++-
>>>>   include/linux/remoteproc.h           |  4 ++++
>>>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>>  diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>>  index 0a9fc7fdd1c3..3ea5f675a148 100644
>>>>  --- a/drivers/remoteproc/remoteproc_core.c
>>>>  +++ b/drivers/remoteproc/remoteproc_core.c
>>>>  @@ -1299,11 +1299,19 @@ static int rproc_start(struct rproc *rproc,
>>>> const struct firmware *fw)
>>>>   	struct device *dev = &rproc->dev;
>>>>   	int ret;
>>>>
>>>>  +	if (rproc->ops->prepare) {
>>>>  +		ret = rproc->ops->prepare(rproc);
>>>>  +		if (ret) {
>>>>  +			dev_err(dev, "Failed to prepare rproc: %d\n", ret);
>>>>  +			return ret;
>>>>  +		}
>>>>  +	}
>>>>  +

>>>>   	/* load the ELF segments to memory */
>>>>   	ret = rproc_load_segments(rproc, fw);
>>>>   	if (ret) {
>>>>   		dev_err(dev, "Failed to load program segments: %d\n", ret);
>>>>  -		return ret;
>>>>  +		goto unprepare_rproc;
>>>>   	}
>>>>
>>>>   	/*
>>>>  @@ -1354,6 +1362,9 @@ static int rproc_start(struct rproc *rproc,
>>>> const struct firmware *fw)
>>>>   	rproc_unprepare_subdevices(rproc);
>>>>   reset_table_ptr:
>>>>   	rproc->table_ptr = rproc->cached_table;
>>>>  +unprepare_rproc:
>>>>  +	if (rproc->ops->unprepare)
>>>>  +		rproc->ops->unprepare(rproc);
>>>>
>>>>   	return ret;
>>>>   }
>>>>  @@ -1483,6 +1494,9 @@ static int rproc_stop(struct rproc *rproc,
>>>> bool crashed)
>>>>
>>>>   	rproc->state = RPROC_OFFLINE;
>>>>
>>>>  +	if (rproc->ops->unprepare)
>>>>  +		rproc->ops->unprepare(rproc);
>>>>  +
>>>>   	dev_info(dev, "stopped remote processor %s\n", rproc->name);
>>>>
>>>>   	return 0;
>>>>  diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>  index 5f201f0c86c3..a6272d1ba384 100644
>>>>  --- a/include/linux/remoteproc.h
>>>>  +++ b/include/linux/remoteproc.h
>>>>  @@ -355,6 +355,8 @@ enum rsc_handling_status {
>>>>
>>>>   /**
>>>>    * struct rproc_ops - platform-specific device handlers
>>>>  + * @prepare:	prepare the device for power up (before the firmware
>>>> is loaded)
>>>>  + * @unprepare:	unprepare the device after it is stopped
>>>>    * @start:	power on the device and boot it
>>>>    * @stop:	power off the device
>>>>    * @kick:	kick a virtqueue (virtqueue id given as a parameter)
>>>>  @@ -371,6 +373,8 @@ enum rsc_handling_status {
>>>>    * @get_boot_addr:	get boot address to entry point specified in
>>>> firmware
>>>>    */
>>>>   struct rproc_ops {
>>>>  +	int (*prepare)(struct rproc *rproc);
>>>>  +	void (*unprepare)(struct rproc *rproc);
>>>>   	int (*start)(struct rproc *rproc);
>>>>   	int (*stop)(struct rproc *rproc);
>>>>   	void (*kick)(struct rproc *rproc, int vqid);
>>>>  --
>>>>  2.24.0
>>>>
>>
>>
