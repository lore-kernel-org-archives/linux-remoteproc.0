Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [RFC 0/2] Allow client to recover crashed processor
Date: Wed, 11 Mar 2020 11:54:30 +0100
Message-ID: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following 2 patches propose some changes to allow user space
client to shutdown and restart a crashed co-processor.
This is required when auto recovery is disabled at framework level or
when auto recovery procedure failed.

Sent as RFC as may be part of Mathieu's proposal for early boot/late
attach support

Loic Pallardy (2):
  remoteproc: sysfs: authorize rproc shutdown when rproc is crashed
  remoteproc: core: keep rproc in crash state in case of recovery
    failure

 drivers/remoteproc/remoteproc_core.c  | 8 +++++++-
 drivers/remoteproc/remoteproc_sysfs.c | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.7.4
