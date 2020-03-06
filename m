Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
References: <20200224212643.30672-1-s-anna@ti.com>
 <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
 <0ace3a3b-cf2f-7977-5337-f74f530afbe1@ti.com>
 <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <a4335428-e29e-d567-b18b-3c144020a726@ti.com>
Date: Thu, 5 Mar 2020 18:27:53 -0600
MIME-Version: 1.0
In-Reply-To: <1ce2bee4-64ed-f630-2695-8e8b9b8e27c1@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Tiwei Bie <tiwei.bie@intel.com>, "David S. Miller" <davem@davemloft.net>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 2/25/20 9:13 PM, Jason Wang wrote:
> 
> On 2020/2/26 上午12:51, Suman Anna wrote:
>> Hi Jason,
>>
>> On 2/24/20 11:39 PM, Jason Wang wrote:
>>> On 2020/2/25 上午5:26, Suman Anna wrote:
>>>> The functions vring_new_virtqueue() and __vring_new_virtqueue() are
>>>> used
>>>> with split rings, and any allocations within these functions are
>>>> managed
>>>> outside of the .we_own_ring flag. The commit cbeedb72b97a
>>>> ("virtio_ring:
>>>> allocate desc state for split ring separately") allocates the desc
>>>> state
>>>> within the __vring_new_virtqueue() but frees it only when the
>>>> .we_own_ring
>>>> flag is set. This leads to a memory leak when freeing such allocated
>>>> virtqueues with the vring_del_virtqueue() function.
>>>>
>>>> Fix this by moving the desc_state free code outside the flag and only
>>>> for split rings. Issue was discovered during testing with remoteproc
>>>> and virtio_rpmsg.
>>>>
>>>> Fixes: cbeedb72b97a ("virtio_ring: allocate desc state for split ring
>>>> separately")
>>>> Signed-off-by: Suman Anna<s-anna@ti.com>
>>>> ---
>>>>    drivers/virtio/virtio_ring.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/virtio/virtio_ring.c
>>>> b/drivers/virtio/virtio_ring.c
>>>> index 867c7ebd3f10..58b96baa8d48 100644
>>>> --- a/drivers/virtio/virtio_ring.c
>>>> +++ b/drivers/virtio/virtio_ring.c
>>>> @@ -2203,10 +2203,10 @@ void vring_del_virtqueue(struct virtqueue *_vq)
>>>>                         vq->split.queue_size_in_bytes,
>>>>                         vq->split.vring.desc,
>>>>                         vq->split.queue_dma_addr);
>>>> -
>>>> -            kfree(vq->split.desc_state);
>>>>            }
>>>>        }
>>>> +    if (!vq->packed_ring)
>>>> +        kfree(vq->split.desc_state);
>>> Nitpick, it looks to me it would be more clear if we just free
>>> desc_state unconditionally here (and remove the kfree for packed above).
>> OK, are you sure you want that to be folded into this patch? It looks to
>> me a separate cleanup/consolidation patch, and packed desc_state does
>> not suffer this memleak, and need not be backported into stable kernels.
>>
>> regards
>> Suman
> 
> 
> Though it's just a small tweak, I'm fine for leaving it for future.
> 
> So
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 

Mike,
Ping on this. I don't see the patch in -next yet. Can we get this into
the current -rc please?

regards
Suman
