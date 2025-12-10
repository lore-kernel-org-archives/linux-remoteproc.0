Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C635219E8;
	Wed, 10 Dec 2025 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381611; cv=fail; b=B+RWImlVq0sXIoj3pcQ3SRz9fJ/dDS3POVUWuI9K9knljq6DXALVXT4PwRQ696ixjvXoyemG6WGyiz7Nz+APidJsEfX/lq7PYCAh82eq8hbDTxU0Zb9xsySbxweqhPyEkBHDWvORx83iyYfmdOn0VOBQHTEgMNY2inA61qNGouI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381611; c=relaxed/simple;
	bh=05VlzDEcy5Z7Wm/hCLF+ggSbQ6JHj/pHGlwO4RGKOsg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IbXvxIq1G7f/HkPzPH9ByOdjd/VftnTuJ4HrfRh5mndl2c/EdmivHCZ/OqfZTREPXL2TwlFejzFoHZFSeEYnrPIxJ665esH8z4e3dlXpx4qD6wlQk1FpXs5mDUCuejjcAklN3u8RoOCknSR28VoM6yn/RrQOJRkccO/r8yMWd9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YacH6BEX; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YacH6BEX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGIxir/km9EtsM+Ewz2CH6Xd+VGXKmI7jugSmdqbziKTCxr7n7r+eUBwIx7EYzy73kEBv5eJM3Rqk96r8wzi9aSVNL0VE2ZU53VC/NdUdQ5oNSA5TLwmzqFoGkpXTAQUCSFk+dttIimxHpVzAjco2xaYjA3d8rbhMUN+icctbGsnzVwzeMZYDxTEvTEOSyzPCvkanDONVxsDgBpYMN9xamZUyVc/ns/qwYtMQID6y3vtW7/bmrywviu7LLN/Ao2BC6Cd5E4Jg41a1KWu8czfN9YhT6saSCZOqoSb1i61iqRgM427ShY05VI08XvPTJIHh58FsSAsoHHS27KZwblfEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvtx6yiQ18FpnDIYsbsMyEPgC5JNzIDONm/Wpow0B3A=;
 b=PNKmaeEPiDM8QpI4FJegK+dM/w5TbvtbtzinGcJ8Vnh+bSRszxcMrxJDI06qmAYRIjG0Ftrj8yYw0aMv06uTfWB7EVT5UPvcSrg22StIYmKvvgJkk+oja5zU6FUrY0g55gQkPKnaFDv6rpa48lxdB3BWOcjfJqGqgI8VytKDXxSE0w5+LreRr8GT2hnOBAT6VQdDX/v6Qqpnij/CU2HBz1sdH4vEEajSHxN0JfNRH4O0+G5qfzbwisym2/VM/LAZiHL6MtP36PTUjSr8ISe5u9+9H+sBf0NOJJWo2mnYDG3GWFsEAp1jrCkeElSKGs/ZZpgRZErXvFej86U72KpDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvtx6yiQ18FpnDIYsbsMyEPgC5JNzIDONm/Wpow0B3A=;
 b=YacH6BEXJl3wAHESM650dNogb6a3VfvgwVDq7rbzJh5d5FAFv3q1QXez71gXNUlaec3oWOabO4DC0jUvNPggXDTHFN2FN8GhKIe2i0UGiAPRNFKTb2xo5X00w6pNTJDVAS6JSjWn2jqgxuqsgPc5ld6ImcbfbMHLyYFp5sZe5U+0qcrSCr5DCFAUaKjsBIpJMBEkQ45VJ/wZaiS9jSEmPp7aJGrZYCPOOzbKeT/AM4uWfOqKwhpCTnsU5JB+7Rgqr7q55WEVQMFkHY1XR6xNQnGh68MmSC3/bgg2ARMcznkslLtf3S1M3ZuQW8c/ClIZApB27zK3mc/iwU4RSV4V8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PAXPR04MB8141.eurprd04.prod.outlook.com (2603:10a6:102:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 15:46:45 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:46:45 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: m.szyprowski@samsung.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	arnaud.pouliquen@foss.st.com,
	robh@kernel.org,
	geert+renesas@glider.be,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
Date: Wed, 10 Dec 2025 17:49:06 +0200
Message-ID: <20251210154906.99210-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::11) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PAXPR04MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 167d3c08-d767-40d7-0452-08de380351f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7RsV4W5ble/lIlQNTv6YvJsRhgh0icNeVEIBXSYF+48VRU628LMJN0WR9Lz+?=
 =?us-ascii?Q?kSAdA2vKr/XDEsnsnFrcmZLo9TShGeGlVALNrEYAgkBZ1/On0tBnh9/m4AIY?=
 =?us-ascii?Q?ghMsw8MngudTRHO762+xYb8lmijkh/73AYFHzaIhI9t0/Zr5/oUqzOSlkQ3d?=
 =?us-ascii?Q?PPlbvCWEjcAuacHCrajpPZdroUZlnSeHRnzsPo7yORdfbauJKqMspcCAy77H?=
 =?us-ascii?Q?kLUMHOR5ivjIF/sjIaery3pTV22Uz/PCUfyyIh05QZ3DLNg1EwI+l+EGR5AE?=
 =?us-ascii?Q?Sp8TTkl53sVkAKAKlphDDd8mzAFKqw4oJdFxXZw3RbHdf8+O86xpYJ4tYs9T?=
 =?us-ascii?Q?M1OdSVWA1tRXNtA/bKrws8/D1c2ouT6k8PJQa1sQmqXsCooMOxw9Cshs+PkO?=
 =?us-ascii?Q?ZR0Sp1I+eyP0HHPk0D4Lk4nX5kCtXBCu4xima6dZgnP8NRpTiMHSwDC2O4lu?=
 =?us-ascii?Q?eq4ddb4k/JCYOIT15Sk8VfIKCtcv+562KAJf7hYxcw0YIbAuKvPkHptPN1VC?=
 =?us-ascii?Q?y9l+rtFqnr7GLZrhabdonUrISSpK/vk97ghPghIjnxo0DTzMlf+0BYT6asRX?=
 =?us-ascii?Q?HJP+5SUbMwuH2Ssi046qK0VexmCZItEjonMJyEK1iZZuwq4xpSlPEcBfQihs?=
 =?us-ascii?Q?IDMC4e52tYE3PLpBI7c1g4CCqwGSQgmwH2/eXJfTzK85uKDEMEDBkDTpk1Cs?=
 =?us-ascii?Q?CbVWDqwniuaS1DryoGvkl6i3in8M0W8elt6YhPrMoBEEPEjsVLrE6y461uYw?=
 =?us-ascii?Q?VuoFUmvX4lU9wn0Zi8dL1fa7ibR7AH2/iFZYeF4zzSry1dtRVMCJLXt3jEJh?=
 =?us-ascii?Q?JKyXqMWCpDtUEd6h8l14Y2ENgVfPz8mk0jMAYLoLrVVPCpd+rG+QRCOmn8lZ?=
 =?us-ascii?Q?BN3Tgy4fJaWWIjk9hIC+XYKJ93Ojt2eVnxadmvqcCmawSiZKv6PuTdSZOSUh?=
 =?us-ascii?Q?lX4qyMrFUS0k3BMPJI5fcjMk9jjG3otiCGABvkIY3v50JZ3K9EM+2CCaHHnD?=
 =?us-ascii?Q?0dFnrpt2JgKIz58wW1KhqaBwd+fu3laEE9Je5GIGOlQ/oomZt2rPWI5B7uQZ?=
 =?us-ascii?Q?gvGxe1fgtV3xVX3CJdChcDgR2EPFn8g8pw64MBeiRVrxnbHSYZN6/XMThV7z?=
 =?us-ascii?Q?Sl6uEQhnV7XdxF4UM8cMgp3xl4AUG/MloYHJP3FiNE8uCUmg1JWJXks/RyxB?=
 =?us-ascii?Q?EbmguQHcJGrJpW+fr0iNI+r0DCh8+V+meH6qHUgQ4SVT8i9Dl8cKNEz6VwZS?=
 =?us-ascii?Q?NSKO5on7k3gwNRsPRvTTJu+M+RpZzcvdpF1B4c80S+QTBKXNTdfqqVd/uQiq?=
 =?us-ascii?Q?yQP/6UmqzAbhwrolDYeoh1twwXmuUHU3vuoc2KMAAnY/LGkcQUDSUcS3RiPt?=
 =?us-ascii?Q?jnvzEsWiFJMCpB5bBZfx+sGgLw2K/YhAGH3vO/TTnZ6/DCcjdfvcexvPu5vI?=
 =?us-ascii?Q?Rkcl3qNHDou26zfI4CBA5uoVi0i7VPsT6u4dQVzezDKtmrVpux7Riu+mH1pb?=
 =?us-ascii?Q?N5tnoqbtGMH/SMH0hYw+0reWetO9GSlnf0kx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YnuwfExERYtAdVrsMnQLfACRIlL4UJL1XN9wSGf5i8C4zoF8yDw1yIFELm4Y?=
 =?us-ascii?Q?PQ0QSv2os3zuj9NTPOLPoTuDOeVjfhebjDExbpoNsLb1CFxUvQp4TQU4ifIg?=
 =?us-ascii?Q?PK4dALe6vNTbR7UvWiHktQbAQ+QOG2eX5LJtPp37c+i+773vRyw4NHB2I0/3?=
 =?us-ascii?Q?ounQCuwvWtA4BdCzV7cLxiPV3O7CLWvcJw0vJwUEJ3E8H06vJ/bJaW1q5Mc4?=
 =?us-ascii?Q?2O0BV237dU1rep6ULNmo6Vu8cuc4TUH9FSnSA7HmeJuBASUAw8/YlDtudnxO?=
 =?us-ascii?Q?75vSLJmF6qSCtpkynmPDcvOVPZ5tjN83MnozPlDCP6UDG9wsdFHoQwjaZM6w?=
 =?us-ascii?Q?SYtRi7TMCwQAJasNT0efXf79gGDS/SjkSlODmR1qJa2Z7cYJv9BNJ2/KVK7B?=
 =?us-ascii?Q?bhvQxiVeDYROTtG2i5TDhm6tJ68b9kNy0afbstDM5e+qDp6c/SwxlHwxlTxn?=
 =?us-ascii?Q?ZC6ZwET6xneZgSvW+oLJuQ9R2ExwWcgrvjWilYF+No5FH323+tvmiM7hnr8G?=
 =?us-ascii?Q?sopN7pqcbwxEO/Yy4qXZhQEDH/ID8bkbhLdQhBfYbU3t9w7VzYMCI6J/Z+MX?=
 =?us-ascii?Q?E/P5mCOmC3FUKR8J7ODbYUb91C7E4NZUa3gdW6Db/w65UDQOa1awnwq7Wbew?=
 =?us-ascii?Q?8eYHGfQvjmaMuoD+2x3/qK20dQMoRCQwapwlqc1Flm/N+W+BK+5LDUQzYnbG?=
 =?us-ascii?Q?1roiv6i3+VKTsq5NtGRJaTmdVMrDGNEKOTSBOupHBuF6BG6k2XZO8wSDw5gj?=
 =?us-ascii?Q?EIFEqOMtQcJCENUQUDkHCtxx0p4/wc6tPXHOtuVupZphy/MoU2qQg+votQf6?=
 =?us-ascii?Q?MbjiFZycIMXWj3K9ea5r7YMJrscuTrmTYzpvyI+kGPY0FpfqzsB8Cn1ZOXOX?=
 =?us-ascii?Q?m64/lO7cVJ2vPHFb1LbxG1HbSlUg3F+EubiSkxjcx8yz0uAomdh6FhHHQPQ9?=
 =?us-ascii?Q?bkNuoEUXa+JmLNEeKjCAlDvGLuUFB2z7aMB0wGhYprQN6LHptxKwT2O0j1eJ?=
 =?us-ascii?Q?qn1QYvv+k8WsN8ar8J7CI2XiZ1Se1IfvJBsnQvbL7d7T5xfQWx3/tvIGmOu/?=
 =?us-ascii?Q?aSDhBEV5PR79NQpk5xBt7Y5LKYQUIL69CE3nOBQBBJTsrB5ekTq8n3e29+15?=
 =?us-ascii?Q?ygFelvM/wHCpuB3+aZwSJPxrq02C4oGqQuL80fu48yLealAClYFFElse/Plo?=
 =?us-ascii?Q?DurZr11JNKJXC06Bcq+51dTgTW4H8v1ywUP4wbakPTu0M2CmrSf4uU/qUFVp?=
 =?us-ascii?Q?sQlpXgc/RJG+ND2IvD2FhJzPEhqZsPrlbHb2PRDjF2T+fUaOHckg96nZcupj?=
 =?us-ascii?Q?phktBWBgjXbhveo81juUoqupSaBQmrVICyZ/V9WTbva1+l/DzMQuPCWWCser?=
 =?us-ascii?Q?a0fCqJUqgce0eMxwYVegDx1KaeNKQiwJb1TEfooApHQdMpQ4ZNdWz4cR4M0L?=
 =?us-ascii?Q?p+vHHmgSpLJzkfAYQn8yYim/oUhk39z1AOR3CoMs4ffjshin+gVd1MfPX5QX?=
 =?us-ascii?Q?TqxJMNKo/n3MlhHphn40px6Ixftuz0Oab9VNQaGxa0z/hr0dFT5S28eD412i?=
 =?us-ascii?Q?d0whQGkxCyljiEiafGj+oW6kGAfiZI5u36uFQ33X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167d3c08-d767-40d7-0452-08de380351f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:46:45.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCeovie7RwoMA8NpgPLRY0re8ZWK7YUjIYUdBK/TmTJicAsSLZwBjC90cQ8JpEK+0jdM8WUFRCZZN+YP4t5AjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8141

After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
functions for "memory-region"") following commands with
imx-dsp-rproc started to fail:

$ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
$ echo start > /sys/class/remoteproc/remoteproc0/state
$ echo stop > /sys/class/remoteproc/remoteproc0/state
$ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
-sh: echo: write error: Device or resource busy

This happens because aforementioned commit replaced devm_ioremap_wc with
devm_ioremap_resource_wc which will "reserve" the memory region with the
first start and then will fail at the second start if the memory
region is already reserved.

Even partially reverting the faulty commit won't fix the
underlying issue because we map the address in prepare() but we never
unmap it at unprepare(), so we will keep leaking memory regions.

So, lets use alloc() and release() callbacks for memory carveout
handling. This will nicely map() the memory region at prepare() time
and unmap() it at unprepare().

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
 * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp.com/T/#t 
 * took a different approach and instead of partially reverting the
  faulty patch, used alloc() and release() callbacks to handle memory
  region mapping.
 drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 5130a35214c9..83468558e634 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->rxdb_ch);
 }
 
+static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
+				   struct rproc_mem_entry *mem)
+{
+	struct device *dev = rproc->dev.parent;
+	void *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va) {
+		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	mem->va = va;
+
+	return 0;
+}
+
+static int imx_dsp_rproc_mem_release(struct rproc *rproc,
+				     struct rproc_mem_entry *mem)
+{
+	iounmap(mem->va);
+
+	return 0;
+}
+
 /**
  * imx_dsp_rproc_add_carveout() - request mailbox channels
  * @priv: private data pointer
@@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = dev->of_node;
 	struct rproc_mem_entry *mem;
-	void __iomem *cpu_addr;
 	int a, i = 0;
 	u64 da;
 
@@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da))
 			return -EINVAL;
 
-		cpu_addr = devm_ioremap_wc(dev, att->sa, att->size);
-		if (!cpu_addr) {
-			dev_err(dev, "failed to map memory %p\n", &att->sa);
-			return -ENOMEM;
-		}
-
 		/* Register memory region */
-		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)att->sa,
-					   att->size, da, NULL, NULL, "dsp_mem");
+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
+					   att->size, da, imx_dsp_rproc_mem_alloc,
+					   imx_dsp_rproc_mem_release, "dsp_mem");
 
 		if (mem)
 			rproc_coredump_add_segment(rproc, da, att->size);
@@ -709,15 +729,11 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		if (imx_dsp_rproc_sys_to_da(priv, res.start, resource_size(&res), &da))
 			return -EINVAL;
 
-		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (IS_ERR(cpu_addr)) {
-			dev_err(dev, "failed to map memory %pR\n", &res);
-			return PTR_ERR(cpu_addr);
-		}
-
 		/* Register memory region */
-		mem = rproc_mem_entry_init(dev, (void __force *)cpu_addr, (dma_addr_t)res.start,
-					   resource_size(&res), da, NULL, NULL,
+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
+					   resource_size(&res), da,
+					    imx_dsp_rproc_mem_alloc,
+					    imx_dsp_rproc_mem_release,
 					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
 		if (!mem)
 			return -ENOMEM;
-- 
2.45.2

