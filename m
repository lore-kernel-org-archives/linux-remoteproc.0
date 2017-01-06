Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 0/3] remoteproc: st: add virtio_rpmsg support
Date: Fri, 6 Jan 2017 18:16:10 +0100
Message-ID: <1483722973-21531-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Goal of this series is:
- to add vring based communication link (virtio_rpmsg)
- to add rproc_da_to_va translation function to allow firmware loading in
  pre-reserved carveout memory region

V2:
Only changes in patch 1 to:
- fix typos
- fix mailbox allocation per coprocessor

Loic Pallardy (3):
  remoteproc: st: add virtio communication support
  remoteproc: st: add da to va support
  remoteproc: core: don't allocate carveout if pa or da are defined

 drivers/remoteproc/Kconfig           |   3 +
 drivers/remoteproc/remoteproc_core.c |   5 ++
 drivers/remoteproc/st_remoteproc.c   | 160 +++++++++++++++++++++++++++++++++--
 3 files changed, 162 insertions(+), 6 deletions(-)

-- 
1.9.1
