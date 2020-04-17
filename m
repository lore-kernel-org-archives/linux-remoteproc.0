Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: rishabhb=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 17 Apr 2020 10:48:18 -0700
From: rishabhb@codeaurora.org
Subject: Re: [PATCH 3/3] remoteproc: Add coredump sysfs attribute
In-Reply-To: <8b807eab057e4dfabbc48d31cbf0b4cc@SFHDAG7NODE2.st.com>
References: <1587062312-4939-1-git-send-email-rishabhb@codeaurora.org>
 <1587062312-4939-3-git-send-email-rishabhb@codeaurora.org>
 <8b807eab057e4dfabbc48d31cbf0b4cc@SFHDAG7NODE2.st.com>
Message-ID: <3c115358fd10ac728559d876976ed391@codeaurora.org>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org, tsoni@codeaurora.org, psodagud@codeaurora.org, sidgup@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2020-04-17 00:54, Loic PALLARDY wrote:
> Hi Rishabh,
> 
>> -----Original Message-----
>> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
>> owner@vger.kernel.org> On Behalf Of Rishabh Bhatnagar
>> Sent: jeudi 16 avril 2020 20:39
>> To: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: bjorn.andersson@linaro.org; ohad@wizery.com;
>> mathieu.poirier@linaro.org; tsoni@codeaurora.org;
>> psodagud@codeaurora.org; sidgup@codeaurora.org; Rishabh Bhatnagar
>> <rishabhb@codeaurora.org>
>> Subject: [PATCH 3/3] remoteproc: Add coredump sysfs attribute
>> 
>> Add coredump sysfs attribute to configure the type of memory dump.
>> User can select between default or inline coredump functionality.
>> Also coredump collection can be disabled through this interface.
>> This functionality can be configured differently for different
>> remote processors.
>> This provides an option to dynamically configure the dump type
>> based on userpsace capability.
> I think this should be under debugfs as it is not link to remoteproc
> control but only
> to its debug capability. Moreover other fields related to coredump are
> already un debugfs control.
> 
> Regards,
> Loic
Hi Loic,
We initially thought of that but the problem is that debugfs is not
mounted for production builds. So we would be limited to only default
coredump and loose the capability to disable/move to inline coredump.
>> 
>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>> ---
>>  drivers/remoteproc/remoteproc_sysfs.c | 57
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>> b/drivers/remoteproc/remoteproc_sysfs.c
>> index 7f8536b..d112664 100644
>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>> @@ -9,6 +9,62 @@
>> 
>>  #define to_rproc(d) container_of(d, struct rproc, dev)
>> 
>> +/*
>> + * A coredump-configuration-to-string lookup table, for exposing a
>> + * human readable configuration via sysfs. Always keep in sync with
>> + * enum rproc_coredump_conf
>> + */
>> +static const char * const rproc_coredump_str[] = {
>> +	[COREDUMP_DEFAULT]	= "default",
>> +	[COREDUMP_INLINE]	= "inline",
>> +	[COREDUMP_DISABLED]	= "disabled",
>> +};
>> +
>> +/* Expose the current coredump configuration via sysfs */
>> +static ssize_t coredump_show(struct device *dev, struct 
>> device_attribute
>> *attr,
>> +			      char *buf)
>> +{
>> +	struct rproc *rproc = to_rproc(dev);
>> +
>> +	return sprintf(buf, "%s\n", rproc_coredump_str[rproc-
>> >coredump_conf]);
>> +}
>> +
>> +/* Change the coredump configuration via sysfs */
>> +static ssize_t coredump_store(struct device *dev, struct 
>> device_attribute
>> *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct rproc *rproc = to_rproc(dev);
>> +	int err;
>> +
>> +	err = mutex_lock_interruptible(&rproc->lock);
>> +	if (err) {
>> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (rproc->state == RPROC_CRASHED) {
>> +		dev_err(dev, "can't change coredump configuration\n");
>> +		err = -EBUSY;
>> +		goto out;
>> +	}
>> +
>> +	if (sysfs_streq(buf, "disable"))
>> +		rproc->coredump_conf = COREDUMP_DISABLED;
>> +	else if (sysfs_streq(buf, "inline"))
>> +		rproc->coredump_conf = COREDUMP_INLINE;
>> +	else if (sysfs_streq(buf, "default"))
>> +		rproc->coredump_conf = COREDUMP_DEFAULT;
>> +	else {
>> +		dev_err(dev, "Invalid coredump configuration\n");
>> +		err = -EINVAL;
>> +	}
>> +out:
>> +	mutex_unlock(&rproc->lock);
>> +
>> +	return err ? err : count;
>> +}
>> +static DEVICE_ATTR_RW(coredump);
>> +
>>  /* Expose the loaded / running firmware name via sysfs */
>>  static ssize_t firmware_show(struct device *dev, struct 
>> device_attribute
>> *attr,
>>  			  char *buf)
>> @@ -127,6 +183,7 @@ static ssize_t name_show(struct device *dev, 
>> struct
>> device_attribute *attr,
>>  	&dev_attr_firmware.attr,
>>  	&dev_attr_state.attr,
>>  	&dev_attr_name.attr,
>> +	&dev_attr_coredump.attr,
>>  	NULL
>>  };
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,
>> a Linux Foundation Collaborative Project
