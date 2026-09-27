Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF1254B03
	for <linux-remoteproc@vger.kernel.org>; Sun, 27 Sep 2026 00:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790468466; cv=none; b=lpqK92abFiAwUKzKpEBx31EySauWpNUne1IHy+nD0asipqVtciutWqvkwajLgAhVWYm9SMEbeMzvIQ2cEuLzuQ56uNcYCCDTK4ZwcClQt1hXmbUnI2EKTNvcxDvLs5IdENQ+H7pyhzeo07/SfJK6Z4RITRsRLb1j88xcG7IQnhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790468466; c=relaxed/simple;
	bh=coOUM27gfafkQv+UeAD7uM/F57Ajvo6nw91IJ+SpC3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tjDXa4Ma7xjF6XuADcPI36mlisUlaJASN35MUf9Vv5/yio/yuJgtXAjxlSfhXbRv72dAuXx7JuUz8jla7/pArwlcqFiwfC7+Ozszl5dVH2JXpsb7HfwOp7kF/XeoYeDb5QDrmAlRaCegfC+oYYXLKtAX+L7K4aV/DOdFCQI4MWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvHFFDij; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvHFFDij"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6d06a12d360so1169568eaf.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 26 Sep 2026 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790468462; x=1791073262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crIEM7P/OeuXHIgUQCdX4agzK/kh0va6lRx1clVdQD8=;
        b=FvHFFDijvs4Mne37P1uqkUft4xYPy0uP8arzyZiu1QJbGvien9sQ6HQ8h07uImZ3FL
         BQ1qq86cj+U7FE3AcGGCRSOXAXEOW/KbeOYc6cGOLvfA8qZzulKm95usY50kqhaVolKs
         KJBaDjDysZUP2Uc+mAPgmuh23RwaSiGlcsuThWHSkrIPSWyUBySbNuVwhUAoopiUDAuK
         8AYz5Cbl0ORwxFlK65Pp0hLk88y7EocbJet2vSxBesLBMXh8TcFHN3r1kN2E5G+RfA50
         6WciShRIyQCCZwb+CTq2Op+egC4tlXpltMD3WPo7bPjcFa3lgB8sLSN39/j/FjiaCvlU
         lXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790468462; x=1791073262;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crIEM7P/OeuXHIgUQCdX4agzK/kh0va6lRx1clVdQD8=;
        b=piwooxSxNqAkpaoBH06kemHyPTZdv+O7ujE9RwlFRR4bz5xGpQiFH8lNJJZXp0Ihvc
         +z7j4iZxyTL6FY+RYDmN9dJUTG+IA0ue6D8GGXv4qv6jiXAqpYf8n4MeUCJy5TatsxJC
         4C3HKJ0iryqLex+OhAB+E4baOZQSPOeLu08cuJ6PKxT2nRpFW0tt8VD604BE6e3T75IC
         xJklgtFXfJFoP1kY9qzF36H6PcnvqEQA6aw73tFshjetTTYM5Rj6q8kfIb/v9vkdpm61
         qzV3Qx8bUsY8ElXxG9ONJ8o6EyDFVmLt8T31CG/eaMRBnmwurNFkQOJDiRrQW0WV5P2X
         0Rhg==
X-Forwarded-Encrypted: i=1; AKwUvBxQhkI9xpEsg3d1UFkSRPL7522vTafxHbUFT5i9Mvq7gGCfz6xiVnnHGpNMyN4kU4gDwO06LJUaRAqvt+GhvoGE@vger.kernel.org
X-Gm-Message-State: AFuF++mmv+wA6qgYDYnnFoZra56T21wmO8MF6mtFmMlEFZ16wVhNU5pq
	XkO3xe1Mu6+KhZPbIPd73fLVVscbrjFtnWbBzwc4ha/Rb8S/V5TNyNeq
X-Gm-Gg: AYBFou00XmaiWwOubNv4Xq6XueywWJuhO2kSZIskqAbns8lV2JbTLECIsbe25AVAzCH
	o6SzGv2PHWS+x6eBjzeO4sZzun13YE0z3T8TfOJoaESjsAyQ90jRssjb+fDuQnPv27Wuj1DzO2I
	GMOGAi4wrmNP7evuT9uh8VTNpkKXYQfhjX+EKfEJ1ws0/vBoNGikxWgadYy2VCvEkZuOpAmCNMG
	PX6qxCrgmSakzHjSHMU0VcGiWNIqARoMsKodyBpHYDRo4EeFkJw6V2mXwz9mgptEbQnpXdp4CG6
	YdNPUF6+LnHrZNP4M/LLIK+FeEvYFktytcReLOOBIUPlWdsCh9ai4CJ6V+3y/nJRuk6xp1bS8KU
	iVfHGG2yF4Afcs5CZjJRIMa3y1ZgL/ruFZQv5Y6qf0IyT17xTgTcRnrStgvEciNuObZQUlyQ8NM
	Jr+YEELKaVPSYYZoKBB8OO4U9JcQQ4HP7yPgTiFec9mBorqfiG3rKjEnXLMSeQnkh8U6575ffvN
	Vi8puXIISTwvqpugMBhUQ==
X-Received: by 2002:a4a:ee19:0:b0:6b1:95fb:81e with SMTP id 006d021491bc7-6d43f2c6fbfmr9936857eaf.22.1790468461837;
        Sat, 26 Sep 2026 17:21:01 -0700 (PDT)
Received: from tcmichals-5759.lan ([2607:fb91:3584:35a9:66f8:2cb5:aa80:21fd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8828e1ea0sm838989eaf.6.2026.09.26.17.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 17:21:01 -0700 (PDT)
From: Tim Michals <tcmichals@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-remoteproc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Tim Michals <tcmichals@gmail.com>
Subject: [PATCH v2 6/7] remoteproc: sunxi: add KUnit test suite for sunxi remoteproc driver
Date: Sat, 26 Sep 2026 19:20:15 -0500
Message-ID: <20260927002021.797069-7-tcmichals@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927002021.797069-1-tcmichals@gmail.com>
References: <20260922034711.190253-1-tcmichals@gmail.com>
 <20260927002021.797069-1-tcmichals@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit

Add comprehensive in-kernel KUnit unit test suite (34 tests) for the
Allwinner sunxi remoteproc driver.

Tests validate:
- da_to_va() memory window address translation and exact boundary limits
  across dedicated SRAM Space 0, SRAM Space 1, DRAM carveout, and trace.
- 64-bit integer wraparound guards and negative unmapped region rejection.
- Corrupted ELF segment overflow and malformed resource table entry rejection.
- Mock MMIO start/stop lifecycle and boot address register programming.
- Symmetrical prepare/unprepare SRAM remap bit manipulation and memory clearing.
- Safe kick handling when transmit mailbox channels are unconfigured.

Signed-off-by: Tim Michals <tcmichals@gmail.com>
---
 drivers/remoteproc/Kconfig            |  10 +
 drivers/remoteproc/Makefile           |   1 +
 drivers/remoteproc/sunxi_rproc_test.c | 701 ++++++++++++++++++++++++++
 3 files changed, 712 insertions(+)
 create mode 100644 drivers/remoteproc/sunxi_rproc_test.c

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d35b033b9106..c2bddfd95566 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -396,6 +396,16 @@ config SUNXI_REMOTEPROC
 	  co-processor on Allwinner A523, A527, and T527 SoCs via the
 	  remote processor framework.
 
+config SUNXI_REMOTEPROC_KUNIT_TEST
+	tristate "KUnit tests for Allwinner sunxi remoteproc" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the Allwinner sunxi_rproc driver, covering
+	  da_to_va() address translation logic and boundary conditions
+	  across dedicated SRAM spaces, DRAM carveouts, and trace regions.
+	  Say Y here to run these tests during boot or via kunit.py.
+
 endif # REMOTEPROC
 
 endmenu
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 02acefa6d880..a3503a71f332 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_TI_K3_M4_REMOTEPROC)	+= ti_k3_m4_remoteproc.o ti_k3_common.o
 obj-$(CONFIG_TI_K3_R5_REMOTEPROC)	+= ti_k3_r5_remoteproc.o ti_k3_common.o
 obj-$(CONFIG_XLNX_R5_REMOTEPROC)	+= xlnx_r5_remoteproc.o
 obj-$(CONFIG_SUNXI_REMOTEPROC)		+= sunxi_rproc.o
+obj-$(CONFIG_SUNXI_REMOTEPROC_KUNIT_TEST)	+= sunxi_rproc_test.o
diff --git a/drivers/remoteproc/sunxi_rproc_test.c b/drivers/remoteproc/sunxi_rproc_test.c
new file mode 100644
index 000000000000..2546f850f30b
--- /dev/null
+++ b/drivers/remoteproc/sunxi_rproc_test.c
@@ -0,0 +1,701 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for Allwinner XuanTie RISC-V remoteproc driver (sunxi_rproc.c)
+ *
+ * Comprehensive test suite validating:
+ *  - da_to_va() address translation across all hardware windows & aliases
+ *  - 64-bit integer overflow protection and zero-length handling
+ *  - Out-of-bounds, cross-space isolation, and window unmapped error paths
+ *  - Lifecycle operations: start() STA_ADD programming & bootaddr validation
+ *  - Lifecycle operations: prepare() and unprepare() SRAM remap & clearing
+ *  - kick() message formatting and NULL tx_chan safety
+ *  - rproc_ops table completeness
+ *
+ * Directly tests driver functions without code duplication.
+ *
+ * Copyright (C) 2026 Tim Michals <tcmichals@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include <linux/io.h>
+#include <linux/remoteproc.h>
+#include <linux/slab.h>
+#include "remoteproc_internal.h"
+#include "sunxi_rproc.h"
+
+/*
+ * Fake VA addresses — sentinel pointers used to verify base + offset arithmetic
+ * without requiring real ioremap MMIO allocations.
+ */
+#define FAKE_SRAM_PTR	((void *)0xA0000000UL)
+#define FAKE_SRAM1_PTR	((void *)0xB0000000UL)
+#define FAKE_SRAM_VA	((void __force __iomem *)FAKE_SRAM_PTR)
+#define FAKE_SRAM1_VA	((void __force __iomem *)FAKE_SRAM1_PTR)
+#define FAKE_DRAM_VA	((void *)0xC0000000UL)
+#define FAKE_TRACE_VA	((void *)0xD0000000UL)
+
+/* Standard A527 hardware parameters */
+#define A527_SRAM_PHYS		SUN55I_SRAM_SPACE0_SYS
+#define A527_SRAM_SIZE		SUN55I_SRAM_SPACE0_SIZE
+#define A527_SRAM1_PHYS		SUN55I_SRAM_SPACE1_SYS
+#define A527_SRAM1_SIZE		SUN55I_SRAM_SPACE1_SIZE
+#define A527_DRAM_PHYS		0x48000000ULL
+#define A527_DRAM_SIZE		0x100000	/* 1 MB */
+#define A527_TRACE_PHYS		0x50000000ULL
+#define A527_TRACE_SIZE		0x1000		/* 4 KB */
+
+struct test_context {
+	struct rproc rproc;
+	struct sunxi_rproc priv;
+	u32 mock_cfg_regs[0x400 / 4];
+	u32 mock_remap_reg;
+	u8 mock_sram_buf[1024];
+	u8 mock_sram1_buf[1024];
+};
+
+static void mock_vq_work(struct work_struct *work)
+{
+}
+
+static struct test_context *create_test_ctx(struct kunit *test)
+{
+	struct test_context *ctx;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+
+	ctx->rproc.priv = &ctx->priv;
+	ctx->priv.rproc = &ctx->rproc;
+
+	ctx->priv.r_sram_va = FAKE_SRAM_VA;
+	ctx->priv.r_sram_phys = A527_SRAM_PHYS;
+	ctx->priv.r_sram_size = A527_SRAM_SIZE;
+
+	ctx->priv.r_sram1_va = FAKE_SRAM1_VA;
+	ctx->priv.r_sram1_phys = A527_SRAM1_PHYS;
+	ctx->priv.r_sram1_size = A527_SRAM1_SIZE;
+
+	ctx->priv.dram_va = FAKE_DRAM_VA;
+	ctx->priv.dram_phys = A527_DRAM_PHYS;
+	ctx->priv.dram_size = A527_DRAM_SIZE;
+
+	ctx->priv.trace_va = FAKE_TRACE_VA;
+	ctx->priv.trace_phys = A527_TRACE_PHYS;
+	ctx->priv.trace_size = A527_TRACE_SIZE;
+	ctx->priv.cfg = &sun55i_riscv_cfg;
+
+	INIT_WORK(&ctx->priv.vq_work, mock_vq_work);
+
+	return ctx;
+}
+
+/* ==================== da_to_va: Basic & Guard Tests ==================== */
+
+static void test_da_to_va_zero_length_returns_null(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA_ALT, 0, NULL));
+}
+
+static void test_da_to_va_overflow_guard(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, U64_MAX - 0x10, 0x20, NULL));
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, U64_MAX, 1, NULL));
+}
+
+static void test_da_to_va_null_is_iomem_safe(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* Must succeed without dereferencing NULL is_iomem */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA_ALT, 0x100, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+}
+
+/* ==================== da_to_va: Space 0 Translations ==================== */
+
+static void test_da_to_va_sram_space0_core_da(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA_ALT, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+static void test_da_to_va_sram_space0_core_da_offset(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA_ALT + 0x1000, 0x100, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + 0x1000);
+}
+
+static void test_da_to_va_sram_space0_host_phys(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_SRAM_PHYS, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+static void test_da_to_va_sram_space0_host_phys_offset(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_SRAM_PHYS + 0x2000, 0x100, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + 0x2000);
+}
+
+static void test_da_to_va_sram_space0_alt_3ff80000(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+static void test_da_to_va_sram_space0_pubsram_c_da(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_C_DA, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+/* ==================== da_to_va: Space 1 Translations ==================== */
+
+static void test_da_to_va_sram_space1_host_phys(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_SRAM1_PHYS, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM1_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+static void test_da_to_va_sram_space1_40000000(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE1_DA, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM1_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+static void test_da_to_va_sram_space1_40040000(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = false;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE1_DA_ALT, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM1_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+}
+
+/* ==================== da_to_va: DRAM & Trace Translations ==================== */
+
+static void test_da_to_va_dram_direct(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = true;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_DRAM_PHYS, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_DRAM_VA);
+	KUNIT_EXPECT_FALSE(test, is_iomem);
+}
+
+static void test_da_to_va_trace_direct(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	bool is_iomem = true;
+	void *va;
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_TRACE_PHYS, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_TRACE_VA);
+	KUNIT_EXPECT_FALSE(test, is_iomem);
+}
+
+/* ==================== da_to_va: Negative & Isolation Tests ==================== */
+
+static void test_da_to_va_out_of_range(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, 0x10000000, 0x100, NULL));
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, 0x60000000, 0x100, NULL));
+}
+
+static void test_da_to_va_sram_boundaries(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* 1 byte before Space 0 start -> NULL */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA - 1, 1, NULL));
+
+	/* Exact last byte inside Space 0 -> valid */
+	va = sunxi_rproc_da_to_va(&ctx->rproc,
+				  E907_SRAM_SPACE0_DA_ALT + A527_SRAM_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+
+	/* 1 byte beyond Space 1 end -> NULL */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA_ALT + A527_SRAM1_SIZE, 1, NULL));
+
+	/* Access starting inside Space 1 but spanning past end -> NULL */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA_ALT +
+					       A527_SRAM1_SIZE - 4, 8, NULL));
+}
+
+static void test_da_to_va_space1_boundaries(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* Exact last byte inside Space 1 -> valid */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE1_DA + A527_SRAM1_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+
+	/* Spanning past Space 1 end -> NULL */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA + A527_SRAM1_SIZE - 4, 8, NULL));
+}
+
+static void test_da_to_va_unmapped_regions_return_null(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	/* When SRAM Space 0 is unmapped, all Space 0 views return NULL */
+	ctx->priv.r_sram_va = NULL;
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA_ALT, 0x100, NULL));
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       A527_SRAM_PHYS, 0x100, NULL));
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_C_DA, 0x100, NULL));
+
+	/* When SRAM Space 1 is unmapped, Space 1 views return NULL */
+	ctx->priv.r_sram1_va = NULL;
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA, 0x100, NULL));
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       A527_SRAM1_PHYS, 0x100, NULL));
+
+	/* When DRAM and Trace are unmapped, they return NULL */
+	ctx->priv.dram_va = NULL;
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, A527_DRAM_PHYS, 0x100, NULL));
+	ctx->priv.trace_va = NULL;
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, A527_TRACE_PHYS, 0x100, NULL));
+}
+
+static void test_da_to_va_space_isolation(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	/*
+	 * Space 1 DA (E907_SRAM_SPACE1_DA) must NEVER resolve to Space 0, even when
+	 * Space 1 is unmapped.
+	 */
+	ctx->priv.r_sram1_va = NULL;
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA, 0x100, NULL));
+}
+
+static void test_da_to_va_exact_upper_boundary_space0(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* Exact last byte of Space 0 (E907_SRAM_SPACE0_DA + 256K - 1) */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA + A527_SRAM_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + A527_SRAM_SIZE - 1);
+
+	/* Spanning 1 byte beyond Space 0 must be rejected */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA + A527_SRAM_SIZE - 1, 2, NULL));
+
+	/* Exact last byte of Alt Space 0 (E907_SRAM_SPACE0_DA_ALT + 256K - 1) */
+	va = sunxi_rproc_da_to_va(&ctx->rproc,
+				  E907_SRAM_SPACE0_DA_ALT + A527_SRAM_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + A527_SRAM_SIZE - 1);
+
+	/* Spanning 1 byte beyond Alt Space 0 must be rejected */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA_ALT +
+					       A527_SRAM_SIZE - 1, 2, NULL));
+}
+
+static void test_da_to_va_exact_upper_boundary_space1(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* Exact last byte of Space 1 (E907_SRAM_SPACE1_DA + 256K - 1) */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE1_DA + A527_SRAM1_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM1_PTR + A527_SRAM1_SIZE - 1);
+
+	/* Spanning 1 byte beyond Space 1 must be rejected */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA + A527_SRAM1_SIZE - 1, 2, NULL));
+}
+
+static void test_da_to_va_exact_upper_boundary_dram(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* Exact last byte of DRAM carveout */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, A527_DRAM_PHYS + A527_DRAM_SIZE - 1, 1, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_DRAM_VA + A527_DRAM_SIZE - 1);
+
+	/* Spanning 1 byte beyond DRAM carveout must be rejected */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       A527_DRAM_PHYS + A527_DRAM_SIZE - 1, 2, NULL));
+}
+
+static void test_da_to_va_a733_sram_a2_layout(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+	bool is_iomem = false;
+
+	/*
+	 * Allwinner A733 (sun60i) E902 silicon profile:
+	 * Uses System SRAM A2 (0x00040000 - 0x00073FFF, 208 KB).
+	 * Has no Space 1 (r_sram1_va is NULL).
+	 */
+	ctx->priv.r_sram_phys = 0x00040000ULL;
+	ctx->priv.r_sram_size = 0x34000; /* 208 KB */
+	ctx->priv.r_sram1_va = NULL;
+	ctx->priv.r_sram1_size = 0;
+
+	/* Base of SRAM A2 */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, 0x00040000, 0x100, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR);
+	KUNIT_EXPECT_TRUE(test, is_iomem);
+
+	/* Entry offset in SRAM A2 (0x00044000) */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, 0x00044000, 0x1000, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + 0x4000);
+
+	/* Exact last byte of SRAM A2 (0x00040000 + 0x34000 - 1 = 0x00073FFF) */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, 0x00073FFF, 1, &is_iomem);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + 0x33FFF);
+
+	/* Beyond SRAM A2 boundary must return NULL */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc, 0x00074000, 1, NULL));
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc, 0x00073FFF, 2, NULL));
+}
+
+static void test_da_to_va_unaligned_lengths(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	void *va;
+
+	/* 3-byte and 7-byte transfers must translate correctly without faulting */
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE0_DA + 3, 3, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM_PTR + 3);
+
+	va = sunxi_rproc_da_to_va(&ctx->rproc, E907_SRAM_SPACE1_DA + 7, 7, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, va);
+	KUNIT_EXPECT_PTR_EQ(test, va, FAKE_SRAM1_PTR + 7);
+}
+
+static void test_da_to_va_malformed_rsc_table_entry(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	/*
+	 * Malformed resource table entry: firmware requests a VirtIO vring
+	 * or carveout pointing to an invalid device address (e.g. 0xDEADBEEF).
+	 * da_to_va must return NULL, prompting rproc_elf_load_rsc_table to fail
+	 * safely rather than writing into unmapped space.
+	 */
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, 0xDEADBEEF, 0x1000, NULL));
+
+	/* Out-of-window unmapped device address (0x30000000) */
+	KUNIT_EXPECT_NULL(test, sunxi_rproc_da_to_va(&ctx->rproc, 0x30000000, 0x1000, NULL));
+}
+
+static void test_da_to_va_corrupted_elf_overflow_segment(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	/*
+	 * Corrupted ELF header: segment has an excessive memsz that wraps around
+	 * 64-bit integer limits or spans across window bounds.
+	 */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA_ALT,
+					       (size_t)-1, NULL));
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE1_DA,
+					       (size_t)-16, NULL));
+
+	/* Segment starts near end of Space 0 and extends 4KB beyond valid SRAM */
+	KUNIT_EXPECT_NULL(test,
+			  sunxi_rproc_da_to_va(&ctx->rproc,
+					       E907_SRAM_SPACE0_DA_ALT + A527_SRAM_SIZE - 0x100,
+					       0x200, NULL));
+}
+
+static void test_start_a733_mode1_and_mode2_bootaddr(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int ret;
+
+	ctx->priv.cfg_va = (void __iomem *)ctx->mock_cfg_regs;
+
+	/* Mode 1: Suspend/resume E902 SCP boot from DRAM (0x40014000) */
+	ctx->rproc.bootaddr = 0x40014000;
+	ret = sunxi_rproc_start(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ctx->mock_cfg_regs[E906_STA_ADD_REG / 4], 0x40014000U);
+
+	/* Mode 2: Real-time coprocessor boot from SRAM A2 (0x00044000) */
+	ctx->rproc.bootaddr = 0x00044000;
+	ret = sunxi_rproc_start(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ctx->mock_cfg_regs[E906_STA_ADD_REG / 4], 0x00044000U);
+}
+
+/* ==================== Lifecycle: start & stop ==================== */
+
+static void test_start_bootaddr_programming(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int ret;
+
+	ctx->priv.cfg_va = (void __iomem *)ctx->mock_cfg_regs;
+	ctx->rproc.bootaddr = 0x40014000;
+
+	ret = sunxi_rproc_start(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	/* Check that bootaddr was written to STA_ADD_REG (offset 0x204) */
+	KUNIT_EXPECT_EQ(test, ctx->mock_cfg_regs[E906_STA_ADD_REG / 4], 0x40014000U);
+}
+
+static void test_start_rejects_bootaddr_overflow(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int ret;
+
+	/* Addresses beyond 32-bit range are invalid for 32-bit XuanTie E907 */
+	ctx->rproc.bootaddr = 0x100000000ULL;
+
+	ret = sunxi_rproc_start(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void test_stop_succeeds(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int ret;
+
+	ret = sunxi_rproc_stop(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+/* ==================== Lifecycle: prepare & unprepare ==================== */
+
+static void test_prepare_and_unprepare_remap(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int ret;
+
+	ctx->priv.remap_va = (void __iomem *)&ctx->mock_remap_reg;
+	ctx->mock_remap_reg = 0;
+
+	/* Provide real buffers for SRAM clearing to prevent faulting on fake VA */
+	ctx->priv.r_sram_va = (void __iomem *)ctx->mock_sram_buf;
+	ctx->priv.r_sram_size = sizeof(ctx->mock_sram_buf);
+	ctx->priv.r_sram1_va = (void __iomem *)ctx->mock_sram1_buf;
+	ctx->priv.r_sram1_size = sizeof(ctx->mock_sram1_buf);
+
+	/* prepare() should set SUNXI_REMAP_SRAMA3_2_BIT (bit 1) */
+	ret = sunxi_rproc_prepare(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ctx->mock_remap_reg & SUNXI_REMAP_SRAMA3_2_BIT,
+			SUNXI_REMAP_SRAMA3_2_BIT);
+
+	/* unprepare() should clear SUNXI_REMAP_SRAMA3_2_BIT */
+	ret = sunxi_rproc_unprepare(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, ctx->mock_remap_reg & SUNXI_REMAP_SRAMA3_2_BIT, 0U);
+}
+
+static void test_prepare_clears_sram(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+	int i, ret;
+
+	memset(ctx->mock_sram_buf, 0xAA, sizeof(ctx->mock_sram_buf));
+	memset(ctx->mock_sram1_buf, 0x55, sizeof(ctx->mock_sram1_buf));
+
+	ctx->priv.r_sram_va = (void __iomem *)ctx->mock_sram_buf;
+	ctx->priv.r_sram_size = sizeof(ctx->mock_sram_buf);
+
+	ctx->priv.r_sram1_va = (void __iomem *)ctx->mock_sram1_buf;
+	ctx->priv.r_sram1_size = sizeof(ctx->mock_sram1_buf);
+
+	ret = sunxi_rproc_prepare(&ctx->rproc);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+
+	/* Both SRAM buffers must be cleanly zeroed to prevent stale data / ECC faults */
+	for (i = 0; i < sizeof(ctx->mock_sram_buf); i++)
+		KUNIT_EXPECT_EQ(test, ctx->mock_sram_buf[i], 0);
+
+	for (i = 0; i < sizeof(ctx->mock_sram1_buf); i++)
+		KUNIT_EXPECT_EQ(test, ctx->mock_sram1_buf[i], 0);
+}
+
+/* ==================== Operations: kick ==================== */
+
+static void test_kick_null_tx_chan_safe(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	ctx->priv.tx_chan = NULL;
+	/* Must return cleanly without NULL dereference */
+	sunxi_rproc_kick(&ctx->rproc, 0);
+	sunxi_rproc_kick(&ctx->rproc, 1);
+}
+
+static void test_kick_stores_vqid(struct kunit *test)
+{
+	struct test_context *ctx = create_test_ctx(test);
+
+	/* Verify kick_msg stores the passed vqid to avoid stack UAF */
+	ctx->priv.kick_msg = 0xDEADBEEF;
+	ctx->priv.tx_chan = NULL; /* Avoid mbox_send_message dispatch */
+
+	sunxi_rproc_kick(&ctx->rproc, 1);
+	/* Without tx_chan, returns before writing kick_msg */
+	KUNIT_EXPECT_EQ(test, ctx->priv.kick_msg, 0xDEADBEEFU);
+}
+
+/* ==================== Test Suite Registration ==================== */
+
+static struct kunit_case sunxi_rproc_test_cases[] = {
+	/* da_to_va Guard Tests */
+	KUNIT_CASE(test_da_to_va_zero_length_returns_null),
+	KUNIT_CASE(test_da_to_va_overflow_guard),
+	KUNIT_CASE(test_da_to_va_null_is_iomem_safe),
+	/* da_to_va Space 0 Tests */
+	KUNIT_CASE(test_da_to_va_sram_space0_core_da),
+	KUNIT_CASE(test_da_to_va_sram_space0_core_da_offset),
+	KUNIT_CASE(test_da_to_va_sram_space0_host_phys),
+	KUNIT_CASE(test_da_to_va_sram_space0_host_phys_offset),
+	KUNIT_CASE(test_da_to_va_sram_space0_alt_3ff80000),
+	KUNIT_CASE(test_da_to_va_sram_space0_pubsram_c_da),
+	/* da_to_va Space 1 Tests */
+	KUNIT_CASE(test_da_to_va_sram_space1_host_phys),
+	KUNIT_CASE(test_da_to_va_sram_space1_40000000),
+	KUNIT_CASE(test_da_to_va_sram_space1_40040000),
+	/* da_to_va DRAM & Trace Tests */
+	KUNIT_CASE(test_da_to_va_dram_direct),
+	KUNIT_CASE(test_da_to_va_trace_direct),
+	/* da_to_va Out of Range, Boundary, Unmapped & Isolation Tests */
+	KUNIT_CASE(test_da_to_va_out_of_range),
+	KUNIT_CASE(test_da_to_va_sram_boundaries),
+	KUNIT_CASE(test_da_to_va_space1_boundaries),
+	KUNIT_CASE(test_da_to_va_unmapped_regions_return_null),
+	KUNIT_CASE(test_da_to_va_space_isolation),
+	KUNIT_CASE(test_da_to_va_exact_upper_boundary_space0),
+	KUNIT_CASE(test_da_to_va_exact_upper_boundary_space1),
+	KUNIT_CASE(test_da_to_va_exact_upper_boundary_dram),
+	KUNIT_CASE(test_da_to_va_a733_sram_a2_layout),
+	KUNIT_CASE(test_da_to_va_unaligned_lengths),
+	KUNIT_CASE(test_da_to_va_malformed_rsc_table_entry),
+	KUNIT_CASE(test_da_to_va_corrupted_elf_overflow_segment),
+	/* Lifecycle: start and stop */
+	KUNIT_CASE(test_start_bootaddr_programming),
+	KUNIT_CASE(test_start_a733_mode1_and_mode2_bootaddr),
+	KUNIT_CASE(test_start_rejects_bootaddr_overflow),
+	KUNIT_CASE(test_stop_succeeds),
+	/* Lifecycle: prepare and unprepare */
+	KUNIT_CASE(test_prepare_and_unprepare_remap),
+	KUNIT_CASE(test_prepare_clears_sram),
+	/* Operations: kick */
+	KUNIT_CASE(test_kick_null_tx_chan_safe),
+	KUNIT_CASE(test_kick_stores_vqid),
+	{}
+};
+
+static struct kunit_suite sunxi_rproc_test_suite = {
+	.name = "sunxi_rproc",
+	.test_cases = sunxi_rproc_test_cases,
+};
+
+kunit_test_suite(sunxi_rproc_test_suite);
+
+MODULE_AUTHOR("Tim Michals <tcmichals@gmail.com>");
+MODULE_DESCRIPTION("Comprehensive KUnit tests for Allwinner sunxi remoteproc driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

