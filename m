Return-Path: <bjorn.andersson@linaro.org>
Date: Sat, 1 Apr 2017 09:13:44 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/6] virtio: wrap find_vqs
Message-ID: <20170401161344.GR20094@minitux>
References: <1490820507-8005-1-git-send-email-mst@redhat.com>
 <1490820507-8005-2-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490820507-8005-2-git-send-email-mst@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Shah <amit@kernel.org>, Gonglei <arei.gonglei@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Ohad Ben-Cohen <ohad@wizery.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, kvm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 29 Mar 13:48 PDT 2017, Michael S. Tsirkin wrote:

> We are going to add more parameters to find_vqs, let's wrap the call so
> we don't need to tweak all drivers every time.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
