Return-Path: <mst@redhat.com>
Date: Wed, 30 May 2018 17:10:56 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio_ring: switch to dma_XX barriers for rpmsg
Message-ID: <20180530163740-mutt-send-email-mst@kernel.org>
References: <1524159181-351878-1-git-send-email-mst@redhat.com>
 <5047d08c-9f9e-2902-d425-1fac849ce5b4@redhat.com>
 <20180419204017-mutt-send-email-mst@kernel.org>
 <524fb400-2325-f60b-7e03-15be01888afc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <524fb400-2325-f60b-7e03-15be01888afc@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 19, 2018 at 07:48:24PM +0200, Paolo Bonzini wrote:
> On 19/04/2018 19:46, Michael S. Tsirkin wrote:
> >> This should be okay, but I wonder if there should be a virtio_wmb(...)
> >> or an "if (weak_barriers) wmb()" before the "writel" in vm_notify
> >> (drivers/virtio/virtio_mmio.c).
> >>
> >> Thanks,
> >>
> >> Paolo
> > That one uses weak barriers AFAIK.
> > 
> > IIUC you mean rproc_virtio_notify.
> > 
> > I suspect it works because specific kick callbacks have a barrier internally.
> 
> Yes, that one.  At least keystone_rproc_kick doesn't seem to have a barrier.
> 
> Paolo

Any feedback from rproc maintainers?

-- 
MST
