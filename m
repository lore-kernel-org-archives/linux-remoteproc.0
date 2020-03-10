Return-Path: <natechancellor@gmail.com>
Return-Path: <natechancellor@gmail.com>
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] remoteproc/mediatek: Use size_t type for len in scp_da_to_va
Date: Tue, 10 Mar 2020 14:15:14 -0700
Message-Id: <20200310211514.32288-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Clang errors:

drivers/remoteproc/mtk_scp.c:364:14: error: incompatible function
pointer types initializing 'void *(*)(struct rproc *, u64, size_t)' (aka
'void *(*)(struct rproc *, unsigned long long, unsigned int)') with an
expression of type 'void *(struct rproc *, u64, int)' (aka 'void
*(struct rproc *, unsigned long long, int)')
[-Werror,-Wincompatible-function-pointer-types]
        .da_to_va       = scp_da_to_va,
                          ^~~~~~~~~~~~
1 error generated.

Make the same change as commit 0fcbb369f052 ("remoteproc: Use size_t
type for len in da_to_va"), which was not updated for the acceptance of
commit 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183").

Fixes: 0fcbb369f052 ("remoteproc: Use size_t type for len in da_to_va")
Link: https://github.com/ClangBuiltLinux/linux/issues/927
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 7ccdf64ff3ea..ea3743e7e794 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -320,7 +320,7 @@ static int scp_start(struct rproc *rproc)
 	return ret;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int offset;
-- 
2.26.0.rc1
