Return-Path: <anup@brainfault.org>
MIME-Version: 1.0
In-Reply-To: <20180318224744.GL5626@tuxbook-pro>
References: <1515590217-24256-1-git-send-email-anup@brainfault.org> <20180318224744.GL5626@tuxbook-pro>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Mar 2018 13:34:18 +0530
Message-ID: <CAAhSdy2JcXTkbtO95yjp4eYQ7cTwS62hh_U1qk3k7taN2ySWgw@mail.gmail.com>
Subject: Re: [PATCH RESEND] rpmsg: virtio_rpmsg_bus: fix rpmsg_probe() for
 virtio-mmio transport
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 19, 2018 at 4:17 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Wed 10 Jan 05:16 PST 2018, Anup Patel wrote:
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> [..]
>> @@ -924,9 +925,16 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>                                    total_buf_space, &vrp->bufs_dma,
>>                                    GFP_KERNEL);
>>       if (!bufs_va) {
>> -             err = -ENOMEM;
>> -             goto vqs_del;
>> -     }
>> +             bufs_va = dma_alloc_coherent(vdev->dev.parent,
>> +                                          total_buf_space, &vrp->bufs_dma,
>> +                                          GFP_KERNEL);
>> +             if (!bufs_va) {
>> +                     err = -ENOMEM;
>> +                     goto vqs_del;
>> +             } else
>> +                     vrp->bufs_dev = vdev->dev.parent;
>> +     } else
>> +             vrp->bufs_dev = vdev->dev.parent->parent;
>
> I really don't fancy the idea of us allocating on behalf of our
> grandparent here, as you show it's not certain that our grandparent is
> what someone originally expected it to be.
>
> With the purpose of being able to control these allocations there is an
> ongoing discussion related to this, which I believe will result in this
> being changed to at least vdev->dev.parent..
>
>
> I do expect that this discussion will be brought up during Linaro
> Connect the coming week.
>

Currently, rpmsg_probe() is broken for virtio-mmio transport
hence I send this patch as a stable fix.

In general, I am fine if we are eventually going towards
vdev->dev.parent usage.

Regards,
Anup
