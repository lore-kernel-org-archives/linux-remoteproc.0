Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE797266569;
	Tue, 25 Feb 2025 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740478746; cv=fail; b=Y4TtpSvLBPhBnDpmk4HI5YBkPxxZrUp5HVbZetx1WKBsCDtMN8dDTlvxLegMpJV0LrEo4jG5eMu782Am6N5tW8flA8FY5R5s+ioDjLzdEBtnd7rx0mCHB3TWcImQsLn5I97gAdnaj+RGm14W/gPzWmchn/UMjidih95gEjzWK2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740478746; c=relaxed/simple;
	bh=ultLxeWDa4jRK7QnJZcJZQC+BGqHHeJtgZbK2SQK0Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HQpSIbj7Nn3/MEnS2swSsf8+z0J2dLrGBYxRZYBGjg3yjtjqQRIMUOboyr70fErifoifW9mDFwlQ0i+/hc0S2Rb/00LycHbPUdA5b1eA9QO8gUsqPiGS/4ji3PUk/GKFrhoMStpsf2/phOK0hKGI4mW5X9F6zs3O0wM6L4vcMTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BK4nKdtq; arc=fail smtp.client-ip=40.107.105.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BK4nKdtq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFFtW+ORn+CKRbpHlOQnpEiz/UZWT4xAwPOuqGghSAr27jo4DGE4wLoHV8laBNRVsuXCQi7sgyXIzNzkIff1fJxlE4BSdZ5UT1148yOm6JH0VjSHt3EeBrXfPQzsmWHJEPMmupZYGDiybeycvDQhENTJnB4l0fwJ6U7tiL8k1YZPJDfDyFhsA1Vh4AklPxEBoFja7BPw2M3/XahbvIEirhMT3p6/xgW8R+XUS2GdJhB/8Pt47U2s2wl+/UO1ioBZQvCmqHQS1qhEudXV0HEvLog5xZIltbRtL0vuxA5VxW2QubBKvZ7iRAFRb2mWr49ILGLwBJgeve8q37goebhFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKINwTrGuf/ZSM3V/VNC36zlq4pjIkL+wF/W5LhiUFU=;
 b=g+W6/RYvQowAM/HlhHJwE7zWGqZ+V9C7lT0K2SaJPL0U/10BS+Wa8i25stKOQSnHGUkjt15egxuONRmq7u1sB6AmheA6vHhmqBOsn96jCdzc7eVzWeA0z/sd3i34tDAUUj+jZ3YwJwCaYwASoBFhCL/QTojZec6Dv4WnycgkDBA/TjY/TAGHSE8ynt+cTGagqOUPYQzSUfITXXOv8CmNnjypJVJs/3MZdc50qquMqGJ+FxSy6HgK+z/PNsL4IbTq/oXEDwMeRV12dJp8yshjFG7lE8RUN1dAwIUnP4PjksdPoMoiO/4KwYc18IJWxfyO1CvV+0c/OUvuo5765qRgJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKINwTrGuf/ZSM3V/VNC36zlq4pjIkL+wF/W5LhiUFU=;
 b=BK4nKdtquK7mDxaDYo2DrAMvaDrS9F1kLT2OOisQbAQoFPlMZdYQtyVbx6RdQEtP1z8pZLPnLHgJ5UmmXJMi0sBaMHBC+kUZNBoNnmr6fQc0eIk2NRW/xShccWkfu8LR7T8dPyy++cVrrHyF7jV/YL79qYmm2qXzsMccbd4fIR2juXgpCP94eODPSlMybPMUY6GV6m/qAwiwT6gx7RZ9aqgka63ZFnAQd5bf3R+cwirc9gZNDOwm/hS2d02uUZtQEytmhKlNp/lZnMvCr7OLbik3ggtQvJWx9lof0g/M4CrTBStVZJLQAnstsA6p88cHJs44zifDOEYyHaF8SplE6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 10:19:00 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:19:00 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	shawnguo@kernel.org,
	mathieu.poirier@linaro.org
Cc: conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	andersson@kernel.org,
	Frank.Li@nxp.com,
	peng.fan@nxp.com,
	laurentiu.mihalcea@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Date: Tue, 25 Feb 2025 12:19:57 +0200
Message-ID: <20250225102005.408773-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: caed5d03-1f12-4da1-1b0c-08dd5585d248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dVL2+Akwa4WbDB8fYELSVEoTneyzgI8Pp/Stoblkj96ed4FSPFCW8nPzcclI?=
 =?us-ascii?Q?Gv+SVzUTzsk+IKJUsm08T6Z+WL3t6/Yvq+3ehHdlKtEEXhasf0bs8nCxy3vk?=
 =?us-ascii?Q?6r9+WruJHFHfklR3MR3yHHjQPEVTJKmQCtTWx5kQEl8PGlYTlJrRr5ch+Cy0?=
 =?us-ascii?Q?FSuysZ93NfxQvV6In+xEEASo699fXlM93ctZNyFN9iRRytii4lNzL7NskaOR?=
 =?us-ascii?Q?naWCiHWdHro2YBX/ECZylWbnfmA9aoC8nAQJFig602fHw7zVCeZIkQ+qe6cU?=
 =?us-ascii?Q?e8hj8tF9MrenYdJvNk1bLVSaTKfOEEv/OapOt844Y3XWxxwDdMb+w9PX+rO8?=
 =?us-ascii?Q?fBDljglaZrCjAM36JY219To8aFlgQLs5Zg9PQKSM+Dm0G5goJHyvsmjnTy7f?=
 =?us-ascii?Q?VPH9+S/R6yXHLpV0Zkl6R0kYY/HZvpaKH0KxRJNFhDhT9DDDQImz58fh+07u?=
 =?us-ascii?Q?DRe3YyZCoNt9UhFF6Z7XuIFvWaSMiJpNIx+lyysEcKM0wK2ozFAIqCUWVRjJ?=
 =?us-ascii?Q?hxkkGeIvgbyTHEPpw/KSLO9ae+j/jHK9Lwg92jB52l5SM2M+aqigZj7LZwmS?=
 =?us-ascii?Q?TM+534fgyDgoVMD9VsUTLGdpnk5dgsECWYSOpJ+e2AG6nyPe3BL0FWDTVqzk?=
 =?us-ascii?Q?6SytL89kNlDhQCKSruih0duTPG2VfiB66ZLRckrnUwX7h2JGI0tbrlLP9iFT?=
 =?us-ascii?Q?wX06oBvIdTcRc7gKWCUzL/98uUwZrBlUIVu1ez+YJKK8vyHZgN0Cz8PeNhuG?=
 =?us-ascii?Q?dXNYhcN+62siCvd/9mUGXBuxSgFMzgg2tg+v07sbrx1TSRhC/ngctbeD52dL?=
 =?us-ascii?Q?KTAiMOOFUGo0nsDZJ09RQVZUg1PBQTokTSQ4AVxCsfr8k2hHdYySNWBfybwH?=
 =?us-ascii?Q?Y44adeGbOWwVIM33TLP55iA31YyYt5djFfQG+L4PCHFJnDWh/Uiie0J+BF2n?=
 =?us-ascii?Q?XHqGdadv7Ql5nc20/SBOJ0ypyrDuP5biQbTNhMP2mZ6tNG4R60PB9uBWiv/E?=
 =?us-ascii?Q?9t0FIcdUjNqfb5eFt7cNepE71De1Ff+4eFxW4ZI5kY600Rp2xRZhPd2T3rH+?=
 =?us-ascii?Q?d7hWYb6iKurhoQfX+mTHVMLhhXhIDkkr73CeeQVUxYNbjT5f3sOo4g/2S7P7?=
 =?us-ascii?Q?ff0anIj1ulx5Mu3AyzJhWvz6H/Ug2Uejp2GVeFlty9Qd6H+yIBhD5MeQsH3W?=
 =?us-ascii?Q?m8wKfRRN+e9elR3vaC7tjsePhVJB1eeWtFrScpBuzA3h/zVkP0aCUkgGVwwe?=
 =?us-ascii?Q?vOS9RInDAbcureSwkStZ1ZqVR0GiwSrekhlbBIvgtjwrwrYYXG0z4MQT2kxo?=
 =?us-ascii?Q?DgCU2N1kIsAPsT1Vf7BWcaRlttxAMmlGLKOqle4PnZQCSLMb/ejLykphJaDg?=
 =?us-ascii?Q?7oT9vkTO1sWI8Z7DezSDE7oLTni/tRF2FdQ0rSyFmaPggzPYIfIfynWYLF8b?=
 =?us-ascii?Q?YO1RpST4D4Z0kFeRHubK7QPjcJ1+wCUwtddRSCC+DvB5lC5IkS2SOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zmOiPG+o+Q83VzTO0rFSPgTWPnirwzHVE6UzvmLdgpaihfCo3KqLMhNWdcLR?=
 =?us-ascii?Q?e/cYs9HmICPJOt4O8L/qyGPamsBKUcZETRClVmLZzzyB2ih8HV8ZL+ecmLQg?=
 =?us-ascii?Q?VutuKQ4CVLjIQ3swBMFv9l4W2XWGyK2i9wLUWErNArvV+tyU68X3GEZV2yT4?=
 =?us-ascii?Q?Mz9Zsftbvj6sBvDgR4FbgByTAg1KI1+hIrL7khryKECOORN578ENgSFPrYtR?=
 =?us-ascii?Q?guDiAUfEZYIu9c66EWmXT0x6QXvLVJ5UL1v7wH7Nq0U+CqN43LgFP1EpmTo7?=
 =?us-ascii?Q?fltDnVhltw7Vjtx4pXivna0dur8PFsMvZqn7/OQTOBTAjlABbIPXZmeT2GVE?=
 =?us-ascii?Q?uVnnsr7LqBuSCV5hD93Q+pYlDN2ElEC3U3xB/9TDerLkM4C4cQapK7xJywYq?=
 =?us-ascii?Q?1yLVwjcRCS9TjUkMZY/V0ZcO2aYI25FEi/8x/tGCTNeNYTqvwZA+4tt+RDGB?=
 =?us-ascii?Q?To2SSXcyFy309Nm4WRhLB6QGvvyL0FRmx2ubSLzUNupW0k3souvZD7SINaKB?=
 =?us-ascii?Q?8jmFjdwuWU+aLPywjMDpqnDF0/s0CQX1a/3QsSa8DhMeadCzOnLaNfNPJz4J?=
 =?us-ascii?Q?NXnR++u4Hwt43SaGfJDhhSwGav4ccVGTQHkxBnPJFEHerLtGdQhB0yI0rJ5T?=
 =?us-ascii?Q?jMKhFU1DmmgbKgCmNxA4rPtotoGl5JIm4eEdWMZ0QTr+H6t416D5TiPJAE6b?=
 =?us-ascii?Q?ncKRlzPllk67Pujnjpi9JGES1xrXoqurnirHFN4U2YHSRr0akRlPcXGxheJI?=
 =?us-ascii?Q?5J2C97Z8EN24XQ/lcvJhNAKRkZnlkuC7V4Bh/GS1yzyt4K9IiqIZdKQA27/i?=
 =?us-ascii?Q?d9D4sp7mU/B7Hrr3XoaEC15JVO2wQvri4Nd6aedvU8IxjHyQsy9093JU3tHG?=
 =?us-ascii?Q?UzA/87mxdwYqzc9yTJdLoKHhDsztxP3ltMk+1oFSCrGbZpsrXdHwvPpxwRPh?=
 =?us-ascii?Q?Rxcqf1WNtuzOmON4PENopKi7W1z85xLX79Ft3pthfb4M5KMOCKJc5xh2oQQA?=
 =?us-ascii?Q?y9v02WAOue/TxRcPKJAgO2Y4Zn2b8nWug0+BR4u+7UqlbXbQszQLKQD+bDfX?=
 =?us-ascii?Q?5u2YvCk0ToOFPYkbC/XPfJOgG4e26NkflpFBIlySrI0yykxSZd7CytbJfnRz?=
 =?us-ascii?Q?UGns0fT0F6Pa6AKOW6gF50Cs9m522wDF0L7wrlwuAzE0Sk5Bp1yKiA2D1cQE?=
 =?us-ascii?Q?MJORrZZqAUzVttz5iEiiT3uMsKPqwDpbDaQHagQBqfrm7ZJT41VvcLBs8r6G?=
 =?us-ascii?Q?TzpQV9HUs0mj1IlkNBLWWNu8vec1W2BMy4t1/EX+pUwd08Tf/NlTab7NxYuq?=
 =?us-ascii?Q?qWtfk6fManEBBfiSEkaiUqaaKrrl4O2mWWlJK6bSrWHCsRtk5gD5eKCqImMZ?=
 =?us-ascii?Q?Wx14d+/aZLDhCXx3St0Vxm5iF2Yu0yvH+WTE1IYNl/VghMmr0q1LZY7Hw5TS?=
 =?us-ascii?Q?AsHefv55OyWG2DoFsPjzFYhYmozj68hByYcR/CHaFcQ2qKcTx83pk1Py2A3a?=
 =?us-ascii?Q?AwjwjF/D9Azs34p+5Pz3GHln9sbzNufdL0HKFQEfAjMnyYIH7HQmP/6JR/KZ?=
 =?us-ascii?Q?efVZxavKtzQj+9R6o52xXwU2wok2J9RHCzGRm6ul?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caed5d03-1f12-4da1-1b0c-08dd5585d248
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 10:19:00.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWlLH6VRjo/PvFihIK0QGz687oCN2Cgq26CVtdPf5CJ4GMy3XG2yGnrdk5DbCE0hnuNLWnFdbBfCLPjfc6r2pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

This patch series adds support to control the Run/Stall DSP bits found on
i.MX8MP via the reset controller API instead of using the syscon API.

Patches 1,4-7 - should be merged first via Rest Controller Tree.
Patch 8 - should be merged via Remoteproc tree.
Patch 2,3 - should be last merged via Shawn's Tree.

DSP found on i.MX8MP doesn't have a direct reset line so according to hardware
design team in order to handle assert/deassert/reset functionality we
need to use a combination of control bits from two modules.

Audio block control module 
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
	- for DAP because it hardcodes de base address.

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

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 16 +++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +
 drivers/remoteproc/imx_dsp_rproc.c            | 25 ++++--
 drivers/remoteproc/imx_rproc.h                |  2 +
 drivers/reset/reset-imx8mp-audiomix.c         | 78 +++++++++++++------
 .../dt-bindings/reset/imx8mp-reset-audiomix.h | 13 ++++
 6 files changed, 105 insertions(+), 31 deletions(-)
 create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h

-- 
2.43.0

