Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED88212FAC;
	Wed,  9 Apr 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234275; cv=fail; b=nuE57TjclO1Xp3Ij1BoBE8ealoLDVmOe/+KhvZB43dchoCAfWtckSpcdIuPI112LBiAZ6iiLZHWQRD152mAylI1hlYpx14zNJiujhtEnLW9LKjjyp79H0RzjG+qw5aK6f8wAXswfNYXPFOi/bau9f0fpW760LuS339zFWqNAXRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234275; c=relaxed/simple;
	bh=ey5bggNoycGXPMQq/smbEQmQpN+z/xOfFKbnuic6bYM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=O8v/iwrcpE7XEeq7jIf0rw43962hCtemxYsWDnn/14lr7UGaqlBSPf4/jGOnLnNVzVdTAkKIa1AI9UHaoeJl1ECpL9+Jhc2dhxSP24hKgwRisJqRRX4d0zE6xf8iE5PMU0vJkE35QhzG5UdKFbAUVVn9Huxe/ewqQQoF7V8rsOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KhvkrWYH; arc=fail smtp.client-ip=40.107.20.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KhvkrWYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Utyu74Km1dwMQ4yg8xSuPE7y3ONXp5Hne5GL9at6NbC0lTDW8rQRhRCVLKKNL6kQGPJBZS18+5+IA9RcLOIp/B/IyfilF8H5cim0j9qp5OHb0mr6SJ/O2BlGDnby8pUIWnCV5a6EuZgADbNQ/uHiSHjzfxQNd9KOv+82/TZ8hniPxMsoIjwN8KdTeWAi/ihkAaHENg2/5biKusxafelsTB8C+n5adEmLgA1k+jHMuZMK+P3zcBkLiJfgQopftote/VP9qg+/GPq4nTGdbb51y7FMfKSMKDec5V3YvT674v6xsVCd3eZ4AuGcfrIYLb6Ri86QA3H8IzWOt/Rlj6AI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeArQuRJ35FDUJIJ6Gc5MU3jreJBE6wBP1UFnpNjT9A=;
 b=sbQnvC0n3SHP5tNbU8cBcH+tEnpbMHlyy+neQtDh/osleK6qKk5rTFuWtVur62a9hr2bkpFN7H9mgimdy+AdVTwpi5S9+KLCturLJNMtbCl+fB4RZVv+TzBL/oQk3/ogmGNvsq4be26By4vbet7JDrKZlvdamLqNTbfh7oTsDtEVFXif07rSuNREy9QKiabPxDETpv7yqGuO6j8l9qurW7L1qvizNmV4H/77aRI7X9Rk36vycKw08jmzw2gv4kzIVLnE5kEp6sMVLBZhWqst0es82PIATjQpJKgU0xSAGAynOzwDlaVUzPsmZ3fI/70sgnsuAVDIgx6FCYBZVJ766g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeArQuRJ35FDUJIJ6Gc5MU3jreJBE6wBP1UFnpNjT9A=;
 b=KhvkrWYH/6rVHuIgzZIAgkJDltaelqwwLrIJ0oSQN0fSDc+OAofhrCvNIlYTCnLCiO3Z0OcaARNCTOqmlF5dpI67j+bCXCRWaHFtIMN5eyJcysTervxzqD1DsGwn3UuJLEOmPy6y5UM1xwxlmlEevhqfX/9o8c72E1LZgu9Jx5Gk+ebj8QGAe348653jzudDRRRDmPGEuA4TFTdQPYEz0Fqk39MC+S3DHTj0+95ehskOtEOFn72QMZEkhh+BNaOcGfPWb9vscoqMGQ/gEWua4R/TO63sbeO7pjI5t6ELS05Moh4D86NsDrluRkKT9Qov1w5S4yJ76bLjQcqK2oDO+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 21:31:07 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 21:31:07 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for DSP-specific features
Date: Thu, 10 Apr 2025 00:30:30 +0300
Message-Id: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0027.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::16) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 325791d2-e477-4022-825c-08dd77add68b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9Bz9oTXQoT4OFJ1wxJkNYiLBzWkfyyzYgfQgNDf4JJ831ApYG9X1hx7Hrhhg?=
 =?us-ascii?Q?L2r+SMkKUkSvOhNQLLa0Kbcg9qaPAmzIpKr/RN6P7EkMMwxuKqwD9AD+iJuz?=
 =?us-ascii?Q?sut+y26IF8G+7kHIjrSq3aXTIU/cEw2ylGo91XFwxM3YPV2olHUstRP14ijh?=
 =?us-ascii?Q?k7fAsoeGXbP69goEs9w3rZ8UyJuW+lxMfzRgMLA+9VCiiFFJyabDrVmpkUuW?=
 =?us-ascii?Q?Dsqnk7Cb+DLCu6URr/NO8EViLyhas5vy6Kt6/ssIpfF5/1lkOHYeLjphwg90?=
 =?us-ascii?Q?L1Pih+LaY+ziIUn0Z3nthT9ccmb3mzvSrdjtL3m2MEhY6d+1cXRklK/MO06w?=
 =?us-ascii?Q?CUaEbDk12x877PBI5y1pFpzjkql3N6Zgc807on9IpYWrPZ4tXQjcxu3NUsOC?=
 =?us-ascii?Q?oeSHXQXuwHhe292+nXcEfcxTmtBjtlArsv3W1fU/Tbzz4Z5thTbBeMO18cA9?=
 =?us-ascii?Q?LkL8famtuoC8lAR5hG+S0tjOQEMqrl90tmuu7fjuRWXPmjvQoj92dWgpDonr?=
 =?us-ascii?Q?O7Ax7FouSK+3X8FstFUB+jxi1vjhqOrzM9yj5idiP3qnflqIHDNEbt5JtA8T?=
 =?us-ascii?Q?MUyZe4VHQmrDmIsX7EgPiIBdhLVxqtJRR/rsyXx8wxcrpe/kbcVLntaAVFt5?=
 =?us-ascii?Q?/svIiRWu+eJi3K4LKA4zKOsyitOP9JYUJd6JUgSZ6EIBg+Q/upbrMtWvqwM8?=
 =?us-ascii?Q?UnURGlw5w+PIMIXE7RDtzAk5ikoGAtqfEdg0T0ZvgnA1iq7nz3x4j5iQ+b2U?=
 =?us-ascii?Q?+5xZl3/BFMfmjHriqlmLuW0JHT+Bgd8WpGmriM3d6WjFYvE+Tvyc0nqs/xWd?=
 =?us-ascii?Q?+cnKBsXrcdg/h/DNkMW34CJNgfJCNwpTuR97pheh44MioGZzy4I++FFcOHas?=
 =?us-ascii?Q?vj8OXUwzOB4+hfrJ/oY796fT5biEF4+/Q9Pjr3CxS1I+pnP1aQoSSLmQAczN?=
 =?us-ascii?Q?btwDC+S0u6OWRmIkN1130PLE7QFeekk6gcr78sMhqwuduF8cXmKqdLMnL7qd?=
 =?us-ascii?Q?9BWKf41jO2nZDMv21VIlG0hJhTbldUBXt+Ur0V7273V+XXia1HQ9VGh0c/tO?=
 =?us-ascii?Q?mcCa0QVcEDC1s8PJm8GGygszhXfz6g8lI6ZwvHkhFZZSXwbEo1DuflWqT7c4?=
 =?us-ascii?Q?sUK7hhXNMHZLw5+HmlIJ4PCChAoqujLM/6RixNoZGqFaMr+Su+otExIW/9Yh?=
 =?us-ascii?Q?DoHmbV8rIZPxTkx55b1LJwfVtMiYUT8Ad2V/TPlRTDZtPzoragbZuK3ZkOk6?=
 =?us-ascii?Q?QcZTS5s+lxVT6fmhJOr0YRsC1b3dINeQSOxZRgLpfsNmEXiGAqfkUhGbMFDl?=
 =?us-ascii?Q?85lfGlSB8llQam7zx+HCmtuH/7fQVTcbC4bBXmu4LBvDrmA3n5IS9qQBWJv6?=
 =?us-ascii?Q?h01FO6/TV9WoPRJno0XpHxcYWFe/p3ykbtZVeULptCI6Uufw/d9Fte3IYsXZ?=
 =?us-ascii?Q?i/Nay2fDyLNtd72JEWifQ6zgdxfzsFWdQRVtS5KzGy8VelWDs2Ngnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Qm3/s0DnW02uWX8l9cWrxWNx8g0Zm6cwqv49fMRKibDaZw0rHflwwyckNwa?=
 =?us-ascii?Q?DKFbFp4TYmaQacuqoRovXD7pbC4VmPSUR4nmtuVQjefwz75mB6vc2D+uSkoT?=
 =?us-ascii?Q?zU+FFz0c+YTVfynHzxIo/3Og5IrrU8hI8wzyv0PPJgVEv/Cx50QQenNjjMEv?=
 =?us-ascii?Q?Tv3PrOHuMw0zT5oBraiyLHh8JHT3iJCSDzdZKBQSyLqDDqZZDtD21rE7Pn7L?=
 =?us-ascii?Q?DJRvN1149JAibyr07SCqhEFMZ5LpdHQqodn/dzR9mxxFPygfN0zcsi9HPKjL?=
 =?us-ascii?Q?JdgxWeA5PPCTz6tZu7P909APsFN8FjA8JIWAfZ3l2CAoca89fxcjH8PQ6WzA?=
 =?us-ascii?Q?tr4MAdpVvEwzXLep71M0XFBnxPH3BlPDb/dxJvfXfOcK2bLNH34S4DBQSmYE?=
 =?us-ascii?Q?OrR6Z2KJx/yylDvlxCnfNhSupQQDr5MzbXwslwS0YzYMJFUZ+gmQP7WCs4Ij?=
 =?us-ascii?Q?e1rraxKnLNu0aE8+YQzHrEqexaSZnPogDdFFDeUQMDS3U/nta3SLcYpB+bou?=
 =?us-ascii?Q?t81IYczEk1qNe/Is28zIGkIx7nbeSo077kuAuuAuEorhktBKFg00kEkOV+JP?=
 =?us-ascii?Q?GjMO6R0J+05ctK91eZjOq9GAA+jeqvxA3BkRD34GQbmMKWigPpIjL6PR88GU?=
 =?us-ascii?Q?MnRp+ddlplWAhfhyBHL5MFWvAYWh6LyXJ9Jvqe0cWWCWm0/vL9WK0Cnt2RRe?=
 =?us-ascii?Q?1wWNB6O+3a6govoi2/rKP89AnrnKt10xmpnOXGdFg06SPSDz00SvAYh1lmWT?=
 =?us-ascii?Q?PxAtgCYT0YtUn2cZCMqipx5vN8butobaLmmsH57UtcdfqRPJRG/lcXP/2uny?=
 =?us-ascii?Q?hMJBK1UzhE+5bp89y5xHBMBShTAsfIz54oIZC+xZ2raMDLwB9NEpPtpeO0IH?=
 =?us-ascii?Q?JAKcKkhwnSzSROKploNRyXUi69jD6d/piY5hBSPKG6UTXPfmUsfIcbGsOL4h?=
 =?us-ascii?Q?Ys4FOOc7ieqZQwDnIfDeck4YG7ucDqAeVofyhaiP4nG8ZGkReaxmjQ/oMxVs?=
 =?us-ascii?Q?w0e9Z3MucBC0EMGT1ZmtKpxf1kgSUpTwlrGU78DKat4iGFwJ2Xn/CXrvGMdY?=
 =?us-ascii?Q?/fChvtL4HzfBtfE2mAnXlV5nywyN++S2Qw4najRGOdbGZ9HjjGVBHGd8f7Yb?=
 =?us-ascii?Q?Y52TmOeD84s3pUVEja0x2+rQKC3uRVNZrnEeOHmAZkyPcx1mEQ0TK76d8NKh?=
 =?us-ascii?Q?NoFAlKQ0+cGKkfwLwcKMLToNok0Gba2nW9bXT+sS+U8DkE4dGosBR8POioHt?=
 =?us-ascii?Q?Mbp4+vbD5ItENIxvgv8uxGx3kBIKkoZtsbq6yRYVWUZdYlD18oMrqBGoHrIf?=
 =?us-ascii?Q?oZzh10+bm6u0rxhvrRWMwriNsL1lqAbD/HgjRvryu/0fWRm9bSe0rJcSPO68?=
 =?us-ascii?Q?DKxBqrl/d+JUKMOesBBqK4vJfcyxbJdNOGY+sJ+cTrrup7inV7Ur9SLW5TwF?=
 =?us-ascii?Q?0rg+CiZhMkiLwZxW3MzkGAroxY2tNsviT0WKjzXh+hQHRFiTsiZUVAqrBw1K?=
 =?us-ascii?Q?CKrwZH4igKwsPu72Ypbgteo+UgflmS3rM1ggXsPXToAP5N4VQoxpsIGEQhXk?=
 =?us-ascii?Q?VITUz795sp/5s+H5HLYKGdLGkU6jZl+QujoBsA6ZVCKM2b9jE0MI9k0ExwIU?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325791d2-e477-4022-825c-08dd77add68b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 21:31:07.1880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MOVlSDhy2MFwAeSFLJ2ySuLu0QG6UEYTsyGEbXSc0NehgtwDhcLnX97cz9RCTImRITJxR0015eiIWxn0pE/a1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Some DSP firmware requires a FW_READY signal before proceeding, while
others do not.
Therefore, add support to handle i.MX DSP-specific features.

Implement handle_rsc callback to handle resource table parsing and to
process DSP-specific resource, to determine if waiting is needed.

Update imx_dsp_rproc_start() to handle this condition accordingly.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
Changes in v4:
- Reviews from Mathieu Poirier:
  - Adjusted len to include the size of struct fw_rsc_imx_dsp.
  - Updated len validation checks.
- Review from Frank Li:
  - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
- In probe(), set flags to WAIT_FW_READY to ensure the host waits
for fw_ready when no vendor-specific resource is defined.
- Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/

Changes in v3:
- Reviews from Mathieu Poirier:
  - Added version and magic number to vendor-specific resource table entry.
  - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
    - By default, wait for `fw_ready`, unless specified otherwise.
- Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com

Changes in v2:
- Reviews from Mathieu Poirier:
  - Use vendor-specific resource table entry.
  - Implement resource handler specific to the i.MX DSP.
- Revise commit message to include recent updates.
- Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/

 drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index b9bb15970966..e4212e624a91 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
 MODULE_PARM_DESC(no_mailboxes,
 		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
 
+/* Flag indicating that the remote is up and running */
 #define REMOTE_IS_READY				BIT(0)
+/* Flag indicating that the host should wait for a firmware-ready response */
+#define WAIT_FW_READY				BIT(1)
 #define REMOTE_READY_WAIT_MAX_RETRIES		500
 
+/*
+ * This flag is set in the DSP resource table's features field to indicate
+ * that the firmware requires the host NOT to wait for a FW_READY response.
+ */
+#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
+
 /* att flags */
 /* DSP own area */
 #define ATT_OWN					BIT(31)
@@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
 
 #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
 
+#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
+						 (uint32_t)'x' << 16 |	\
+						 (uint32_t)'p' << 8 |	\
+						 (uint32_t)'s')
 /*
  * enum - Predefined Mailbox Messages
  *
@@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
 	int (*reset)(struct imx_dsp_rproc *priv);
 };
 
+/**
+ * struct fw_rsc_imx_dsp - i.MX DSP specific info
+ *
+ * @len: length of the resource entry
+ * @magic_num: 32-bit magic number
+ * @version: version of data structure
+ * @features: feature flags supported by the i.MX DSP firmware
+ *
+ * This represents a DSP-specific resource in the firmware's
+ * resource table, providing information on supported features.
+ */
+struct fw_rsc_imx_dsp {
+	uint32_t len;
+	uint32_t magic_num;
+	uint32_t version;
+	uint32_t features;
+} __packed;
+
 static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
 	/* dev addr , sys addr  , size	    , flags */
 	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
@@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
 	return -ETIMEDOUT;
 }
 
+/**
+ * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
+ * @rproc: remote processor instance
+ * @rsc_type: resource type identifier
+ * @rsc: pointer to the resource entry
+ * @offset: offset of the resource entry
+ * @avail: available space in the resource table
+ *
+ * Parse the DSP-specific resource entry and update flags accordingly.
+ * If the WAIT_FW_READY feature is set, the host must wait for the firmware
+ * to signal readiness before proceeding with execution.
+ *
+ * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
+ */
+static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
+				    void *rsc, int offset, int avail)
+{
+	struct imx_dsp_rproc *priv = rproc->priv;
+	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
+	struct device *dev = rproc->dev.parent;
+
+	if (!imx_dsp_rsc) {
+		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
+		return RSC_IGNORED;
+	}
+
+	/* Make sure resource isn't truncated */
+	if (sizeof(struct fw_rsc_imx_dsp) > avail ||
+	    sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {
+		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
+		return RSC_IGNORED;
+	}
+
+	/*
+	 * If FW_RSC_NXP_S_MAGIC number is not found then
+	 * wait for fw_ready reply (default work flow)
+	 */
+	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
+		dev_dbg(dev, "Invalid resource table magic number.\n");
+		return RSC_IGNORED;
+	}
+
+	/*
+	 * For now, in struct fw_rsc_imx_dsp, version 0,
+	 * only FEATURE_DONT_WAIT_FW_READY is valid.
+	 *
+	 * When adding new features, please upgrade version.
+	 */
+	if (imx_dsp_rsc->version > 0) {
+		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
+			 imx_dsp_rsc->version);
+		return RSC_IGNORED;
+	}
+
+	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
+		priv->flags &= ~WAIT_FW_READY;
+
+	return RSC_HANDLED;
+}
+
 /*
  * Start function for rproc_ops
  *
@@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
 
 	if (ret)
 		dev_err(dev, "Failed to enable remote core!\n");
-	else
-		ret = imx_dsp_rproc_ready(rproc);
+	else if (priv->flags & WAIT_FW_READY)
+		return imx_dsp_rproc_ready(rproc);
 
 	return ret;
 }
@@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.kick		= imx_dsp_rproc_kick,
 	.load		= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
+	.handle_rsc	= imx_dsp_rproc_handle_rsc,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
@@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
 	priv = rproc->priv;
 	priv->rproc = rproc;
 	priv->dsp_dcfg = dsp_dcfg;
+	/* By default, host waits for fw_ready reply */
+	priv->flags |= WAIT_FW_READY;
 
 	if (no_mailboxes)
 		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
-- 
2.25.1

