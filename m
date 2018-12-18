Return-Path: <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 11:16:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] remoteproc: fix a ! vs ~ typo
Message-ID: <20181218081657.GA32567@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Patrice Chotard <patrice.chotard@st.com>, Peter Griffin <peter.griffin@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This is from static analysis and not from testing.  It doesn't really
make sense to talk about !BIT(0) so probably ~BIT(0) was intended.
I had to cast it from unsigned long to unsigned int to silence a GCC
warning.

Fixes: bb6869b21478 ("Peter Griffin <peter.griffin@linaro.org>")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

Sorry for the crap commit message.  I'm pretty sure the static checker
warning is correct, but I don't know what the run time impact of this
bug would be.

 drivers/remoteproc/st_slim_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index d711d9430a4f..a646dfb9d6cd 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -128,7 +128,7 @@ static int slim_rproc_start(struct rproc *rproc)
 	writel(SLIM_STBUS_SYNC_DIS, slim_rproc->peri + SLIM_STBUS_SYNC_OFST);
 
 	/* enable cpu pipeline clock */
-	writel(!SLIM_CLK_GATE_DIS,
+	writel((unsigned int)~SLIM_CLK_GATE_DIS,
 		slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
 
 	/* clear int & cmd mailbox */
@@ -167,7 +167,7 @@ static int slim_rproc_stop(struct rproc *rproc)
 	/* disable cpu pipeline clock */
 	writel(SLIM_CLK_GATE_DIS, slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
 
-	writel(!SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
+	writel((unsigned int)~SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
 
 	val = readl(slim_rproc->slimcore + SLIM_EN_OFST);
 	if (val & SLIM_EN_RUN)
-- 
2.17.1
