Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v4 0/2] remoteproc: st: add virtio_rpmsg support
Date: Wed, 15 Feb 2017 21:18:47 +0100
Message-ID: <1487189929-24196-1-git-send-email-loic.pallardy@st.com>
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

V4:
- Rebase on maintainer rproc-next branch on which patches 1 & 2 are present
- Remove check on device address (da) from patch 4
- Add Acked-by and Tested-by

Loic Pallardy (2):
  remoteproc: st: add da to va support
  remoteproc: core: don't allocate carveout if pa is defined

 drivers/remoteproc/remoteproc_core.c |  5 +++++
 drivers/remoteproc/st_remoteproc.c   | 43 +++++++++++++++++++++++++++++++-----
 2 files changed, 42 insertions(+), 6 deletions(-)

-- 
1.9.1
