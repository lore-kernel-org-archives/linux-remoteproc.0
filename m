Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/2] Misc. rproc fixes around fixed memory region support
Date: Thu, 5 Mar 2020 16:41:06 -0600
Message-ID: <20200305224108.21351-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, Loic,

The following are two different fixes for the same commit 086d08725d34
("remoteproc: create vdev subdevice with specific dma memory pool") added
in 5.1 kernel. This has deviated from the core logic prior to the fixed
memory region support.

Patch 1 fixes an issue for some TI remoteproc drivers which always used
the same CMA pool for allocating vrings, vring buffers and carveouts. It
assigns the same pool (if there exists one) for the separated out
vdev device if there are no specific vdev memory regions, and is a
no-op otherwise.

Patch 2 restores the parenting hierarchy for rpmsg devices so that the
rproc handle can be retrieved by rpmsg drivers using the rproc_get_by_child()
API. 

Following is an example of how the rpmsg-client-sample devices looked on
our Davinci platforms:
1. On 4.19 kernel:
root@omapl138-lcdk# ls -l /sys/bus/rpmsg/devices/
lrwxrwxrwx    1 root     root             0 Nov 17 02:03 virtio0.rpmsg-client-sample.-1.50 -> ../../../devices/platform/11800000.dsp/remoteproc/remoteproc0/virtio0/virtio0.rpmsg-client-sample.-1.50
lrwxrwxrwx    1 root     root             0 Nov 17 02:03 virtio0.rpmsg-client-sample.-1.51 -> ../../../devices/platform/11800000.dsp/remoteproc/remoteproc0/virtio0/virtio0.rpmsg-client-sample.-1.51

2. After the commit 086d08725d34:
root@omapl138-lcdk# ls -l /sys/bus/rpmsg/devices/
lrwxrwxrwx    1 root     root             0 Nov 17 02:05 virtio0.rpmsg-client-sample.-1.50 -> ../../../devices/platform/11800000.dsp/11800000.dsp#vdev0buffer/virtio0/virtio0.rpmsg-client-sample.-1.50
lrwxrwxrwx    1 root     root             0 Nov 17 02:05 virtio0.rpmsg-client-sample.-1.51 -> ../../../devices/platform/11800000.dsp/11800000.dsp#vdev0buffer/virtio0/virtio0.rpmsg-client-sample.-1.51

3. With Patch 2:
root@omapl138-lcdk:/rpmsg/2020lts# ls -l /sys/bus/rpmsg/devices/
lrwxrwxrwx    1 root     root             0 Nov 17 02:00 virtio0.rpmsg-client-sample.-1.50 -> ../../../devices/platform/11800000.dsp/remoteproc/remoteproc0/remoteproc0#vdev0buffer/virtio0/virtio0.rpmsg-client-sample.-1.50
lrwxrwxrwx    1 root     root             0 Nov 17 02:00 virtio0.rpmsg-client-sample.-1.51 -> ../../../devices/platform/11800000.dsp/remoteproc/remoteproc0/remoteproc0#vdev0buffer/virtio0/virtio0.rpmsg-client-sample.-1.51

regards
Suman

Suman Anna (1):
  remoteproc: Fix and restore the parenting hierarchy for vdev

Tero Kristo (1):
  remoteproc: fall back to using parent memory pool if no dedicated
    available

 drivers/remoteproc/remoteproc_core.c   |  2 +-
 drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.23.0
