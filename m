Return-Path: <cleger@kalray.eu>
Date: Mon, 6 Apr 2020 14:06:01 +0200 (CEST)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalrayinc.com>
Message-ID: <634144036.14036712.1586174761552.JavaMail.zimbra@kalray.eu>
In-Reply-To: <730c75c9-15e2-19c5-d97a-190bf1e6ffaa@st.com>
References: <1585699438-14394-1-git-send-email-rishabhb@codeaurora.org> <5b1c8287-0077-87e7-9364-b1f5a104c9e3@st.com> <6261646b2e0c4d9c8a30900b2f475890@codeaurora.org> <730c75c9-15e2-19c5-d97a-190bf1e6ffaa@st.com>
Subject: Re: [PATCH v2 1/2] remoteproc: Add character device interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-remoteproc <linux-remoteproc@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, psodagud <psodagud@codeaurora.org>, tsoni <tsoni@codeaurora.org>, sidgup <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnaud,

----- On 6 Apr, 2020, at 11:01, Arnaud Pouliquen arnaud.pouliquen@st.com wr=
ote:

> On 4/3/20 9:13 PM, rishabhb@codeaurora.org wrote:
>> On 2020-04-02 10:28, Arnaud POULIQUEN wrote:
>>> Hi
>>>
>>> On 4/1/20 2:03 AM, Rishabh Bhatnagar wrote:
>>>> Add the character device interface for userspace applications.
>>>> This interface can be used in order to boot up and shutdown
>>>> remote subsystems. Currently there is only a sysfs interface
>>>> which the userspace clients can use. If a usersapce application
>>>> crashes after booting the remote processor does not get any
>>>> indication about the crash. It might still assume that the
>>>> application is running. For example modem uses remotefs service
>>>> to fetch data from disk/flash memory. If the remotefs service
>>>> crashes, modem keeps on requesting data which might lead to a
>>>> crash. Adding a character device interface makes the remote
>>>> processor tightly coupled with the user space application.
>>>> A crash of the application leads to a close on the file descriptors
>>>> therefore shutting down the remoteproc.
>>>
>>> Sorry I'm late in the discussion, I hope I've gone through the whole
>>> discussion so I don't reopen a closed point...
>>>
>>> Something here is not crystal clear to me so I'd rather share it...
>>>
>>> I suppose that you the automatic restart of the application is not poss=
ible to
>>> stop and restart the remote processor...
>> Yes correct, while we wait for the application to restart we might obser=
ve a
>> fatal crash.
>>>
>>> Why this use case can not be solved by a process monitor or a service
>>> in userland that detects the application crash and stop the remote
>>> firmware using
>>> the sysfs interface?
>>>
>> What happens in the case where the process monitor itself crashes? This =
is
>> actually the approach we follow in our downstream code. We have a centra=
l entity
>> in userspace that controls bootup/shutdown of some remote processors bas=
ed on
>> the
>> votes from userspace clients. We have observed cases where this entity
>> itself crashes and remote processors are left hanging.
>=20
> Your description makes me feel like this patch is only a workaround of so=
mething
> that
> should be fixed in the userland, even if i understand that hanging is one=
 of the
> most
> critical problem and have to be fixed.
> For instance, how to handle several applications that interact with the r=
emote
> processor
> ( e.g. rpmsg service applications) how to stop and restart everything. Us=
ing the
> char
> device would probaly resolve only a part of the issue...
>=20
> I'm not aware about your environment and i'm not a userland expert. But w=
hat i
> still not
> understand why a parent process can not do the job...
> I just test a simple script on my side that treat the kill -9 of an appli=
cation
> ("cat" in my case).

This is not entirely true, if the parent process is killed with a SIGKILL, =
then
the process will not be able to handle anything and the remoteproc will sti=
ll
be running.

What I understood from Rishabh patch is a way to allow a single process han=
dling
the rproc state. We have the same kind of need and currently, if the
user application crashes, then the rproc is still running (which happens).

>=20
> #start the remote firmware
> cp  $1 /lib/firmware/
> echo $1> /sys/class/remoteproc/remoteproc0/firmware
> echo start >/sys/class/remoteproc/remoteproc0/state
> #your binary
> cat /dev/kmsg
> # stop the remote firmware in case of crash (and potentially some other a=
pps)
> echo stop >/sys/class/remoteproc/remoteproc0/state
>=20

This is not really "production proof" and what happens if the application i=
s
responsible of setting the firmware which might be jitted ?=20
And if the script receives the SIGKILL, then we are back to the same proble=
m.

I really think, this is a step forward an easier and reliable use of the re=
moteproc
on userland to guarantee a coherent rproc state even if host application
crashes.

Regards,

Cl=C3=A9ment

> Anyway, it's just my feeling, let other people give their feedback.
>=20
>>> I just want to be sure that there is no alternative to this, because
>>> having two ways
>>> for application to shutdown the firmware seems to me confusing...
>> Does making this interface optional/configurable helps?
>>>
>>> What about the opposite service, mean inform the application that the r=
emote
>>> processor is crashed?
>>> Do you identify such need? or the "auto" crash recovery is sufficient?
>> Auto recovery works perfectly for us. Although there is a mechanism in
>> place using QMI(Qualcomm MSM interface) that can notify clients about re=
mote
>> processor crash.
>=20
> Thanks for the information.
>=20
> Regards
> Arnaud
>=20
>>>
>>> Thanks,
>>> Arnaud
>>>>
>>>> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
>>>> ---
>>>> =C2=A0drivers/remoteproc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +++
>>>> =C2=A0drivers/remoteproc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>> =C2=A0drivers/remoteproc/remoteproc_cdev.c=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
00 +++++++++++++++++++++++++++++++
>>>> =C2=A0drivers/remoteproc/remoteproc_internal.h |=C2=A0 22 +++++++
>>>> =C2=A0include/linux/remoteproc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
>>>> =C2=A05 files changed, 134 insertions(+)
>>>> =C2=A0create mode 100644 drivers/remoteproc/remoteproc_cdev.c
>>>>
>>>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>>> index de3862c..6374b79 100644
>>>> --- a/drivers/remoteproc/Kconfig
>>>> +++ b/drivers/remoteproc/Kconfig
>>>> @@ -14,6 +14,15 @@ config REMOTEPROC
>>>>
>>>> =C2=A0if REMOTEPROC
>>>>
>>>> +config REMOTEPROC_CDEV
>>>> +=C2=A0=C2=A0=C2=A0 bool "Remoteproc character device interface"
>>>> +=C2=A0=C2=A0=C2=A0 help
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Say y here to have a character device =
interface for Remoteproc
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 framework. Userspace can boot/shutdown=
 remote processors through
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this interface.
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 It's safe to say N if you don't want t=
o use this interface.
>>>> +
>>>> =C2=A0config IMX_REMOTEPROC
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 tristate "IMX6/7 remoteproc support"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 depends on ARCH_MXC
>>>> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>>> index e30a1b1..b7d4f77 100644
>>>> --- a/drivers/remoteproc/Makefile
>>>> +++ b/drivers/remoteproc/Makefile
>>>> @@ -9,6 +9,7 @@ remoteproc-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D remoteproc_debugfs.o
>>>> =C2=A0remoteproc-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D remoteproc_sysfs.o
>>>> =C2=A0remoteproc-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D remoteproc_virtio.o
>>>> =C2=A0remoteproc-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D remoteproc_elf_loader.o
>>>> +obj-$(CONFIG_REMOTEPROC_CDEV)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D remoteproc_cdev.o
>>>> =C2=A0obj-$(CONFIG_IMX_REMOTEPROC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +=3D imx_rproc.o
>>>> =C2=A0obj-$(CONFIG_MTK_SCP)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +=3D mtk_scp.o mtk_scp_ipi.o
>>>> =C2=A0obj-$(CONFIG_OMAP_REMOTEPROC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +=3D omap_remoteproc.o
>>>> diff --git a/drivers/remoteproc/remoteproc_cdev.c
>>>> b/drivers/remoteproc/remoteproc_cdev.c
>>>> new file mode 100644
>>>> index 0000000..8182bd1
>>>> --- /dev/null
>>>> +++ b/drivers/remoteproc/remoteproc_cdev.c
>>>> @@ -0,0 +1,100 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Character device interface driver for Remoteproc framework.
>>>> + *
>>>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/cdev.h>
>>>> +#include <linux/fs.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <linux/remoteproc.h>
>>>> +
>>>> +#include "remoteproc_internal.h"
>>>> +
>>>> +#define NUM_RPROC_DEVICES=C2=A0=C2=A0=C2=A0 64
>>>> +static dev_t rproc_cdev;
>>>> +static DEFINE_IDA(cdev_minor_ida);
>>>> +
>>>> +static int rproc_cdev_open(struct inode *inode, struct file *file)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct rproc *rproc;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 rproc =3D container_of(inode->i_cdev, struct rproc=
, char_dev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!rproc)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (rproc->state =3D=3D RPROC_RUNNING)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBUSY;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return rproc_boot(rproc);
>>>> +}
>>>> +
>>>> +static int rproc_cdev_release(struct inode *inode, struct file *file)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 struct rproc *rproc;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 rproc =3D container_of(inode->i_cdev, struct rproc=
, char_dev);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!rproc || rproc->state !=3D RPROC_RUNNING)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 rproc_shutdown(rproc);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +
>>>> +static const struct file_operations rproc_fops =3D {
>>>> +=C2=A0=C2=A0=C2=A0 .open =3D rproc_cdev_open,
>>>> +=C2=A0=C2=A0=C2=A0 .release =3D rproc_cdev_release,
>>>> +};
>>>> +
>>>> +int rproc_char_device_add(struct rproc *rproc)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 int ret, minor;
>>>> +=C2=A0=C2=A0=C2=A0 dev_t cdevt;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 minor =3D ida_simple_get(&cdev_minor_ida, 0, NUM_R=
PROC_DEVICES,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
>>>> +=C2=A0=C2=A0=C2=A0 if (minor < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&rproc->dev, "%s: =
No more minor numbers left! rc:%d\n",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __=
func__, minor);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 cdev_init(&rproc->char_dev, &rproc_fops);
>>>> +=C2=A0=C2=A0=C2=A0 rproc->char_dev.owner =3D THIS_MODULE;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 cdevt =3D MKDEV(MAJOR(rproc_cdev), minor);
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D cdev_add(&rproc->char_dev, cdevt, 1);
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ida_simple_remove(&cdev_mi=
nor_ida, minor);
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 rproc->dev.devt =3D cdevt;
>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>> +}
>>>> +
>>>> +void rproc_char_device_remove(struct rproc *rproc)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 __unregister_chrdev(MAJOR(rproc->dev.devt), MINOR(=
rproc->dev.devt), 1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "rproc");
>>>> +=C2=A0=C2=A0=C2=A0 ida_simple_remove(&cdev_minor_ida, MINOR(rproc->de=
v.devt));
>>>> +}
>>>> +
>>>> +void __init rproc_init_cdev(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 ret =3D alloc_chrdev_region(&rproc_cdev, 0, NUM_RP=
ROC_DEVICES, "rproc");
>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Failed to alloc rp=
roc_cdev region, err %d\n", ret);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>> +}
>>>> +
>>>> +void __exit rproc_exit_cdev(void)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 __unregister_chrdev(MAJOR(rproc_cdev), 0, NUM_RPRO=
C_DEVICES, "rproc");
>>>> +}
>>>> diff --git a/drivers/remoteproc/remoteproc_internal.h
>>>> b/drivers/remoteproc/remoteproc_internal.h
>>>> index 493ef92..28d61a1 100644
>>>> --- a/drivers/remoteproc/remoteproc_internal.h
>>>> +++ b/drivers/remoteproc/remoteproc_internal.h
>>>> @@ -47,6 +47,27 @@ struct dentry *rproc_create_trace_file(const char *=
name,
>>>> struct rproc *rproc,
>>>> =C2=A0int rproc_init_sysfs(void);
>>>> =C2=A0void rproc_exit_sysfs(void);
>>>>
>>>> +#ifdef CONFIG_REMOTEPROC_CDEV
>>>> +void rproc_init_cdev(void);
>>>> +void rproc_exit_cdev(void);
>>>> +int rproc_char_device_add(struct rproc *rproc);
>>>> +void rproc_char_device_remove(struct rproc *rproc);
>>>> +#else
>>>> +static inline void rproc_init_cdev(void)
>>>> +{
>>>> +}
>>>> +static inline void rproc_exit_cdev(void)
>>>> +{
>>>> +}
>>>> +static inline int rproc_char_device_add(struct rproc *rproc)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>> +}
>>>> +static inline void=C2=A0 rproc_char_device_remove(struct rproc *rproc=
)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>> =C2=A0void rproc_free_vring(struct rproc_vring *rvring);
>>>> =C2=A0int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
>>>>
>>>> @@ -63,6 +84,7 @@ struct resource_table *rproc_elf_find_loaded_rsc_tab=
le(struct
>>>> rproc *rproc,
>>>> =C2=A0struct rproc_mem_entry *
>>>> =C2=A0rproc_find_carveout_by_name(struct rproc *rproc, const char *nam=
e, ...);
>>>>
>>>> +
>>>> =C2=A0static inline
>>>> =C2=A0int rproc_fw_sanity_check(struct rproc *rproc, const struct firm=
ware *fw)
>>>> =C2=A0{
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index 16ad666..c4ca796 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -37,6 +37,7 @@
>>>>
>>>> =C2=A0#include <linux/types.h>
>>>> =C2=A0#include <linux/mutex.h>
>>>> +#include <linux/cdev.h>
>>>> =C2=A0#include <linux/virtio.h>
>>>> =C2=A0#include <linux/completion.h>
>>>> =C2=A0#include <linux/idr.h>
>>>> @@ -514,6 +515,7 @@ struct rproc {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 bool auto_boot;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 struct list_head dump_segments;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 int nb_vdev;
>>>> +=C2=A0=C2=A0=C2=A0 struct cdev char_dev;
>>>> =C2=A0};
>>>>
>>>> =C2=A0/**
