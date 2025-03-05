Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91732200115;
	Wed,  5 Mar 2025 10:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741168866; cv=fail; b=TMu4MMjxVWNZLJooq/C/4TKRqmhGPyfBj0C0Mf/jD7w3HYZKME2IywVouy5/bBuVqfvKCPk4D8DW3KkCWBg/07coGgjsxFbqdfPD00y0W/N6ddtiF4T58cwdChjlIEC28zQfI1wUWYjNxgmriUbqV6xr4lUBBKCH9x1ujbEF5BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741168866; c=relaxed/simple;
	bh=pPMHVYS/ZFis6AjWk1u44m2s46bH0W/s5kh6vRP6GH4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CDnJunqLhxN5Pw0P4oOuynYHNPgtV3eBjWVSa144yZ2BndKXfLc8ksFZscuc0Uw+l+Ay8PUpvoaHK4FFVu6bVVy+7tscDNMq9ZTEPY5zCfg28FNWhg9E8qMexhhGBKzPfhj0yloPRZhdoICfdfiWhh4ZnbSp2gIXCSrsKKb4QH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PgA/xUHa; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PgA/xUHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3hGyDARL5HfKceLcNVEitbva1s6mDTwB8DEqbB1W5gtdFFph+0MxbbdAge3sK9clRgbzwOl5ot14GPcp8WNfreVwPhNCIGxc8uBj/xiupLFXokyNuhytGHpfgJ7pnCCRKv71plVNcdzN+XHLIqOu7tlkoSZRQnrlvq0emquxwWQqRbhkW+TCsK4bw6QiZBP3kOrONh471J6ageRfH7+J/dNr20vyHQBDWByb1Z9+uNFHJ7HUPn+ByaZ1+b5mnD7gECBkXmRm2YXGOwMfocRSq5ulLpnosM9SNPqYhLxm0WsbJzmjeAw90zc8bP4PUQOT2ftj0qkuRRrvboAzChvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaHdjN3Ftssj5DYtrfw4nijQep+Nx/nZheqe395kiZw=;
 b=h3u4kGEZmMp/hFpy7ntkWF2FyZMQM6zeJwgJEVe1E6wSBP1zzsbwjIDy1OuQVUJ7h/Z1jIN+vbv3UE/nUB3CbpD8xnO864/wQFuck4ayYj8s4uoDWL2gksXGRwqAD/ViHmMfHt+yxYY3ix7okBad949hEESc1gB5LrWFRVH3q51/aCYEHcjJUA7tLLlkTSh01BGdN89JrcJ3YDq18EQ4CW+krSSqRL3gMLn7kxWGrzIAEkG5td9Q9MQMK1FYPUyaQ1TvXgzWEB0dF3eQR92Ekq660TdXhk3Bxr0abG8VC8kSsX49ETwcfsNYaJf17qbxd/sXMenRZuqNolSpTTDeMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaHdjN3Ftssj5DYtrfw4nijQep+Nx/nZheqe395kiZw=;
 b=PgA/xUHaUnt/Ad+N+E6JaiO7xNV1wIHK9mp117fRhv3jjawUnbOk7wfHyCL4y+ohiPFSxtGEOO/SrnEFNjFD9XW0HTF9kuJjPdoiugtET3WK3zx/e1bWvH+okeYYV8MEux1PJGwOwRw6LoGOIsrILpoL35ZY+qicWzqSg5lmpLCk1hGDTAdAGwfBwCsNFhLz8dh950AGPY8/omx09JRGECSwuP1N8yXU/m/1X9Vjt43trrgIYNGsFn+bJJAhYDtkEq4nAO4Fy/y/1IXiwFok6kkPfXu4ntubdcLNwJ0QMi/ydWeBskJirtzTI1x0BsHJAwRtHpTJqXBdcMZwqdCd1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10541.eurprd04.prod.outlook.com (2603:10a6:800:26a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 10:00:58 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 10:00:58 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	shengjiu.wang@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v4 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Date: Wed,  5 Mar 2025 12:00:28 +0200
Message-ID: <20250305100037.373782-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: b69668e4-91e0-4c05-077c-08dd5bcca064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ExE94XEr4NjlnHj5rhi/o2yby0SzeC5+mlk9hfWsTGJdWHk9SnRA5pbtIRde?=
 =?us-ascii?Q?Y8UZvatMUOtHe9KROzPIBWX3FBHhGXrP5mD37rvVL8bD9X6myBA5d8U54oj4?=
 =?us-ascii?Q?S92WZBfvf+u8aIP4CVAbAAfVWY6MD1fCunYD9BbH/tXAJcRebfeVzKPywi7n?=
 =?us-ascii?Q?hekpoTXnKfpvIImG5++GpSKo95WomD+XiFu+TKB5IZO9pt8d00iNSKhsUTCa?=
 =?us-ascii?Q?+jrk/CuH0Qrw+caqn5/QsFu+5dZVTfjmtLbmsMY9QrPJqqNzYQxOCGM8i3uU?=
 =?us-ascii?Q?J8VfitgUUuimdIq52DnaiWdokSPgkLdUrqqYGgYYBRdUpzU3USOtzXQynKx3?=
 =?us-ascii?Q?6MGxof4VrR1RhSI6gBvOilLe8ybaD9AmJ0dVVIKDMJqDTGZZlGkL3Ovpj8Xd?=
 =?us-ascii?Q?KMTSRkOSzGNBjgtJ998zXHsKsUUvMQ/G/xHVh3eUGp6BXJXuVJa5U9sLQEd6?=
 =?us-ascii?Q?/rVc3kJDFTcGv1lQXYv9WGr6lw5u1/57We1J1/bB/t3iFVPDSQlCAvuVlACS?=
 =?us-ascii?Q?UDvxDu2s/lgR13FbM7GluiF1n7w2ZhK03lU5iuvdxv7dolChZk3h4EODw1Bl?=
 =?us-ascii?Q?HKA/kEFRFduw9W+e/FtcT69JL6w3MqrR4CxXIYm6byxbAAP6UW0t313RXqrh?=
 =?us-ascii?Q?NW/b+jVkkY7XtsvxIzUMy0yyOUtZ7vXCkBPzrmTUNXgaQG+KyIz+t7LQ24xk?=
 =?us-ascii?Q?jEm9Ic9KBuwNk1M7r5ajXgJn0LlAukSoFaqg+EQPrI4vlivLdYIQKIRudjRU?=
 =?us-ascii?Q?kKAglq82WlHbYs+rEabCs8n8iJNx7KouQI2Wf67aOzELrgak902f65ZoQMho?=
 =?us-ascii?Q?CxUz8eZi1cKN4hxBn32CYxwnrfRJDKltxSUHdC4dGh6FP9XMxpove7QMWDik?=
 =?us-ascii?Q?fPKGFAizVqGUHLlxx2XjigfAs8QYzSz+PXvuU73bbPqiPa9fwLM0nIxmEn23?=
 =?us-ascii?Q?Hykp0/Mux8L6QmRLAgHTmFhxOoPSn1m86cSugjV8BVAMZW9SqFSQ8YnzyYVS?=
 =?us-ascii?Q?MpP17twOz+vALfa3YvHlRozVaJzHVOtRaOASTP9TSPrmZC5oFWYjbrM3vo9y?=
 =?us-ascii?Q?zhxlvl7hoEV3RuWWkNfkfEBcyRGJVoMcKJoy5MQtQ8K9OIwprrIlvmmgn5Sw?=
 =?us-ascii?Q?vMtGgzXiBVOBC8aVhdB31mJVH7J6k9C4aMgthFVhJ/UGx4/cIsaa+3HzfXO9?=
 =?us-ascii?Q?oePjGn1Pmea/NZVmsjEQ/cQOXLDjgs3AJwtxZvHiArV7nSTlU3tb0f/P+u9K?=
 =?us-ascii?Q?cBV8ZObB/s0c7iT+yxpWN5cmSMRv16dNkrwbBvrAW6jR7NpX+T8t7WPWkmdu?=
 =?us-ascii?Q?Zt1hVYdbQtqiGCPvwbIYc9daXwIt6W7nsdpRnSsaMgebzXe+GS/MNOL519Ko?=
 =?us-ascii?Q?FVdeNWjabEyWH3pf2AYcNQvCqZ8qFMCFCKMjEZASYa7+jtzsOA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uEn23/F/euD8RJnnD9a0vPt73IL8rPEI1AP/vp0xGu3rz3SshGTYDrLZuJHN?=
 =?us-ascii?Q?7ka7jNWyfCj7AimnXXYzslarEiXTWilqbSJclXiUgrAx/VHVdeCLiPDOKFIU?=
 =?us-ascii?Q?YTWv/39ksTXcy/SwEsWfspmBlOdxRszp5zl3O/S1qC1b3iTsI0YidJGnQN/Y?=
 =?us-ascii?Q?/1UZHu7KSU6Ccc5QjW82LR5IRbcWmfqYVJIjNNuI/r6jOOYEMoUyqV1IX6BU?=
 =?us-ascii?Q?SUwc/RujsU73LGTihII52KTPO6BQlGtF3+osFnd7tqLsv3IHFLicOmS33hCq?=
 =?us-ascii?Q?GMyquWNdI8NwlVSQJWR0jPH0Ia69s3WZotN8cxET87eeD7lkMnFdjaTAQ0OU?=
 =?us-ascii?Q?hYX3xnhAJf3hTwrK5M8897mZLRoh8cXSSDvsHGAfcUxp0iMseFVxIwS5qxWU?=
 =?us-ascii?Q?u4I1BBwFZ3ZndKZ8kia5+Xkup6F1crjZOVH9XKUmPVXC012bSM5AdyWyEYMx?=
 =?us-ascii?Q?0jg+p8oK7RD86945YQBqzc4Da7UlOlVFrL33MvddoDK2v6Fv/E3lwOwg9zRN?=
 =?us-ascii?Q?OOD8VHd0a9ngKTcwUTQp9xCHF2Bo4jk6sk7by526UEoZdPHmRSLqlvcZ8Qgy?=
 =?us-ascii?Q?Tpy0hlmrcK1NysKaHwe4SBDuf8HToTvpBn0LRnW9SHkqlTAEQJq5TLFYDi4d?=
 =?us-ascii?Q?a3K9JChvNfPQ8rlVWZPll6w+/yWAFeBWQkDBpl3JtkgFrjEU18r9A2AYMyLU?=
 =?us-ascii?Q?8GxjvEqHjntEt61Mju326cyr1afdv4YqPm8QfANt+g5WekD2tj1S7S7Mw1U3?=
 =?us-ascii?Q?pd+NI5mutkKlr7ZNeqIhxmhmdrrru6pvdCo5j+DsGZ+nAVYVp2eJjmC7UO95?=
 =?us-ascii?Q?DPUJKAL6WJJDWl3D22U84hWWTnLKfinPss9zIcPrhic7McvFzhc0iD3gqzt4?=
 =?us-ascii?Q?7TE+itPezO3aZn0qyDVZpr4X3XpLnkF0y+bFsleb6W1A32vEORpXtEZUeAHE?=
 =?us-ascii?Q?FS3tSHIVflk6FXz2FC8JPPLylRM2O2L3+VU9JTZXp+X5M8P/PwzBlcFz358q?=
 =?us-ascii?Q?ZMsUfVD+8aFqrGjp0eTZGSN5nl6mr60m6tWMcuLIlGobFTgZpJ3so54Wp7Qm?=
 =?us-ascii?Q?JtdntTRjQAJTjXM9KbW87aOoJhx8MfG0uB5Cv14MIhoTq1afDxFzyFy543iS?=
 =?us-ascii?Q?E2jlNixS+qhz4Up77jtnssWCYuiTrhFjSHWf9ab5hrYSwXEBidwQGjzfrqDK?=
 =?us-ascii?Q?Pliya+xvyO4YyQQurHqIekK+ypLf7ygtQ19d9WiljGnHihZfeJBhzGsdqVLw?=
 =?us-ascii?Q?DMeUbGR6vnFdK2WqxdkK8eWYkAl4B5IvsmIu84DWCzR8Fb0E7zPOl2xyE+nY?=
 =?us-ascii?Q?CWNJMimvGDXKTQzJA/SnHdq+Lswb94H0e+kGL0rcrX7rJiXHm67zOKPI3qpj?=
 =?us-ascii?Q?Io8855xX4OCPnD43wpSvFI6CZZQYjDqp1hvdgrJ920LJLIwPbCFnOedNJiWo?=
 =?us-ascii?Q?V5kYv9kz20Lsc1AktFzYJprin4RZP4paitmsMU+414o/MVTrEFlpKMomwzX5?=
 =?us-ascii?Q?6d5rndSXNiC8WmY/L689/TnQt/o/KwN2u2n1vaX3WaebCG7RC0/KjPX5SQ2P?=
 =?us-ascii?Q?winGqGDEvPN2SeP8f+si8mvpKQ7r14h9AsaDX4OY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69668e4-91e0-4c05-077c-08dd5bcca064
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 10:00:58.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7ewER0yuWUzQhvhaqlyvOQAwtWygEhi1aDUppxkyPr6Y+pJiJOkFvfzXJNlOk6XlTLs/uK0IFUMcUEAQn/gEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10541

This patch series adds support to control the Run/Stall DSP bits found on
i.MX8MP via the reset controller API instead of using the syscon API.

DSP found on i.MX8MP doesn't have a direct reset line so according to hardware
design team in order to handle assert/deassert/reset functionality we
need to use a combination of control bits from two modules.

Audio block control module:
	- for Run/Stall control bits of the DSP

Debug Access Port (DAP)
	- for Software Reset via IMX8M_DAP_PWRCTL register

The current implementation for IMX DSP Remotproc driver and for Sound Open
Firmware driver (already upstream) uses the following approach:
	- maps the Audio Block Control address via syscon API through
          the fsl,dsp-ctrl property of the dsp node.
	- maps the DAP address space using directly a call to ioremap
          with IMX8M_DAP_DEBUG macro depicting the DAP base address.

The both approaches are problematic when comes to describing the address
spaces via the DT:
	- for Audio Block Control, because it uses the syscon interface
	- for DAP because it hardcodes de base address instead of using a dt node.

This patch series aims to fix the Audio Block control usage of the
syscon interface and replace it with Reset Controller interface.

Main advantages of using the Reset Controller API is that we stop
abusing the syscon interface, offer a better probe ordering, PM runtime
support. Main critique of using the Reset Controller API is that
Run/Stall bits are not reset bits (but according the hardware design
team they are part of the reset proccess since there is no real reset
line).

Initial discussion is here:
https://patchwork.kernel.org/project/imx/patch/20250212085222.107102-6-daniel.baluta@nxp.com/

Note that we can safely remove the fsl,dsp-ctrl property usage from IMX DSP
remoteproc driver because there is no Device Tree users.

Changes since v3:
https://lore.kernel.org/linux-arm-kernel/20250225102005.408773-5-daniel.baluta@nxp.com/T/
	- renamed resets ids as per Philipp comments
	- add boths resets (named them runstall and softreset) as per Philipp comments

Changes since v2:
(https://lore.kernel.org/lkml/Z7ZNngd3wtJ5MZgl@lizhi-Precision-Tower-5810/T/)
        - picked R-b and A-b tags
        - use run_stall instead of reset to refer to reset controller
          instance
        - remove 'resets' description as it is a common property
        - add correct include in the yaml dts snippet example
Changes since v1:
(https://lore.kernel.org/imx/20250219030809.GD6537@nxa18884-linux/T/)
        - addresed comments received on v1
        - picked up R-b and A-b tags

Daniel Baluta (8):
  dt-bindings: reset: audiomix: Add reset ids for EARC and DSP
  dt-bindings: dsp: fsl,dsp: Add resets property
  arm64: dts: imx8mp: Use resets property
  reset: imx8mp-audiomix: Add prefix for internal macro
  reset: imx8mp-audiomix: Prepare the code for more reset bits
  reset: imx8mp-audiomix: Introduce active_low configuration option
  reset: imx8mp-audiomix: Add support for DSP run/stall
  imx_dsp_rproc: Use reset controller API to control the DSP

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 24 +++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  3 +
 drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
 drivers/remoteproc/imx_rproc.h                |  2 +
 drivers/reset/reset-imx8mp-audiomix.c         | 78 +++++++++++++------
 .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
 6 files changed, 114 insertions(+), 31 deletions(-)
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

-- 
2.43.0

