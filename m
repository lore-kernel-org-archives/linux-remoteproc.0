Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 17/18] remoteproc: stm32: Add the pa to da ops.
Date: Thu, 16 Apr 2020 18:13:30 +0200
Message-ID: <20200416161331.7606-18-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add pa_to_da ops to translate the physical address into
device address.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Change-Id: Ie1aa26769635d6d4c4581486700c4061f0f99ff1
---
 drivers/remoteproc/stm32_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a18f88044111..1dd4c0f9c423 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -507,6 +507,7 @@ static struct rproc_ops st_rproc_ops = {
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
+	.pa_to_da	= stm32_rproc_pa_to_da,
 };
 
 static const struct of_device_id stm32_rproc_match[] = {
-- 
2.17.1
