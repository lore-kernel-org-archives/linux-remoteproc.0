Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E579DA;
	Fri, 24 Apr 2026 03:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777001799; cv=fail; b=UkpzLZpJkr8kgzE14q/Oy5I9ZR9QcFbhslkTDNN5XAt5ISQOfGMuFlvy87r5RorUZPE5eyx0RqeKS/UQiAoUuCTF8y1FkLs/u5dir8fI/aTX+Jo0OR5+Y2BETS/uon0Af/aD3rzGx2ox3GL+02Wr9b0RnmmfJQfm9kAmFrcbPao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777001799; c=relaxed/simple;
	bh=uEUgwcu57LhxUjKjye9nBwXvQDKyJZ0++4xpd6ch6K8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8Povl05elzuSKiX2UrsDKRTxpY43a03BXvy1/FQrsOgCFZvCkQNTHrFJ1pj0n91tpzV0lBA2Kp/eSALwT5OaBVrBE7QJ6+uN2ZOqDONkqgF2nQjvM32VsokQjnIp6UozwtwJRKSGF8h+OROJ9tbL+6m3HhAjCC7heBxC8foK2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpPT588Xeysw8FoAu5ZjFco6/JrgtXFaGHLjhq7L7Qrn8oHTtA1LvZjzSCIdQ2GLgEc47y/qThleWSGg0OGY04j/UHfcBnOT31wz7bpw5TRIV+uPaa40eLbCWD/KQXll9oixFuFLNKrsZhVrhxChrg5dbq3psNe6MUHacVl+dPBQnPvf0OTWp1ZNmsgqKbJIcUUni/z8s9PuU0N6mp48eG4/XdBSBLUKpC85eG+xdV0IVfS1jXpv8gXe/p0OHyTYAqXqxbe43CXjQ78/mAjwYaxbFxtCGqtEdr+n+dg2e3pna19DwW3YcT1VYfzaX9EyIgQ4zncfTDhRj1Xc8+U12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX6sPz/RZmqwuVICM7Yjw0Fu4B827FW27up1vKbmWqU=;
 b=d543kWPNgsicEq+fasFo81blMu03wJU8tfZZwjg/2RstKrYqbrsakAZgB97fr2DHLPV7DPEkhawdfW+oYNAncyabpI9K4Ij1iasB47dUTdBINMpQhBbfpQ57lzKLhEu5A+7jehHeyAg/VEwvTD/+J0/Ast2xwFqIEjiNVwG1VgIJ5XXGI3rl8EV1dey0pCqrIn0d23IH0m438D4nrJ7FWnQ0qh2ESy97lHskZF8fhQG9YqCgdzoFi3vVreEvysNktXJ46M4x40LS5DgvXPnVNkIyKzd9sz8v7KUHm6OI/BOZ2tFHSD+VwkxQ80fZcSdmuYc1GuwYXUovveTdnHAqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB0970.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 03:20:37 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::d8e2:3f39:6ae7:bdf2]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::d8e2:3f39:6ae7:bdf2%6])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 03:20:37 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v1 2/2] hwspinlock: Add StarFive hwspinlock device
Date: Fri, 24 Apr 2026 11:20:26 +0800
Message-Id: <20260424032026.62301-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
References: <20260424032026.62301-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0010.CHNPR01.prod.partner.outlook.cn
 (10.43.34.150) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn (10.2.8.138)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6e6650-65bb-4e8f-ab31-08dea1b07472
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info:
	XIzOElZPOCVhJlANyp9Ue+GRlckoUqqE+qr4N9pwAgRRpm0CUB73yfFSl3aDYvc5uTmVgIWSWcP9Ncc9i2ytzoRx5LCiUh91SAhGZaPUpB1DJbm0PbWZj4eDvDeinOWf7vt72ftybuIefy+OImmDJXg/BDc0Evc3Z140LLl0DBa68Z2bCb+53K/igQXWsoY3C8f3kCguLRC5V6nR0k7NikFCkTEYHIgGIxZOl7pa7DTAe1OmnxNCinBupi3grNg0LTaDBRU2e5/B5Lj/XZO7qobBgxXYY/oJowNUp2GdRg0jlt886ilJgH+UN2lt8oD2L9oOrSeVDBMpKYmhJmGyIFwEpg6WxCFCqEG4Pe53+Y4Hx0Y6A5zC8F2nk6Ia/atzX2ubwiKa10LgNurvvzXij/IAhpWm0zbQZxkmgwd2+lrQWCRMaHk3+O7VIeuwFpcbVbyLQ7YOLqUld0099+VzisiqFPbZj3R/mmmXIACea3yfpTfl54QyOmFUD0YNlmf6kXWku7/oJfKWu6NTh8a1vO9MtYD6KAi2ZU3dSmS/GoHqN58IdjIZJkrVNiVsUjxWqPp9bzoytP+fWTKdMrsJK/krYC1VDWTz/9ZhipPAabk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7sTVyRx3802O2Lkrx7peucRXFaBDCWsxyH6YwZ2NoeQu0RdBFQ0GsufjTdad?=
 =?us-ascii?Q?MV3TAIeNiZwbkzJ4xyjhKLtjmJGK/yk17h6qWf8QTaplusZLkcDdSCoh5RCo?=
 =?us-ascii?Q?2CfL4kyUf2FmlvhRvliiPiaUyw+ANwKfUR/RuFWmaU9FZR9mAytxIjE2HB7c?=
 =?us-ascii?Q?zuuo8dO+T7vKJnBIyrWfwKtQA6XVyNUUpwMLdq9OVc4ByeI2EpsjHCJIIk+Z?=
 =?us-ascii?Q?o/gyxJ85ZbMfS9erMrO16ArApDae+DMvyopHfcGgGXbG4WIIm963y5MxKb9M?=
 =?us-ascii?Q?/YNBo+53AABLNozeC20+MMiGWzO7pAE3kNwxOitzrAD2ndZl/xXi0BmBtdkv?=
 =?us-ascii?Q?YYUSj78X1xSe6qI6EnOJFB0LVOSCL8m44m6gi5jSr7MdJtDiTPTAjZxnb0V9?=
 =?us-ascii?Q?ZDnmTzXdMhPlv8/v6vX6Qbeh3dJNAM47TMv2Bk8mIAnA9PdhLXSEMuuJrTu7?=
 =?us-ascii?Q?y3dxTbjBhqzu7B1uMC+nhFG3pliJbf1eW5RrUbGqP/Aojb9UzDpUSln0HNXX?=
 =?us-ascii?Q?oxU7ISl/X5c5qAfEBqXwIbdUmNay74APoWs7iCQ+odfX3G7Araxy+ieDlWjL?=
 =?us-ascii?Q?A+O5dP5goxwStG9Sqa3c5dN1Qx2s+oyqTnciVf172pQX1fuB6wBH27vjiQ0D?=
 =?us-ascii?Q?YIgzDbE7adm4F2JwQ+gl3AHldoL9MB+YDyvMXNXDNB6aysniwtmSJzJrExtk?=
 =?us-ascii?Q?B++HqPXtlsOcy0PWOSiWWTcp7IsQLvLszwBkRoiqTbQ/t+LR7xS7KtnPO4S4?=
 =?us-ascii?Q?hyN/Qq2dfFlqRIGSH2aAc05B4eNRP6+YSGOy6Sjpv7US0sHP4LnS/RiAhlcD?=
 =?us-ascii?Q?qlHcF+tPilNxHCVkghJMknjy0YPMFWhhwxRVX/2gMa5Q/Jqg/sEjFVhletmH?=
 =?us-ascii?Q?gJ96dbi1RKdtKHChCtFNlfT/HiLPKiqUcyeti9WDrtYP0xwx/sBlY+I6sk+a?=
 =?us-ascii?Q?MCEUbtRMFS+c9qZQ1jK/bhDflny34l+mOYDMxg68h4nhB/022BbNPKUukEVC?=
 =?us-ascii?Q?mzGwAkiO/yaRqC6KsWMsmiurpf+Zl/ahOdRutUicsV8BHrF8fq8W33evfrXk?=
 =?us-ascii?Q?RD/VnllUn4yy7NxIS4T+qxKIwoCkoRJHj8fAQGG4Bkdr4/JHFYoq0NAE4Gmx?=
 =?us-ascii?Q?JAjeWnv2P9oij57UawNSR7Yl0bEcOjfcwvI9SN3NaamO0Wl6cS03VNvqyCvc?=
 =?us-ascii?Q?TPcZNgrED4U5lUTZ/K59hSFTFURin94io5EocSEWnjLTgL1ucT9zArePwCW8?=
 =?us-ascii?Q?RvlXmOkQddSVKNbLAjmyDdbbOMtMqhlVLlt4DECjOVM8F8/wqvzsP+ttjrlD?=
 =?us-ascii?Q?JlVfnM6phRn86rw7KgAklkeNY2Bu0VThiaSw/4KkbJfWpH/8e/O0/57gaBk+?=
 =?us-ascii?Q?DVwUHVVFagNmSpW5qhqVuQVlfTOKE2axQ/zdkV0Ph8zpLSZ8vHxTYtJr+szh?=
 =?us-ascii?Q?q7dxft5LRslTPHq2jr0ae30IKkIFHXLQggibesw1IBCg66rYZSnL0AOpxCAk?=
 =?us-ascii?Q?h0hyRxOUKMOYqIABGuuLSnpxIJdr4aHA+/6ZPWfOMh2a3ckSQqX0Ksfx1s4Q?=
 =?us-ascii?Q?OVDAJUV83PFw58swk/HzA+b1xvJIHEONHWr3/1wZZPIV7Ve09KYNby2BNtRm?=
 =?us-ascii?Q?+HRwBfK2qeONhsFUDCu1OJ+cKX/FT+McTYutc+8FPkrdC6C4vK9Tddu3EI9n?=
 =?us-ascii?Q?QhfBW2biDrDMX3ULed1gcih4wsAasU48VqTOB4H6BIEuruC9lXSqaOYdjyUm?=
 =?us-ascii?Q?qRoup9zPIWwuDE65hytsWEiUEP16oks=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6e6650-65bb-4e8f-ab31-08dea1b07472
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 03:20:37.4407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VIxMavoirGccw9SrcC3WpixMc3CuqEe4FhbFgo+AgiqodRgs7Aqm04G7obXZ0u6HaeTvNYCXt5tIH5PtjrQjT1dS2t7kmovFCH0c/bEV5T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0970

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
index 7d10988cbc62..adf04852186c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25266,6 +25266,12 @@ F:	Documentation/devicetree/bindings/power/starfive*
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

