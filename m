Return-Path: <loic.pallardy@st.com>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
 <20161202231944.GF9322@tuxbot> <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
 <20161206174025.GE30492@tuxbot>
From: loic pallardy <loic.pallardy@st.com>
Message-ID: <ae3b7df2-6fd0-1d48-0e37-bf56af7e637e@st.com>
Date: Wed, 7 Dec 2016 09:42:04 +0100
MIME-Version: 1.0
In-Reply-To: <20161206174025.GE30492@tuxbot>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>



On 12/06/2016 06:40 PM, Bjorn Andersson wrote:
> On Mon 05 Dec 00:32 PST 2016, loic pallardy wrote:
>
>>
>>
>> On 12/03/2016 12:19 AM, Bjorn Andersson wrote:
>>> On Fri 25 Nov 09:54 PST 2016, Loic Pallardy wrote:
>>>
>>>> Since virtio backend creation, it is no more possible for a firmware to
>>>> register twice a service (on different endpoints). rpmsg_register_device
>>>> function is failing when calling device_add for the second time as second
>>>> device has the same name as first one already register.
>>>> It is because name is based only on service name.
>>>>
>>>
>>> Afaict rpmsg_create_channel() first looks for any existing devices with
>>> the same src, dst and name and if such device is found we fail early and
>>> this logic is found before all those changes as well.
>>>
>>>> This patch adds destination endpoint to service name to create an
>>>> unique device name.
>>>
>>> As the code didn't look to support multiple services with the same name
>>> I have not considered this scenario. Can you describe your use case for
>>> this?
>>>
>> Services are generic and could be instancied several times.
>> For exemple we have some communication coprocessor (modem like) for which we
>> are using 2 socket channels between coprocessor and user space stack.
>> Today each rpmsg client driver is identified by a unique service name.
>> "rpmsg-proto" for socket channel for example.
>> User space application can open a specified socket providing endpoint number
>> or request for a socket creation thanks to bind.
>>
>
> Why do you have two rpmsg-proto instances?
Because it is a request from user space modem application which control 
modem with sockets (over ethernet or any other link like Rpmsg)
>
>> Ditto with tty, with one tty for command and one tty for debug (reuse of
>> external coprocessor SW)
>>
>
> I don't think I've seen this driver yet, will do some searching.
> May I ask why you're not using the virtio serial stuff directly?
Maybe discussed but not shared on ML.
A public version is available here:
http://git.toradex.com/cgit/linux-toradex.git/tree/drivers/rpmsg/imx_rpmsg_tty.c?h=toradex_imx_3.14.52_1.1.0_ga-next


We are not using virtio serial to simplify the number of IPC. Moreover 
we are using rpmsg annoucement capability to tune to detect available 
services. Debug link is there only if coprocessor supports it.
>
>> Also I have similar issue with some I2C or SPI over rpmsg driver which allow
>> host to access coprocessor peripherals (mostly in development or debug
>> mode).
>>
>
> So you have a i2c/spi bridge in the firmware and custom i2c/spi adapter
> drivers sitting ontop of rpmsg? That does sound useful for debugging
> purposes.
It is exactly done for that. I will put it in my upstream todo list.
>
> But I do wonder if such a mechanism should be on virtio level rather
> than wrapped in rpmsg - as it's a analog to the other cases of hardware
> access provided there.
>
We select Rpmsg for annoucement mechanism and to have a unique IPC link.

>> I think use cases are multiple and rpmsg should not limit the number of
>> identical services.
>>
>
> I can see the benefit of having multiple instances of rpmsg devices tied
> to individual endpoints, I do that in the Qualcomm platform, based on DT
> matching (channel names are unique there though). So I'm definitely not
> against this.
>
> I can however not see how this have ever worked, as the code since being
> introduced in mainline has failed before reaching your change upon
> duplicates. So I'm still puzzled to where the regression is.
Regression is on sysfs creation.
I have the following crash on second rpmsg-proto creation:

[   52.687795] remoteproc remoteproc0: remote processor st231-gp0 is now up
[   52.694894] virtio_rpmsg_bus virtio0: creating channel 
rpmsg-client-sample addr 0x0
[   52.702912] virtio_rpmsg_bus virtio0: creating channel rpmsg-proto 
addr 0x1
[   52.710203] virtio_rpmsg_bus virtio0: creating channel rpmsg-proto 
addr 0x2
[   52.717346] ------------[ cut here ]------------
[   52.721991] WARNING: CPU: 1 PID: 85 at fs/sysfs/dir.c:31 
sysfs_warn_dup+0x64/0x74
[   52.729563] sysfs: cannot create duplicate filename 
'/devices/platform/soc/soc:st231-gp0@4000'
[   52.743046] Modules linked in:[   52.745942]  cfg80211 
snd_soc_hdmi_codec snd_soc_core snd_pcc
[   52.769014] CPU: 1 PID: 85 Comm: irq/249-a9 Tainted: G        W 
4.9.0-rc1-15161-gf5d6118
[   52.778025] Hardware name: STi SoC with Flattened Device Tree
[   52.783802] [<c0310394>] (unwind_backtrace) from [<c030b9b4>] 
(show_stack+0x10/0x14)
[   52.791550] [<c030b9b4>] (show_stack) from [<c05970b8>] 
(dump_stack+0x94/0xa8)
[   52.798815] [<c05970b8>] (dump_stack) from [<c0342dfc>] 
(__warn+0xe8/0x100)
[   52.805783] [<c0342dfc>] (__warn) from [<c0342e4c>] 
(warn_slowpath_fmt+0x38/0x48)
[   52.813266] [<c0342e4c>] (warn_slowpath_fmt) from [<c047ba84>] 
(sysfs_warn_dup+0x64/0x74)
[   52.821442] [<c047ba84>] (sysfs_warn_dup) from [<c047bb68>] 
(sysfs_create_dir_ns+0x8c/0x94)
[   52.829837] [<c047bb68>] (sysfs_create_dir_ns) from [<c0599874>] 
(kobject_add_internal+0xac/0)
[   52.838873] [<c0599874>] (kobject_add_internal) from [<c0599c8c>] 
(kobject_add+0x48/0x94)
root@sti:~# [   52.838895] [<c0599c8c>] (kobject_add) from [<c07d2ad0>] 
(device_add+0xe8/0x564)
[   52.838913] [<c07d2ad0>] (device_add) from [<c0a86134>] 
(rpmsg_register_device+0x48/0x74)
[   52.838922] [<c0a86134>] (rpmsg_register_device) from [<c0a86b08>] 
(rpmsg_ns_cb+0x11c/0x1d0)
[   52.838928] [<c0a86b08>] (rpmsg_ns_cb) from [<c0a87794>] 
(rpmsg_recv_done+0x118/0x30c)
[   52.838946] [<c0a87794>] (rpmsg_recv_done) from [<c06d78f8>] 
(vring_interrupt+0x38/0x50)
[   52.838966] [<c06d78f8>] (vring_interrupt) from [<c0a81908>] 
(sti_mbox_thread_handler+0x2c/0x)
[   52.838982] [<c0a81908>] (sti_mbox_thread_handler) from [<c0389980>] 
(irq_thread_fn+0x1c/0x34)
[   52.838989] [<c0389980>] (irq_thread_fn) from [<c0389c98>] 
(irq_thread+0x144/0x1f0)
[   52.838995] [<c0389c98>] (irq_thread) from [<c035e1b8>] 
(kthread+0xe0/0xf8)
[   52.839011] [<c035e1b8>] (kthread) from [<c0307bb8>] 
(ret_from_fork+0x14/0x3c)
[   52.839119] ---[ end trace 348233ab00816e4c ]---
[   52.839126] ------------[ cut here ]------------
[   52.839141] WARNING: CPU: 1 PID: 85 at lib/kobject.c:240 
kobject_add_internal+0x28c/0x304
[   52.839146] kobject_add_internal failed for virtio0:rpmsg-proto with 
-EEXIST, don't try to re.
[   52.839172] Modules linked in: cfg80211 snd_soc_hdmi_codec 
snd_soc_core snd_pcm_dmaengine sndc
[   52.839178] CPU: 1 PID: 85 Comm: irq/249-a9 Tainted: G        W 
4.9.0-rc1-15161-gf5d6118
[   52.839180] Hardware name: STi SoC with Flattened Device Tree
[   52.839200] [<c0310394>] (unwind_backtrace) from [<c030b9b4>] 
(show_stack+0x10/0x14)
[   52.839210] [<c030b9b4>] (show_stack) from [<c05970b8>] 
(dump_stack+0x94/0xa8)
[   52.839225] [<c05970b8>] (dump_stack) from [<c0342dfc>] 
(__warn+0xe8/0x100)
[   52.839232] [<c0342dfc>] (__warn) from [<c0342e4c>] 
(warn_slowpath_fmt+0x38/0x48)
[   52.839240] [<c0342e4c>] (warn_slowpath_fmt) from [<c0599a54>] 
(kobject_add_internal+0x28c/0x)
[   52.839247] [<c0599a54>] (kobject_add_internal) from [<c0599c8c>] 
(kobject_add+0x48/0x94)
[   52.839260] [<c0599c8c>] (kobject_add) from [<c07d2ad0>] 
(device_add+0xe8/0x564)
[   52.839268] [<c07d2ad0>] (device_add) from [<c0a86134>] 
(rpmsg_register_device+0x48/0x74)
[   52.839275] [<c0a86134>] (rpmsg_register_device) from [<c0a86b08>] 
(rpmsg_ns_cb+0x11c/0x1d0)
[   52.839280] [<c0a86b08>] (rpmsg_ns_cb) from [<c0a87794>] 
(rpmsg_recv_done+0x118/0x30c)
[   52.839293] [<c0a87794>] (rpmsg_recv_done) from [<c06d78f8>] 
(vring_interrupt+0x38/0x50)
[   52.839309] [<c06d78f8>] (vring_interrupt) from [<c0a81908>] 
(sti_mbox_thread_handler+0x2c/0x)
[   52.839323] [<c0a81908>] (sti_mbox_thread_handler) from [<c0389980>] 
(irq_thread_fn+0x1c/0x34)
[   52.839329] [<c0389980>] (irq_thread_fn) from [<c0389c98>] 
(irq_thread+0x144/0x1f0)
[   52.839335] [<c0389c98>] (irq_thread) from [<c035e1b8>] 
(kthread+0xe0/0xf8)
[   52.839349] [<c035e1b8>] (kthread) from [<c0307bb8>] 
(ret_from_fork+0x14/0x3c)
[   52.839352] ---[ end trace 348233ab00816e4d ]---
[   52.839362] rpmsg virtio0:rpmsg-proto: device_register failed: -17
[   52.839370] virtio_rpmsg_bus virtio0: rpmsg_create_channel failed
[   52.839388] virtio_rpmsg_bus virtio0: creating channel rpmsg-resmgr 
addr 0x3


>
> And as I said, we use the "id" when creating the device to match with
> drivers, so I don't see how probing would work with it introduced.
>
Change has been introduce here:
4dffed5b3ac796bcaf040ca1f64e650f9263363e rpmsg: Name rpmsg devices based 
on channel id

-	dev_set_name(&rpdev->dev, "rpmsg%d", rpmsg_dev_index++);
+	dev_set_name(&rpdev->dev, "%s:%s",
+		     dev_name(dev->parent), rpdev->id.name);

Before name was not explicit but unique.
Now name is clear but not unique. If 2 identical services are announced 
on the same rpmsg link, second will failed.
Instance number is needed to make it unique.

Regards,
Loic

> Regards,
> Bjorn
>
