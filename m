Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 0/4] remoteproc: st: add virtio_rpmsg support
Date: Tue, 31 Jan 2017 13:35:52 +0100
Message-ID: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Goal of this series is:
- to add vring based communication link (virtio_rpmsg)
- to add rproc_da_to_va translation function to allow firmware loading in
  pre-reserved carveout memory region

V2:
Only changes in patch 1 to:
- fix typos
- fix mailbox allocation per coprocessor

V3:
- Integrate Bjorn's comments about mailbox support simplification
- Add missing Signed-of-by
- Move st_rproc_probe error management correction in a dedicated patch
- Fix warnings reported by checkpatch --strict

Loic Pallardy (4):
  remoteproc: st: correct probe error management
  remoteproc: st: add virtio communication support
  remoteproc: st: add da to va support
  remoteproc: core: don't allocate carveout if pa or da are defined

 drivers/remoteproc/Kconfig           |   3 +
 drivers/remoteproc/remoteproc_core.c |   5 ++
 drivers/remoteproc/st_remoteproc.c   | 158 +++++++++++++++++++++++++++++++++--
 3 files changed, 158 insertions(+), 8 deletions(-)

-- 
1.9.1
