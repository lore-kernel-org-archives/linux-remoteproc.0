Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH v2 1/1] remoteproc: core: probe subdevices before booting
 coprocessor
References: <1481143768-16377-1-git-send-email-loic.pallardy@st.com>
 <20161207232332.GJ30492@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <df027c54-fb48-da31-752b-5b551c698f8f@st.com>
Date: Sun, 11 Dec 2016 21:30:26 +0100
MIME-Version: 1.0
In-Reply-To: <20161207232332.GJ30492@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/08/2016 12:23 AM, Bjorn Andersson wrote:
> On Wed 07 Dec 12:49 PST 2016, Loic Pallardy wrote:
>
>> With subdevice support introduction, coprocessor boot sequence has
>> changed. Related coprocessor subdevices are now starting after firmware
>> and resource table loading and coprocessor boot.
>>
>
> ...just as they always have been.
>
>> But some subdevices can resources to allocate before coprocessor start,
>> like rpmsg buffers allocation for example.
>>
>
> "for example"?
>
> I can think of numerous examples where rpmsg devices would need this
> mechanism as well, but there's no guarantees that just because we probe
> subdevices before we boot that these devices has had their chance to
> probe and register their resources.
>
> How would this work if some of the virtio drivers used by the firmware
> are compiled as modules and not yet loaded or anything hitting an
> EPROBE_DEFER?
OK You're true, need to be compliant with module mode too.
>
>> This patch probes subdevices just before loading resource table,
>> to keep backward compatibility with existing firmwares.
>>
>
> Backward compatibility with firmware written specifically for the
> single, yet unreleased, version of the Linux kernel with this behavior?
No backward compatibility in view. We are working to have firmwares 
released for 96board B2260 asap. Just need to cop with SoC HW and ST 
RTOS constraints.
>
>
>
> I still believe that resources that are so strictly tied to the state of
> the firmware should be declared as part of the remoteproc, not
> registered by other devices that might or might not finish their
> registration in time - unless those resources can be associated
> to the remote dynamically.
Yes please drop out this patch. I'll work on firmware side to be more 
flexible for initialization sequence.

Regards,
Loic
>
> Regards,
> Bjorn
>
>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
>> ---
>> v2: remove unused stop_rproc label
>>
>>  drivers/remoteproc/remoteproc_core.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index f0f6ec1..61f06a7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -913,6 +913,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up_resources;
>>  	}
>>
>> +	/* probe any subdevices for the remote processor */
>> +	ret = rproc_probe_subdevices(rproc);
>> +	if (ret) {
>> +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>> +			rproc->name, ret);
>> +		goto clean_up_resources;
>> +	}
>> +
>>  	/*
>>  	 * The starting device has been given the rproc->table_ptr as the
>>  	 * resource table. The address of the vring along with the other
>> @@ -932,22 +940,12 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>>  		goto clean_up_resources;
>>  	}
>>
>> -	/* probe any subdevices for the remote processor */
>> -	ret = rproc_probe_subdevices(rproc);
>> -	if (ret) {
>> -		dev_err(dev, "failed to probe subdevices for %s: %d\n",
>> -			rproc->name, ret);
>> -		goto stop_rproc;
>> -	}
>> -
>>  	rproc->state = RPROC_RUNNING;
>>
>>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);
>>
>>  	return 0;
>>
>> -stop_rproc:
>> -	rproc->ops->stop(rproc);
>>  clean_up_resources:
>>  	rproc_resource_cleanup(rproc);
>>  clean_up:
>> --
>> 1.9.1
>>
