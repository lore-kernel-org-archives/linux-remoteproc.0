Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070FB1FAC4D;
	Fri,  4 Jul 2025 05:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606874; cv=fail; b=DjAbBuQ4ZVx0UFU4gOSHTPZNxpNTmDeA6X87Nm0WiAGE2LUlxVACVtJFCOiQdFLf3XrLmM0/xsomPjDJ+SFTpldqf0qlqttG6/yDRlbJa6FpzJaQN7H6egSYCGUOIdTCbZnQ+TIVaxuPD39BV4p0dYv+W//a1Joap+mJusDzZAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606874; c=relaxed/simple;
	bh=HJVkUV09O5DbDnLEpq4uIoMmy1XINOCNxfvwcf6LbTc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Xxd5h5p854C1xHUKQqq0wvxxACGGu+g/uHAkgqTEP79K2DaUhQZ4yzipiE97PdR1jlzAi/qLDT8UH0eaxe55j0Zv80BfDt53+3wXdscWGXITw6JYK4KhVLK2hMb9pzbgnQH7LTAU9YUvikr7gfTUSUKj8zpMYw6d5JOISO032IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GGS9oCMI; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GGS9oCMI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdAYPCucTjVEhCN8FVShgE5IDo+lWUi5nqQTkAZxVJMIew0z2ttKc7T0IWmqfuQJAlPS3tnijg71jUup20wJ3wXnW1gJ/Gbb3gip3gAxbp8+33nM1T3LC9UKWN3fj/Ra3QVuZjdqaEfqwbcYUIbCS0DzyRsISio5T1CVV7p2ih5jNmn/FSulbTBBEM9bWQPPZV2V1gMTBZRqdkKkVy3sQxwhmnRFNOxonGG2qvfH/Y0yTVnOJ0OF0kj596bshBQBo9r7Wd7yhNF9/Jv4b415SyMWcN1nuxbcYZWkAxgThotJ0mZWEWPb+phOz7PL8ev3fSUKSBHkOooVUrhPs0uToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpESlYP6UOoXNzzjOmr4cjkC5v1RSR8ZldWx6Hh41rc=;
 b=KGS2OVyg5f7hTk9ZDv21DtSrop2qf2SidWBk9o0l3QU5ARWxjRJQQ53Q0lqP8/LvX1QH37S0VMCi9+Wr5GrhDnj3Q7waM9txfAtfupaY8Y1xUVLeK1nN3NU96aYBFBxMFqvhcHPNjpbipHe03+xq6gqRHpgsFZt0H2B4kOlze9Z9G3qsBeQSBfHGzQMLnkcWeIxZB5vSBdynGiQukvOs7gEMWmSmdJXC/pOBMKHJrLtHZcoLPsIaxqny1XVyC3rpqOpsmrGWRVW0CEhPJTXqj7Ji4iFYWm/nFlKXi9SVeVhuEGv5OnrnlZqrpf2/jZKAPWMrCUym2LYnGrM3382gvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpESlYP6UOoXNzzjOmr4cjkC5v1RSR8ZldWx6Hh41rc=;
 b=GGS9oCMIjnqjl/7LeDHkUSrcaSG9+3hP6P5qE6tBtVzX4OQDDm9SgbhdS9vEU3kMguD//wJcy5iUlBnMuPsyTAZMhlxPs6og71pkxRdPnozHIfrXLX4JxMrq1nGxw2ZfSW7vqeImbI/ODbpMDYRRwm5+I1zpQHQ82OYX9zOUy6FGmomWRpVmYLasuQbZHPceAkUyUyM2qArsowpQ8fW+pRhabdpr1xq1PQ01LcZvpFs30n1goUzFHG3WX41C+DLE9ZfCrEW8nohurxJlImynpEVKM0ZRRaEDX8s6LNrMZ+y5gy/x7wwSEuvqrIloZOOv4kG0cVYRCqu94eV1GjlnGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by FRWPR04MB11197.eurprd04.prod.outlook.com (2603:10a6:d10:170::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 05:27:48 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 05:27:48 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] remoteproc: imx_dsp_rproc: Add coredump and recovery support
Date: Fri,  4 Jul 2025 13:25:27 +0800
Message-Id: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|FRWPR04MB11197:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e1ce33-7c04-4029-fd40-08ddbabb8308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|7416014|376014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZF4tWNXaJLz5xr82PXu9i5cDBWE20YuAcPKapKnZAvqjPU96ABBnnMVRW3tS?=
 =?us-ascii?Q?TYBEU59zOaffATf8UTgB7xnoD57MDLcU2wzRWGM77xkSozXUsrkzthZi+XC+?=
 =?us-ascii?Q?UlNfR0OsLM70QCKJkrhIG19meQT/Q3ziDNhI9MBabRJTpAMDxyesJMkMR3cc?=
 =?us-ascii?Q?0hQB3UCDl67hX1EwLiUWuQSbbAOQdbwDEp9d0JffYcS889Mui1G1ChnRFAvE?=
 =?us-ascii?Q?DTdUz+6Yv6wn8zPDYmNjubcy0Zc5jjSYS1sM4uOJPWtybMeoR7Tecb1Kogw3?=
 =?us-ascii?Q?ZOCkRGDyxbMHQ7G64wgPhinUpv+rvu5832uhSlgJfBIJgyOIYlmzCMhqVRVX?=
 =?us-ascii?Q?O7Od+yTaRcFwtApoCs8X60AXp+Z7yjRb948VJpHxu2SE1Nb5lnWQ6KE4fbmk?=
 =?us-ascii?Q?JyFSrKF/hCDdSa8jKz0dEWYltj9080fiL52G2e/itvpb6T4/4+1D0h1jb20H?=
 =?us-ascii?Q?EmKUme5qmnC6wv5msrAIYThaoFz0XwDdRJed5bbPygw8I55vSlgtpRKBIjzZ?=
 =?us-ascii?Q?+1WCryek0ywIFSRJ9u7b4v4G8LbRoxgLCwf9IftA/14DpVOhm0Pc0iq89n57?=
 =?us-ascii?Q?gZj+0X6EU+qCEW8/e2kmfmagef23QT57rpN/OTTmanVjCkV6mHZC5UcYWzuC?=
 =?us-ascii?Q?RKoN2dkD3RPLE6yxmyvgXSbJhzt+Ld4NGhq+BBcjqsWJfMd4Aw9bc6apHVcr?=
 =?us-ascii?Q?TJj0nb2qQHcWe54VMfYzMI5WC4hjQ+q8TpPfwskwHRBoA28Cnrwwvq2llhPv?=
 =?us-ascii?Q?/Edse+GngTeBn5eSetDvjXIdRMwVQT2f10aflmERWBfXkRFJZlnBtz8beahf?=
 =?us-ascii?Q?0tJS/1RWaYgIWjXqM2TBlfxGlbY/aSlIz538mNPyhi4Y2Av+yJk+M5GMPwWr?=
 =?us-ascii?Q?XdIES0/6SmmqnP+D/RpZA2odyEoe1jk1SgTVtSpvfhaXdNMfRO+h4lDq1VdZ?=
 =?us-ascii?Q?pzQEkAA7SXLSAw2UoD4UCpfJ+Jpt8x9L1Ye3w/DrALUIFm2zZ29BI1ISPF5v?=
 =?us-ascii?Q?oCieZqzU3xt8U96R2fCQZglJXH6kg5/UBQg6cIepF6uolkABrqjjHG+RcQc4?=
 =?us-ascii?Q?lpg9fgCDfpgH2X0VXtx0Bd7K4V2E9Ui7XpSxuJhkkwzq3wIPhQYAVgUhVAxW?=
 =?us-ascii?Q?gDq6hvTDHQNNJIM//xrOet39Sb+Hk1E1uvAdOnoqZugWYp5Y2IWuBnRLSAQa?=
 =?us-ascii?Q?pErxhoduy/XL6kQNJf3euAij480tSnRixseGD6eDPwSIlEalgZ5amH1j8bcv?=
 =?us-ascii?Q?ebB76ofCRlpxR7Y5qvwEDD7BvOvfbl39Gb4F4GojTjrjBo9vIiSk2beCKb0G?=
 =?us-ascii?Q?/ioXbZrPwOdiZ7edN8rRjACl8eKa7Y2yUilrt6ZnwqFs2EeSCJNIdWH7y/Eg?=
 =?us-ascii?Q?9J1W0iAAMuPruHqlz24aLnRDCPOAiuXNtWo0lZBIBPF50N/TYAiu3qIzLmZS?=
 =?us-ascii?Q?PMWAOFSHYv7tRTg0ZN6aoNceYFFvSt7ajIrHOOvjcHYRVpZfZ4cIeoxA69bR?=
 =?us-ascii?Q?RDNXcWqrNrwrBX0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(7416014)(376014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EOgUjJhC9IBoBV/jITvo37TUXG7HinFieRyHpnfeAoDpzK6M1PeXSajGoCx1?=
 =?us-ascii?Q?XgLd/r0Z0UM6mWUMNyDnFCxAtTa9q7J9XkKIlDp8Wx6Ew4gF0GLP4w8AQ502?=
 =?us-ascii?Q?tvcJ/Q5DhOKSL1wJr66c1kLh1wrdh04EUufNCh1zYkhTAnM7DPwiXnB79+ka?=
 =?us-ascii?Q?oiNeHKecC7DHi03wTdDR5bC29Ji1jXX2ndxET1ffDL975avPC0lZwf9usc4Q?=
 =?us-ascii?Q?FZk/UXAwCVNK5M7E733f3LyeusVh4ySuWpqGOQXOB6dR5M4tHJGswO+vIxQf?=
 =?us-ascii?Q?FV8GM9vdpfvpC6gg07lY+f6CUChwwXND5gguxjwMmpWXgU3HdRiqFe0L7n+X?=
 =?us-ascii?Q?AiSR0PHzqFZxtvmlaFH3mT/G5bbeMfOBNkIG0+MYZ42vMX0IeiVAUQxxOI+8?=
 =?us-ascii?Q?CWqQ8jR/q+HdH/I/X5Nq5veXBvoBU/UbR3Gge0kR/h/lEty15A9sV51BXFwc?=
 =?us-ascii?Q?stpYTciX2LaLzx4X8pgSBJf2wutndQn+yZJX8gqQeZvspkkCVnp3SryvGDg8?=
 =?us-ascii?Q?Nr30J741zLswhidZHSJEpTq8iZohxe0RA1yxWcx4qvPD19Ha/FlvzjpGBraa?=
 =?us-ascii?Q?6qrdYQS+g3bT+Fv+g58B63f10BpwjLaBsLhfnM0IRw9gAZgoLtgBm5h7le6P?=
 =?us-ascii?Q?GglTs3Vj6xihnNi4yAbYa0BOr15Q8ixXI/vqBuERpqQgDF/zQAjpMBjyg4ky?=
 =?us-ascii?Q?5PWENTknzhQvKg27xEboPzPn+ZPpKVmgKOW/6HcUaTNZIY/WV9AHGtiLdP+d?=
 =?us-ascii?Q?xDsSMdBLUuDoGO+duQTs2gLul3pnOE/MNiocENTF8jEnYI/Mw3qe6NOyBDrY?=
 =?us-ascii?Q?2Ysh6cInbxvmaO23G40OE+o3owYsHiWpjIc6Wd9SmXaDaw0gVIjM4B3rTspO?=
 =?us-ascii?Q?5UIRP7vyc+AowMcvTFjQWapG+00v2uGppRid7wZxSEfpwFsZ6h7SVgrBxXGj?=
 =?us-ascii?Q?+EAPJfol80dhGYz64zhZvF/IrdgJ0r7ubOsz2+4rmkviSy/NARoQqvZmzL+n?=
 =?us-ascii?Q?xV8JWJpCFo/XBAtXwKQnyg0PtTXooA16ImDWjEbhwUHNgY6YtcCfUTJQFI9j?=
 =?us-ascii?Q?v9C47JM7XuZ8rbfybgJXLRfq+epZ7wDk+bN0IaXwOUnnVSeBwtHZ1nyxtbyR?=
 =?us-ascii?Q?ZaveJTXPLki+OfZbLRN5llgEm//dn73YmR6+RMseUrGTcnXkniC4k77n8RvP?=
 =?us-ascii?Q?rAR3e35zJa2WlzB2vo+ajug4I7HMOF0iZB3TFjEBs2S88q91jA+QhnYi9ey+?=
 =?us-ascii?Q?LhGY5LB7s0whY0p9THyhedBkHxtTseu46Mh6kfS2a0aT3CP4kpSY2XzGkdDG?=
 =?us-ascii?Q?3NS+E0uZcXYA7nAki8GuLdD45iBwzb9c6OBkVfVom7hHY9CluWON38gztFhg?=
 =?us-ascii?Q?axJGQnlPhmWqwJ/FD9iYLLtIU8T6cnQ45I+UTcif+jvzPxoAZjkeqfrDxpNh?=
 =?us-ascii?Q?gD/pTOZCkGLaNfK9xmVCtZyXaEmZ3Cy9dZ+UFsfCB+o3bd1On41OecMp/8Wj?=
 =?us-ascii?Q?tmm4/YSs8ghOkyf4L1hCZemMGMqlBf22c8NoyS9CvYoQFooDV7n7GntgZD1y?=
 =?us-ascii?Q?BR3QOSOLsHwhhcpLO9q9uwK3SRyAB8K5y5vAwua7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e1ce33-7c04-4029-fd40-08ddbabb8308
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 05:27:47.9704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COoRV1wrD/WSwiBl6dJLV20bg//z0DfJVILKLfAXdyh+n25pldXOI2ap1vA8YaIObWaN2RPbxUzur88LJ8bsTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11197

When recovery is triggered, rproc_stop() is called first then
rproc_start(), but there is no rproc_unprepare_device() and
rproc_prepare_device() in the flow. As the software reset is needed
before DSP starts, so move software reset from imx_dsp_runtime_resume()
to .load() to make the recovery work. And make sure memory is cleared
before loading firmware.

Add call rproc_coredump_set_elf_info() to initialize the elf info for
coredump, otherwise coredump will report error "ELF class is not set".

changes in v2:
- move .reset() from runtime resume to .load()
- IRAM and DRAM still in the coredump scope.

Shengjiu Wang (2):
  remoteproc: imx_dsp_rproc: Add support of recovery process
  remoteproc: imx_dsp_rproc: Add support of coredump

 drivers/remoteproc/imx_dsp_rproc.c | 45 +++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 16 deletions(-)

-- 
2.34.1

