Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E922A7F9;
	Tue, 11 Mar 2025 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741683418; cv=fail; b=nlN7r3yfZbQCD1R281bNLT9Hfg+l2B6L6zJ7jvbGg4kQCc8M3RzuIDYSUct0vdWGNGgEgBgEGVqgPC5au6SyZpMtGi5YJxbL4CSnQzU5R+PPY8wul/d1CGwdem3CvjU1XYllR0/6yQ8/3ngWWFaZ5XxIOYwV+Y6ZBJFrYeMLzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741683418; c=relaxed/simple;
	bh=0b2Hp+7wNo3HEyIFwDlhllDXZDmxALM2URC49B0k2zs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pTms7Xz6iKFq2x6ZKtMJRJGyVmPXxVSAfAMuDBZGmiPiJUmVBXvfDDDcMV2VdXtbyhU6Me3huknedjgTH3ikJIsno0i8oz8uQeAZfi2HZO9Laze5ezTjISWWHYMmmozhMYediE5bvxl2drsmlnAhskOS+1vaywVnRZ/3D6FtR+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WGAsKNxX; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WGAsKNxX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTox1g4e1Pux7uzEto+PjcXXJfCCZNp/0Oy2+ptgc38iSyQIr0gYvDLGJyxwXlWFVS06Q3ZpdGDSmyDT72dEpLsaXbrrsujOmD4iYMa2YZ6lSsQcuyrQMEyCCvgzEjxrgRptZxOamIsW33t7fJmFw27FMqOjMemI8qJhzdnXK5WEuDOt+M0b2eKLgraRk9KgkEPHtMpJsBirBrcUYDlgkJvWYyZpr3yk9449f/Cm7Kg+l+GpYvHu2bgc3N5/N369VeVXq+Y1xjoxMML6qGqqUDzGGzzRblCEqNw3/vbDq3FbwkVpslzpDhqrkUUyjpsgA30gIVOPwb4W0nDboKJfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzG50cvdCSfnDBBssUbVWSVF04Ra1sQTn2/ywFp9Kts=;
 b=TkMol6Rf8QbrC/fYG5SAycXQEdyrRdlNUy2L38duSjpCrcjjh1oOqgXY9b6dXa/ag/Zpjr4fS2HuvBc9Il/4ntlZhr3tr2ha8nMMv4k8l4s6s2OoHzzqANovzIHXwXdsttxu2yzoFSQNHJOuBzKnUy+udnCY8IPyZpOx8k4A3o96YtQ+LO7hTQ3OvmuslOpTa/6APE7sIkmDj7PZHueOPe30+BxY4pEF1jCx4YPnEznJAo+Py9HGGjBJaXSsIkRoydJ0rw294U0OfroCF1SCCAsZxM4CjfsP5F1MXPYHmxRbOZteTTP2ZJxPUGRuwvIXmMqz+GB3zsb4CEnqP9s3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzG50cvdCSfnDBBssUbVWSVF04Ra1sQTn2/ywFp9Kts=;
 b=WGAsKNxX94tITtVMULQOk3SCYQ3Y8z3XB4zWV7rtI5KhG/QOc5qscfVHN0MQarXvwN2fKje/t/aueS1c6mEUCtX7KiH1HVxlXJgAdnx8FsX5xcmJ/1ysyQyKaxWIvDUanHjMN+bW8X6UO7L+WKxDFjeVAOKLOwFCzE2X/xICN9F9q1XZhclboyBn/+nxwyVh6SyxIkVIuYA93ufnVprO062S+wLbgHhi39SbD660Dd9uy2A7QLlOx+K8Lj0JkWlSsXvrZW79R5EdTQWyRLp3nzZBz0b3+Yw/ygv4gLCTIuGeTp+bibr671lpYR2d00WSd8FP29BE59PfHeRux4JXrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA4PR04MB7646.eurprd04.prod.outlook.com (2603:10a6:102:f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 08:56:52 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 08:56:52 +0000
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
Subject: [PATCH v5 0/8] imx8mp: Add support to Run/Stall DSP via reset API
Date: Tue, 11 Mar 2025 10:58:03 +0200
Message-ID: <20250311085812.1296243-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::14) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 00be9a77-9df7-4bda-834c-08dd607aaac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zUXLydI1c75tDddcE4z6HhvH6jhAC6qawXvRW9Vvi/u57SPZONfM0p7K6dx/?=
 =?us-ascii?Q?Q05EcN7XWqCrS4otZtmJlVbz9ozeDTwe93vzIEkrgIijKRVD+wg4xUpzaGDn?=
 =?us-ascii?Q?J166p49RVesyLGF4urVz5F3OMrDSQsZeoGrOo/lzlOSwkr58L/U/DctoClXH?=
 =?us-ascii?Q?v3PPT+gDoRCO6LSMQqCdl0W0exIo7WG2J3HP5o8tG9b+RFwLZAQQLTQHfs76?=
 =?us-ascii?Q?bfrZBlOmXw6OoABNJ+FD7rEDuvYK1Ph8C7SR/ICtoeulstkvmAFilDkPz98g?=
 =?us-ascii?Q?BS8+pCbnqJlMjy7Hkht0+yOXlxYYFv/Fmi3Q1Yy/+aSVHCGfTvgDnpvBD/3m?=
 =?us-ascii?Q?xVdAEkX8qbzua0Bjl2ntumVCgCFwTv+MAD/kgYt7HfH1Qwy6MSmu/UXe+R91?=
 =?us-ascii?Q?4h2dfxfDemqbE/7dx1Mj7iUt/2V6kCKrkKzeoje6lwGmDxF46MSKY7LI9Bsu?=
 =?us-ascii?Q?TE3Jp7q1SudKYSjjWlwnwh6MxyKXU7slBcXdPax2lPLak7ibsmmljZRcI3eI?=
 =?us-ascii?Q?2QkW2DBedURDF778svxUN4Sz8DcmEhbEHEjR4aA94gTDIoHQ21pvCwG2JihU?=
 =?us-ascii?Q?IahKmixkdHXpIDPBbpdBZtNaFq6W+X9yI/0mo8NhqneLTz36gtW4qG6UM4pb?=
 =?us-ascii?Q?g2VFNwfsDqPTQYKkiQWviC4HWrvoD11Ct2uP590rq1mpx5SC1hZr+YhdIwpd?=
 =?us-ascii?Q?z8gESsMmId7Gpx5j9jpD05+pKAaDCKGW72GMDTT1mxf8WWGmndDjHdDj+fT2?=
 =?us-ascii?Q?iAOIzwdYk3QuZs80u/wd7haNwKlKHFHNwtGCcm8/hPDyYBPow6dbgGmY/86a?=
 =?us-ascii?Q?f6iEj2tjPyXUhZnsc2SbdmNN7FwZOV6NaQwY95Mcl/DA9GLAmK3uXj0KOgOT?=
 =?us-ascii?Q?8BJO71/0ORncp7bZufsV3Vu6zBC+isIndpwk57Go82dGfMQw+0dsU7RId1il?=
 =?us-ascii?Q?4ha/HhUK/N9Ag0PdgfOFCcswm+V7jnslSawlmd6R4Vk39WIYDCDxEKbrSCTB?=
 =?us-ascii?Q?3Qk5WonIyjDHIDiqzxqfYk0dy8dduUZDuold8bTxmODxnceDe6tjmh791Rpb?=
 =?us-ascii?Q?kjuxrABoasjlIUQJH6a8vFGv1KZbWbL2noK/HuDx0vovmjJk5hVn41Cdz/TK?=
 =?us-ascii?Q?Y56UgFoNFLLsEEo54DSC348u1l5l2Hk8N5LiBdha+U3sAaG9UdVaMD48XXic?=
 =?us-ascii?Q?rGR1aGRvgWfWLJ1ZU4YxCMs4/nvOlSqN2bxHBwo5r18Fm2138lrJtpb17IXF?=
 =?us-ascii?Q?IKkf9YL0K2FZgmwEBjnWt9XzyYOms5KbYdIpj2DxnP7LxPbYj+cXrqArU9gB?=
 =?us-ascii?Q?5UKlOY6RnkK0zGXyL0Y15mP5Qhn8SN4iekurYEzUP6fXbGnrq+UrB72OLrYF?=
 =?us-ascii?Q?bnuz23p51rZTnwX6PR26jPyXvCLVhJV7it9FgQL//614YvoXOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFGEAC4+HCN3g6EzThjzVZ3z34PDLRcA0rUU+quKTbAGCMy1V5yloeZl5M6T?=
 =?us-ascii?Q?Ql7Sa7dcanEjL4WRx9mQjN0Pxe1tORfEe+1YI9Z4dahN82peBtHiKuaFPqXX?=
 =?us-ascii?Q?dwTSGdnApIfk0Ugnxq0VeUAodbJS+hDujM61UdSS+cnD5jwken/lBa7H7JdT?=
 =?us-ascii?Q?dgX1MPRWGnPF1l298qbsWP2wIFwFb58ZqXbwf3Q9/aq/JX1SYxO/wkt7UhDy?=
 =?us-ascii?Q?hm2TXiqDlBnORLw8PPbPGMETX8sx0nU+qARhWfdpEaTPvYjrNw3bRqa5Bu5f?=
 =?us-ascii?Q?rsczgQl1w16KqEvlukpx27bFSQZ7+hBE/NW8gbcL9VfO9MUhI+yjugfHfwyv?=
 =?us-ascii?Q?oqzwqXChI1mWWa+4oui4bm2G1wFBjlKin1jTV+3qPr5M8uGm+wR8rpsiCXy0?=
 =?us-ascii?Q?QOMEZR7ev1GUVIj4oz096CVWHWovrHLxsTcAtEkuRE/M27kMqpVkWqdapwUb?=
 =?us-ascii?Q?SjfEHe/bkK5Qr+AV4SJ5NyLygY2+RzoPv0ZxXSecWRdDJLLL9u3PmwyQGV50?=
 =?us-ascii?Q?5pLWdYRqV6j53lecbNoe2nkQsj9sqTRLkMllU/D2UPVcO2YQdUdJsNp8DBTy?=
 =?us-ascii?Q?TYrw7oUZ5fWRx38s8+e5Tee1TBhwlFqK9+ojerbmdzeESdaiOw1YxzVbtWG9?=
 =?us-ascii?Q?ES+v6/hN3X3jibAN6DKKiTKOvsGT4v9TitSFsfes9DF6ua/MkdcnZEtBE8Hr?=
 =?us-ascii?Q?pSCq+Y9yOZryUx4IQ8q/kbVygmQb5hFHwZMIHJ7CU/R5jPzNtJTWUVNPYNNY?=
 =?us-ascii?Q?c4HzrbBGB5iQczBpd1X9fX+euNKLYIjHQluceyfQPDpPOEp/Eiba+bISIE0d?=
 =?us-ascii?Q?0qJlLobkdkT998GFf6toIh/A0EGGxv9VFtM8AIrWlzVBrMGjQk6RyX5ogy86?=
 =?us-ascii?Q?sQGrzMTnel3zjq4qp/1qptqhGfYeiHy3sc8rlQukBydsBQVV+3ep0w9sOUsX?=
 =?us-ascii?Q?f17nwx15nj6iVve3eW+HMrlvL+PiBFuFhRSx89e4JBfhBM47G/lL/WBleVuu?=
 =?us-ascii?Q?/aA2RXARTCLkHdSUxTMjxVZ628JPWRWoWJUQu0ixjQj5aKJA/Z4pdjN6RnQU?=
 =?us-ascii?Q?/S5qpOeSjNl4d41BdHeIuHeqVzLALnZKN8jZxpXykoLBSZ96twmI97gryVts?=
 =?us-ascii?Q?n4ptTRkSZpTrsI8ZSMjAYegcyTxA9sFFLfjIt754mjjp2NVppFUIGyjQqqGW?=
 =?us-ascii?Q?o75wWcC+XD1ShCYamM7LsGYLTZhMrSqz/KF5XSa4uqmy2W0htYkEtCkl9Bzz?=
 =?us-ascii?Q?L1mzB3nWu2njsI1APwCNE0DoVdKY2Y1zFtL8YdP3FM4sU2Tqo1eeJm0TpuD1?=
 =?us-ascii?Q?UwaU3X5qCMMtD4qkJY4mY+SXa3DpXxq938xZooGIMUOOiNTIdbawu0zP7uk4?=
 =?us-ascii?Q?02cqDF/TVQ0lhSvTqp2BBGJHE4Y6rW0wuUkSDo5f65UcXiflptixH9X6kS8H?=
 =?us-ascii?Q?1XYvYfRPukKWqG5ClEeJv0JMpPs5svV9s94+cHECTaWQFdOkK3qEI8N65hLJ?=
 =?us-ascii?Q?MQMTty1SmKGBQAQzPBSsqXQInPjwAHm1FCQns3MAeOlSSS4lbs5QxwS+pzAC?=
 =?us-ascii?Q?AA3hqJwJBepjQ4CbHH/cCwiqNJm7LaoWUwQf+LlD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00be9a77-9df7-4bda-834c-08dd607aaac2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 08:56:52.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqUNcpjlhtX/XBAyYAyNNH55woLz6hiCYrZ7TAJg7QcjpemAkzDJpedduAQAmrl+3OWatL6FMZEozw001dp6jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

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

Changes since v4:
https://lore.kernel.org/lkml/20250305100037.373782-3-daniel.baluta@nxp.com/T/
	- picked-up R-b tags from Frank Li and Peng Fan
	- reworded commit message of patch 8/8 as per Mathieu Poirier suggestion

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

