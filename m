Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:33268 "EHLO sipsolutions.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751225AbcLGG0i (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Dec 2016 01:26:38 -0500
Message-ID: <1481091951.4092.12.camel@sipsolutions.net>
Subject: Re: [PATCH 10/10] virtio: enable endian checks for sparse builds
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 07 Dec 2016 07:25:51 +0100
In-Reply-To: <1481038106-24899-11-git-send-email-mst@redhat.com> (sfid-20161206_164156_647850_329465D7)
References: <1481038106-24899-1-git-send-email-mst@redhat.com>
         <1481038106-24899-11-git-send-email-mst@redhat.com>
         (sfid-20161206_164156_647850_329465D7)
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 2016-12-06 at 17:41 +0200, Michael S. Tsirkin wrote:

> It seems that there should be a better way to do it,
> but this works too.

In some cases there might be:

> --- a/drivers/s390/virtio/Makefile
> +++ b/drivers/s390/virtio/Makefile
> @@ -6,6 +6,8 @@
>  # it under the terms of the GNU General Public License (version 2
> only)
>  # as published by the Free Software Foundation.
>  
> +CFLAGS_virtio_ccw.o += -D__CHECK_ENDIAN__
> +CFLAGS_kvm_virtio.o += -D__CHECK_ENDIAN__
>  s390-virtio-objs := virtio_ccw.o
>  ifdef CONFIG_S390_GUEST_OLD_TRANSPORT
>  s390-virtio-objs += kvm_virtio.o

Here you could use

ccflags-y += -D__CHECK_ENDIAN__

for example, or even

subdir-ccflags-y += -D__CHECK_ENDIAN__

(in case any subdirs ever get added here)

> --- a/drivers/vhost/Makefile
> +++ b/drivers/vhost/Makefile
> @@ -1,3 +1,4 @@
> +ccflags-y := -D__CHECK_ENDIAN__

Looks like you did that here and in some other places though - so
perhaps the s390 one was intentionally different?

> --- a/net/packet/Makefile
> +++ b/net/packet/Makefile
> @@ -2,6 +2,7 @@
>  # Makefile for the packet AF.
>  #
>  
> +ccflags-y := -D__CHECK_ENDIAN__

Technically this is slightly more than advertised, but I guess that
still makes sense if it's clean now.

johannes

