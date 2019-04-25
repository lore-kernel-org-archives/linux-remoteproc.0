Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de> <20190416202701.127745-1-arnd@arndb.de>
 <20190425122153.450fc094@coco.lan>
In-Reply-To: <20190425122153.450fc094@coco.lan>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 25 Apr 2019 17:32:05 +0200
Message-ID: <CAK8P3a1qCQJEkne3uAw-Ep-taNU9t5Y2ZmgoiCGmOz1BSwmzEw@mail.gmail.com>
Subject: Re: [PATCH v3 12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
Content-Type: text/plain; charset="UTF-8"
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 25, 2019 at 5:22 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
> Em Tue, 16 Apr 2019 22:25:33 +0200 Arnd Bergmann <arnd@arndb.de> escreveu:
>
> If I understand your patch description well, using compat_ptr_ioctl
> only works if the driver is not for s390, right?

No, the purpose of compat_ptr_ioctl() is to make sure it works
everywhere including s390.

Even on s390 it tends to work most of the time, but for correctness
the upper bit of a 32-bit pointer needs to be cleared, as
compat_ptr_ioctl does, in case some application passes a pointer
with that bit set. [IIRC, in the instruction pointer, the high bit is set, in
data references it is ignored but usually cleared, but it may be left
on for IP-relative address generation]

       Arnd
