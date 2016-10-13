Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH 3/4] remoteproc: Add a sysfs interface for firmware and
 state
References: <1476193185-32107-1-git-send-email-matt.redfearn@imgtec.com>
 <1476193185-32107-4-git-send-email-matt.redfearn@imgtec.com>
 <d206a09e-4db6-2199-2a5f-a81430c3adae@st.com>
 <f070f6e0-275c-1937-2bde-adee0c1fd08e@imgtec.com>
 <45167a9c-80ee-2af1-2ec5-db1eb1eef883@st.com>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <8f898d96-bd48-2666-0551-6d48966f50fc@imgtec.com>
Date: Thu, 13 Oct 2016 16:00:34 +0100
MIME-Version: 1.0
In-Reply-To: <45167a9c-80ee-2af1-2ec5-db1eb1eef883@st.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: loic pallardy <loic.pallardy@st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic


On 13/10/16 15:39, loic pallardy wrote:
>
>
> On 10/13/2016 04:25 PM, Matt Redfearn wrote:
>> Hi Loic,
>>
>>
>> On 13/10/16 14:56, loic pallardy wrote:
>>>
>>>
>>> On 10/11/2016 03:39 PM, Matt Redfearn wrote:
>>>> This patch adds a sysfs interface to rproc allowing the firmware name
>>>> and processor state to be changed dynamically.
>>>>
>>>> State was previously available in debugfs, and is replicated here. The
>>>> firmware file allows retrieval of the running firmware name, and a new
>>>> one to be specified at run time, so long as the remote processor has
>>>> been stopped.
>>>>
>>>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>>>>
>>>> ---
>>>>
>>>>  Documentation/ABI/testing/sysfs-class-remoteproc |  50 +++++++++
>>>>  drivers/remoteproc/Makefile                      |   1 +
>>>>  drivers/remoteproc/remoteproc_core.c             |   3 +
>>>>  drivers/remoteproc/remoteproc_internal.h         |   5 +
>>>>  drivers/remoteproc/remoteproc_sysfs.c            | 132
>>>> +++++++++++++++++++++++
>>>>  5 files changed, 191 insertions(+)
>>>>  create mode 100644 Documentation/ABI/testing/sysfs-class-remoteproc
>>>>  create mode 100644 drivers/remoteproc/remoteproc_sysfs.c
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc
>>>> b/Documentation/ABI/testing/sysfs-class-remoteproc
>>>> new file mode 100644
>>>> index 000000000000..d188afebc8ba
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
>>>> @@ -0,0 +1,50 @@
>>>> +What:        /sys/class/remoteproc/.../firmware
>>>> +Date:        October 2016
>>>> +Contact:    Matt Redfearn <matt.redfearn@imgtec.com>
>>>> +Description:    Remote processor firmware
>>>> +
>>>> +        Reports the name of the firmware currently loaded to the
>>>> +        remote processor.
>>>> +
>>>> +        To change the running firmware, ensure the remote 
>>>> processor is
>>>> +        stopped (using /sys/class/remoteproc/.../state) and write a
>>>> new filename.
>>>> +
>>>> +What:        /sys/class/remoteproc/.../state
>>>> +Date:        October 2016
>>>> +Contact:    Matt Redfearn <matt.redfearn@imgtec.com>
>>>> +Description:    Remote processor state
>>>> +
>>>> +        Reports the state of the remote processor, which will be one
>>>> of:
>>>> +
>>>> +        "offline"
>>>> +        "suspended"
>>>> +        "running"
>>>> +        "crashed"
>>>> +        "invalid"
>>>> +
>>>> +        "offline" means the remote processor is powered off.
>>>> +
>>>> +        "suspended" means that the remote processor is suspended and
>>>> +        must be woken to receive messages.
>>>> +
>>>> +        "running" is the normal state of an available remote 
>>>> processor
>>>> +
>>>> +        "crashed" indicates that a problem/crash has been detected on
>>>> +        the remote processor.
>>>> +
>>>> +        "invalid" is returned if the remote processor is in an
>>>> +        unknown state.
>>>> +
>>>> +        Writing this file controls the state of the remote processor.
>>>> +        The following states can be written:
>>>> +
>>>> +        "start"
>>>> +        "stop"
>>>> +
>>>> +        Writing "start" will attempt to start the processor 
>>>> running the
>>>> +        firmware indicated by, or written to,
>>>> +        /sys/class/remoteproc/.../firmware. The remote processor 
>>>> should
>>>> +        transition to "running" state.
>>>> +
>>>> +        Writing "stop" will attempt to halt the remote processor and
>>>> +        return it to the "offline" state.
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index 92d3758bd15c..666258bd80aa 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -5,6 +5,7 @@
>>>>  obj-$(CONFIG_REMOTEPROC)        += remoteproc.o
>>>>  remoteproc-y                := remoteproc_core.o
>>>>  remoteproc-y                += remoteproc_debugfs.o
>>>> +remoteproc-y                += remoteproc_sysfs.o
>>>>  remoteproc-y                += remoteproc_virtio.o
>>>>  remoteproc-y                += remoteproc_elf_loader.o
>>>>  obj-$(CONFIG_OMAP_REMOTEPROC)        += omap_remoteproc.o
>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>>> b/drivers/remoteproc/remoteproc_core.c
>>>> index 2152b484f314..642c5b58fec5 100644
>>>> --- a/drivers/remoteproc/remoteproc_core.c
>>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>>> @@ -1455,6 +1455,7 @@ struct rproc *rproc_alloc(struct device *dev,
>>>> const char *name,
>>>>      device_initialize(&rproc->dev);
>>>>      rproc->dev.parent = dev;
>>>>      rproc->dev.type = &rproc_type;
>>>> +    rproc->dev.class = &rproc_class;
>>>>
>>>>      /* Assign a unique device index and name */
>>>>      rproc->index = ida_simple_get(&rproc_dev_index, 0, 0, 
>>>> GFP_KERNEL);
>>>> @@ -1580,6 +1581,7 @@ EXPORT_SYMBOL(rproc_report_crash);
>>>>
>>>>  static int __init remoteproc_init(void)
>>>>  {
>>>> +    rproc_init_sysfs();
>>>>      rproc_init_debugfs();
>>>>
>>>>      return 0;
>>>> @@ -1591,6 +1593,7 @@ static void __exit remoteproc_exit(void)
>>>>      ida_destroy(&rproc_dev_index);
>>>>
>>>>      rproc_exit_debugfs();
>>>> +    rproc_exit_sysfs();
>>>>  }
>>>>  module_exit(remoteproc_exit);
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>>> b/drivers/remoteproc/remoteproc_internal.h
>>>> index 837faf2677a6..2beb86ddfacc 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -64,6 +64,11 @@ void rproc_create_debug_dir(struct rproc *rproc);
>>>>  void rproc_init_debugfs(void);
>>>>  void rproc_exit_debugfs(void);
>>>>
>>>> +/* from remoteproc_sysfs.c */
>>>> +extern struct class rproc_class;
>>> struct class rproc_class should be static to remoteproc_sysfs.c file.
>>> It will be better to create a new interface like rproc_register_sysfs
>>> to associate rproc_class to rproc device.
>>
>> It would be nice if that were possible, but since the class has to
>> associated with the devices created within remoteproc_core, as it stands
>> we must have visibility of this symbol there, see above the change to
>> drivers/remoteproc/remoteproc_core.c line 1455.
>> The alternative would be a utility function in remoteproc_sysfs.c to
>> associate the class with an rproc device, it depends what the preference
>> would be.
>
> Yes it will be my preference. remoteproc_sysfs.c file to provide a new 
> service like:
> void rproc_register_sysfs(struct rproc *rproc) {
>     rproc->dev.class = &rproc_class;
> }
>
> and to call this function from rproc_alloc
>
> /Loic

OK, no problem - that is probably neater :-)

Thanks,
Matt


>>
>> Thanks,
>> Matt
>>
>>>
>>>> +int rproc_init_sysfs(void);
>>>> +void rproc_exit_sysfs(void);
>>>> +
>>>>  void rproc_free_vring(struct rproc_vring *rvring);
>>>>  int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>>> new file mode 100644
>>>> index 000000000000..892599863ca6
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>>> @@ -0,0 +1,132 @@
>>>> +/*
>>>> + * Remote Processor Framework
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> + * modify it under the terms of the GNU General Public License
>>>> + * version 2 as published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +
>>>> +#include <linux/remoteproc.h>
>>>> +
>>>> +#include "remoteproc_internal.h"
>>>> +
>>>> +#define to_rproc(d) container_of(d, struct rproc, dev)
>>>> +
>>>> +/* Expose the loaded / running firmware name via sysfs */
>>>> +static ssize_t firmware_show(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +              char *buf)
>>>> +{
>>>> +    struct rproc *rproc = to_rproc(dev);
>>>> +
>>>> +    if (rproc->firmware)
>>>> +        return sprintf(buf, "%s\n", rproc->firmware);
>>>> +    else
>>>> +        return sprintf(buf, "unknown");
>>>> +}
>>>> +
>>>> +/* Change firmware name via sysfs */
>>>> +static ssize_t firmware_store(struct device *dev,
>>>> +                  struct device_attribute *attr,
>>>> +                  const char *buf, size_t count)
>>>> +{
>>>> +    struct rproc *rproc = to_rproc(dev);
>>>> +    int err;
>>>> +
>>>> +    err = rproc_change_firmware(rproc, buf);
>>>> +    return err ? err : count;
>>>> +}
>>>> +static DEVICE_ATTR_RW(firmware);
>>>> +
>>>> +
>>>> +/*
>>>> + * A state-to-string lookup table, for exposing a human readable 
>>>> state
>>>> + * via sysfs. Always keep in sync with enum rproc_state
>>>> + */
>>>> +static const char * const rproc_state_string[] = {
>>>> +    "offline",
>>>> +    "suspended",
>>>> +    "running",
>>>> +    "crashed",
>>>> +    "invalid",
>>>> +};
>>>> +
>>>> +/* Expose the state of the remote processor via sysfs */
>>>> +static ssize_t state_show(struct device *dev, struct
>>>> device_attribute *attr,
>>>> +              char *buf)
>>>> +{
>>>> +    struct rproc *rproc = to_rproc(dev);
>>>> +    unsigned int state;
>>>> +
>>>> +    state = rproc->state > RPROC_LAST ? RPROC_LAST : rproc->state;
>>>> +    return scnprintf(buf, 30, "%.28s (%d)\n",
>>>> +             rproc_state_string[state], rproc->state);
>>>> +}
>>>> +
>>>> +/* Change remote processor state via sysfs */
>>>> +static ssize_t state_store(struct device *dev,
>>>> +                  struct device_attribute *attr,
>>>> +                  const char *buf, size_t count)
>>>> +{
>>>> +    struct rproc *rproc = to_rproc(dev);
>>>> +    int ret = 0;
>>>> +    int len = count;
>>>> +
>>>> +    if (buf[len - 1] == '\n')
>>>> +        len--;
>>>> +
>>>> +    if (!strncmp(buf, "start", len)) {
>>>> +        if (rproc->state == RPROC_RUNNING)
>>>> +            return -EBUSY;
>>>> +
>>>> +        ret = rproc_boot(rproc);
>>>> +        if (ret)
>>>> +            dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>>>> +    } else if (!strncmp(buf, "stop", len)) {
>>>> +        rproc_shutdown(rproc);
>>>> +    } else {
>>>> +        dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>>>> +        ret = -EINVAL;
>>>> +    }
>>>> +    return ret ? ret : count;
>>>> +}
>>>> +static DEVICE_ATTR_RW(state);
>>>> +
>>>> +static const struct attribute *rproc_attrs[] = {
>>>> +    &dev_attr_firmware.attr,
>>>> +    &dev_attr_state.attr,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +static const struct attribute_group rproc_devgroup = {
>>>> +    .attrs = rproc_attrs
>>>> +};
>>>> +
>>>> +static const struct attribute_group *rproc_devgroups[] = {
>>>> +    &rproc_devgroup,
>>>> +    NULL
>>>> +};
>>>> +
>>>> +struct class rproc_class = {
>>> static ?
>>>
>>> Regards,
>>> Loic
>>>> +    .name        = "remoteproc",
>>>> +    .dev_groups    = rproc_devgroups,
>>>> +};
>>>> +
>>>> +int __init rproc_init_sysfs(void)
>>>> +{
>>>> +    /* create remoteproc device class for sysfs */
>>>> +    int err = class_register(&rproc_class);
>>>> +
>>>> +    if (err)
>>>> +        pr_err("remoteproc: unable to register class\n");
>>>> +    return err;
>>>> +}
>>>> +
>>>> +void __exit rproc_exit_sysfs(void)
>>>> +{
>>>> +    class_unregister(&rproc_class);
>>>> +}
>>>>
>>
