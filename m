Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v1 0/3] remoteproc: st: add virtio_rpmsg support
Date: Wed, 7 Dec 2016 21:33:43 +0100
Message-ID: <1481142826-15528-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Goal of this series is:
- to add vring based communication link (virtio_rpmsg)
- to add rproc_da_to_va translation function to allow firmware loading in
  pre-reserved carveout memory region

Loic Pallardy (3):
  remoteproc: st: add virtio communication support
  remoteproc: st: add da to va support
  remoteproc: core: don't allocate carveout if pa or da are defined

 drivers/remoteproc/Kconfig           |   3 +
 drivers/remoteproc/remoteproc_core.c |   5 ++
 drivers/remoteproc/st_remoteproc.c   | 161 +++++++++++++++++++++++++++++++++--
 3 files changed, 163 insertions(+), 6 deletions(-)

-- 
1.9.1
