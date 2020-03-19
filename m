Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 0/2] Misc. rproc fixes around fixed memory region support
Date: Thu, 19 Mar 2020 11:23:19 -0500
Message-ID: <20200319162321.20632-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi All,

This is a minor revised version of the fixes around fixed memory region
support [1]. Patch 1 is updated to address Arnaud's review comments about 
the hard-coded memory region.

Please see the v1 cover-letter [1] for the details on the issues.

regards
Suman

[1] https://patchwork.kernel.org/cover/11422723/

Suman Anna (1):
  remoteproc: Fix and restore the parenting hierarchy for vdev

Tero Kristo (1):
  remoteproc: fall back to using parent memory pool if no dedicated
    available

 drivers/remoteproc/remoteproc_core.c   |  2 +-
 drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
 include/linux/remoteproc.h             |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.23.0
