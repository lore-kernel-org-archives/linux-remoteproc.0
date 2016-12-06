Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751443AbcLFPke (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Dec 2016 10:40:34 -0500
Date: Tue, 6 Dec 2016 17:40:28 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 00/10] virtio: sparse fixes
Message-ID: <1481038106-24899-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>, linux-crypto@vger.kernel.org, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-scsi@vger.kernel.org, v9fs-developer@lists.sourceforge.net, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

I run latest sparse from git on virtio drivers
(turns out the version I had was rather outdated).
This patchset fixes a couple of bugs this uncovered,
and adds some annotations to make it sparse-clean.
In particular, endian-ness is often tricky,
so this patchset enabled endian-ness checks for sparse
builds.

Michael S. Tsirkin (10):
  virtio_console: drop unused config fields
  drm/virtio: fix endianness in primary_plane_update
  drm/virtio: fix lock context imbalance
  drm/virtio: annotate virtio_gpu_queue_ctrl_buffer_locked
  vhost: make interval tree static inline
  vhost: add missing __user annotations
  vsock/virtio: add a missing __le annotation
  vsock/virtio: mark an internal function static
  vsock/virtio: fix src/dst cid format
  virtio: enable endian checks for sparse builds

 drivers/char/virtio_console.c           | 14 +++++++-------
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  4 ++--
 drivers/gpu/drm/virtio/virtgpu_vq.c     |  6 +++++-
 drivers/vhost/vhost.c                   | 12 ++++++------
 net/vmw_vsock/virtio_transport.c        |  2 +-
 net/vmw_vsock/virtio_transport_common.c | 16 ++++++++--------
 drivers/block/Makefile                  |  1 +
 drivers/char/Makefile                   |  1 +
 drivers/char/hw_random/Makefile         |  2 ++
 drivers/gpu/drm/virtio/Makefile         |  1 +
 drivers/net/Makefile                    |  3 +++
 drivers/net/caif/Makefile               |  1 +
 drivers/rpmsg/Makefile                  |  1 +
 drivers/s390/virtio/Makefile            |  2 ++
 drivers/scsi/Makefile                   |  1 +
 drivers/vhost/Makefile                  |  1 +
 drivers/virtio/Makefile                 |  3 +++
 net/9p/Makefile                         |  1 +
 net/packet/Makefile                     |  1 +
 net/vmw_vsock/Makefile                  |  2 ++
 20 files changed, 50 insertions(+), 25 deletions(-)

-- 
MST

