Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120251AB50D;
	Wed, 19 Mar 2025 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742377535; cv=fail; b=sZ48/HoAend8aOm7bGD/hrmCv8Dct0LQYAwoMfxEfB669kAis/oAo9Nyu4iOYzbLeZZPliqDCPYFVaQJI+VwhWIwDwEcH39bhgMNViiT4VCVQMBSu2avUrWEF64Z4Qx/m6/VRYJGs8NVZd7cuMmZWhcafofy7NKL81P7wV51/A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742377535; c=relaxed/simple;
	bh=kIJc6YxxT5KVrQRq2E+nRim98GuI3d+NOSA9f44GcKc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oW33RpojSrYxMeLme7LEoXMfM1eC+z+FQLdNxC8qDPSL/UMq9Tvo6cwqCYcuY/bFHLQYzu6/794top1RTSn0Xyv1QNas0tYU1+lkmcodTHhOEvp7z6+6aB3sTRYxnkJPGCatkEjs89seWTsm3JtC5mIlkuLPOFUJBdgMTMziVUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OTaVlDq3; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OTaVlDq3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUexzEc/K1HwIiqXCWAjr9Gdhi0h5cEtyXtNalQSzJq20hmrIg1diqJnxnZInzSs8csc442RzQEqLMw6ebKjstljqyF+eu46FQhx778ZtWQZOEnuXSSu1bzvz9s28ExURaOfB7J04lD/XMcTly7dD36Tzb2QRrc3x++4SDqsEdgJbABKos5nxO2YlaDMEhO7G0Mg5yI1tzx9d3Z+xm6jPn79HDl/aiTAGKIc1n7ukqRyOYFSkz9Ze5Q/jrbGmdVDCRwEJ6GgGdsxCbBQVirJ4WfjpXqDwZRdXWmj87JZysf4pVRTya+jYlqarQczL281xW7gc+27hS0YSUMpRx/2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo/6W/8zXBBUPY9AqZAAWnKbPHxDjfW1f61wSmN6cTI=;
 b=RonMbSpGaO5bKzw5UJQoupsJNiObb312bcBKQTAi41f2+szA4xwEOfF3lpL1ez3+CmDn/CMCd6RJvUsrh0G5kE8gl3zeY3ZN6lkFqhz3/HGQzAv6WM1/MOtyN0xnx2tSOHW4DQJAmh2t6Zx80Y/Amee23tIP5PruOvSbdHJ/xAQ9vnqqDnmOpclx9dRk+cZnji87K7coREPclNKqQIb+GfsPNjRq+VJNZDMJN+RWXrjDnZJN5Yi3YZbryKuYH/NBcr2abY4VHeXSFXfHzig142k5NMTfOKgckjWIlXo0+aCybOj3VSRFjeW0HEjfHfHnNSMGzLlwClBYQUHE6M0bMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo/6W/8zXBBUPY9AqZAAWnKbPHxDjfW1f61wSmN6cTI=;
 b=OTaVlDq3HXZQxUO88YkPXd9/2d+Z0VIniCSGPMp/CTdHfpihfLqgyCWX374sdxK86mvtlbjd3mS8J/IpiCTA99ar0Uv9ojzNw53u1688uZU+11X36QYP/sddApiKg0hBwyRVTs7VwddyzhhjfCAKN4KS4WKwsa7QrIYVuoKqwvs1BR56sSbDF3nh6iSHt3556MIrc/BDiHmWdvNBkHYhT1p3++r31arRwgM04G6Y3H2TeO7xmhUpJxRUBNRBl4SiG0Kys4Nr7V/0ZSiJ0qkmyNhhdTce7Wngkn0niv1vwJQReNPqXefZDtQnnip0ZDAApfuOVgKVlBMndGATyLIsPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI1PR04MB10002.eurprd04.prod.outlook.com (2603:10a6:800:1d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 09:45:30 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%5]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:45:30 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v6 0/5] Configure imx8mp dsp node for rproc usage
Date: Wed, 19 Mar 2025 11:46:16 +0200
Message-ID: <20250319094621.2353442-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0069.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::22) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI1PR04MB10002:EE_
X-MS-Office365-Filtering-Correlation-Id: 43efa66f-9419-443e-49b1-08dd66cac8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cogN+JZJP78m76alcJJOFhbN9nwCyHiY/mUN1GLTQf0l+zMN6G6WpkZWz3Ey?=
 =?us-ascii?Q?OfQQ73Od+NNaDEly7XJUqp/lnnJSdXH38Ojm/XXeAEkfS2mjDJM8Q+3f6l9N?=
 =?us-ascii?Q?6evyXuxTyVrwo+PBVf3QITCgG6evitl313GNqVSwU5UeMA5RrWiAANG53ggi?=
 =?us-ascii?Q?t4V309V5LT9m7MaI04BV1ZK+FkyAmutc080EFdQuDGS70EY7fNnNDaIjAJVR?=
 =?us-ascii?Q?SKEjeXnFHb95aLTIIyMFW2WEaddr6xJFuJqWs9kv1+pjA3U23ysqu785xA6i?=
 =?us-ascii?Q?ULXuvM78ubdop3KGXcBUydT8KiIaPHxkyZRaquZJRbKd/zv1gpty4igk++yF?=
 =?us-ascii?Q?N5NA8VFYnd9avISZcqCqjL9gdrgmzZvF71EciOY/gQydmSOzoDLimVgHtY3e?=
 =?us-ascii?Q?Brn6tnZ6KIBL9rA1Upkoph+p4N0tT7alHZMjit/yaEnSs7XaLEMXIXmmp7lF?=
 =?us-ascii?Q?LvdAEElugz6HAv1c2nBV5T1mILXmHhBznZz9FiVbuoSu5aEH8I0DNeU98rSy?=
 =?us-ascii?Q?QzEHesA0FUdpFZObkZ6YPpldm4hyxfrr1lqxHC+oAdmAuTpgpdbPgCqN+CNm?=
 =?us-ascii?Q?vXJof8V+CyekDu6NVyh6YvqbU2+T7Doj1ytbtEzebzOToQSfKSXBTGUrcZ61?=
 =?us-ascii?Q?6P1g9FGtQctd7u/3N7fZDsbABxJlukcB/aw0dDJTBkOrqDg/higQnMqn1lMB?=
 =?us-ascii?Q?zoVpIhi1c3jcfMLcXV+G2T5p/+fwm3VbYfsRuY/FZTk96cEvbbswlogwh7di?=
 =?us-ascii?Q?d0gjhtfSdadugIp4NIIylbde9e8foj8mzBTa4J4gT+xA8ujyzt83bLPGKWL4?=
 =?us-ascii?Q?UbK8R/RCJsl5GxMDCRnd2qg14JvbgBtIEdaPFsm6UuNxYsWvPDdZ5KOuf/eH?=
 =?us-ascii?Q?i1pcD4Jev+Z9V59f4NOB6+eV3C9M6Zg8w08X+ayNYytiu81ycVq3AUjmXS+c?=
 =?us-ascii?Q?52XlLtSCH4Vd+b7OyY3UFDa1O6DH1JORqZuarqB+4HeVC7gbEde8WYpDkccP?=
 =?us-ascii?Q?9pYvBAH7dAiaGA8lxcOPJi2Z/6pm9xVzlfT8RmczkMgI8o1yKS5TR6nTtjW1?=
 =?us-ascii?Q?FrASMdSF8K/4lE5GdZ+UPygfK0si0aUm/ZXlhGFDHSxMdznfq+qVDwSOpKZC?=
 =?us-ascii?Q?6GFFsv/gBqKOKWqLgO/6fE69c9axjfa2zLFH2BLFpD7QNV/qfz1PyYPD4i3g?=
 =?us-ascii?Q?eh3ViSicI8y4FmSwuZFuqJRcFxng0ml3XRwQgQ65AA3uz/getc3+zc+MpeGi?=
 =?us-ascii?Q?H621NyV+AsYFYy6lU9gSlPTfGdr5frHWTpBQfAevadn2CV2ckBltQTk3kZ/S?=
 =?us-ascii?Q?TdozNiLSRpAs77g3/y2oV/8wZc8HI1LM5bm5jndL5GGoYi+/W/4TMHHlodGc?=
 =?us-ascii?Q?WmbRwLXFsWCu8ym6son2RYblNOzB/te0wR6yn5odTG6pQCJOtKzEs/P/r1fN?=
 =?us-ascii?Q?grrvCpgK5vrG9tK2oXmbh96z92HLB/Rq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mSfXUilMotU/DDtBrN6G2EhtQifX5ks2NtamnaNLYve6tSn+ybMwoWjH+ARq?=
 =?us-ascii?Q?0bP3OM6GWTH7ZRxlQ+K+UrKM3Yppq+VYd+hfZqc4qllb4KSHXSfSXal+IiQT?=
 =?us-ascii?Q?Z0JKORWzcnSpOVDmNgMVvu9oG6UMV3n9ztqcveFgxqBVkMDbdWigOn+ayPzA?=
 =?us-ascii?Q?0XEwlPbeN3VJOz0gKQzJBg4gvki1dU1oQ/IQoRy5qzzfbve64wnyufsxxfVj?=
 =?us-ascii?Q?HdyOVxxXnsrpATDu+5hlehVbWqJ+DrCWNrncQQQVWiz2drJOB3WbPVabgj+r?=
 =?us-ascii?Q?geXT0zdriqlulniDqY88D2kzJEweYlaPYwvay4I/JKDE6R3Eyu+AFBqfOAEm?=
 =?us-ascii?Q?jETBYIfEE7s4ulev80S5+EGiVxOIoogCWYXXAf93ybk80Fvf16gpCzdX/MlF?=
 =?us-ascii?Q?e/WE/6D5kI/nFosVTLiW0w4ElPq3WcoaSGNvtodZDSdSwWfZD/tGaXRcDkG2?=
 =?us-ascii?Q?ZWB73Jb9Iqupk8YfiTdb1QhPCdW3Qjb6qz05zEaTmMFxnSgcOwkRj5p3lhC9?=
 =?us-ascii?Q?KS1G+hhdKfnlHueli0V3h91zc3jf5OpYLJTyKemWEuvSAQ0zp4VRan1mwWxC?=
 =?us-ascii?Q?3vlv1T/GC6JvakOXykaHNUaLkKhqFw3G78FUhZwmGcWh7scfzQ1pOuqxBsI5?=
 =?us-ascii?Q?vQMkOKdIk0Du29RXXZwjb1fdovqlFVnJ9oJl11H508vPt7dtVgMuuh70cWwc?=
 =?us-ascii?Q?3EHzFM1Gr0WsPUxb66UJ7bUR2JEi3RvSBELpvUVMTnGUxlwiIaso+ww+4SWk?=
 =?us-ascii?Q?8RCD6kRSRh8AqfdnK3r4nNdvhmnQvGTcr0kk1gmuY75ux9/+PhVOQjc65k3f?=
 =?us-ascii?Q?CBqxyN4fXbAiZAeDf1LR7czcSt/yiBUugk+IGeaGNZW8Q1RL9gqTTaBVL7ew?=
 =?us-ascii?Q?HHTn8nDG/3/VNlNnwwavaaOYfYUbf71YF+XcnpducyySgNMs48Dn12gBHQmv?=
 =?us-ascii?Q?gBLERIvnxvnmNmaJF20R7Qj9Rt6GL/hBnt5fMt6U6O8A9PxhCTlImjUpZN5X?=
 =?us-ascii?Q?vGOWqMYz9ixcNyM+YshDPFeBuHX22yTxTyGV3d0kzImChkvHvYGG8EvJDxNx?=
 =?us-ascii?Q?m3zN5pDPpslmE4xX9OFGwIKDZsc+oGvAVsfwH5/Y/33+KVYnnK6Ha7q5Y6Ob?=
 =?us-ascii?Q?hzNryYrg7eWZNQvjK2aRSbuP+/qmabPYp0lFPisD69km3MuJdGMEx/XdXDpC?=
 =?us-ascii?Q?vL4IuB6d5vKuFg+VuFgMyjyd9oaa+hMwdqwTsDE468sUrfMssHyfl0gsS30y?=
 =?us-ascii?Q?LZqQCMeWDeprBrD95FPLwFRCStWxht/BLrzYMWO6XSJeCl360PIZSRPESnBR?=
 =?us-ascii?Q?p8yZGBHmfxh3Zw6Xkx6XY20r58BJmAUa1onAExAMQ+tnL8kKB5wOH4++4iLH?=
 =?us-ascii?Q?ZYarb00o2VgINBNU0o0NAES3ncYN1o0aG7FIsu9BUjOxbrnlIbCipC5EOmnu?=
 =?us-ascii?Q?4iy78R7sLGrKQEv0PE7Pz4iLiq5VcLy0NwX2p3X/8FNfAlw5Fv4ClG9gfwLv?=
 =?us-ascii?Q?XcYA3IK/3hhOyD1goC+EBzmLV+Nq+/hfCA39YwY/51sKhkZ7h4JEDXi5sivs?=
 =?us-ascii?Q?/wx78z5Vl8K6ToDQursGRmKAYGuRjCchqTjy6oGX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43efa66f-9419-443e-49b1-08dd66cac8f5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:45:30.0820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2a0RHXKls+GHvWnP2TNYrLbkHuhTC2vYN31/E21W6AcDYLtsVvS5DVRn/YS1PGbVd6Y/xwMz6cCTDMVzIAsKiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10002

DSP found in i.MX8MP SOC can be used by multiple frameworks in order to
enable various applications:
        - rproc/rpmsg framework, used to load for example Zephyr samples
        - Sound Open Firmware, used to enable various audio processing
          pipelines.

Current dsp node was configured with SOF in mind but it doesn't work
well with imx8mp-evk dts. SOF controls audio IPs from firmware side
while imx8mp-evk.dts preffers to control audio IPs from Linux side.

So, configure 'dsp' node to be used with rproc scenario and later will
add a separate dts or an overlay to configure the node for SOF.

This patch series configures and enables dsp node to be used with rproc.

Changes since v5:
       - do not enable mu2 node by default
       - fix dt_bindings errors

Changes since v4:
(https://lore.kernel.org/linux-arm-kernel/Z6zGLn3B6SVXhTV1@lizhi-Precision-Tower-5810/T/)                                                                                               
       - after comments received on v4, we implemented the run/stall
         bits using reset controller API (changes merged ->
https://patchwork.kernel.org/project/linux-arm-kernel/cover/20250311085812.1296243-1-daniel.baluta@nxp.com/)
        - drop patches related to DSP run/stall/reset via syscon
       - picked up patch related to using run_stall via reset
         controller API.

Daniel Baluta (5):
  arm64: dts: imx8mp: Use resets property
  arm64: dts: imx8mp: Add mu2 root clock
  arm64: dts: imx8mp: Configure dsp node for rproc usage
  arm64: dts: imx8mp: Add DSP clocks
  arm64: dts: Add dsp rproc related mem regions

 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 14 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 22 +++++++++++++-------
 2 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.43.0

