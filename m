Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724531C57F;
	Mon, 22 Sep 2025 20:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571514; cv=fail; b=uqd7T43Ha104SmaxLxHIhTgL88jM2cbXwQeItwq+6e1FeEttZC6TaCxSGfSl7TJaM4PTHLgRX4ae61EQ5dU2VWiS5pLuJgrj3h8IeClfzfUMJJH17QLZDLZnKTWGU+Caxr6tif4vngVrV2enSsMsDaWB8W8oenF69tzbG47djwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571514; c=relaxed/simple;
	bh=OASqwJrdvFD2xqNsxYcE+awwvugjicPrBRRpD8as/6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PZmYfc58VfSPB3ap8mCUGrJ0xmqNXe88PghzGDR9UFk9VflEy+GeilaSMlVaiWjltVFok5Z76P4HEsK0Q7Ol1EuB98hHGM4z5doWp5TPfBJWQP54+dQwcw6hHT3aHZISFFrJwuo4aRmo4VEVkNUWHfwU8CtDLrC3gojpFLJHSL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=faFgK4Sm; arc=fail smtp.client-ip=52.101.70.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="faFgK4Sm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKnmQ3IAYXodWIKnnszLvBwu6JB8GHV/z3RDjuNTUZj0u5nJiN81GGSOjaRGIYhagQIE/Wk/As8BHPCYZ491SaFWO2DDyd7LNVQZE0A2Ze4zVsHTo/K2P1XOB0KVPOXymMPofW3v3OYHcWUeKs79rO2RwHWRdHdXmrGj29Ya5LxSbnam88eHoAmcD4sCJuOWm4+PVjsjVqZLzfFxLn5SRb6r8Z7Qb/OEXuIqPRbRwh276YC6qY7d4z7sPC+XZjya9Ecy8ZeI9oOx4eupHodOUd+dXfV8uMQBS89JrP3M+5tk4TMPeippVD8k1rwWZfg1g9srkRUmym98MHoaNIJ23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqUtDSmF6Qz2hfNGYGoV9WFLcdjLj+diUrnTPic4Jac=;
 b=rV6KDon/ZsZK5ehN14iGNvUbjRL8nOATwbQ14iHMitjjcPNowSV9SMazX0yp5DUrO+wH0MHuAd4JCKI3nVRG/A7KKyIpS/WpTg5dmt+s3Uiv6Cx/xCTrOOA1XaZ9IVMh4Q/e7wnLsyAvEeIZw17Sj5ddAnf5N8gvB29bTpIOjFtYE3XNvitRunr43B6kA+w9fndmT98MJYT81gUoYX49XDBW5AWX4bQUPs/pCb25Q9zVed0Hq6DUTnwC1OsUvQAhJ/mPyUd8+Mrltn/1PZHIvczRKw31NpoZ7sNbsWntMp2hMdKRxefpw4t8J4F8Zt7W7wHaKkuT9nEsR0/R/KXOcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqUtDSmF6Qz2hfNGYGoV9WFLcdjLj+diUrnTPic4Jac=;
 b=faFgK4SmFo0vRESlDYjdJXnyEdTtFv++mkBpeinXCs0JaOwkQNxw8PaQ80ogHDpNEbF0uUCNTnoZcVXvEwOTs7Z/b+dh7B3m5hflkkxkBJxdqWzB/I14wtkBYYXrI8svKbPeJcwNyu8wqWlqWnXkwJorHcPEu8bJaVMeRDzClR0UBat9PlfY9k+WNZqSL4Xl2HRKD4mN80CyphYoL3fnEs/f36x9UvI5e0Xxs162SxvVo4WQU5zZmh9NYgHk0bYjaFlt/J60XI4kzmlHCWGcJmewHxxwRLjTgfjxRKe/7QlXyOeu791qo8yVMMXcDTAghLmmtXiUBkkFUN1nK+Mblg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Mon, 22 Sep
 2025 20:05:08 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 20:05:08 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Date: Mon, 22 Sep 2025 15:04:12 -0500
Message-ID: <20250922200413.309707-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922200413.309707-1-shenwei.wang@nxp.com>
References: <20250922200413.309707-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: aab2ccd0-7713-436c-9100-08ddfa1353f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtrKimqj8N7TGOPfgaFQOpe2FUGh587v3Q07BC75Tc7oNni6nDpUBrhk5BD+?=
 =?us-ascii?Q?7FybnhPTduLBjIbKPZUSjYxAccm/SXZsjhhqZGbJ42GZ5W6BB4nDQswbOIVA?=
 =?us-ascii?Q?0KG+Ykko0MYNRlw45IfnXgrJYpAWXGzgoqCa+9sZVw5T02FYFMq3YlI7NXCS?=
 =?us-ascii?Q?8rZOsGOQohYCc8DTOiReYUsIkm0TyksPGxFociDd1G7HmXozgX62W2KFZXXE?=
 =?us-ascii?Q?XnpbUrKooJTXsS5pcixUoyDGtGhqog2JYWYslq6kL7Y47PoJELYEVhjOvHdp?=
 =?us-ascii?Q?kXxmS6F/evNP7cOxaCRBDMfXz5mTXnXFT0RWUmALqLFhaDiB6XKDXZYu6hYI?=
 =?us-ascii?Q?9w0L7/PAduYy5G8VzkEagFoiBJ8m8c8J4A8zW/0gsZh3d6lFCog8svAU+MXm?=
 =?us-ascii?Q?JawElBe8MG4hSi9Lzm3hfpGwD3H4CYCpLu77tNxqJ53TGlS33SiRe/jrfhTQ?=
 =?us-ascii?Q?+xeO/GivhwTD3yW+98HSs+Q5cazHCEw/nEeH8aagIIKSPwefvR9aNkrgsd0Q?=
 =?us-ascii?Q?Qjgghafi+4axmMMcPh6A1DjBg8XbRrccwPvKPeIjpgxCS4ax3sOecd2c3Awg?=
 =?us-ascii?Q?QDRZMpfngCCP+MgnyDZMhrlHsAFcDlFlXl+K0l652V9RstJ9X+iOhX3XKJUi?=
 =?us-ascii?Q?1K/CFkFoHUjZNcDxrfujPSdx0MMDEbd5gWvqLZHWpd3Uvd5YraCfht34oGB/?=
 =?us-ascii?Q?UXBpHEWtCSWMSjphvqE2DHh50yXmHamZPu6P23Azs5G++htghu95GF3MTiX3?=
 =?us-ascii?Q?d55+00GSRAVBrMjytGT5b9b2mNQVReivQsYgGc9rUQECAvfnim060z5tm9G9?=
 =?us-ascii?Q?TsPI/KNzv7bEogDKzAdN7uSlme9K6r4OTmSNncV9xtyeKYFg22hYX9SrOJjq?=
 =?us-ascii?Q?X/JqpvMdwIhsAkVA64WSPfYy61LAFrbL3QcyHyUvwzcMi2JC8cOLD+aWbQex?=
 =?us-ascii?Q?GB2WyQSND+zl/9Ahnbv+QnQDmvAA8Q7WfzSMsTAmtW4Ct+UPYLRuagAc7Yp+?=
 =?us-ascii?Q?3yqm6PKalVWC5UAzfDbiVRF7n1agpWuOGVDx5Y8CGUSnHXAQnl3hWO4iTZPN?=
 =?us-ascii?Q?WoFZX+XSI2TzhUuXm/jKh6bhmAH8aKhWT1k6Oky9doFDjWU0n5XqYgjbkwbi?=
 =?us-ascii?Q?hMFtyGKtd4Ey+Jq5J7TmbGbxrv+C1juQ/BJxz84MCaIVWPI0jIFsGAZMLqkH?=
 =?us-ascii?Q?VW368T9YasRvfXSRYTtRfEkQOPwArlGEgkNZcitHqECrQ4uSJypRo1jRt+xh?=
 =?us-ascii?Q?1nOZvRMV1JbxfuRZ2ROiawC8dQrM9/i18ZQYhHjWd7V/Z7Gm6VYGXNtAZgAL?=
 =?us-ascii?Q?lhLqqX28ApAmTCWLbUblpIEdnVuMwYs4q6TklgnimzJimbDOp2bj79HOlM3v?=
 =?us-ascii?Q?P/OvJCdAF/Ak5wCDtflVxjb7Y+lKGY771nKXZTkXzOjSGKuFf+jeQQJaT6gL?=
 =?us-ascii?Q?YWWDMyp+o62EQTfCoFK8lgY4njtTqOb1uyqc1aWz/oVaHkt31/m3rA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wKhzyL0XGiIPwECabQRkQC95LOHPrD39xQM5wZFh/y7ujrm5plP77fyD+x7E?=
 =?us-ascii?Q?KKbYLmeZe2vYfokt+XkdGlnXVPCp6iRmZzE/G6BHR57GksbxXMRW868YyikB?=
 =?us-ascii?Q?SGuGED9H+v4WyTeekIcvDtUJDE59FhD/kPBZZQs6dnQG5dzleq/ExB9AUCyV?=
 =?us-ascii?Q?2lV26aht2h/fYK9/OadcbmtdpjLLJIN1i63aGmWXV+kliHWBFMSUP8Qi8WRI?=
 =?us-ascii?Q?ZfuDJA1FAXMrH/Z0ZAZEatobfwH0OQtc2rw8MiYxkBxvTvbicMgvT1Ey3LXI?=
 =?us-ascii?Q?g9dl/lZ6KX123O0l1YmnOzKWMxeuxzBFDIaXA+QG9EpzREQKIwKaPEZvEYqv?=
 =?us-ascii?Q?4Zx0KHJ/MWETx7IVQqc1eoXbypsFelk6cvKUDMnTl1qJQB6jnfxsUqkvN+MS?=
 =?us-ascii?Q?teU0k85wMNQxxjtUEr3aT6GYYmbD5MHR6y7q68p1rXtWQHrAD1SE+MSzrlU+?=
 =?us-ascii?Q?MknAcMOK7d5nzJyYIrvH3mIwp+V0lX8zmMUTS99B6mWGspfRWllK2EJXg4/W?=
 =?us-ascii?Q?4iZgdn7ILJ2eboHTWPWI3p60zjUJprUk87CoNcFoqH/nU1uQZk9C6DWGroKo?=
 =?us-ascii?Q?GkV9S/4eizUlUk4yD82JNKY8367UrnXnC7VH/sbTP+HUgWjh7QtloC8DFfW7?=
 =?us-ascii?Q?dPJMOrArpR40Is/POObg7OLS75er3sUlqA6e1gt8SxjxBrW4IvYGEXooZQty?=
 =?us-ascii?Q?u+X+D2o/RIBsXdr1Hms9HnR1CHk0SNoLz2Tm9bi/S/idkxPf8gIBJ0DUiWfD?=
 =?us-ascii?Q?9/x3D9LX3PMFgpQDjUdn0d4U1vLQ/sPr4paaGxONIPa3sQzxJTO712jbYPXX?=
 =?us-ascii?Q?8aswOXHNOcbEi3d5X1ODxO0Hq9MzfEOpddm+F6gMN9RLXtaPoJec6p1Tgqmo?=
 =?us-ascii?Q?49g2/1Iqzgft4FuKTKobpyEAcNA4LJe7ePLK+a5mdrNDm9ap/O2B4dEgT0Z4?=
 =?us-ascii?Q?HWGTRnKNZHkvTK1ut0guhd4ON0yh5UoULA5u6q6Pr/TSZL3KE0TWwRXMBGRr?=
 =?us-ascii?Q?5vsIUmfI8UbPzRiKZyl/LCMZbKYurYd2DUX1FlbfZ1G3L/NtyJQ5wwh/6vSl?=
 =?us-ascii?Q?TyZPOpq3SSPnDLDZjCmg74L5lGWltJfPjNqxo+cM71IgwoZ4E4zY6PTd0kYb?=
 =?us-ascii?Q?BqZ3WyeUGKGfEuLTYoZkQLSxgUVd7VcEF+526FvbsNPGTwHKAL94i8yjfbM3?=
 =?us-ascii?Q?yLEm6zKcEYlScYDDkM8jDYJWllLslhe7oWQXVwyLgBUKLP2ZqJlqxNJFPe5+?=
 =?us-ascii?Q?x8vKow/5g4eyJx8x9eyfCgcpKL40yHhh8Wc5GeMniChIFUHtVmnIHMcHz0bJ?=
 =?us-ascii?Q?jNxM89VqhVGKOhnDXtNAhJULFODbL45ssdCHtIYDsGFhsrNbAwmN75RsuGvd?=
 =?us-ascii?Q?1GHcuj0i8NrX5Hf8OWMCYsY8xo0bR7TS092+D/MCtZz/jINLvqYvrYjTLA6i?=
 =?us-ascii?Q?Re95eTLZpkwNRyLA7YuFw/05+b8HlOzgQ241HoN6AClqqYruLzXebTAjhsBP?=
 =?us-ascii?Q?psFb1lQmUgziDFaw/1/bZ0YCkFnnuxbyYZa6KYIwaQ17ODLeGHSLgd1Mplj+?=
 =?us-ascii?Q?WIHxCNtIfhDJK5Fj4DrF71hZrE+xRZCiI2P7uSsu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab2ccd0-7713-436c-9100-08ddfa1353f9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:05:07.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYWPpR9lfdSUYWSyRaRONQm1v2HeJUopCUrIz7/xUHw3cv3zGm3xdrSdMAvpEzOZQDXLxBi90ThNO0qS0d3kbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

On i.MX SoCs, the system may include two processors:
	- An MCU running an RTOS
	- An MPU running Linux

These processors communicate via the RPMSG protocol.
The driver implements the standard GPIO interface, allowing
the Linux side to control GPIO controllers which reside in
the remote processor via RPMSG protocol.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/Kconfig          |  17 ++
 drivers/gpio/Makefile         |   1 +
 drivers/gpio/gpio-imx-rpmsg.c | 488 ++++++++++++++++++++++++++++++++++
 3 files changed, 506 insertions(+)
 create mode 100644 drivers/gpio/gpio-imx-rpmsg.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index a437fe652dbc..97eda94b0ba1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1847,6 +1847,23 @@ config GPIO_SODAVILLE
 
 endmenu
 
+menu "RPMSG GPIO drivers"
+	depends on RPMSG
+
+config GPIO_IMX_RPMSG
+	tristate "NXP i.MX SoC RPMSG GPIO support"
+	depends on IMX_REMOTEPROC
+	select GPIOLIB_IRQCHIP
+	default IMX_REMOTEPROC
+	help
+	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
+	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
+	  and i.MX9x.
+
+	  If unsure, say N.
+
+endmenu
+
 menu "SPI GPIO expanders"
 	depends on SPI_MASTER
 
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 379f55e9ed1e..e01465c03431 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
 obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
 obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
+obj-$(CONFIG_GPIO_IMX_RPMSG)		+= gpio-imx-rpmsg.o
 obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
 obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
diff --git a/drivers/gpio/gpio-imx-rpmsg.c b/drivers/gpio/gpio-imx-rpmsg.c
new file mode 100644
index 000000000000..46b1b6b798c8
--- /dev/null
+++ b/drivers/gpio/gpio-imx-rpmsg.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 NXP
+ *
+ * The driver exports a standard gpiochip interface to control
+ * the GPIO controllers via RPMSG on a remote processor.
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/rpmsg/imx_rpmsg.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+
+#define IMX_RPMSG_GPIO_PER_PORT	32
+#define RPMSG_TIMEOUT	1000
+
+enum gpio_input_trigger_type {
+	GPIO_RPMSG_TRI_IGNORE,
+	GPIO_RPMSG_TRI_RISING,
+	GPIO_RPMSG_TRI_FALLING,
+	GPIO_RPMSG_TRI_BOTH_EDGE,
+	GPIO_RPMSG_TRI_LOW_LEVEL,
+	GPIO_RPMSG_TRI_HIGH_LEVEL,
+};
+
+enum gpio_rpmsg_header_type {
+	GPIO_RPMSG_SETUP,
+	GPIO_RPMSG_REPLY,
+	GPIO_RPMSG_NOTIFY,
+};
+
+enum gpio_rpmsg_header_cmd {
+	GPIO_RPMSG_INPUT_INIT,
+	GPIO_RPMSG_OUTPUT_INIT,
+	GPIO_RPMSG_INPUT_GET,
+};
+
+struct gpio_rpmsg_data {
+	struct imx_rpmsg_head header;
+	u8 pin_idx;
+	u8 port_idx;
+	union {
+		u8 event;
+		u8 retcode;
+		u8 value;
+	} out;
+	union {
+		u8 wakeup;
+		u8 value;
+	} in;
+} __packed __aligned(8);
+
+struct imx_rpmsg_gpio_pin {
+	u8 irq_shutdown;
+	u8 irq_unmask;
+	u8 irq_mask;
+	u32 irq_wake_enable;
+	u32 irq_type;
+	struct gpio_rpmsg_data msg;
+};
+
+struct imx_gpio_rpmsg_info {
+	struct rpmsg_device *rpdev;
+	struct gpio_rpmsg_data *notify_msg;
+	struct gpio_rpmsg_data *reply_msg;
+	struct completion cmd_complete;
+	struct mutex lock;
+	void **port_store;
+};
+
+struct imx_rpmsg_gpio_port {
+	struct gpio_chip gc;
+	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
+	struct imx_gpio_rpmsg_info info;
+	int idx;
+};
+
+static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
+			     struct gpio_rpmsg_data *msg,
+			     bool sync)
+{
+	struct imx_gpio_rpmsg_info *info = &port->info;
+	int err;
+
+	if (!info->rpdev) {
+		dev_dbg(&info->rpdev->dev,
+			"rpmsg channel not ready, m4 image ready?\n");
+		return -EINVAL;
+	}
+
+	reinit_completion(&info->cmd_complete);
+	err = rpmsg_send(info->rpdev->ept, (void *)msg,
+			 sizeof(struct gpio_rpmsg_data));
+	if (err) {
+		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
+		return err;
+	}
+
+	if (sync) {
+		err = wait_for_completion_timeout(&info->cmd_complete,
+						  msecs_to_jiffies(RPMSG_TIMEOUT));
+		if (!err) {
+			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
+			return -ETIMEDOUT;
+		}
+
+		if (info->reply_msg->out.retcode != 0) {
+			dev_err(&info->rpdev->dev, "rpmsg not ack %d!\n",
+				info->reply_msg->out.retcode);
+			return -EINVAL;
+		}
+
+		/* copy the reply message */
+		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
+		       info->reply_msg, sizeof(*info->reply_msg));
+	}
+
+	return 0;
+}
+
+static struct gpio_rpmsg_data *gpio_get_pin_msg(struct imx_rpmsg_gpio_port *port,
+						unsigned int offset)
+{
+	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
+
+	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
+
+	return msg;
+};
+
+static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+	int ret;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_GET;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+
+	ret = gpio_send_message(port, msg, true);
+	if (!ret)
+		ret = !!port->gpio_pins[gpio].msg.in.value;
+
+	return ret;
+}
+
+static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
+					  unsigned int gpio)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+
+	msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+	msg->in.wakeup = 0;
+
+	return gpio_send_message(port, msg, true);
+}
+
+static inline void imx_rpmsg_gpio_direction_output_init(struct gpio_chip *gc,
+		unsigned int gpio, int val, struct gpio_rpmsg_data *msg)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_OUTPUT_INIT;
+	msg->pin_idx = gpio;
+	msg->port_idx = port->idx;
+	msg->out.value = val;
+}
+
+static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int val)
+{
+	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
+	struct gpio_rpmsg_data *msg = NULL;
+
+	guard(mutex)(&port->info.lock);
+
+	msg = gpio_get_pin_msg(port, gpio);
+	imx_rpmsg_gpio_direction_output_init(gc, gpio, val, msg);
+
+	return gpio_send_message(port, msg, true);
+}
+
+static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	int edge = 0;
+	int ret = 0;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		edge = GPIO_RPMSG_TRI_RISING;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		edge = GPIO_RPMSG_TRI_FALLING;
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	port->gpio_pins[gpio_idx].irq_type = edge;
+
+	return ret;
+}
+
+static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
+
+	return 0;
+}
+
+/*
+ * This function will be called at:
+ *  - one interrupt setup.
+ *  - the end of one interrupt happened
+ * The gpio over rpmsg driver will not write the real register, so save
+ * all infos before this function and then send all infos to M core in this
+ * step.
+ */
+static void imx_rpmsg_unmask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_unmask = 1;
+}
+
+static void imx_rpmsg_mask_irq(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+	/*
+	 * No need to implement the callback at A core side.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+	port->gpio_pins[gpio_idx].irq_mask = 1;
+}
+
+static void imx_rpmsg_irq_shutdown(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	u32 gpio_idx = d->hwirq;
+
+	port->gpio_pins[gpio_idx].irq_shutdown = 1;
+}
+
+static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+
+	mutex_lock(&port->info.lock);
+}
+
+static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
+	struct gpio_rpmsg_data *msg = NULL;
+	u32 gpio_idx = d->hwirq;
+
+	if (port == NULL) {
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	/*
+	 * For mask irq, do nothing here.
+	 * M core will mask interrupt after a interrupt occurred, and then
+	 * sends a notify to A core.
+	 * After A core dealt with the notify, A core will send a rpmsg to
+	 * M core to unmask this interrupt again.
+	 */
+
+	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
+		port->gpio_pins[gpio_idx].irq_mask = 0;
+		mutex_unlock(&port->info.lock);
+		return;
+	}
+
+	msg = gpio_get_pin_msg(port, gpio_idx);
+	msg->header.cate = IMX_RPMSG_GPIO;
+	msg->header.major = IMX_RMPSG_MAJOR;
+	msg->header.minor = IMX_RMPSG_MINOR;
+	msg->header.type = GPIO_RPMSG_SETUP;
+	msg->header.cmd = GPIO_RPMSG_INPUT_INIT;
+	msg->pin_idx = gpio_idx;
+	msg->port_idx = port->idx;
+
+	if (port->gpio_pins[gpio_idx].irq_shutdown) {
+		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
+		msg->in.wakeup = 0;
+		port->gpio_pins[gpio_idx].irq_shutdown = 0;
+	} else {
+		 /* if not set irq type, then use low level as trigger type */
+		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
+		if (!msg->out.event)
+			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
+		if (port->gpio_pins[gpio_idx].irq_unmask) {
+			msg->in.wakeup = 0;
+			port->gpio_pins[gpio_idx].irq_unmask = 0;
+		} else /* irq set wake */
+			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
+	}
+
+	gpio_send_message(port, msg, false);
+	mutex_unlock(&port->info.lock);
+}
+
+static const struct irq_chip imx_rpmsg_irq_chip = {
+	.irq_mask = imx_rpmsg_mask_irq,
+	.irq_unmask = imx_rpmsg_unmask_irq,
+	.irq_set_wake = imx_rpmsg_irq_set_wake,
+	.irq_set_type = imx_rpmsg_irq_set_type,
+	.irq_shutdown = imx_rpmsg_irq_shutdown,
+	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
+	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
+	.flags = IRQCHIP_IMMUTABLE,
+};
+
+static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
+	void *data, int len, void *priv, u32 src)
+{
+	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
+	struct imx_rpmsg_gpio_port *port = NULL;
+	struct imx_rpmsg_driver_data *drvdata;
+	unsigned long flags;
+
+	drvdata = dev_get_drvdata(&rpdev->dev);
+	if (msg)
+		port = drvdata->channel_devices[msg->port_idx];
+
+	if (!port)
+		return -ENODEV;
+
+	if (msg->header.type == GPIO_RPMSG_REPLY) {
+		port->info.reply_msg = msg;
+		complete(&port->info.cmd_complete);
+	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
+		port->info.notify_msg = msg;
+		local_irq_save(flags);
+		generic_handle_domain_irq(port->gc.irq.domain, msg->pin_idx);
+		local_irq_restore(flags);
+	} else
+		dev_err(&rpdev->dev, "wrong command type!\n");
+
+	return 0;
+}
+
+static void imx_rpmsg_gpio_remove_action(void *data)
+{
+	struct imx_rpmsg_gpio_port *port = data;
+
+	port->info.port_store[port->idx] = 0;
+}
+
+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
+	struct device_node *np = pdev->dev.of_node;
+	struct imx_rpmsg_gpio_port *port;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	int ret;
+
+	if (!pltdata)
+		return -EPROBE_DEFER;
+
+	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "reg", &port->idx);
+	if (ret)
+		return ret;
+
+	if (port->idx > MAX_DEV_PER_CHANNEL)
+		return -EINVAL;
+
+	mutex_init(&port->info.lock);
+	init_completion(&port->info.cmd_complete);
+	port->info.rpdev = pltdata->rpdev;
+	port->info.port_store = pltdata->channel_devices;
+	port->info.port_store[port->idx] = port;
+	if (!pltdata->rx_callback)
+		pltdata->rx_callback = imx_rpmsg_gpio_callback;
+
+	gc = &port->gc;
+	gc->owner = THIS_MODULE;
+	gc->parent = &pltdata->rpdev->dev;
+	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				   pltdata->rproc_name, port->idx);
+	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
+	gc->base = -1;
+
+	gc->direction_input = imx_rpmsg_gpio_direction_input;
+	gc->direction_output = imx_rpmsg_gpio_direction_output;
+	gc->get = imx_rpmsg_gpio_get;
+	gc->set = imx_rpmsg_gpio_set;
+
+	platform_set_drvdata(pdev, port);
+	girq = &gc->irq;
+	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
+				 pltdata->rproc_name, port->idx);
+
+	devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
+
+	return devm_gpiochip_add_data(&pdev->dev, gc, port);
+}
+
+static const struct of_device_id imx_rpmsg_gpio_dt_ids[] = {
+	{ .compatible = "fsl,imx-rpmsg-gpio" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver imx_rpmsg_gpio_driver = {
+	.driver	= {
+		.name = "gpio-imx-rpmsg",
+		.of_match_table = imx_rpmsg_gpio_dt_ids,
+	},
+	.probe = imx_rpmsg_gpio_probe,
+};
+
+module_platform_driver(imx_rpmsg_gpio_driver);
+
+MODULE_AUTHOR("NXP Semiconductor");
+MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

