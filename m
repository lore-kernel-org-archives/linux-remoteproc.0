Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [RESEND 0/2] remoteproc: add support for preloaded firmware
Date: Wed, 7 Aug 2019 11:41:17 +0200
Message-ID: <1565170879-3185-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series introduces a new flag in remoteproc core to add
support of remote processor having their firmware loading by another
way than standard remoteproc core sequence.

Firmware could be ROMed, loaded by security or bootloader before kernel
boot or loaded by a special rproc platform driver interface.

When "preloaded" flag is set by rproc platform driver, remoteproc core
doesn't request firmware and execute rproc_start sequence as usual allocating
associated rproc resources.
It is rproc platform driver responsibility to implement the right firmware
load operations according to HW specificities like resource table location
or firmware definition if needed.

Regards,
Loic

Loic Pallardy (2):
  remoteproc: replace bool from struct rproc by u8
  remoteproc: add support for co-processor booted before kernel

 drivers/remoteproc/remoteproc_core.c | 37 +++++++++++++++++++++++++++---------
 include/linux/remoteproc.h           | 14 ++++++++------
 2 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.7.4
