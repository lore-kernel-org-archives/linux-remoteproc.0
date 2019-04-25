Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202701.127745-1-arnd@arndb.de>
 <20190425122153.450fc094@coco.lan> <20190425153534.GS2217@ZenIV.linux.org.uk>
In-Reply-To: <20190425153534.GS2217@ZenIV.linux.org.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Apr 2019 17:55:23 +0200
Message-ID: <CAK8P3a2HmiYQJ2FV2FgLiFsD8M9UKteC9Jetx7ja06PQVZWYfA@mail.gmail.com>
Subject: Re: [PATCH v3 12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
Content-Type: text/plain; charset="UTF-8"
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 25, 2019 at 5:35 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Thu, Apr 25, 2019 at 12:21:53PM -0300, Mauro Carvalho Chehab wrote:
>
> > If I understand your patch description well, using compat_ptr_ioctl
> > only works if the driver is not for s390, right?
>
> No; s390 is where "oh, just set ->compat_ioctl same as ->unlocked_ioctl
> and be done with that; compat_ptr() is a no-op anyway" breaks.  IOW,
> s390 is the reason for having compat_ptr_ioctl() in the first place;
> that thing works on all biarch architectures, as long as all stuff
> handled by ->ioctl() takes pointer to arch-independent object as
> argument.  IOW,
>         argument ignored => OK
>         any arithmetical type => no go, compat_ptr() would bugger it
>         pointer to int => OK
>         pointer to string => OK
>         pointer to u64 => OK
>         pointer to struct {u64 addr; char s[11];} => OK

To be extra pedantic, the 'struct {u64 addr; char s[11];} '
case is also broken on x86, because sizeof (obj) is smaller
on i386, even though the location of the members are
the same. i.e. you can copy_from_user() this, but not
copy_to_user(), which overwrites 4 bytes after the end of
the 20-byte user structure.

       Arnd
