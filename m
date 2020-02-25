Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43334 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726019AbgBYFjz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Feb 2020 00:39:55 -0500
Subject: Re: [PATCH] virtio_ring: Fix mem leak with vring_new_virtqueue()
References: <20200224212643.30672-1-s-anna@ti.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b622c831-9adb-b9af-dd4a-21605bc124a8@redhat.com>
Date: Tue, 25 Feb 2020 13:39:41 +0800
MIME-Version: 1.0
In-Reply-To: <20200224212643.30672-1-s-anna@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
To: Suman Anna <s-anna@ti.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Tiwei Bie <tiwei.bie@intel.com>, "David S. Miller" <davem@davemloft.net>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>


On 2020/2/25 =E4=B8=8A=E5=8D=885:26, Suman Anna wrote:
> The functions vring_new_virtqueue() and __vring_new_virtqueue() are use=
d
> with split rings, and any allocations within these functions are manage=
d
> outside of the .we_own_ring flag. The commit cbeedb72b97a ("virtio_ring=
:
> allocate desc state for split ring separately") allocates the desc stat=
e
> within the __vring_new_virtqueue() but frees it only when the .we_own_r=
ing
> flag is set. This leads to a memory leak when freeing such allocated
> virtqueues with the vring_del_virtqueue() function.
>
> Fix this by moving the desc_state free code outside the flag and only
> for split rings. Issue was discovered during testing with remoteproc
> and virtio_rpmsg.
>
> Fixes: cbeedb72b97a ("virtio_ring: allocate desc state for split ring s=
eparately")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>   drivers/virtio/virtio_ring.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.=
c
> index 867c7ebd3f10..58b96baa8d48 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2203,10 +2203,10 @@ void vring_del_virtqueue(struct virtqueue *_vq)
>   					 vq->split.queue_size_in_bytes,
>   					 vq->split.vring.desc,
>   					 vq->split.queue_dma_addr);
> -
> -			kfree(vq->split.desc_state);
>   		}
>   	}
> +	if (!vq->packed_ring)
> +		kfree(vq->split.desc_state);


Nitpick, it looks to me it would be more clear if we just free=20
desc_state unconditionally here (and remove the kfree for packed above).

Anyway desc_state will be allocated by use even if !we_own_ring.

Thanks


>   	list_del(&_vq->list);
>   	kfree(vq);
>   }
