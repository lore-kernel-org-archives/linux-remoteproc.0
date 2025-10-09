Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A70286D77;
	Thu,  9 Oct 2025 22:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048869; cv=fail; b=GTewLPvVBzzYnzcbMY8uyJdHIOeU+bojFPC7JnQg7YkEjgXbmUDH6x2KbSJ/wq2mKY9i0B5Wrk/3PclN0F9Qe46IXZtd/wXy2+5h1VokIyw5qTySY2y6p0BYdv8ph9FIiU+F7vGVkRrcYXx6P8kXaaNph5OLtEGLEERPfK5jGfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048869; c=relaxed/simple;
	bh=24O7WkqENqzfAohWmrWfU3a0HWiwQ5Z9uSLESCPwmXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sDTCgyzLruAYtbAThW9Mu+gxRQFceZ0yKdfdJdWanfbTcouXI7MO1XMHR/gID9KPg7nYiQjmF2KCfBpcQKypOJPZ+Ge5JAffPENlDFOuuZSnjPRN0ra1JQAaRoWYxRFzfNRzZi1NAeV2bC0iLqk5iVc5o6Cgvf3U/Bps60LTF3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XILa/fqx; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XILa/fqx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgZABbCau2h5ldnULYYttQk4N2hH9Y21gH+AyT1iciP/wHBf3EB7C9LvArBtgsg3mBU5T96e45nXAnX0feIhtKg1UUzWkrs6IVmU2rzmiULvdPFwAiMhKop8ibG+hLVj3M3SXQs0qMWS2DEgKlDeZbh6jUTqokV7H319PSxMaK8S3ehdh/ugGBzCib11kJHW4KB12k8uoDwiTXPH3xE8mjJigzDPnIlJoHKTwzGBA6SMZINyvbGZaAVjYksltihE8MH6A7dw9x8DR2jpoU9YIMiU3gYoMqXd/JKkypy8xiYFhF/U6Mg6MUWih6CgObsHkaA4Tj/gVDyhm5A5phfdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIjhKHiECwOklX9ydx7zbqhupBFFYSAqzNF/hBj9SOo=;
 b=C9tCT2UHR5sbiebhZiltlzjKUDfn0RcU5b0szKJHU4TdFbqMPraOpQ+ebPT+Aidk+qIGS67chIofSq78yh8v5N/P0S8d1tqLHq1+0m9bRurWj3TkGTduDLJ0LaoznVDZTy1Dq9kQquextXfCSD7JZozSVOkrjUuNjroqlkz1BqaGXtWgEOjEScKb2tiEbzgyF+y4QRwB1ReJMrZH8vgaw9ltpeM2vtvmo+dQ9fLCF0/JHmTYUHjSXIxEjhoGFCsPV1dSrSpdtWig/fvgV2OM1dylvcDAr15pSndcOUrxsEZU+ecycaSDclgD1MEV5osW4+A02WAu+N/fDirJS/AkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIjhKHiECwOklX9ydx7zbqhupBFFYSAqzNF/hBj9SOo=;
 b=XILa/fqxF4sGDhbRPGGZFx2xXRTCf0UZj3Qlefk+Pw9dgwT1yULYjXalBWpzdGB3nODEHsRdYqo1qciZEatB9zDYsI9Xwhk2v+kldXRDvfXN9JX45WzNymHUIhDfj8GqqOZX8ploo2UjLJOkS1sPR6TsAzZGYvGkk8B+yRUNWTA/71lkf1FTKGF8+i2lyCi53bHP5mUEbQMVPQYq0JjBT/Oy9dr3CqndtmQE1yLEs7Lor5QGgiWXaFWpxJQHzrpHijUOVf+ovPRfqf14L9qyPRoUUbK6T9eoNcQojPqTP7W49WIjMLI2yoKgQQaTpWkchipi3vesWFVfPoNrBDj2pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 22:27:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 22:27:44 +0000
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
Subject: [PATCH v3 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
Date: Thu,  9 Oct 2025 17:27:15 -0500
Message-ID: <20251009222716.394806-4-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009222716.394806-1-shenwei.wang@nxp.com>
References: <20251009222716.394806-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::14) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GVXPR04MB10852:EE_
X-MS-Office365-Filtering-Correlation-Id: 405d2736-20d6-4c9c-559b-08de078310ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PAHXWdYhfaiMu7O+z+FObUfURAlX7bvEvEm0ggVEHyytZS1SuVhJ67olciiM?=
 =?us-ascii?Q?6FGUgy5UMZ/CYhFldvP72x91NOrZ/l5jxJ3BtwNW6Ro8TxpU0yjb4Ds6Zx8o?=
 =?us-ascii?Q?EjZlVXviXjRSbU/HmksDWGumbCApcVqevVg899MBTwz0/NH7aVhPymjlWFm3?=
 =?us-ascii?Q?cXe0jJXP6ilq1I72K72uqkj+o+BVWl8/mAy9Da3QxxhwEd10wjvPD8RQAl+5?=
 =?us-ascii?Q?gWp9cp0xNhZ+2Xq/wbSJHIBgHXe6dk1Eb/N8UdHrvvDIxsp8+jKtPY7GXtG4?=
 =?us-ascii?Q?pnFKziqUCK545QCrLaEicauWDwVNP4JW/HUlCyLKzGJZH6NfttqskRZ+hZSz?=
 =?us-ascii?Q?lY9LWncBTkl6r+S4poJGRfF2+AtWAKZAMLpxnutqYwPYxW7PFZrC+Ec+qvzT?=
 =?us-ascii?Q?98xHERpSw1bVutYsjiKfSEHdnkv3CNv2YbNKMiR7oVoHxMitmrqJ0bKtqkAf?=
 =?us-ascii?Q?J0gfYVCwNhJGe3ntKpBuwUQXB3P35MMj0t0KgLKklHiP4WNteRlpVt3gOyNr?=
 =?us-ascii?Q?T2qy0UVHxjF59R8rNCjdk/LSXC2az9Yqsml6A3QCM8ErNx91jKG3mRM+T+9K?=
 =?us-ascii?Q?g/eh1VE9JPCPMmvtjLh2gtw29W3kFUXgIdBId9XWlzqxk2UOgdDFHHHHhQsp?=
 =?us-ascii?Q?a2ZgmzPbWGMsPWOSzAHIYyPnhGy9Ct9c18AsnAh/xOm0nCfeF+K0D+PnT91x?=
 =?us-ascii?Q?ESGYX2vLKn+cx4a42iSJcJuh+yB6K3BRe/gQOTNt0s52MjN8T0h0rIz6Bfl/?=
 =?us-ascii?Q?ELsOnSpEZtybvj2rqWiuJ9htMbaBVZq6NlAttJwdQf+DLEKhBFw0RYOXhPRq?=
 =?us-ascii?Q?QLXwHPD9/jT3XXo9n5AhhAJca2yWp8xmo+u37o+UAHaTGllssfmJ/d7nspGH?=
 =?us-ascii?Q?84ulo2rgHWf0wMuqpaLhMCOqjFbTY9apuhUH7zqNThFD2p4v3juQO+ZKQk79?=
 =?us-ascii?Q?m+1PyGvmQaIUiFwAgur8dx5GOR/kHOK+cqAO+ekTdI7U37jtDIT4ObD/HiSk?=
 =?us-ascii?Q?wifyTd4fXmI+FrrO3KXrswkztWyMyA8JVVtd0n7yshftadudaM0oS17xd6tT?=
 =?us-ascii?Q?QPkUo+vVUbNXEsm9TD68UuPLrK/G8JuROAMtobmcIZ4Oo4bX+v5AWftQAUlX?=
 =?us-ascii?Q?799HwqkenVjKn1BRvdZi84RsqPSoKHGoZ+PRxQJ+DzXjRW/qFjdekTgXw4p/?=
 =?us-ascii?Q?xe7jFhgiy3ZgX32NqZ9k6T4iJTYYuHlYu2CpNQO830RvUZJILG681a6/ogIK?=
 =?us-ascii?Q?s7sYi+qiK9whYqBcsHeKULs9SjYciYQo7Hq6DmFtN68rH8eQYkT4XDmnzFxM?=
 =?us-ascii?Q?pQVA1EW7qK3Cu5sUWdJJj2QIJ7ZnQlIPcsFjroC189av1W5vI864c0P6Bugp?=
 =?us-ascii?Q?FOmA/h61dGYqsnPJjrq0vpOOT6nd+afxW95ae4Jqw8V/F5MlwftcgMiIjbRU?=
 =?us-ascii?Q?eyiiVgZkZmNoszDmEn6VH3RB71l43RyXiaK461FBjNDoUHfOZxcOZkwkW3q1?=
 =?us-ascii?Q?ud8+RxL+aLL9gc7T0NlOq3/vnjjij3N2qsBq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HrLdmA2zYJ6WKpJGJysV/0g+EmsybIjwL+1BY6qLmtlXe3umKitUzf1Azt6d?=
 =?us-ascii?Q?Re1wSUy5W5SMSxNJYsA2YHOcugnIoaRv/xZuAb5Xk0euw7xbKNAl81M72Q35?=
 =?us-ascii?Q?iVRdbcepGDbnX7xyt94wHkj7GK5D1eptglczhhL5Z+OewQ4FBFrcaXv3ETaO?=
 =?us-ascii?Q?Mn15GtOMJj0QT6KtwVHu1lZ5NFt/YbnI368OsElBp/pq+iMIp/rEqaqA7wDv?=
 =?us-ascii?Q?qLGcXYuL4DKN0DmK0tmmttCZ+TAAsgR9dnWevLOT41Vh+uwyaLYYa28hKkmZ?=
 =?us-ascii?Q?PerdIPC0bdltOqdn6K08/FEdIXNCZpgO0Hl/sSRDFjwgYljhoQInZNz0/Xgb?=
 =?us-ascii?Q?qZ5jS11QuTtVNoVffycnS5A+U8eEV8nGDJ3xmJ+4+IKKNh9iyy9d4qc9FW6E?=
 =?us-ascii?Q?u1IRPjGZ5dSzchS4y4Gi4Zcaey3amQw7zWNC8kGQJMIhGafN6ZcOgD8yRKl7?=
 =?us-ascii?Q?DNsQU/BpHZqO6shVxyqxGKJ1DLmphm61pgERjoS7n0sbCrs+xp0DSEuDu94G?=
 =?us-ascii?Q?K1vAkWp7O7nHmz2YxD5fPvugexNfe3gpS4EuVh7XMhtX4iwc0WLF0i4dKgQA?=
 =?us-ascii?Q?/B/yhoILID7JeAQioOy861RU2BeOlbty9vFZN91hZvz9tb6XhcedFFPGXWmi?=
 =?us-ascii?Q?yHAvMn+Fs0sbb8wzSMejFDnkSCw5/u6AAxznDFH6Rd759nc+V4iAxLVmWAnQ?=
 =?us-ascii?Q?pwNywwTZhhC3cd3ZuEJ+igiJz5GMjilOTSKQaKOz0qSBqDNVgek2o0Xryhl4?=
 =?us-ascii?Q?u0qjiUqjCsYJgN/TdPGyAzGC/TIatgoLUOswxyJXX3tcHJ7Dy9+nJ5iv7Wlk?=
 =?us-ascii?Q?e29XSBipQEmsdfo7WFjMopctQEN65RfD+uqHF4RxLJ/EsBksEJf8q6Crxqxn?=
 =?us-ascii?Q?K1doH3eFdqRlqEf5mMaw3zhitfDIaplsmX0N9OwuEBRDos53wXx+cpbJBhyf?=
 =?us-ascii?Q?VutHYTARy5x1Hlg/vya9qRgweeu9YAIf3PF3aeAXD/TnUpp5PddAqrDQDR2Q?=
 =?us-ascii?Q?VH9g27pN3glL9nC+LjQhLlsM9i8seaBYbEn47LWkejWBpnullhBiwQla9Xnx?=
 =?us-ascii?Q?zymiHWH9gQ/lj/MGv9jo6hotKQFPkDG9Y7ms+U48nnwbfqKV0hSW4+HKtT6V?=
 =?us-ascii?Q?QpsSF+aeTi5RCRfhIT+qV+A6qFG0jf8X57j/29OmsUEHGC8H989vp8+FRf7Z?=
 =?us-ascii?Q?WCfu/VPOLy7eNdha8KXEb6LBdxiRctFoRddA2p8FY3rMsqlxsiJ5xchAZmEn?=
 =?us-ascii?Q?QCW/dk3t4RUdCT76i4drkkFZUfv4se72iLOFgYd7h3VbeNV+5F2Gv5U5mqmL?=
 =?us-ascii?Q?MJz70zY8RZJA4wXNPFWeUQfWZ0BKn8yIu++2rDSIAY+t7B5LycUVepd2bnkC?=
 =?us-ascii?Q?+CoPRXdb0hWXY0EdQdG1Kmup83A/IktTiDgpXv2DLv3uF1y9duZh8dQBX7WR?=
 =?us-ascii?Q?btW43Bp4HUilXFpJKa3WIeyqknZFkHZsyYuRR0Ez8xwiIRtThGLcxsPRhJRq?=
 =?us-ascii?Q?e56iCGtjrQBHbQeTlQTSfjUW8hjiL2Fi7gTLkioWvnHT0aucWQI/kJXbiGbD?=
 =?us-ascii?Q?eKTgeqHXWaUWIkwqEav44jX/+4Wwy5IIaYsooTkt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 405d2736-20d6-4c9c-559b-08de078310ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 22:27:44.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0izY44MQ5jR3kbgT4lYkowYDUKFCE0dP8jPfwxRwinEkKlJ6+CaeZJxXVG2qU9Bd6zmNbwEzH6I/mYvs4jFuRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852

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
 drivers/gpio/gpio-imx-rpmsg.c | 486 ++++++++++++++++++++++++++++++++++
 3 files changed, 504 insertions(+)
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
index 000000000000..d2db39693a37
--- /dev/null
+++ b/drivers/gpio/gpio-imx-rpmsg.c
@@ -0,0 +1,486 @@
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
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rpmsg.h>
+#include <linux/rpmsg/imx_rpmsg.h>
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
+			"rpmsg channel doesn't exist, is remote core ready?\n");
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
+		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
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
+	port->info.port_store[port->idx] = NULL;
+}
+
+static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
+{
+	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
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
+	ret = device_property_read_u32(&pdev->dev, "reg", &port->idx);
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
+					  pltdata->rproc_name, port->idx);
+
+	ret = devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
+	if (ret)
+		return ret;
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

