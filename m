Return-Path: <mst@redhat.com>
Date: Thu, 30 Mar 2017 17:32:19 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/6] virtio: wrap find_vqs
Message-ID: <20170330173146-mutt-send-email-mst@kernel.org>
References: <1490820507-8005-1-git-send-email-mst@redhat.com>
 <1490820507-8005-2-git-send-email-mst@redhat.com>
 <72f533a2-482d-1956-b0fe-254e273e1818@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72f533a2-482d-1956-b0fe-254e273e1818@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: linux-kernel@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Shah <amit@kernel.org>, Gonglei <arei.gonglei@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux-foundation.org, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, kvm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Mar 30, 2017 at 02:00:08PM +0800, Jason Wang wrote:
> 
> 
> On 2017年03月30日 04:48, Michael S. Tsirkin wrote:
> > We are going to add more parameters to find_vqs, let's wrap the call so
> > we don't need to tweak all drivers every time.
> > 
> > Signed-off-by: Michael S. Tsirkin<mst@redhat.com>
> > ---
> 
> A quick glance and it looks ok, but what the benefit of this series, is it
> required by other changes?
> 
> Thanks

Yes - to avoid touching all devices when doing the rest of
the patchset.
