Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34918 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbfBIEGd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Feb 2019 23:06:33 -0500
Received: by mail-ed1-f67.google.com with SMTP id b17so4504782eds.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Feb 2019 20:06:32 -0800 (PST)
MIME-Version: 1.0
References: <CAB7rCTjfQoFOQkStQFP96+44jjZJSaWxQRk8JuktVGDE19Q7MQ@mail.gmail.com>
 <CAAPnCLxo5+Fr3txN0Vjp0OkrxB-YrX0drPgyGbH92r8ttHvsxQ@mail.gmail.com> <CAB7rCThrnzHSCRZ-d+qLd507d5wZVby40u1k8ViK7cS=z5OyRA@mail.gmail.com>
In-Reply-To: <CAB7rCThrnzHSCRZ-d+qLd507d5wZVby40u1k8ViK7cS=z5OyRA@mail.gmail.com>
From: Mike <puffy.taco@gmail.com>
Date: Fri, 8 Feb 2019 22:06:18 -0600
Message-ID: <CAB7rCTg=hWXPbgoPreD58F3azEP=swotKsQRdLnoYAs8dkR+HQ@mail.gmail.com>
Subject: Re: Rpmsg Char Driver
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
To: Denis R <dry.embdev@gmail.com>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Feb 7, 2019 at 1:37 PM Mike <puffy.taco@gmail.com> wrote:
>
> Hey Denis,
>
> On Wed, Feb 6, 2019 at 10:12 PM Denis R <dry.embdev@gmail.com> wrote:
> >
> > Hello Mike,
> >
> > On Thu, Feb 7, 2019 at 9:45 AM Mike <puffy.taco@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > First, I think this is the right place for questions relating to
> > > rpmsg, but please redirect me if I'm wrong.
> > >
> > > I'm looking to get access to send messages from userspace to the rpmsg
> > > bus, but am not sure the best way.  The base of my work is a 4.9
> > > series kernel for NXP's i.MX7D,
> >
> > Have you seen the imx_rpmsg_tty driver as part of NXP's 4.9 kernel?
> > This is the driver which will create the A7-M4  channel to the other
> > side,
> > and the ttyRPMSG device, with one default endpoint.
> >
>
> Yes, I've been using that driver to facilitate porting RPMsg-Lite to
> the RTOS I'm using on the M4.
>
> > > but I've been comparing it to mainline
> > > to see if there's anything I could utilize.  In particular, I was
> > > looking at the config option RPMSG_CHAR which states:
> > >
> > > "Say Y here to export rpmsg endpoints as device files, usually found
> > > in /dev. They make it possible for user-space programs to send and
> > > receive rpmsg packets."
> > >
> > > I compiled a kernel with that option but I don't see any device files
> > > in /dev.  Looking through the code, it seems like only the qcom_smd
> > > driver actually uses this driver, so I assume the Kconfig help text is
> > > somewhat misleading?
> > >
> > > Is there a general purpose way to open a channel from userspace?  Or
> > > am I best off using the name service from the remote processor to
> > > announce all the channels I want and write a generic driver that
> > > creates a char device to expose an interface to each?
> >
> > I too would be interested to know how far ahead is the mainstream on
> > that. It would be great if there is a new or updated driver which
> > creates ttyrpmsg devices dynamically
> > for the new endpoints that application may create.
> >
> > I was going to expand the imx_rpmsg_tty to do this just for ones I
> > need, but of course would rather use an already working driver for
> > this of exists.
> >
>
> I'm in the same place.  The downside to me of the tty driver was that
> everything became a stream of bytes, when ultimately everything I was
> sending was more message based.  Worked just fine to get everything
> tested, but if I can move more decision making to userspace, that
> suits me.  I did cherry-pick a few commits as the char driver didn't
> compile as it was based on the source provided by NXP.  Seems like the
> right driver to use as I previously looked at what seemed like the
> same prior art, but I just can't figure out if it should start working
> without drastic changes to one of the drivers.
>

Examined it a bit more and figured out what the qcom_smd driver was
doing, so I ported that to the virtio_rpmsg_bus.  Code below, my
apologies for gmail mangling the tabs into spaces.  Intent isn't to
submit it as a patch against current mainline as I'm not building from
there, but I can if it helps people look it over.  I also had to
modify the rpmsg_char driver because the destination channel wasn't
being utilized.  It seems that all endpoints in that driver are using
the rpmsg_device from the ctrl device, so the proper destination is
never carried through.  One option is as below, the other would be to
alloc an rpmsg_device for each endpoint.  Again, this was based on a
4.9 kernel from NXP, but I cherry-picked all the meaningful patches
from drivers/rpmsg/* to bring it close enough to mainline.  The virtio
rpmsg bus doesn't export an rpmsg_name attribute, but modifying the
associated udev rules to account for that gets a useful device name to
userspace and I can create endpoints and transfer data.  Does this
seem like the right direction for the virtio bus?  I saw one commit
that was pushing towards a driver_override in sysfs to make use of
rpmsg_char, but my assumption was that you would need to first have
the remote announce an endpoint before you could assign the char
driver, where this approach instantiates it from the start.


diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 0b5d0d342ab0..fa06ea9207c2 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -244,9 +244,9 @@ static ssize_t rpmsg_eptdev_write(struct file
*filp, const char __user *buf,
     }

     if (filp->f_flags & O_NONBLOCK)
-        ret = rpmsg_trysend(eptdev->ept, kbuf, len);
+        ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
     else
-        ret = rpmsg_send(eptdev->ept, kbuf, len);
+        ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);

 unlock_eptdev:
     mutex_unlock(&eptdev->ept_lock);
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index b7fa5676893b..612120447771 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -880,6 +880,22 @@ static int rpmsg_ns_cb(struct rpmsg_device
*rpdev, void *data, int len,
     return 0;
 }

+static int rpmsg_create_chrdev(struct virtproc_info *vrp)
+{
+    struct virtio_rpmsg_channel *vch;
+
+    vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+    if (!vch)
+        return -ENOMEM;
+
+    vch->vrp = vrp;
+    vch->rpdev.ops = &virtio_rpmsg_ops;
+    vch->rpdev.dev.parent = &vrp->vdev->dev;
+    vch->rpdev.dev.release = virtio_rpmsg_release_device;
+
+    return rpmsg_chrdev_register_device(&vch->rpdev);
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
     vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -990,6 +1006,10 @@ static int rpmsg_probe(struct virtio_device *vdev)
     if (notify)
         virtqueue_notify(vrp->rvq);

+    err = rpmsg_create_chrdev(vrp);
+    if (err)
+        dev_err(&vdev->dev, "failed to register chrdev for virtio\n");
+
     dev_info(&vdev->dev, "rpmsg host is online\n");

     return 0;

> > > Thanks,
> > > Mike
> >
> > Regards,
> >
> > Denis
