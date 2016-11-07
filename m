Return-Path: <sunnyliangjy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <30d50d76-e040-d9f2-c67e-49a2a3921f51@imgtec.com>
References: <1476878748-32097-1-git-send-email-matt.redfearn@imgtec.com>
 <1476878748-32097-2-git-send-email-matt.redfearn@imgtec.com>
 <CAA07jV8BUGMMtP=3PQLaL887UOd2wWa8ALyPqr=pdDdbGErGig@mail.gmail.com> <30d50d76-e040-d9f2-c67e-49a2a3921f51@imgtec.com>
From: Wendy Liang <sunnyliangjy@gmail.com>
Date: Mon, 7 Nov 2016 10:14:56 -0800
Message-ID: <CAA07jV9cUtRizVXXPB53iPXZc5Qz+uxUfuMj0nbCeagoDh3c7Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] remoteproc: Add a sysfs interface for firmware and state
Content-Type: text/plain; charset=UTF-8
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Matt,

On Fri, Nov 4, 2016 at 2:13 AM, Matt Redfearn <matt.redfearn@imgtec.com> wrote:
> Hi Wendy,
>
> Replies inline
>
>
>
> On 03/11/16 23:40, Wendy Liang wrote:
>>
>> HI Matt,
>>
>> Thanks for your patch. I am trying it.
>>
>> Please see my questions inline.
>>
>> Thanks,
>> Wendy
>>
>> On Wed, Oct 19, 2016 at 5:05 AM, Matt Redfearn <matt.redfearn@imgtec.com>
>> wrote:
>>>
>>> This patch adds a sysfs interface to rproc allowing the firmware name
>>> and processor state to be changed dynamically.
>>>
>>> State was previously available in debugfs, and is replicated here. The
>>> firmware file allows retrieval of the running firmware name, and a new
>>> one to be specified at run time, so long as the remote processor has
>>> been stopped.
>>>
>>> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
>>>
>>> ---
>>>
>>> Changes in v3:
>>> Drop call to rproc_add_virtio_devices from sysfs firmware_store
>>> Use strcspn to find firmware name length
>>> Explicit indexes for state strings
>>>
>>> Changes in v2:
>>> Have firmware_store perform the necessary steps inline.
>>> Use sysfs_streq when dealing with writes to sysfs files
>>>
>>>   Documentation/ABI/testing/sysfs-class-remoteproc |  50 ++++++++
>>>   drivers/remoteproc/Makefile                      |   1 +
>>>   drivers/remoteproc/remoteproc_core.c             |   3 +
>>>   drivers/remoteproc/remoteproc_internal.h         |   5 +
>>>   drivers/remoteproc/remoteproc_sysfs.c            | 151
>>> +++++++++++++++++++++++
>>>   5 files changed, 210 insertions(+)
>>>   create mode 100644 Documentation/ABI/testing/sysfs-class-remoteproc
>>>   create mode 100644 drivers/remoteproc/remoteproc_sysfs.c
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc
>>> b/Documentation/ABI/testing/sysfs-class-remoteproc
>>> new file mode 100644
>>> index 000000000000..d188afebc8ba
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
>>> @@ -0,0 +1,50 @@
>>> +What:          /sys/class/remoteproc/.../firmware
>>> +Date:          October 2016
>>> +Contact:       Matt Redfearn <matt.redfearn@imgtec.com>
>>> +Description:   Remote processor firmware
>>> +
>>> +               Reports the name of the firmware currently loaded to the
>>> +               remote processor.
>>> +
>>> +               To change the running firmware, ensure the remote
>>> processor is
>>> +               stopped (using /sys/class/remoteproc/.../state) and write
>>> a new filename.
>>> +
>>> +What:          /sys/class/remoteproc/.../state
>>> +Date:          October 2016
>>> +Contact:       Matt Redfearn <matt.redfearn@imgtec.com>
>>> +Description:   Remote processor state
>>> +
>>> +               Reports the state of the remote processor, which will be
>>> one of:
>>> +
>>> +               "offline"
>>> +               "suspended"
>>> +               "running"
>>> +               "crashed"
>>> +               "invalid"
>>> +
>>> +               "offline" means the remote processor is powered off.
>>> +
>>> +               "suspended" means that the remote processor is suspended
>>> and
>>> +               must be woken to receive messages.
>>> +
>>> +               "running" is the normal state of an available remote
>>> processor
>>> +
>>> +               "crashed" indicates that a problem/crash has been
>>> detected on
>>> +               the remote processor.
>>> +
>>> +               "invalid" is returned if the remote processor is in an
>>> +               unknown state.
>>> +
>>> +               Writing this file controls the state of the remote
>>> processor.
>>> +               The following states can be written:
>>> +
>>> +               "start"
>>> +               "stop"
>>> +
>>> +               Writing "start" will attempt to start the processor
>>> running the
>>> +               firmware indicated by, or written to,
>>> +               /sys/class/remoteproc/.../firmware. The remote processor
>>> should
>>> +               transition to "running" state.
>>> +
>>> +               Writing "stop" will attempt to halt the remote processor
>>> and
>>> +               return it to the "offline" state.
>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>> index 6dfb62ed643f..6da9b12f9798 100644
>>> --- a/drivers/remoteproc/Makefile
>>> +++ b/drivers/remoteproc/Makefile
>>> @@ -5,6 +5,7 @@
>>>   obj-$(CONFIG_REMOTEPROC)               += remoteproc.o
>>>   remoteproc-y                           := remoteproc_core.o
>>>   remoteproc-y                           += remoteproc_debugfs.o
>>> +remoteproc-y                           += remoteproc_sysfs.o
>>>   remoteproc-y                           += remoteproc_virtio.o
>>>   remoteproc-y                           += remoteproc_elf_loader.o
>>>   obj-$(CONFIG_OMAP_REMOTEPROC)          += omap_remoteproc.o
>>> diff --git a/drivers/remoteproc/remoteproc_core.c
>>> b/drivers/remoteproc/remoteproc_core.c
>>> index ccc2a73e94dd..b1860949d106 100644
>>> --- a/drivers/remoteproc/remoteproc_core.c
>>> +++ b/drivers/remoteproc/remoteproc_core.c
>>> @@ -1347,6 +1347,7 @@ struct rproc *rproc_alloc(struct device *dev, const
>>> char *name,
>>>          device_initialize(&rproc->dev);
>>>          rproc->dev.parent = dev;
>>>          rproc->dev.type = &rproc_type;
>>> +       rproc->dev.class = &rproc_class;
>>>
>>>          /* Assign a unique device index and name */
>>>          rproc->index = ida_simple_get(&rproc_dev_index, 0, 0,
>>> GFP_KERNEL);
>>> @@ -1485,6 +1486,7 @@ EXPORT_SYMBOL(rproc_report_crash);
>>>
>>>   static int __init remoteproc_init(void)
>>>   {
>>> +       rproc_init_sysfs();
>>>          rproc_init_debugfs();
>>>
>>>          return 0;
>>> @@ -1496,6 +1498,7 @@ static void __exit remoteproc_exit(void)
>>>          ida_destroy(&rproc_dev_index);
>>>
>>>          rproc_exit_debugfs();
>>> +       rproc_exit_sysfs();
>>>   }
>>>   module_exit(remoteproc_exit);
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>> b/drivers/remoteproc/remoteproc_internal.h
>>> index 4cf93ca2816e..c2c3e4762b90 100644
>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>> @@ -63,6 +63,11 @@ void rproc_create_debug_dir(struct rproc *rproc);
>>>   void rproc_init_debugfs(void);
>>>   void rproc_exit_debugfs(void);
>>>
>>> +/* from remoteproc_sysfs.c */
>>> +extern struct class rproc_class;
>>> +int rproc_init_sysfs(void);
>>> +void rproc_exit_sysfs(void);
>>> +
>>>   void rproc_free_vring(struct rproc_vring *rvring);
>>>   int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>
>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c
>>> b/drivers/remoteproc/remoteproc_sysfs.c
>>> new file mode 100644
>>> index 000000000000..bc5b0e00efb1
>>> --- /dev/null
>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>> @@ -0,0 +1,151 @@
>>> +/*
>>> + * Remote Processor Framework
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * version 2 as published by the Free Software Foundation.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/remoteproc.h>
>>> +
>>> +#include "remoteproc_internal.h"
>>> +
>>> +#define to_rproc(d) container_of(d, struct rproc, dev)
>>> +
>>> +/* Expose the loaded / running firmware name via sysfs */
>>> +static ssize_t firmware_show(struct device *dev, struct device_attribute
>>> *attr,
>>> +                         char *buf)
>>> +{
>>> +       struct rproc *rproc = to_rproc(dev);
>>> +
>>> +       return sprintf(buf, "%s\n", rproc->firmware);
>>> +}
>>> +
>>> +/* Change firmware name via sysfs */
>>> +static ssize_t firmware_store(struct device *dev,
>>> +                             struct device_attribute *attr,
>>> +                             const char *buf, size_t count)
>>> +{
>>> +       struct rproc *rproc = to_rproc(dev);
>>> +       char *p;
>>> +       int err, len = count;
>>> +
>>> +       err = mutex_lock_interruptible(&rproc->lock);
>>> +       if (err) {
>>> +               dev_err(dev, "can't lock rproc %s: %d\n", rproc->name,
>>> err);
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       if (rproc->state != RPROC_OFFLINE) {
>>> +               dev_err(dev, "can't change firmware while running\n");
>>> +               err = -EBUSY;
>>> +               goto out;
>>> +       }
>>> +
>>> +       len = strcspn(buf, "\n");
>>> +
>>> +       p = kstrndup(buf, len, GFP_KERNEL);
>>> +       if (!p) {
>>> +               err = -ENOMEM;
>>> +               goto out;
>>> +       }
>>> +
>>> +       kfree(rproc->firmware);
>>
>> it gives me kernel panic if the initial firmware name is passed from
>> my remoteproc driver to rproc_alloc()
>> and it is a const string.
>> It is better to have another modification to the remoteproc_core.c as
>> follows in the rproc_alloc().
>>
>> -       if (!firmware)
>> +       if (!firmware) {
>>                  /*
>>                   * Make room for default firmware name (minus %s plus
>> '\0').
>>                   * If the caller didn't pass in a firmware name then
>> @@ -1332,17 +1346,29 @@ struct rproc *rproc_alloc(struct device *dev,
>> const char *name,
>>                   * the caller doesn't pass one).
>>                   */
>>                  name_len = strlen(name) + strlen(template) - 2 + 1;
>> +               p = kmalloc_track_caller(name_len, GFP_KERNEL);
>> +               if (!p)
>> +                       return NULL;
>> +               snprintf(p, name_len, template, name);
>> +       } else {
>> +               p = kstrndup(firmware, strlen(firmware), GFP_KERNEL);
>> +               if (!p) {
>> +                       return NULL;
>> +               }
>> +       }
>>
>> -       rproc = kzalloc(sizeof(*rproc) + len + name_len, GFP_KERNEL);
>> +       rproc = kzalloc(sizeof(*rproc) + len, GFP_KERNEL);
>
>
> Yes - to address this a very similar change was already introduced into
> Bjorn's tree in
> https://github.com/andersson/remoteproc/commit/0f57dc6ae1ff0c702450083176b657ba37c07363
Great. I didn't know that.

>
>
>
>>
>>> +       rproc->firmware = p;
>>> +out:
>>> +       mutex_unlock(&rproc->lock);
>>> +
>>> +       return err ? err : count;
>>> +}
>>> +static DEVICE_ATTR_RW(firmware);
>>> +
>>> +/*
>>> + * A state-to-string lookup table, for exposing a human readable state
>>> + * via sysfs. Always keep in sync with enum rproc_state
>>> + */
>>> +static const char * const rproc_state_string[] = {
>>> +       [RPROC_OFFLINE]         = "offline",
>>> +       [RPROC_SUSPENDED]       = "suspended",
>>> +       [RPROC_RUNNING]         = "running",
>>> +       [RPROC_CRASHED]         = "crashed",
>>> +       [RPROC_LAST]            = "invalid",
>>> +};
>>> +
>>> +/* Expose the state of the remote processor via sysfs */
>>> +static ssize_t state_show(struct device *dev, struct device_attribute
>>> *attr,
>>> +                         char *buf)
>>> +{
>>> +       struct rproc *rproc = to_rproc(dev);
>>> +       unsigned int state;
>>> +
>>> +       state = rproc->state > RPROC_LAST ? RPROC_LAST : rproc->state;
>>> +       return sprintf(buf, "%s\n", rproc_state_string[state]);
>>> +}
>>> +
>>> +/* Change remote processor state via sysfs */
>>> +static ssize_t state_store(struct device *dev,
>>> +                             struct device_attribute *attr,
>>> +                             const char *buf, size_t count)
>>> +{
>>> +       struct rproc *rproc = to_rproc(dev);
>>> +       int ret = 0;
>>> +
>>> +       if (sysfs_streq(buf, "start")) {
>>> +               if (rproc->state == RPROC_RUNNING)
>>> +                       return -EBUSY;
>>> +
>>> +               ret = rproc_boot(rproc);
>>> +               if (ret)
>>> +                       dev_err(&rproc->dev, "Boot failed: %d\n", ret);
>>> +       } else if (sysfs_streq(buf, "stop")) {
>>> +               if (rproc->state != RPROC_RUNNING)
>>> +                       return -EINVAL;
>>> +
>>> +               rproc_shutdown(rproc);
>>
>> The kernel hanged when it was trying to unregister the virtio device
>> after I tried"stop".
>> It doesn't look like related to this sysfs API. But just wonder have you
>> seen
>> similar issue?
>
>
> I have not seen that in my testing - but I did run into things such as
> virtio_console giving warnings when the device was removed from a remoteproc
> device (which I submitted a fix for). I guess that the removal of remoteproc
> devices at runtime has previously not been as easy and therefore not as well
> tested so there may well be a few issues lurking as new code paths are
> tested, depending on which virtio devices your firmware implements.
It is just a vring deivce, I am still checking why it hanged at
device_unregister() in the unregister_virtio_device().

>
> Thanks,
> Matt
>
>
>>
>>> +       } else {
>>> +               dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>>> +               ret = -EINVAL;
>>> +       }
>>> +       return ret ? ret : count;
>>> +}
>>> +static DEVICE_ATTR_RW(state);
>>> +
>>> +static struct attribute *rproc_attrs[] = {
>>> +       &dev_attr_firmware.attr,
>>> +       &dev_attr_state.attr,
>>> +       NULL
>>> +};
>>> +
>>> +static const struct attribute_group rproc_devgroup = {
>>> +       .attrs = rproc_attrs
>>> +};
>>> +
>>> +static const struct attribute_group *rproc_devgroups[] = {
>>> +       &rproc_devgroup,
>>> +       NULL
>>> +};
>>> +
>>> +struct class rproc_class = {
>>> +       .name           = "remoteproc",
>>> +       .dev_groups     = rproc_devgroups,
>>> +};
>>> +
>>> +int __init rproc_init_sysfs(void)
>>> +{
>>> +       /* create remoteproc device class for sysfs */
>>> +       int err = class_register(&rproc_class);
>>> +
>>> +       if (err)
>>> +               pr_err("remoteproc: unable to register class\n");
>>> +       return err;
>>> +}
>>> +
>>> +void __exit rproc_exit_sysfs(void)
>>> +{
>>> +       class_unregister(&rproc_class);
>>> +}
>>> --
>>> 2.7.4
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-remoteproc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
