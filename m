Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v3 0/2] Misc. rproc fixes around fixed memory region support
Date: Mon, 20 Apr 2020 11:05:58 -0500
Message-ID: <20200420160600.10467-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

This is another minor revision of the fixes around fixed memory region
support [1] series. Patch 1 is revised to go back to the logic used in v1
after a long discussion on the v2 version [2]. The other suggestions can
be future improvments as they would require corresponding platform driver
changes. Please look through the discussion there and let us know your
preference. Patches are based on v5.7-rc1.

I really appreciate it if you can target the series for the current 5.7 -rc's.
The fixes would apply for all 5.1+ kernels.

Please see the v1 cover-letter [1] for the details on the issues.

regards
Suman

[1] https://patchwork.kernel.org/cover/11422723/
[2] https://patchwork.kernel.org/comment/23274389/

Suman Anna (1):
  remoteproc: Fix and restore the parenting hierarchy for vdev

Tero Kristo (1):
  remoteproc: Fall back to using parent memory pool if no dedicated
    available

 drivers/remoteproc/remoteproc_core.c   |  2 +-
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.26.0
