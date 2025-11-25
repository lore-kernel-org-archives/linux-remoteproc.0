Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE3320A3E;
	Tue, 25 Nov 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764074977; cv=fail; b=PVcwbcpM2630vvbjQj78HLkS/u/NnF9MrtK13KD3Cce1ka7UbWRDjwv97Av2UpgrPevR3IENRbTY4dKT2k0QnyVN+lZHKipwMeywHgbNxZvlyiTemrSJQqFgeznFbezJWdAviL9Fe+wtUcf5l6MTx3lPBGi2cvXurbM0vnl0STQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764074977; c=relaxed/simple;
	bh=usTCbeFVemiFWwlVMVybcRLRsQjIEnpQjRsFmuyVuE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UoqSaNunBMRkUOCowSxWF1MKE+JvX4jdWpcb2PM8xWZl8XW0Nbftup+UjhiJCEJnZFY4ugAwh4iA23v75enP1CsbUVS0aDyOg5+aGPdihtJkRA21FkpWyagKWPt9JJSD3GN7TWMmeBD7RWCDvI1fv1dWLMRlqRzUnVQdZrw2Ozg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TK5Cflnx; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TK5Cflnx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBEu980RkZYXFSPQScQhKjHmPrT3roJTez78VYjGXf0gCu41fX6Jz9l4Q4bhNERgMFxh0Xs1wtilPksuJx/v+YrBhPpu8XFLlQiE6cAOGiEL3BYeo5oVn8tbEdBbNJYakQsq0Pfhud1PH9OxVddn42Js5vJbzxfoed1Hx67+vb3N0PYyA06nePowbVpu0Eivj2QdxXIAtohJ1+beklHWb1OUch9fRzPlaLVkrqtsWUD9nBctzvLVMoZGWB9VRucGvjYT/GlmjB/vCWfiWBObyDiSzr4fuw3R5haWaL/oxiKER/Apc9sVyy3WaEf/miPN3pR7c74EV6Wz0i69I2sP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzCncS48SRMG5EKU70BHmHfncc6enNfU9I8pbIp1kNo=;
 b=Sq3/fyGZHFY/S7FsrVyo06LmT8ufG63Hu5NYQeD9ACRmthvdarw9NV/Frfaz7BiJlVIICHrv426OSPMQ7ZF9H+IXyPQjpiZ1HfBi1KB6uFVxtOEAQcTpNbsHKmMFRa6e8o6OPDwaGfyrj1I23Is7hvYnQ2MnslTbf8acc4hs37R2TwYU0trD5ulUuoi/EnfQIMblfVTfwIFSQKWSnSh8f00FKI2iwtH0bCrfgsDB31KhfZSQTjzMEezAr+UfUNne3ZeKjDve/BPFecfDhdeTGla7kUKPEsI5bG5sbiYSEkhpBk/+rQ5oHcj3MTxj3vdvWnH/uQfF2gH2tc3N9JBRIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzCncS48SRMG5EKU70BHmHfncc6enNfU9I8pbIp1kNo=;
 b=TK5Cflnx4+SntjVl1eI65Loo1DKoPczqkPoa5/+A4eqm+o+kNP5Kk6IcPLS+BScyq3C0EdxgIQQ9lqFWU6nxlWlqD/LeaSfwwntQ9ikbDbejN2Rpg5wZZZGqMCSU4++jiPd+sfd8n/Eea23SoBCHSZbxiaQ+p3AvmH64LXPAUVhh9RTTzjHSIkT6mr8QApuuaN/7qVnHFi8LWAPwI/8/J1Rh5sO6KH8KxSCVAeaYVtqx8SNhW+4OGwqJ5dBlq4tvf5pZ9pJuuKkJ7hch/MgvPGXznBnrMKJuiM+37e2WTrvWp0ov1G7RD20jhcQ7DnJBHsi1eVn4a6ws/cLUX4RvtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by DUZPR04MB9872.eurprd04.prod.outlook.com (2603:10a6:10:4dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 12:49:33 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:49:33 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/2] remoteproc: imx_dsp_rproc: Wait for suspend ACK only if WAIT_FW_READY is set
Date: Tue, 25 Nov 2025 14:49:03 +0200
Message-Id: <20251125124903.962295-2-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
References: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|DUZPR04MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d396c2-f01e-411a-086e-08de2c2114c3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XFs0Aq65M0of6gDe3atoI6fWLH7wdWCdq5wp1XLFknH1BZeGBI39UBtjWZC4?=
 =?us-ascii?Q?UEEDFP40fQkAvf2xpsSvoU0fLG54BBw3954/UJTzdknuCsEqgEeP268bd7D9?=
 =?us-ascii?Q?b7hxZgJFsKi4oBvMXxr1vpnPNFtgyTseRl5S8ltKRsOk5+9Yqp2Abvuya039?=
 =?us-ascii?Q?RO1Kqkw0CghKjq2EyKTN7XpilVQkEN+rnS0Yxf8TRJ/uGrHD45U73bpxZ6pn?=
 =?us-ascii?Q?oewYK3DukC7heDmK7ag6kk3nZma0m8q0XLsOIz7/Ty3bk6j9s1l9Pi/czcmU?=
 =?us-ascii?Q?G0Z3m0fn8KRVXVlJAhEPDu5niNFtvKTubZ+N5psBbpx4opmdmQVN/1QxcVRW?=
 =?us-ascii?Q?M4shp7TkQVpNh2NInra6qHgF+cE/XEhm4cqU86P4wz3j7vvefIzpLDIAGQzC?=
 =?us-ascii?Q?RDAWIpy8WQyuP1Kfwqwc5br1cqfKGcKhwCycDTT2rHHjzSMTmHKeApviuxnW?=
 =?us-ascii?Q?D1/FkmAle6TMyn4Bd/QrUre53oxv84a41GpRtD52HIc6WcRK2BJw5aC5bCpP?=
 =?us-ascii?Q?6VDCXPDfAYVIH6xYekzHT5uwsHD+l/GeY10WKreUOH1Hw60gzE9++Pd1Ory3?=
 =?us-ascii?Q?r2qvnSP5e2qgGRU9dTYMBWJwceYcAaQADZe1nG/ZXONDfxU1Gg/QO4Mfw/9n?=
 =?us-ascii?Q?IiKZEGhjXHpTqEyBNlR/92sc3QJL86D31zl/qg+x/odGznrjaWnJSeQNRrV0?=
 =?us-ascii?Q?I1V8OjDhzsGR7vgr4tJWeiurS7MEdXkOiQ66DgKkwsC3aMO1MmZO5XWLmG6a?=
 =?us-ascii?Q?yfuumlrQdZyEj0TNA0jy6KavLuaKm4iTs+oHfV/W/OPYRAQBgxTtk6LjwbWe?=
 =?us-ascii?Q?VuQfgxlgnobxNJLcJUCf0SxFRMMYDyIsZoQpFvfbbqrGFjKWjZ/INSzY8s9S?=
 =?us-ascii?Q?DlnojaGSbaPx2/mnLH4a6GYHA4ICAyuICgIa0VYzPJBY3TeMFbao7joGbqMZ?=
 =?us-ascii?Q?AX/eNnQSk1nMRPyiYFHlPL3evtZPhZ+v+O7OE+Mo8pe6drUO0KRaorbCqC0A?=
 =?us-ascii?Q?GLn+mW3cqtoVMlOSAeIUXUsckyQurqxrb4NgZoinbHWHe6zC7mwLVBfNJnK3?=
 =?us-ascii?Q?D3hCOpvTzhvQ7Z1Ee3b9UYYZgk+q9ul/AWu3lkXpVnZ69uzqmgFLS2UW4h1c?=
 =?us-ascii?Q?zvmFG68Hj3+j/ZvCSG4UA3Ezjs9OEP9EyhZcp7qcgfjLg6vWy+59UPb48e3w?=
 =?us-ascii?Q?0Y3vEdAw8mxQM6jXwRlQ2MC+7edkj5csAK4G3w1c/AGw9NODJ0MBONhpfVyc?=
 =?us-ascii?Q?YjVDIr7znPudolgdUOSHCRwX9/vaKp5tOrcI4zdHNNVMfb2T4/s5SqzKJIWV?=
 =?us-ascii?Q?1TKINLWh8HhseFNlzUWeiihnCyGEwm2Df4E4JmQF9hvSTrml13Jc6u7NQVUl?=
 =?us-ascii?Q?UwchedQdvOLXVFw7AT6qCcTvuiQZQuS/zlWxT+BNqV0YSMsLnoeEY3FFTrLf?=
 =?us-ascii?Q?+5MeHnWQNQrfyYqX19Bo93eKr9sYNlKq57RW2tNicFJ0q86QEd9rEu/qx1J7?=
 =?us-ascii?Q?5k67SbpEaxyJCse1uvBo5fu2Dz2k11dkmQVN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WezltusenqwqTAqBt8sE7n6Hvp4+EVK5xmKjVNCHwSgyKZOn7smbWbyvEWwY?=
 =?us-ascii?Q?MCMCu1to+G00ru5Muc+9A8FztF/pWteQ15mIuF9NvMBWqbXjbAWsDAbjCCVc?=
 =?us-ascii?Q?qoJgFf40ALHjtNSCpRM7LVZcQ6krH2LTNwqLQFyTBVGrD2kqZw/w2aJrJg6C?=
 =?us-ascii?Q?/oayhesB4rtV/URwJFk1UiYsuEcVECSq92nLoYQPQw7WH+50UsNI4u+El1jo?=
 =?us-ascii?Q?tzg5gUerCDq6KKzMmfnzavreBaFhcVjOlPQAA10dQqKqI1Tp7zzluMi3Y+LN?=
 =?us-ascii?Q?zgNav36lgBqEFNKmNSsbJ5/aE9WGxBaeJfqHUGBuu6zJUOqtGtOpgwRzutUg?=
 =?us-ascii?Q?ex571g4pmRUjvhyri7ucQ8cmdyOEM5p7uxi2OVJ3c3G4T/AaIA2mzAeCVQpG?=
 =?us-ascii?Q?P66aXy0bWpnqK3Qpclrt40kPyloCMlym310zBfM4gJnDTX4tNyndIdb9O5vY?=
 =?us-ascii?Q?3or/5kDBfHiPDtun1ZaU5V9KWe8f7yS2htqjBiWzglCovkWl3klopLPD44aS?=
 =?us-ascii?Q?RB/W4x9LK3/7DdgU2k2oe6Sz2UQ/dT0qfK4UeNzEPrLi3sXjUKP6xbOryG4V?=
 =?us-ascii?Q?9OIXEobvjJEmUgl21KY68aPamGXD4BCQDYyud9ylWgX8cW/Jg9cAvco52B57?=
 =?us-ascii?Q?sfXTOlPo3PXxTx4hAeVzeN/Zor7PvjQ1e5E1pA+fYoXbljtjg53ZoU240DDv?=
 =?us-ascii?Q?ugS2FqwVgCYgW7YOlWXaGdJvFfiH1qc4TW3NlhW57M5NqIbWMjjnG269NU3w?=
 =?us-ascii?Q?jmFmJ9hulaeZZC+uPHGyZeg4zh2hNBqB3KgxOdvXouIK3phMkVLQpyUWmF6X?=
 =?us-ascii?Q?BQqCllTdaOq7KWO7T5/odgCD7FKZvFG5pG189PbVt+o3+A4Xer6nMPZ19/6Q?=
 =?us-ascii?Q?Y8uFmP3eeZ6urf1t50FgjohzUePtkPYC22KuObi7NdEeCVUdPi1pDk0z/naY?=
 =?us-ascii?Q?1yBHYb55rNumi698ZawhrWtveMmasj5A/Cy1stDWtoZc1kul7I0iMUQsIMP2?=
 =?us-ascii?Q?9BEgRI/7PZj1GS1qHnPEAPDDn+oyBYUpPPsvJfM8zsC3gMXTMU//QTAYNtpQ?=
 =?us-ascii?Q?rWXV0scylZF8aSIBZZdNpOgLqiSukkfTKZVRNse3J/jl8Lpqen5h0dQfWLvy?=
 =?us-ascii?Q?nglki/a65XQKLvwVyvWv7w1CqUMgXR8B0LJI9/XfG67YbgEDI04MF6/5PKqi?=
 =?us-ascii?Q?8EOxQ7F3uhMhS1xw0KIZejaFee4l3CsXBOk+9auOiPUJQU6mjxuR0w6xYf25?=
 =?us-ascii?Q?Iobgm0HaTz+sOnogdkyb6t1vpEDM76eF/HHQcE2bt9ICD1nE6Ee0YRAVdfRe?=
 =?us-ascii?Q?5aLOUAhzgVUrwzAHlOWaoBCxt2gj6vizFE37AyVMQcYnSWh899lXbSuvZlbc?=
 =?us-ascii?Q?9/mNSwQZ/fezqD1D4FxSR0QwD6uYPo49y+8HWSj1HsmhBzjUjGTbrFO0hh3H?=
 =?us-ascii?Q?iQxDulQ9rPqPb+xkjeBdS+uFrtGl140cMDejpjXtXZbyBp9u2mvy272sG91m?=
 =?us-ascii?Q?JvW51/MOVa8kFoHGtuubtn2ri2r8cpXibKU1hiutpPbL5YqiLxppu6GvTmE5?=
 =?us-ascii?Q?P4k1Tq+A7SGEkC720ysVy18qiJexMib6VAsWbdKu+kCwDykOSqT+nZPR3oJG?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d396c2-f01e-411a-086e-08de2c2114c3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:49:32.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+/BH7olJkLUQibu+xC3NnoMtwW36tb1JcWe+GmzXTlojdcSBw6TyNjvlChL+YCaI35x3PrIuUY/EiBCV+1Feg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9872

From: Iuliana Prodan <iuliana.prodan@nxp.com>

The DSP suspend path currently waits unconditionally
for a suspend ack from the firmware.
This breaks firmwares that do not implement the
mailbox-based READY handshake, as the DSP never
responds and system suspend fails with -EBUSY.

The driver already uses the WAIT_FW_READY flag to
indicate that the firmware supports the READY
handshake at boot. Apply the same logic during
suspend: only wait for the suspend ack when the
firmware is expected to support it.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index fc0470aa72c1..e25dbe32ef79 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1327,10 +1327,11 @@ static int imx_dsp_suspend(struct device *dev)
 	}
 
 	/*
-	 * DSP need to save the context at suspend.
-	 * Here waiting the response for DSP, then power can be disabled.
+	 * The DSP must save its context during suspend.
+	 * Wait for a response from the DSP if required before disabling power.
 	 */
-	if (!wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
+	if (priv->flags & WAIT_FW_READY &&
+	    !wait_for_completion_timeout(&priv->pm_comp, msecs_to_jiffies(100)))
 		return -EBUSY;
 
 out:
-- 
2.34.1

