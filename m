Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17622F178;
	Tue, 18 Feb 2025 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869084; cv=fail; b=s5pwh4BBt6ySKJkAAyRQ94NntGoZc+iF7u9h57wYEEgJv/pL4DwKmIsfl8V0tIWK+KZnVY4o8Ue36NszpAYOj7hHXAvrxacrHsCJUARSAJ3G4qTtznFIWh/7Lh6Ucou+DpiHM73JuhtewXKBAwHEuELhsLRKyy159bfEmutYTxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869084; c=relaxed/simple;
	bh=8OeJnZD9MlmZNozzt0JC622+TxcZxO6b/rtxuumSVX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gVktYq7GDT1AFn7edxVx1YT4kcwOEyRRMiW8xN5bdwXpbW1PpjIhjP/j0lz0SQVTrzivGucZuuXpfEvPwNdJh7YTMUZHNAWdH+c+ZqGDXlXqrPTEBkvg9Agch0gxY1R/NOjjZPlo0OmPOv+SF9SLRzSSOs+zU/3Z1RVR6JuT/HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kLRY2YE9; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kLRY2YE9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTJdc9xrkhzM/l5eoD5jgprZ6KlacdUHOB+IXhTM85Dx9LdLbnvha/xNbpY3BX7ltUgz+J8lwqyWBmkJGzyzEN0zJfvHrdkNx8Wd35SEM9V2jr/GNXM6DRg+jolO8Dd165+WP/0X2+fH6mzZRo/0kG5kXAIa0p7poxSOG8mhcnXb7FsbxhSX6WrAamIXNflly4yhcnSHQdPufHHHQR08W+IrunlXJNUVDT5DYcaVuSCQqyBzzeiDFBfICjQek7+L49SV1S+uMsb6sRSULLJzMH7mS5BpraRMdlTSGVMTg0wLfTEbuxkqgBZZyoQaIbfDpxTMpzYCu1wpqBiD8GHlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DWA6l36mIRJ2hiBtuK8jXwsQP2icifS7X/uHU1E220=;
 b=v9xLzxllvG/FN74RKz5CGx5vfEH5OGfF/3hsm8uqgZ3C2rf/PtzBCniEzU2HNCzHWaav16sk1UpJWrOPe6FP58GbCpNsLR3QVKrUXgoi5qt9OAep/y+CQZsaTi3W0JOxhCzX/8Td1Q4uoDBRH+LrgAwY6p3g1+JVPvALdOrSp9D8rb12aGtH2URyhOt9NMVkqIV6hyYNelEziJd5HGd80oq4EgGRY5OtL9nOEgJVDzPNokxRMFOEg0wZ+5LfVagjUihZdbAFwcjbtZsmhIhMebp2r7joO659LwiAWTr+2+AFATr7x6NRjeJ+udGzAUrkmpwD5h5hSYvcHO/QF8BWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DWA6l36mIRJ2hiBtuK8jXwsQP2icifS7X/uHU1E220=;
 b=kLRY2YE9FPYX+YbEapkdqOu4o3fMnT8nAC8GbolVk1nGdlpBv70ceYzBwFoyRz+Y6YyQgM7uTdAjZ0CfX0Nx2wB3Z58STckK9uKYBbSuMokz8cDkYBYgQpnQYHoijRWSbWksHtseiS7GG0u6YATaZZ183aQs6K01o2GzvSxKZvAmirod7BNhR6u0BvvPJarbNgmkIpzAxMoAiplTcpISJ7RM62aKd9kb2kghS5a/r3dnjDIVh5yyVnoqPSqSvTE7NNGJBtyaFhoLVPy3B2OGvhbJ4/rtc/VsQE1OUbE/ztS/vAzHaFpr+CYoVDhiT5RTH58GCcnqA1XsQLcucfFmFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by AS5PR04MB10057.eurprd04.prod.outlook.com (2603:10a6:20b:67d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 08:57:58 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 08:57:58 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	linux-remoteproc@vger.kernel.org,
	iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	Frank.Li@nxp.com,
	krzk@kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more reset bits
Date: Tue, 18 Feb 2025 10:57:09 +0200
Message-Id: <20250218085712.66690-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250218085712.66690-1-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0286.eurprd07.prod.outlook.com
 (2603:10a6:800:130::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|AS5PR04MB10057:EE_
X-MS-Office365-Filtering-Correlation-Id: 172531a5-b78d-4954-d311-08dd4ffa5738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rf7eXR8suq3ZhMiw9aGQUPswAEHwjxdhsko+vjuNmROcLwSwNmm6mJq87vmJ?=
 =?us-ascii?Q?UQMf4ho6dYCmrviyBirs8qwY7KLdY7yp7r5KQFqaAIRk7dwMKwVP8AT7Xfvx?=
 =?us-ascii?Q?taJ+TFCjmtaJbJRiXIiTeLe7+SfHQxD0BmmMQLvunNCf35VD/raEzVvaLPi9?=
 =?us-ascii?Q?w/KIRLgaEewI+/41sSak/GdtY0lC/KZJvv0Eyg8hs72nxZmXXgLc8FJ3Z1Me?=
 =?us-ascii?Q?6+i1cftU8dcKsgqjbTKTzsulV4h/TtUq+y4QAzsqEQ3L1a7tS1dq+u6oDusF?=
 =?us-ascii?Q?35/XMX5xV/HWpWZPfpigem7U4bkT/+CP2IXnGFoyogKjPpYpzl7WheVnMqoX?=
 =?us-ascii?Q?bJy7KqgjqYZnqmUGMnFY2V9sFQNup0w75/Lonl3RuFNu1/6utPJmkzwUuRXh?=
 =?us-ascii?Q?RQ5aGNMmcmaZ3CDz3ohG00KGQcVoeu+SfgISlBW5E8L4D+dz0tSnBYmH1wWF?=
 =?us-ascii?Q?DkWegf5v8QiVaqmXESjKgUkkehwAMJao+3tiC7w09am0DXcEbhXsUfbaStXB?=
 =?us-ascii?Q?eI1rI+HBFsD22RML2TRuVIGlDn5uOvDLNj0KWUX1nr6spafvcUqyIxE9jQHF?=
 =?us-ascii?Q?uYbVgwhdgrE/th+SdbIAXDkqOIF9xHBHuza9YzBZuCza55JLF+1HOlkSMS0L?=
 =?us-ascii?Q?H23fomWE0Mf4bO/px8C/C8XHtC4yeNY4jPd0TLziySR1wF8t3/WfvZRjkclD?=
 =?us-ascii?Q?FLRm30OtEh8d1/udM++lMTZp7fqpwxhjPFoxy6HrOmTp079tk8nbHjpeUaw0?=
 =?us-ascii?Q?yeagEH9vlUb2BC2wMN8U99FlOYm37kz1fgMfmzkj8/+EPKSWR54MdQIkt2+p?=
 =?us-ascii?Q?dzdKHJwr2/x+Ndwl3kZVFogQOuxuKafW6I6Zv7H0izc3DtmtmbvP3S20KdnC?=
 =?us-ascii?Q?r/YkWzeH/J20DJAFR3OmqORm6LD4bgrByLp25MurbsqB205B8Tciawsnyb9M?=
 =?us-ascii?Q?Lf+m1EKz1kNkwxTYt8YURAa0KGdw0NRt+XxvH1y/znwO3bvhj18Q50lRIf06?=
 =?us-ascii?Q?LpHRXiLJ9vn7Vzl1kvLmShl++6Wjz9HoQiudu6am+sWZ06g2xoW4mTWEgPNM?=
 =?us-ascii?Q?ZA+vX6gGjewKivX/p9NC3njhpZU7yM0IJEse8nolfIHRz4lKJxR9OXLbM9i5?=
 =?us-ascii?Q?oX2KcR4cHSWtLdPLcI1z7AJ59kCN5IkokND+hs1WCiaW7i28LEyp3Zo/VW/r?=
 =?us-ascii?Q?IDyJjOoyJ9esNiWGpSNxyJ/EvB6JW+dkIRDlszdyWg8k3OhHy3lgUFGy+dWE?=
 =?us-ascii?Q?RBpXgVNo33M5WtgTCldJ6ibUc8W7h1VzvpGUMDIYD3YsXNubCFohVLPO7eSo?=
 =?us-ascii?Q?IYwlo2GUe6BuCy0O1NT3lNy6PeppiU20y3kqsqTsiZkrKSrTq0tYQQe8/4c5?=
 =?us-ascii?Q?wQop0KCLU1QpHL5oRROocDra0nRY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xcHulsNzpKn2TSIG+v2wyF8Gs4XsAHvDUpki96GDSxNouIFZ6KWyo5n/ye7q?=
 =?us-ascii?Q?RLn+RGujzwdy0U8deu5kBrRtJsXiRK4MHuJufFmSmu3Eg4pd+3pMBM0D9qhw?=
 =?us-ascii?Q?UlaTHQYxFXCAB30KBepYiVK1QB61+3zsyKWoRlpgH3Z40bCdP8AUkd0bg5MG?=
 =?us-ascii?Q?kcIQ7L8wR4MYEsV+FYEoAcKGp5y8X2J+DF0846kzmoCA0dENnagGDbkVlxWR?=
 =?us-ascii?Q?mS65tqdSKeeyigt9dqLzpGQm7nRMbD7/dA5qlqVFiORBtgJQ4k+WRuqQhkH0?=
 =?us-ascii?Q?ZuY+TqCmM8fpjiiHXC9f0bGU7h+k6QjmAxi3GCh8pWKObj0BZ+TxpvNO/RnQ?=
 =?us-ascii?Q?Mnua3AArDMDlngEZgz7EONv31FIziyBgX1TlU5XJAxOpFwIQoRyOYp02uSrv?=
 =?us-ascii?Q?9yycHbaMNIUlwFE3gaJFKPJL2UQVBfzj2tjhiULzkmYZXlurj6+y2ShMjkOr?=
 =?us-ascii?Q?dexgI1JZrf89fUr4pA2nEJEO71fnIauXOWdvjtceoDE5jyUWW/V51ZGcQjxv?=
 =?us-ascii?Q?FNcuuxwG9FDztt0TyWRUVhniTMvUGZHS/0owHJPVIRu4E4LUpaQVQZHZgtl1?=
 =?us-ascii?Q?kXzGB8otpq3Boo21qimXQOFr5FTREE0zVziC4QkiZNx27r+r3MmE1Ev1PxKK?=
 =?us-ascii?Q?EHdhsD717O6DGba19gcPiLbSyQGYQpnlewqO9kfgHprYLK7/GbNbQ9aiNhJU?=
 =?us-ascii?Q?LaTPvvuGeVUqbubLU+dDytpXR5KDorKUG+uESZVyKobOio80KgEXzmXIVgla?=
 =?us-ascii?Q?GHRbKL+2C/Pp0rZIBt7uCuRttoQqDRRclBeHG7njgwalyZiO044l/At/zzk7?=
 =?us-ascii?Q?u+u+VVfBKzxMhxtGpYTWgCoswaL2Ap15e/tOZJyEPo8aBShPl7bmZCiAcuXs?=
 =?us-ascii?Q?5XHoZioFjMVBXqzHT5NrYGWHTdp5vrJ+72XWWHKVU6N+BV/+A0copCjxVowQ?=
 =?us-ascii?Q?tIK1da9+O+r6PD+E/Hc/AkIdd90PGOFwLOBrAQqq8+004HHqrjCYGYbhIenW?=
 =?us-ascii?Q?fO1mulbwuMQ2cMXVe12+Y7O9eftgGpQDWCkOxLug6henLFOTXliQDKiLxSsh?=
 =?us-ascii?Q?5D6R+0iBlcug7BZJ31nBdpSf+hXmhyw1C1DbxwnHMW01AQd2C3/+Y99sxvMZ?=
 =?us-ascii?Q?SYpcYmDj6dYsxCjuf7UgjbGlFtc7ub44BH67zYCpEIubWik4wigCYdzRp10J?=
 =?us-ascii?Q?iw6P4vLjAnuWCr0dfEeXpJL+No1x/w4alFMaoUKXmmP4KbVvdRBZ2uw9Dvcf?=
 =?us-ascii?Q?xLhBR9VLikJkExRRA3mp2uIduM0foyALdujn0x6v5WnNI/rOpBb5Sy5XhpGC?=
 =?us-ascii?Q?e4JKhoZj6ufNNd2CNAQLZPgeMi1l6Hnhf6ip4IuyBEKYBA2x3JOCfWL6/S88?=
 =?us-ascii?Q?mgvPqSeX7ZhqQ23uvtOoysWQyqxbuWHcfxLKTHkxR5HRJRw7XCFM9pAph0XI?=
 =?us-ascii?Q?hl+4mhbZo8KFVi81mH3LpUXAVPrnqTxD8jGGbegty862Hoavs7Ty9iifM0UJ?=
 =?us-ascii?Q?PZ9ov8x5XQa5w0aO84j79vcUt3/uXCRKFncCJ0BZ8KdjPlAx70ANAqGsy33k?=
 =?us-ascii?Q?e03ARmjVJEn/8IG/TVNSxSKhfc9pFGHHpgKqKXsPrzoziRHYana8RFKLoAwl?=
 =?us-ascii?Q?3rlWtK/6bVFFzmWcqgWRVkHLUjSDc5vGtob6UAvJZdKZpSuB03O74L5boODR?=
 =?us-ascii?Q?KI5oOQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172531a5-b78d-4954-d311-08dd4ffa5738
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:57:58.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAPi+pVrmgMicvTBl0tARl7XRNtItFyeUVoN4HFHq2vAnIC5rBpN7I0/ieyJDO59ze1cOlkqJGqLvNvVQbYRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10057

Current code supports EARC PHY Software Reset and EARC 	Software
Reset but it is not easily extensible to more reset bits.

So, refactor the code in order to easily allow more reset bits
in the future.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 1fe21980a66c..6b1666c4e069 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -12,7 +12,30 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
+
+#define IMX8MP_AUDIOMIX_EARC		0
+#define IMX8MP_AUDIOMIX_EARC_PHY	1
+
+#define IMX8MP_AUDIOMIX_RESET_NUM	2
+
+struct imx8mp_reset_map {
+	unsigned int offset;
+	unsigned int mask;
+};
+
+static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
+	[IMX8MP_AUDIOMIX_EARC] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+	},
+	[IMX8MP_AUDIOMIX_EARC_PHY] = {
+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
+		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+	},
+
+};
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
@@ -30,13 +53,18 @@ static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
+		return -EINVAL;
+
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
-	writel(reg & ~mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg & ~mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -47,13 +75,18 @@ static int imx8mp_audiomix_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
 	void __iomem *reg_addr = priv->base;
-	unsigned int mask, reg;
+	unsigned int mask, offset, reg;
 	unsigned long flags;
 
-	mask = BIT(id);
+	if (id >=  IMX8MP_AUDIOMIX_RESET_NUM)
+		return -EINVAL;
+
+	mask = reset_map[id].mask;
+	offset = reset_map[id].offset;
+
 	spin_lock_irqsave(&priv->lock, flags);
-	reg = readl(reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
-	writel(reg | mask, reg_addr + IMX8MP_AUDIOMIX_EARC_OFFSET);
+	reg = readl(reg_addr + offset);
+	writel(reg | mask, reg_addr + offset);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
 	return 0;
@@ -78,7 +111,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = fls(IMX8MP_AUDIOMIX_EARC_RESET_MASK);
+	priv->rcdev.nr_resets = IMX8MP_AUDIOMIX_RESET_NUM;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
-- 
2.25.1

