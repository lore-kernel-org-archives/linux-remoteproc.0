Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [PATCH v5 0/3] add support for co-processor loaded and booted before kernel
Date: Tue, 11 Feb 2020 18:42:02 +0100
Message-ID: <20200211174205.22247-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, arnaud.pouliquen@st.com, Suman Anna <s-anna@ti.com>, Fabien DESSENNE <fabien.dessenne@st.com>, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-ID: <linux-remoteproc@vger.kernel.org>

This series introduce the support of a preloaded firmware. In this case
the load of the firmware is skipped. It is platform driver responsibility
to implement the right firmware load ops according to HW specificities.

V4[1] to V5 update:
  - add stm32 platform implementation  

[1]. https://patchwork.kernel.org/patch/11265869/

Arnaud Pouliquen (1):
  dt-bindings: remoteproc: stm32: add syscon bindings preloaded fw
    support

Fabien Dessenne (1):
  remoteproc: stm32: add support for co-processor booted before kernel

Loic Pallardy (1):
  remoteproc: add support for co-processor loaded and booted before
    kernel

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  21 ++
 drivers/remoteproc/remoteproc_core.c          |  67 ++++--
 drivers/remoteproc/stm32_rproc.c              | 205 ++++++++++++++++--
 include/linux/remoteproc.h                    |   2 +
 4 files changed, 267 insertions(+), 28 deletions(-)

-- 
2.17.1
