Return-Path: <pbonzini@redhat.com>
Subject: Re: [PATCH] virtio_ring: switch to dma_XX barriers for rpmsg
References: <1524159181-351878-1-git-send-email-mst@redhat.com>
 <5047d08c-9f9e-2902-d425-1fac849ce5b4@redhat.com>
 <20180419204017-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <524fb400-2325-f60b-7e03-15be01888afc@redhat.com>
Date: Thu, 19 Apr 2018 19:48:24 +0200
MIME-Version: 1.0
In-Reply-To: <20180419204017-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 19/04/2018 19:46, Michael S. Tsirkin wrote:
>> This should be okay, but I wonder if there should be a virtio_wmb(...)
>> or an "if (weak_barriers) wmb()" before the "writel" in vm_notify
>> (drivers/virtio/virtio_mmio.c).
>>
>> Thanks,
>>
>> Paolo
> That one uses weak barriers AFAIK.
> 
> IIUC you mean rproc_virtio_notify.
> 
> I suspect it works because specific kick callbacks have a barrier internally.

Yes, that one.  At least keystone_rproc_kick doesn't seem to have a barrier.

Paolo
