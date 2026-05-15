Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225B43CF674;
	Fri, 15 May 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840860; cv=fail; b=SfKvEWXoQYV5otQKybw3zqf0r+0BrG+hpbLE9bINoLwAFAfpD5zUZusMWItVXGtsAP9OmfpWCNP87J7Qy3B2Sf+z0Cw/5WJR7/bnZNRve5cgKEMGvdB04d4MmK7ZRi1+ef1ZUTarbjL/6IljTPg+MkNM8bsUApF1CkDNbzDXQ7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840860; c=relaxed/simple;
	bh=xqjKjH20NdQmKQXY9OzOZZeokryUxj6O/BV193RMCCo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAx79BY+uCow7zjKnLY0Jgc0A4eHao++9OsThJ6ibbvxOMH1iZvGQcPyaXzvy7VAUHQvqTDcS/VA9AslaStyk2jNh5IOVU+RT+BVsbTbQ4O9+lDTS19mukpnNvh3OTpGLvJAV+1N0CjSodWQCXM5ldPg1S2ixxNnlr9ULUBEUpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gna75OX1NNgdC/Jas1IhjurVZqwspeD1ukU5g4pE449X+Fm++1OT+Zcttb6ukOaoaj4R8ZRBhPq+C0U8WFofZVf4OQheG7Ko8QENHbYyi6EXveoxWDvdw9BSc8Ma2qbGScPZy7TKOJxcFC4XZ2YbpbxN+rr0cQnsMx6/6cuteLHgV6J/Oc6lmKPAZuhzYZR2m5ppPYBBgy2z+UALeHsUb78CYaxUCkwENAo0Jyab6oQ5pGObCE9PeJRVMCIlqbV7l89Vy+8AFPrIfOFw3u965pKrdDb6Q/gfQqu+gS/I4U6J3gXkMFSTLPJ/EIaB+8VcAlkdob8BEQPi3HsmcFTbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp9uzXDtylnQwQO7vq6Wv0NvLVLg6za3MDpZa+Phuck=;
 b=ZzDLpCemI2M7Ill4L+hlwdpWEq26oe8TlLbRPVSFeOhKz3wkMZVasZoMckvQzp7nI3b7H2m2gSy1O9dS9y86vHSFRnQf3SvKqeHwky7Hn5E/VSC/g6EIchmbf2U6SVtvZeYV/OaE0s5NpIpLL63gQZqH4Jkm8e7BcIO1KKflXneI9irrM0lSN9P7hhd16L6NrKW0ZFKCtpKaVsz0BS1VLsqhryfP1/LpL2pYRaR3XJBNB67jKBMx0hSQLOvdawLdiJTVye7gXsEHKJgQf/AmxpPmIPh8oexQqhvaJ2UGqvW5xxRpbU4ZnjKxK8ENvuN8hnZOGCYs7sQ+OR5HASAcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138) by
 NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn (10.2.8.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Fri, 15 May 2026 09:54:07 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9913.012; Fri, 15 May 2026 09:54:07 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 2/2] hwspinlock: Add StarFive hwspinlock device
Date: Fri, 15 May 2026 17:53:57 +0800
Message-Id: <20260515095357.75998-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
References: <20260515095357.75998-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::7) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: 5661b713-0b94-454a-03d7-08deb267e7cc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o0NR3DqrydHjfwJ5tOqVwDWZtxDjqujpkUaosf7w2KilC4aTR/Pc/F2U04jCt7MHPIlB1BaJZIEnuBxu8brbv/OgLUR4nbSLK70E0gK7YVmg6CZlDl85QUJzUbQFOx1LHM4AaEZubPbT60h/Vkf0i6maDvYZNIfczS7DaPnTIYyyvg35y88HI12wSgI8mKSjtOJghpWFbUiDJGZSdZdKTA7wR0BHq+5em1Y1ALX8a4sxZruGqlyRAl8gztzvr6cwd7duWxypy1ycBIlsC5ry24Qp0FFy4BoO1l8aFLYqSMtpUoJMu7npsJd95ARGF7eRLvW28GjWv+V7h5WNCUfeMFqnzo+srsm5YnsC02OzKgN1Tk19YdyELI9I9mYP2gcE04vGkikvmqMNWOAU8x5z12YB48lL8xIcuL/fqbAOSh6KViRrlGojVJG6h8earvFwCvME4yxYDWsZIszAWOJDxRUI9003Os77D4BM9cAjWZWAbw92bYqHqyU8Ba8g0IUBDT8pxUSX6GP+YUU+gPuc9NaeGpuhzI++qEmEjwU/XbTdBdUsALA7w2IpbqMcgh+j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?da8TkfKLOtOmYAx5WvnqP2yXERPaqo08xj4zptER87gBr2gnh3kdDBbKDvV9?=
 =?us-ascii?Q?Qsxvy9HGa9nIcP70tXfUEShvYWoVLFZWA88qUW6Uiej0sYOuaPruheoqAxsA?=
 =?us-ascii?Q?LyyUKjiwpgFLO5AAgSIa35esjNnQw2OCWpX9rqipx6fiopkdLVFrTWDtXIqD?=
 =?us-ascii?Q?GaRlcodOC648pm7RMBfKuhZZbsaaEflKjybSrVmHzDoucUGJf0JEle5plRv2?=
 =?us-ascii?Q?SzSi6OYYz6pzHrutOO6yl2zLnnXh0gkpckEeWGspnzQqfAXEGpHnHzaueebs?=
 =?us-ascii?Q?f3t8Fbz0L6+CfYLkqI2+/+Bwj/aAi4QcXZc4SkjkTbA0nAIxgcnDCR3uoB2m?=
 =?us-ascii?Q?OvPKCIowgEoFb9VTX0xXfXyiwSHBaY1bpZwRlCEVeBZH02UwK+vqffl79E3G?=
 =?us-ascii?Q?U+kTjqLwgARdzKHX/IalNwCLg7SuAmvf+9ZWXPf52NnJ+1iVZ1/uwUJQCbNH?=
 =?us-ascii?Q?Agqo8bVDILwi8ciIpyLXtmhYB+O9YdEoIvsZP/Jc0mbXtE2yDXPVd7DTSTBX?=
 =?us-ascii?Q?CXVjNmZ3OVwvUVlMYJw5/c2D3kV0Ts7sKKq/Xsmvex31VOGOm2SGytfDpI15?=
 =?us-ascii?Q?T/CXhRHwi0MlePCGx4hB2gTtdwUdsqo7Gxg2F+1TbCn6rjaDds4AFL6FlpFv?=
 =?us-ascii?Q?edurc5DF+SzLBcXkLhTpuUioGPPfV7lc4GsNUOTW4joldxrsW43dUAqxXT/b?=
 =?us-ascii?Q?KKqiw/1ppTahJg6OjC3Z/JiVCSZVQqwtDc/Yjo6tgHcEhiNDtc4ND2bar79b?=
 =?us-ascii?Q?JG7Oe4wniwPqjWlE4zA/dmM2oix/yhzYM5MhfagB4bpwIPpRkDg2dXE8pXtg?=
 =?us-ascii?Q?vwvFHBE+rcxqUVZUfJG+P973VFITCO+/tXRdn2IdN8n4LEFbEMada8CZURF0?=
 =?us-ascii?Q?DIBmQtXgRZ3QrQVH2GzRliruaColZCKccd21fRBMIYQoKcHuFmaaON3GCwRo?=
 =?us-ascii?Q?9XmcOn2RkFvmJj3qN8XwlTHOcv6Nr4GjJ2MamEYVTH2tdFKEdvu7AXaA4fcl?=
 =?us-ascii?Q?S/ueX5nCqrgSpt7z5C7zwgr6F3PNrxkFoeSMODqE0fNgKCSw+CQf53I/ArlF?=
 =?us-ascii?Q?yfJ+tnQ4+YJzvHbaUswFjvLsJjFO/6yciees+OA1YZB6tUSHqBhdoylXfWVO?=
 =?us-ascii?Q?8KjiW/xlFBaMhE2eJQyHcTzGRgyC+JA5sMPuLU0ZAljQJiXIUmkhlpyTsYQr?=
 =?us-ascii?Q?BXndeB3N9m9c2O8BbRtJauU24s+E2xzVS+pRyAzKGGdQ9KTfz4c0LDSVjRv/?=
 =?us-ascii?Q?hxhBaEnRrsSrf6hHhGJmAsWoD2DOu0hc5FubsV9gjfU0SUjye2dR3Zf0aJOW?=
 =?us-ascii?Q?0ztTsnlrFurEDUiEE2bSyCfR8lr+MmQKKh6G+weqCUmOa2RVSUA3kFZwaZi/?=
 =?us-ascii?Q?hY99f4oOaW8oq7N/jsFxvjjRFkHvKuAXn3RpNrPReSWBEx+CTjrRmjet+oVv?=
 =?us-ascii?Q?ReodgpHz5YjzWKZOAtQRxMHCZWCl3yl2B77JTKevoyMB7g9KnebPYO8j1NdE?=
 =?us-ascii?Q?YLekzN/srN3KyvIEdjQ299r2bvdCgCCzf/r99GRVZWUmVwyHmhoq/E8ZlORU?=
 =?us-ascii?Q?Nntb1UWE1LFQbGKyl4YhJEurYPvl3Y99D6+J0Da+y0Xb6HlOnWx3NDNX+KWt?=
 =?us-ascii?Q?WZz8SQrafUnfoJ+hIHHJAiiLLwndAyN3Wu/WqcyiUOHdznEl3Exazbr2z9xU?=
 =?us-ascii?Q?3NB1l0vckkKdeGugYehBaXMHaxA9pliKm0rHo0nfPGR/urZEg1o12WjZgQMt?=
 =?us-ascii?Q?xuycRsprJyvIgqL/db559+Qxw0xQoWg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5661b713-0b94-454a-03d7-08deb267e7cc
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 09:54:07.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sx3Z8y7PS4ZJ/XG0UQaITMVeHhtnDBxZAqpF22Vzlin9ZdyFddLpLJ74GiA5gy9uy4q6d/oXQHvWEKoYcQsRjYLP5k0ewYh61AhucayYC/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002

Add support of hardware spinlock for the StarFive JHB100 SoC.
The hwspinlock provides 16 channels for using by secur core and AP core.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 MAINTAINERS                              |   6 ++
 drivers/hwspinlock/Kconfig               |   8 ++
 drivers/hwspinlock/Makefile              |   1 +
 drivers/hwspinlock/starfive_hwspinlock.c | 130 +++++++++++++++++++++++
 4 files changed, 145 insertions(+)
 create mode 100644 drivers/hwspinlock/starfive_hwspinlock.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..4ff12806ba09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25275,6 +25275,12 @@ F:	Documentation/devicetree/bindings/power/starfive*
 F:	drivers/pmdomain/starfive/
 F:	include/dt-bindings/power/starfive,jh7110-pmu.h
 
+STARFIVE JHB100 HARDWARE SPINLOCK DRIVER
+M:      Xingyu Wu <xingyu.wu@starfivetech.com>
+S:      Supported
+F:      Documentation/devicetree/bindings/hwlock/starfive,jhb100-hwspinlock.yaml
+F:      drivers/hwspinlock/starfive_hwspinlock.c
+
 STARFIVE SOC DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
diff --git a/drivers/hwspinlock/Kconfig b/drivers/hwspinlock/Kconfig
index 3874d15b0e9b..797f5a833547 100644
--- a/drivers/hwspinlock/Kconfig
+++ b/drivers/hwspinlock/Kconfig
@@ -36,6 +36,14 @@ config HWSPINLOCK_SPRD
 
 	  If unsure, say N.
 
+config HWSPINLOCK_STARFIVE
+	tristate "StarFive Hardware Spinlock device"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	help
+	  Say y here to support the StarFive Hardware Spinlock device.
+
+	  If unsure, say N.
+
 config HWSPINLOCK_STM32
 	tristate "STM32 Hardware Spinlock device"
 	depends on MACH_STM32MP157 || COMPILE_TEST
diff --git a/drivers/hwspinlock/Makefile b/drivers/hwspinlock/Makefile
index a0f16c9aaa82..bc713bdc7e04 100644
--- a/drivers/hwspinlock/Makefile
+++ b/drivers/hwspinlock/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_HWSPINLOCK)		+= hwspinlock_core.o
 obj-$(CONFIG_HWSPINLOCK_OMAP)		+= omap_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_QCOM)		+= qcom_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SPRD)		+= sprd_hwspinlock.o
+obj-$(CONFIG_HWSPINLOCK_STARFIVE)       += starfive_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_STM32)		+= stm32_hwspinlock.o
 obj-$(CONFIG_HWSPINLOCK_SUN6I)		+= sun6i_hwspinlock.o
 obj-$(CONFIG_HSEM_U8500)		+= u8500_hsem.o
diff --git a/drivers/hwspinlock/starfive_hwspinlock.c b/drivers/hwspinlock/starfive_hwspinlock.c
new file mode 100644
index 000000000000..d85f43a48013
--- /dev/null
+++ b/drivers/hwspinlock/starfive_hwspinlock.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware spinlock driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include "hwspinlock_internal.h"
+
+/* reg offset */
+#define STARFIVE_REG_APP_LOCK_REQ		0x08
+#define STARFIVE_REG_APP_LOCK_RLS		0x0C
+#define STARFIVE_REG_LOCK_STA			0x10
+
+/* macro STARFIVE_REG_LOCK_STA reg*/
+#define STARFIVE_STA_APP_OWN			BIT(1)
+#define STARFIVE_STA_OWN_MSK			0x3
+
+#define STARFIVE_NUM_LOCKS			16
+
+struct starfive_hwspinlock {
+	void __iomem *base;
+	struct reset_control *rst;
+	struct hwspinlock_device bank;
+};
+
+static int starfive_hwspinlock_trylock(struct hwspinlock *lock)
+{
+	struct starfive_hwspinlock *priv = dev_get_drvdata(lock->bank->dev);
+	int id = hwlock_to_id(lock);
+	u32 status;
+
+	writel(BIT(id), priv->base + STARFIVE_REG_APP_LOCK_REQ);
+	status = (readl(priv->base + STARFIVE_REG_LOCK_STA) >> (2 * id)) &
+		 STARFIVE_STA_OWN_MSK;
+
+	return (status == STARFIVE_STA_APP_OWN);
+}
+
+static void starfive_hwspinlock_unlock(struct hwspinlock *lock)
+{
+	struct starfive_hwspinlock *priv = dev_get_drvdata(lock->bank->dev);
+	int id = hwlock_to_id(lock);
+
+	writel(BIT(id), priv->base + STARFIVE_REG_APP_LOCK_RLS);
+}
+
+static void starfive_hwspinlock_relax(struct hwspinlock *lock)
+{
+	ndelay(50);
+}
+
+static const struct hwspinlock_ops starfive_hwspinlock_ops = {
+	.trylock	= starfive_hwspinlock_trylock,
+	.unlock		= starfive_hwspinlock_unlock,
+	.relax		= starfive_hwspinlock_relax,
+};
+
+static void starfive_hwspinlock_disable(void *data)
+{
+	struct starfive_hwspinlock *priv = data;
+
+	reset_control_assert(priv->rst);
+}
+
+static int starfive_hwspinlock_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct starfive_hwspinlock *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, struct_size(priv, bank.lock, STARFIVE_NUM_LOCKS),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->rst = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(dev, PTR_ERR(priv->rst),
+				     "failed to get reset\n");
+
+	ret = reset_control_deassert(priv->rst);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = devm_add_action_or_reset(dev, starfive_hwspinlock_disable, priv);
+	if (ret)
+		goto fail_action;
+
+	return devm_hwspin_lock_register(dev, &priv->bank, &starfive_hwspinlock_ops,
+					 0, STARFIVE_NUM_LOCKS);
+
+fail_action:
+	reset_control_assert(priv->rst);
+	return ret;
+}
+
+static const struct of_device_id starfive_hwpinlock_ids[] = {
+	{ .compatible = "starfive,jhb100-hwspinlock", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, starfive_hwpinlock_ids);
+
+static struct platform_driver starfive_hwspinlock_driver = {
+	.probe		= starfive_hwspinlock_probe,
+	.driver		= {
+		.name	= "starfive_hwspinlock",
+		.of_match_table = starfive_hwpinlock_ids,
+	},
+};
+module_platform_driver(starfive_hwspinlock_driver);
+
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Hardware spinlock driver for StarFive JHB100 SoC");
-- 
2.34.1

