Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 10/10] virtio: enable endian checks for sparse builds
References: <1481038106-24899-1-git-send-email-mst@redhat.com>
 <1481038106-24899-11-git-send-email-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9694c60d-c0cb-945c-f10e-9c1a8036ae6f@redhat.com>
Date: Wed, 7 Dec 2016 13:27:35 +0800
MIME-Version: 1.0
In-Reply-To: <1481038106-24899-11-git-send-email-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Ohad Ben-Cohen <ohad@wizery.com>, Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@fb.com>, Neil Armstrong <narmstrong@baylibre.com>, Stefan Hajnoczi <stefanha@redhat.com>, Asias He <asias@redhat.com>, linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net
List-ID: <linux-remoteproc@vger.kernel.org>



On 2016年12月06日 23:41, Michael S. Tsirkin wrote:
> __CHECK_ENDIAN__ isn't on by default presumably because
> it triggers too many sparse warnings for correct code.
> But virtio is now clean of these warnings, and
> we want to keep it this way - enable this for
> sparse builds.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>
> It seems that there should be a better way to do it,
> but this works too.

Reviewed-by: Jason Wang <jasowang@redhat.com>

>
>   drivers/block/Makefile          | 1 +
>   drivers/char/Makefile           | 1 +
>   drivers/char/hw_random/Makefile | 2 ++
>   drivers/gpu/drm/virtio/Makefile | 1 +
>   drivers/net/Makefile            | 3 +++
>   drivers/net/caif/Makefile       | 1 +
>   drivers/rpmsg/Makefile          | 1 +
>   drivers/s390/virtio/Makefile    | 2 ++
>   drivers/scsi/Makefile           | 1 +
>   drivers/vhost/Makefile          | 1 +
>   drivers/virtio/Makefile         | 3 +++
>   net/9p/Makefile                 | 1 +
>   net/packet/Makefile             | 1 +
>   net/vmw_vsock/Makefile          | 2 ++
>   14 files changed, 21 insertions(+)
>
> diff --git a/drivers/block/Makefile b/drivers/block/Makefile
> index 1e9661e..597481c 100644
> --- a/drivers/block/Makefile
> +++ b/drivers/block/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_BLK_DEV_OSD)	+= osdblk.o
>   obj-$(CONFIG_BLK_DEV_UMEM)	+= umem.o
>   obj-$(CONFIG_BLK_DEV_NBD)	+= nbd.o
>   obj-$(CONFIG_BLK_DEV_CRYPTOLOOP) += cryptoloop.o
> +CFLAGS_virtio_blk.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_VIRTIO_BLK)	+= virtio_blk.o
>   
>   obj-$(CONFIG_BLK_DEV_SX8)	+= sx8.o
> diff --git a/drivers/char/Makefile b/drivers/char/Makefile
> index 6e6c244..a99467d 100644
> --- a/drivers/char/Makefile
> +++ b/drivers/char/Makefile
> @@ -6,6 +6,7 @@ obj-y				+= mem.o random.o
>   obj-$(CONFIG_TTY_PRINTK)	+= ttyprintk.o
>   obj-y				+= misc.o
>   obj-$(CONFIG_ATARI_DSP56K)	+= dsp56k.o
> +CFLAGS_virtio_console.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_VIRTIO_CONSOLE)	+= virtio_console.o
>   obj-$(CONFIG_RAW_DRIVER)	+= raw.o
>   obj-$(CONFIG_SGI_SNSC)		+= snsc.o snsc_event.o
> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
> index 5f52b1e..a2b0931 100644
> --- a/drivers/char/hw_random/Makefile
> +++ b/drivers/char/hw_random/Makefile
> @@ -17,6 +17,8 @@ obj-$(CONFIG_HW_RANDOM_IXP4XX) += ixp4xx-rng.o
>   obj-$(CONFIG_HW_RANDOM_OMAP) += omap-rng.o
>   obj-$(CONFIG_HW_RANDOM_OMAP3_ROM) += omap3-rom-rng.o
>   obj-$(CONFIG_HW_RANDOM_PASEMI) += pasemi-rng.o
> +CFLAGS_virtio_transport.o += -D__CHECK_ENDIAN__
> +CFLAGS_virtio-rng.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_HW_RANDOM_VIRTIO) += virtio-rng.o
>   obj-$(CONFIG_HW_RANDOM_TX4939) += tx4939-rng.o
>   obj-$(CONFIG_HW_RANDOM_MXC_RNGA) += mxc-rnga.o
> diff --git a/drivers/gpu/drm/virtio/Makefile b/drivers/gpu/drm/virtio/Makefile
> index 3fb8eac..1162366 100644
> --- a/drivers/gpu/drm/virtio/Makefile
> +++ b/drivers/gpu/drm/virtio/Makefile
> @@ -3,6 +3,7 @@
>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>   
>   ccflags-y := -Iinclude/drm
> +ccflags-y += -D__CHECK_ENDIAN__
>   
>   virtio-gpu-y := virtgpu_drv.o virtgpu_kms.o virtgpu_drm_bus.o virtgpu_gem.o \
>   	virtgpu_fb.o virtgpu_display.o virtgpu_vq.o virtgpu_ttm.o \
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 7336cbd..3f587de 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_EQUALIZER) += eql.o
>   obj-$(CONFIG_IFB) += ifb.o
>   obj-$(CONFIG_MACSEC) += macsec.o
>   obj-$(CONFIG_MACVLAN) += macvlan.o
> +CFLAGS_macvtap.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_MACVTAP) += macvtap.o
>   obj-$(CONFIG_MII) += mii.o
>   obj-$(CONFIG_MDIO) += mdio.o
> @@ -20,8 +21,10 @@ obj-$(CONFIG_NETCONSOLE) += netconsole.o
>   obj-$(CONFIG_PHYLIB) += phy/
>   obj-$(CONFIG_RIONET) += rionet.o
>   obj-$(CONFIG_NET_TEAM) += team/
> +CFLAGS_tun.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_TUN) += tun.o
>   obj-$(CONFIG_VETH) += veth.o
> +CFLAGS_virtio_net.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_VIRTIO_NET) += virtio_net.o
>   obj-$(CONFIG_VXLAN) += vxlan.o
>   obj-$(CONFIG_GENEVE) += geneve.o
> diff --git a/drivers/net/caif/Makefile b/drivers/net/caif/Makefile
> index 9bbd453..d1a922c 100644
> --- a/drivers/net/caif/Makefile
> +++ b/drivers/net/caif/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_CAIF_HSI) += caif_hsi.o
>   
>   # Virtio interface
>   obj-$(CONFIG_CAIF_VIRTIO) += caif_virtio.o
> +CFLAGS_caif_virtio.o += -D__CHECK_ENDIAN__
> diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
> index ae9c913..23c8b66 100644
> --- a/drivers/rpmsg/Makefile
> +++ b/drivers/rpmsg/Makefile
> @@ -1,3 +1,4 @@
>   obj-$(CONFIG_RPMSG)		+= rpmsg_core.o
>   obj-$(CONFIG_RPMSG_QCOM_SMD)	+= qcom_smd.o
>   obj-$(CONFIG_RPMSG_VIRTIO)	+= virtio_rpmsg_bus.o
> +CFLAGS_virtio_rpmsg_bus.o	+= -D__CHECK_ENDIAN__
> diff --git a/drivers/s390/virtio/Makefile b/drivers/s390/virtio/Makefile
> index df40692..270ada5 100644
> --- a/drivers/s390/virtio/Makefile
> +++ b/drivers/s390/virtio/Makefile
> @@ -6,6 +6,8 @@
>   # it under the terms of the GNU General Public License (version 2 only)
>   # as published by the Free Software Foundation.
>   
> +CFLAGS_virtio_ccw.o += -D__CHECK_ENDIAN__
> +CFLAGS_kvm_virtio.o += -D__CHECK_ENDIAN__
>   s390-virtio-objs := virtio_ccw.o
>   ifdef CONFIG_S390_GUEST_OLD_TRANSPORT
>   s390-virtio-objs += kvm_virtio.o
> diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
> index 38d938d..9f70d46 100644
> --- a/drivers/scsi/Makefile
> +++ b/drivers/scsi/Makefile
> @@ -135,6 +135,7 @@ obj-$(CONFIG_SCSI_BNX2_ISCSI)	+= libiscsi.o bnx2i/
>   obj-$(CONFIG_BE2ISCSI)		+= libiscsi.o be2iscsi/
>   obj-$(CONFIG_SCSI_ESAS2R)	+= esas2r/
>   obj-$(CONFIG_SCSI_PMCRAID)	+= pmcraid.o
> +CFLAGS_virtio_scsi.o += -D__CHECK_ENDIAN__
>   obj-$(CONFIG_SCSI_VIRTIO)	+= virtio_scsi.o
>   obj-$(CONFIG_VMWARE_PVSCSI)	+= vmw_pvscsi.o
>   obj-$(CONFIG_XEN_SCSI_FRONTEND)	+= xen-scsifront.o
> diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
> index 6b012b9..619e2cd 100644
> --- a/drivers/vhost/Makefile
> +++ b/drivers/vhost/Makefile
> @@ -1,3 +1,4 @@
> +ccflags-y := -D__CHECK_ENDIAN__
>   obj-$(CONFIG_VHOST_NET) += vhost_net.o
>   vhost_net-y := net.o
>   
> diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> index 41e30e3..d331f19 100644
> --- a/drivers/virtio/Makefile
> +++ b/drivers/virtio/Makefile
> @@ -1,3 +1,6 @@
> +#virtio must be kept clean wrt endian tags,
> +#otherwise we'll get to maintain broken host/guest ABIs
> +ccflags-y := -D__CHECK_ENDIAN__
>   obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
>   obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
>   obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> diff --git a/net/9p/Makefile b/net/9p/Makefile
> index a0874cc..acf1225 100644
> --- a/net/9p/Makefile
> +++ b/net/9p/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_NET_9P_RDMA) += 9pnet_rdma.o
>   	trans_fd.o \
>   	trans_common.o \
>   
> +CFLAGS_trans_virtio.o += -D__CHECK_ENDIAN__
>   9pnet_virtio-objs := \
>   	trans_virtio.o \
>   
> diff --git a/net/packet/Makefile b/net/packet/Makefile
> index 9df6134..a13bcb3 100644
> --- a/net/packet/Makefile
> +++ b/net/packet/Makefile
> @@ -2,6 +2,7 @@
>   # Makefile for the packet AF.
>   #
>   
> +ccflags-y := -D__CHECK_ENDIAN__
>   obj-$(CONFIG_PACKET) += af_packet.o
>   obj-$(CONFIG_PACKET_DIAG) += af_packet_diag.o
>   af_packet_diag-y += diag.o
> diff --git a/net/vmw_vsock/Makefile b/net/vmw_vsock/Makefile
> index bc27c70..a61eccb 100644
> --- a/net/vmw_vsock/Makefile
> +++ b/net/vmw_vsock/Makefile
> @@ -8,6 +8,8 @@ vsock-y += af_vsock.o vsock_addr.o
>   vmw_vsock_vmci_transport-y += vmci_transport.o vmci_transport_notify.o \
>   	vmci_transport_notify_qstate.o
>   
> +CFLAGS_virtio_transport.o += -D__CHECK_ENDIAN__
> +CFLAGS_virtio_transport_common.o += -D__CHECK_ENDIAN__
>   vmw_vsock_virtio_transport-y += virtio_transport.o
>   
>   vmw_vsock_virtio_transport_common-y += virtio_transport_common.o
