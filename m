Return-Path: <linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org>
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
In-Reply-To: <20190416202013.4034148-1-arnd@arndb.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2019 12:03:42 +0300
Message-ID: <CAHp75Vc2-zzRYk0vpdPQm5duZwW+v=svEndTPV4Sr59QrGcMHg@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] compat_ioctl: cleanups
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux NVMe Mailinglist <linux-nvme@lists.infradead.org>, linux-iio <linux-iio@vger.kernel.org>, linux-remoteproc@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-ide@vger.kernel.org, "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, sparclinux@vger.kernel.org, linux1394-devel@lists.sourceforge.net, devel@driverdev.osuosl.org, linux-s390@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>, linux-bluetooth@vger.kernel.org, y2038@lists.linaro.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org, linux-input <linux-input@vger.kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Karsten Keil <isdn@linux-pingi.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, linux-crypto <linux-crypto@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, linux-integrity <linux-integrity@vger.kernel.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org, linux-ppp@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Apr 16, 2019 at 11:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Hi Al,
>
> It took me way longer than I had hoped to revisit this series, see
> https://lore.kernel.org/lkml/20180912150142.157913-1-arnd@arndb.de/
> for the previously posted version.
>
> I've come to the point where all conversion handlers and most
> COMPATIBLE_IOCTL() entries are gone from this file, but for
> now, this series only has the parts that have either been reviewed
> previously, or that are simple enough to include.
>
> The main missing piece is the SG_IO/SG_GET_REQUEST_TABLE conversion.
> I'll post the patches I made for that later, as they need more
> testing and review from the scsi maintainers.
>
> I hope you can still take these for the coming merge window, unless
> new problems come up.

>  drivers/platform/x86/wmi.c                  |   2 +-

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
