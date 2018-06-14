Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: [PATCH v2 0/7] soc: qcom: Allow COMPILE_TEST of all drivers
Date: Thu, 14 Jun 2018 13:11:31 +0200
Message-Id: <20180614111138.8923-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: andy.gross@linaro.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Patrick Lai <plai@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, alsa-devel@alsa-project.org
List-ID: <linux-remoteproc@vger.kernel.org>

Since commit cab673583d96 ("soc: Unconditionally include qcom Makefile"),
we unconditionally include the soc/qcom/Makefile.

This opens up the possibility to compile test the code even when
building for other architectures.

This patch series prepares and enables all but two Kconfigs to be
compile tested even when building for other architectures.


Changes since v1:
Added two new patches, "ASoC: qdsp6: Add depends on OF"
and "soc: qcom: Remove bogus depends on OF".
Patch "soc: qcom: Allow COMPILE_TEST of all drivers"
now adds "depends on ARCH_QCOM || COMPILE_TEST" to the menu entry.


Niklas Cassel (7):
  rpmsg: smd: Add missing include of sizes.h
  soc: qcom: smem: Add missing include of sizes.h
  soc: qcom: smp2p: Add select IRQ_DOMAIN
  soc: qcom: smsm: Add select IRQ_DOMAIN
  ASoC: qdsp6: Add depends on OF
  soc: qcom: Remove bogus depends on OF
  soc: qcom: Allow COMPILE_TEST of all drivers

 drivers/rpmsg/qcom_smd.c |  1 +
 drivers/soc/qcom/Kconfig | 14 +++++---------
 drivers/soc/qcom/smem.c  |  1 +
 sound/soc/qcom/Kconfig   |  2 +-
 4 files changed, 8 insertions(+), 10 deletions(-)

-- 
2.17.1
