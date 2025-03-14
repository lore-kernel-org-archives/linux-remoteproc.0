Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040801C878E;
	Fri, 14 Mar 2025 15:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741965373; cv=fail; b=Q6iZ7RufabY3ylsp6cJM9cMqfuy/KjwCDsLY5WNlE62F4Mmtk/sZHSCvHYZTs4tHZgsNdDoAvKx4+0qqZx01B32D06qSr4pfGl+CciOUCuSZC2fJPlCbF11ZZdlwwkXG2OUAwpjy/0/bFXNKjrphPswmo9XXXtSyqiLydechH1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741965373; c=relaxed/simple;
	bh=Av52XJNNnq8JnPPyO4vLycUvcC/aU1le9s4ac3zuPRA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Z1WjpLjruFCQgnEq4ohX/Z2dCCKOqRr8E9vhyKcVB2JoEd/ieBJISp7MqTFIa5r1IQw451pL8kWnnW2tYpquQ/+yg9B5mlJKa33vcW6wgNmR9GRGItzorSoxoPTGqMyjKYwdDip5NGhO3GimfKA6sc7nQ1ykwKGgkyKeM6fhsVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GkSQBTuu; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GkSQBTuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh9KoCPS+QCDPzGYfDP7oQI+qSnb9TwOBxWN1HXzpMBqnRcnEXOhLjRwq8uAU2oA0xY5fjWPUgMDyyvnMjSc7sdN+iPwoMhp6mMVVElHObf1KyjAZ9uDd/hSzsvvskoIweaj/0QqWE9oJSokLMw+jHYhb598ANt4/cFEsIxpN3Dqi551WIqpqVIyKIG0NtOOJQ93ec2wKfKfbrEeksev/G+yVBMHVfRb2/ez73aaTSteLj+eFsskls3tywallEm0sJW1X3jdEy91h9wbMip1ZF/4GJ1JpGPFTu+6LEpIs9ncBLr5fwfZcbPYkQSRTbjQRNVI1FWfFDDMoRQQ5fGhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyxDfd+rbtOPqY6kpqjDngzuTHHrmBTxdzDNK/Ud37g=;
 b=OWdQJ/XXNCAMqzHdp9H07ZkyQlsJTXUyPKA1zc5Byz4fIFrF7GfLAEA5O/Vt+pHn34DXLcjimUcOyCqB6xQK8m+vqrZ1x/qP2Lx20fT58+XentsoxscgkHQrtzVKBbD4yz4mGhxKNTX4ol2tQ1u/e5IjHOk7EoBM2aHUiUSndta8ip1Kj2MqJxPobLCdERrTEC2wjv4ng3tdv40ZqqbDO9oV5N/i7PKQKZBaa2v/yLBm06x8UbwM/Uy/h72bPzi3V2xVKllJdUIdzLiWQygZlbSpPN9zw0mzUM35f2EELlcTj6wM4Dsf/R5ozd5RXc+XSOXqRR8zmx7PrY5QNQYYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyxDfd+rbtOPqY6kpqjDngzuTHHrmBTxdzDNK/Ud37g=;
 b=GkSQBTuu0dhgiy4hwI27fUmrBoLuP06zLdnnbzbmfjF3yE48MQe2LWZwegAHrsWY3lL/kbx48In+V4lobAILHsR0l5roGBYgh+7jhqFNlhq9hAY5OwTx6Fi0qASfx+9titR+GEwKdtZJu0V83SXdhEH21wFH/aRoC19r/+Nc1dNoCpIGKw+x+oHipvc+hlo7LdrTTRRpWOp0n1Oyv6H3Bu1SHSB9RmTjOuc0Hxv/Q6oTSqGSPnHwZ7h/oeS/pmkdHcSbMb+SFyo8G7IV6hGNjSFA0zLEElWeJNwmI0Tsf7Ib3jTi05uA29XZa8HzRnECGYakGEr1VDalCHc0/tDaHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI2PR04MB11099.eurprd04.prod.outlook.com (2603:10a6:800:298::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 15:16:07 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.024; Fri, 14 Mar 2025
 15:16:07 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de,
	peng.fan@nxp.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] remoteproc: imx_dsp_rproc: Document run_stall struct member
Date: Fri, 14 Mar 2025 17:17:19 +0200
Message-ID: <20250314151720.1793719-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::40) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI2PR04MB11099:EE_
X-MS-Office365-Filtering-Correlation-Id: 648363a6-7d93-4352-8fbb-08dd630b24b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OWnkJvk9X8Cs8gNJA+iHdh+npKS9nsRgzUowMKn1j2pXI/5R1dgq5985NviC?=
 =?us-ascii?Q?JDNM5S4aAUHC54JaRUuOZl4LwEhLp2ECbF9iJapj08YGDMdmp57DxDhOmiOz?=
 =?us-ascii?Q?kWahrtOBWxGoBpeUF1rmJaOMQVMZ4el3fwZWU1R87qodcn/XZVKd45MNr2Es?=
 =?us-ascii?Q?TM5JWlRu9Sy3rREqnGZMewHC9rE9v9hSuf1lZJ7F2ykNhveDSb/E9GVyCzWF?=
 =?us-ascii?Q?vosPFfiIfjmXrjnoVhRbbXAoTjLVYCu9j3uXP46x68X3YvvObkbslCKge/P6?=
 =?us-ascii?Q?VnRvC92tmmaL1FyWExBAHTDH6b3L2HplAfTtNf9tzpfaxG0lm++ODwFkZK/7?=
 =?us-ascii?Q?7gfJ5qOBz67DF0B99qkcnNYVRo/bfjNEMuGv11/q7jj9jmiUBKQAv4b0/9Yf?=
 =?us-ascii?Q?/prtAdSCnlj3EH5ged1yznOWKyDtdIjmo3HaRPCSai5bqjcwTTa/xGlTrgbx?=
 =?us-ascii?Q?l8+oN4oVFRqUqVKr0V2zhbSYPWRIrTmDUUquQpB8A9UMXo35JnPGFTVcDMVc?=
 =?us-ascii?Q?4w1/yqJruJjfGV0i09XUZPfE7zwvGeaFmF5oMjAxgZxia7+WCzYClhA7AA3B?=
 =?us-ascii?Q?ObHapBxnwUQa3saWWBinXTrqLDDHxbwxb+w0ogLN6803pZlMJ9EuvbeYMYwL?=
 =?us-ascii?Q?MOwAtDsOdjUWmJcmBnHZCQRP2Biiu9QE3nlVqyGHTJOQJEYmctvWVGgblUof?=
 =?us-ascii?Q?Qv7TWVVHGQcSMq0OLbblZuHlkim3lVZqvti/lj6vO2SuG5u6xqjmNMv7fmr+?=
 =?us-ascii?Q?iUUw8L+x6DH+kqQ1F+HkNpFn87MBgvw71IL4EznHmAcY0sYcCLH/TTs6usyu?=
 =?us-ascii?Q?T53TfsyTVtWuCxm36Ayv45jvqqbWCxK4KVHKImkvqUIObE1Lj5nhfXY+AsQC?=
 =?us-ascii?Q?QgwcKgN8noKj8HO9AI1dSXMr7Lzb5wQ3IabO4zknqLQLG3jyAm88Y3CrgFPl?=
 =?us-ascii?Q?P8AZ2NetwyndlMg0tCOZ8A8H76ySAvanIJr7//wT9s/MlgWIgXeT+iFkENEF?=
 =?us-ascii?Q?424ZmmqYS9Ur0bj6TvYNifQ8prLzjFIxsiGY9zQ1NLeuS8/mbk2bpqkWQnRB?=
 =?us-ascii?Q?Hku2/QsHbPIF92zCNGJnJrupPxCbuW95DiQIkgnpHQI+dhXfAlwiLK8hS62V?=
 =?us-ascii?Q?gZ/waNkfQoXxTqPXyBxu09ttrdinJ8RHEknWUiVNG7tklupKU64B08/0dq8L?=
 =?us-ascii?Q?VlilEqEdOQ7wJuf43fI6UwVZ3wjST/lFhS2aPM75Td8DwtaFfGj9DGDDQ+Xa?=
 =?us-ascii?Q?sEzH5iwnZ51XtBDlWYYi+0ur3LxJArs7wN6CQzkfZoV4pdwGaeQo/HwJ+Mzn?=
 =?us-ascii?Q?BOKskpxm2zWQeV7Anq7N/4twJ8+tGio+bOdXelmOZ5FBZ5wO9YT5WFmoOIqz?=
 =?us-ascii?Q?DbwXd7mwn27jo5rYG7ieXdpZ7EFV2pvQYQ6tSJSpC5MIqya2fv5q0jj+iKZC?=
 =?us-ascii?Q?nhTmQYFZrqKRCjaZP9EknaMA2g5/8oUV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pA7hQhk0keFuMRunR1QyuEPv6NCsT36UjyGZ0alPBOj/AwqIcED0OCiULJ5Q?=
 =?us-ascii?Q?xl9BvMaYuQvw4Jeb612mzFi9EuCbYZbWVb5T1V6sn3p/wzCrWGTuHCuXvCtc?=
 =?us-ascii?Q?vwtRYRSNqhZHam4gEG6yp296dMqt0QbNp1HCT1TjRGSECjGCcuAN8FAv9J61?=
 =?us-ascii?Q?lFae4PUHMK2PdyLhaoAee5dYxgMBEvNVGDZax5iFb/xpmwvfzIaaWqlfUpZ9?=
 =?us-ascii?Q?goZFkzbby+k601A3zYmUSijfyrDHLaMQqKqkegdAPY+BPwaPVuoYdDCyz9KT?=
 =?us-ascii?Q?bEUg4FiRPhRkJ+M7emDhGtCpO0KFQLDvoLBRBOXcNEkQl86hLN2sB8W7xdD4?=
 =?us-ascii?Q?T1+7bi2HmQO5OdwcelN0/Vx2W5AOb3fMZP6uFwyIb10Op84j5TIyWkx/y/ll?=
 =?us-ascii?Q?gqJ5K29pCZhf2GObewcGq3Pm0SBBLPybp+pPevGXjQKgsiTpR1WMZJIeMWeV?=
 =?us-ascii?Q?L6IULUHFtnTEDW7LeeWyJGWk23KZl+Wb503H+7QBoTulnLYHK6HLpSkICQXM?=
 =?us-ascii?Q?oZnczxI5d2nl2vRUsAiRRaOr70bMjqUKTdKojVS+iIy6jLBv1Mi2Ers//0Tm?=
 =?us-ascii?Q?DIz7Ufq5s7gKn1HBq8OE4vlsv4SvPXvA6vwoR6Uzxz/1RCav+Jem9knhvyBq?=
 =?us-ascii?Q?Y+Ez2AD4xNoeUR8eduoJYgkTsUOIWS05IfKrxwn8pf4cbfZib8hSCbiWJQ8G?=
 =?us-ascii?Q?6xSqD0qXnFnLzFUu0c/gvvQkPHm4maoUzQw/nkLHGdhPQh8Fdc6bPzTNsQCk?=
 =?us-ascii?Q?MSPkzbD0zS6Ja3+1ihtm48UVfzcSGrGYK1y2p8+avB5TzRMexDC3gz10bK4p?=
 =?us-ascii?Q?FakRDeQoCJKrqbxN7D3Dx5Vv2k2gIb/FiMnRPFwhdQZe+ga0p/UXlHuhXF80?=
 =?us-ascii?Q?4r3K0E1mH0NvfFyo2qT9J6tOmO+Rxc8LRb6Xz3GhhqkBxUJvz2O2+fouQmS8?=
 =?us-ascii?Q?FTuaFJ/xF4LddbS+CmlsRluIUDNMR13CxjAeX0o/I7qNoU92t/OBJMCjXmg/?=
 =?us-ascii?Q?M3PQVOUPhHTojUuR/d8fPhTPHa2KDb0L0ZGZ9k+xrEpbiNITRSoFqeag9SY8?=
 =?us-ascii?Q?ws2SGnH+4X42M35SIGhZfqY48F9D+NyqppDZGLvrXfaRDPSFwhSs5j0UGrDs?=
 =?us-ascii?Q?lyi5J3Y+ch41lXHFfoZm90/CyKYNO/m6ctScGOuyM162Y9BF1tzqUQfh4kZk?=
 =?us-ascii?Q?6Wl6qiHIRRUpve/a/OyRn0arnlwIwI9cPQv+2wVHi1IEq1IUCgdrDDfflBmK?=
 =?us-ascii?Q?OSdD5lqh15kSZ1NqSpmQmlidpRu+VopnTBZsFILcWlBIfY127uS/Ldx+UZiy?=
 =?us-ascii?Q?pO+USaAArKgZEFDfqg9D9eNRebSxgHWq71SgS0sgFlVIanr3Lr2LJhG4S3M/?=
 =?us-ascii?Q?/ehZaAjIebWPHIAyNaGc7dj86btjJatmr675qUJwu30SCwzC8wPMrjno9maX?=
 =?us-ascii?Q?gr58CwLchMwFfem4jPayK6oPTkL6GS2bF4pHC6V/b0kKrfDiavJ8RVXDIIvT?=
 =?us-ascii?Q?BCMswy95AqfXoMH5d1mrheykKI/mgBkjqpGJpzWDDsYrYxhrG7zE5KYniF52?=
 =?us-ascii?Q?0f7mRdt07EFZCrAHWajhYtxl9jsuJ46LxeGqTOsl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648363a6-7d93-4352-8fbb-08dd630b24b2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:16:07.0518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WglZIdwiQfUmlRuwlCInVLVL6TbArQSYRd4H8eH/o5bv4ExW1kuUplcVnRIE/Run+xIry1BEy7aN2m7cq5rLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11099

Add documentation for 'run_stall' imx_dsp_rproc struct member.
This also fixes the following warning:

warning: Function parameter or struct member 'run_stall'
not described in 'imx_dsp_rproc'

Fixes: 0184b4fdbad1 ("imx_dsp_rproc: Use reset controller API to control the DSP")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503142125.IE33sCto-lkp@intel.com/
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index bc60edcdd661..90cb1fc13e71 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -96,6 +96,7 @@ enum imx_dsp_rp_mbox_messages {
 /**
  * struct imx_dsp_rproc - DSP remote processor state
  * @regmap: regmap handler
+ * @run_stall: reset control handle used for Run/Stall operation
  * @rproc: rproc handler
  * @dsp_dcfg: device configuration pointer
  * @clks: clocks needed by this device
-- 
2.43.0

