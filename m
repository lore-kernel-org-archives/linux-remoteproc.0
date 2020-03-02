Return-Path: <cleger@kalray.eu>
From: Clement Leger <cleger@kalray.eu>
Subject: [PATCH v5 7/8] remoteproc: Allow overriding only sanity_check
Date: Mon,  2 Mar 2020 10:39:01 +0100
Message-Id: <20200302093902.27849-8-cleger@kalray.eu>
In-Reply-To: <20200302093902.27849-1-cleger@kalray.eu>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, Patrice Chotard <patrice.chotard@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Clement Leger <cleger@kalray.eu>
List-ID: <linux-remoteproc@vger.kernel.org>

Now that rproc_elf_sanity_check can be used by external drivers, allow
to only overwrite the sanity_check member of rproc_ops. This will allow
drivers to handle elf32 and elf64 by overwriting sanity_check with
rproc_elf_sanity_check function.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 99f0b796fbc7..b932a64a2be2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2055,7 +2055,8 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 		rproc->ops->load = rproc_elf_load_segments;
 		rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 		rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
-		rproc->ops->sanity_check = rproc_elf32_sanity_check;
+		if (!rproc->ops->sanity_check)
+			rproc->ops->sanity_check = rproc_elf32_sanity_check;
 		rproc->ops->get_boot_addr = rproc_elf_get_boot_addr;
 	}
 
-- 
2.15.0.276.g89ea799
