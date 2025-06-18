Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F58202F7C;
	Wed, 18 Jun 2025 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228122; cv=fail; b=A0MXaJ657ayg7csCzZRLcXGnBqj3i9C/d6im9rnywLLJd9FDSIV4xRWDx3b9Ue1osoy/8JxukmwH2GDvocwGl8giRxSuCDF2maz4gKVSuYE2vzUQG65e6aUvFwmAPzcXVRv1NW5S5rZgEbNxUUtQO8htBCBisgIWv0djRkDiCp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228122; c=relaxed/simple;
	bh=zl7JsFNZE1Kw69LRcSOIPR/NewVH4ZUkt4OttgGgWto=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ag6Yc0C3z/cE02P5xpvU3bGRhthRiIeqBmDa5UDjQIG8tP6ULmKtfd+rmmkrlfM+NEDvQiTHnMhWhqGTz9azFCBqpKTJNyDz+vJLhEwCANw/K3/dJiJCIzdkuQLuiYhuXCzCNZVyGVfjcP5F3V0NHyCtCGEqmxQTQpLOdtp70eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SO0sSm62; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SO0sSm62"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os+owvWdEsqVMZFjvlSTmrnJlqkavr3mqg7pYjDsZOlLbBDrn/Cp2/l+CHzGkjPxTa1IKJmd8RB6xQ4ooFQ2glubLLW6DYdoZm+MqSCe5lizhkTRYWc9xGWVN33TFs6xS8Aq+GB5XzaWdLZVW5SAmZUv5fgETOkW6lL3PGB+u2MgLScZC1RXstCROufEZYBWB6srYGw6hu+iiK0ogDJ2hiED33TjBsWjVvBiVDT9fWVmrRrbF9BGnCsA8qbEHy1YmDEXlUoEbkwvPeJTm1ny87YtvpR4V4fsdEtXotHwWNdYNoz1l9FS/iNRFsORr7NvMPCBq54skiu5Soq2EiohgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuGZpoghCC6C/KwR+MxKwzoN5Ct//Mj3gTfuaYgkOhw=;
 b=vUi10kV5egQmndIEJQpwbMEkPkcUXsx0mijd1GzJww2z6b3KvNOCGD/MTUuQYnhUhePAO6DibzizQfjQ0daJzVeHT6A/68x8EV/Z4vNfqL6xdR8748pH/1Yk1jKXwh+V2AOVAOvUGEpKnLIAn1bsqKudEDyEmkb5+y6cUhqOy73jF3Sj68iNWaI2nsj2qcA2tV81+iSTaANIfuYFyVohQI5uDKB6pGSnk4yp87ycHz3dW2bouSdl7+t0x9kfR67NwD49wKyKmy1JPfrEZ2SXsg2q0h+TdBigXRPWSiEESKrLgRWFgPKlUXyznuOUXAqcq2YpsEzEoxCUbOZADBAxlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuGZpoghCC6C/KwR+MxKwzoN5Ct//Mj3gTfuaYgkOhw=;
 b=SO0sSm62HTP9ZwkYgAgohAO/y6gS38vNepZPfZRqezQBsCdIkexd9MObg+vhugwxuhKIk80ALMyjM0oEQ6IxsFziX85X8ApjncvMWXK6EvGzWbc/TZJeWy57HiJ9dHmUapzHTQThWe0tCBaRIpu79xe4fn/lnMUvqz0zel3m46gUIZ7myEBSJC+z2DSCLf8PfWw3agwPKlyBDHx793YnhZ0H3DvWKId1d4Ltwj4faw8W1jLVnazxBDYBNW+KlnN0T4MoOiiTmJOHaWPoxIBYxlGsqZIEeqT9O57p+J0lHHwJTCKoBQ04gAK92voyEG7C00Hy0+p9WVxyIxH9bcUqhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by GVXPR04MB10184.eurprd04.prod.outlook.com (2603:10a6:150:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 06:28:37 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%4]) with mapi id 15.20.8835.030; Wed, 18 Jun 2025
 06:28:37 +0000
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
Subject: [PATCH 0/2] remoteproc: imx_dsp_rproc: Add coredump and recovery
Date: Wed, 18 Jun 2025 14:26:42 +0800
Message-Id: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|GVXPR04MB10184:EE_
X-MS-Office365-Filtering-Correlation-Id: 950fca52-106a-4762-835e-08ddae315a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KV/9XCXE+XG3r2y2JXZAhyOc0iifH8n74imCem4uQcTx1H2tM5wB0h22jdGP?=
 =?us-ascii?Q?u+7mHguLD4TlGUOBqPgI5qjZJ6PhssEqw3BtQ6OOhUXKbhHOXJXFI/3U2FmX?=
 =?us-ascii?Q?W2ssT+I6TtMCp5HUyBRJ7rQ9ddBwBDT1qsN/zWViw7wCftFszPCOFsr+xasJ?=
 =?us-ascii?Q?pk+rokCcY7t8WpRGaBkLkbjjaaMn956jTiTvIWZBkR7H7jxxLpj0R+mmiCPd?=
 =?us-ascii?Q?yGcMvjq7qu2ZDUI17r+aRetXfo0qgBm88nXWL3KQjcfmX898e+xiIiHLGtEZ?=
 =?us-ascii?Q?gmpmtMOFktEy4lqPk1Lvv7eayV9ZNLpwv80RESvFt2uVAl74/pSjvVt7jMyO?=
 =?us-ascii?Q?CQNJ3s5ehtEnovWeJ9djaLFb3Y9GGoezWOxAEJyad/u1AkZPFz2X7DxiUZdA?=
 =?us-ascii?Q?+J4QrkGJChjVWJdnRCyzhn8IaUA1MnCwPXfNYzaaeN0F6Na6aug+w5Se4WnU?=
 =?us-ascii?Q?3xPfQYaq7qRAm3Cz9lAOvYcEUfgSaQknKuC8LfQt/3TopTbcC75VnBQmlIpL?=
 =?us-ascii?Q?BzEkxxcrzmJrRktteYcawUy0S3Zqu2NssO8i+wiNfMW80/qBREvDOYb40IOj?=
 =?us-ascii?Q?z/doez3axbRArMXrTzKZQk8ESsWraMNmV5VTVFKYkCwAsTfLdiL42BhUKN4O?=
 =?us-ascii?Q?c4sKU0T2l0JaAX+nOqyQ7uM/Aa30TRX4Wwt4aN1TyXP9gopTaIhpkHiAtUQM?=
 =?us-ascii?Q?jhTz1Mo1H48Bcs+ukv0vXKmWPu1OXKz3MmE3zW7rCcPS33mcGraI4KOizidS?=
 =?us-ascii?Q?hUOUPA54yGnnZ/soRIWkN+9w+yw/AAo37lID3/MHO9qLB3Dyxk8RFL4s29rk?=
 =?us-ascii?Q?rniUMloQWb9fbYGxIjmXf2iynNvQlG+38lnXWFxSyxLJOp3s829XOMvgTRFI?=
 =?us-ascii?Q?G60HfSicRH42yJg8jhczigj8zH3mL8bLW9UI6URXyRAWzEtnRd/GQrKJYVWe?=
 =?us-ascii?Q?cCehtkQ097AxtuPYdpVbLNr0oX/usSNVDVxnInLeSHIhdkJ/bE+24G0FSAOn?=
 =?us-ascii?Q?emmeQ/VuEjFm6nAZJ4y9290J+pSqzC9u13afTxxiWphMVScif0jhCS+a7SMI?=
 =?us-ascii?Q?EA2A4rjCI3+CLHPDiJSzK/b0anYG/+ZPaed0c6jXS1ULUeVXm1MxISntI0CF?=
 =?us-ascii?Q?ee6k4JOaL2zVx37ntw4Kl42AaxWtxKHUzQXhX7anJ/XOYjUhCiSMdvO55thC?=
 =?us-ascii?Q?uOrzjS0qY3GqW3I5py0AC+37RRmB0o+w6QaUSzvO5PQV43QjOX1jwQ0uqUf7?=
 =?us-ascii?Q?uX8563OUNapBblZzUv525jJstzU6Y/BglZoM4dnNw7W5pyRQtfmCegW1v6sb?=
 =?us-ascii?Q?q70a6rFYnP4uo+wR4OMxO0ttc9zK4NdVd/MubCZPWH577bKwqT/JJY8XA4zo?=
 =?us-ascii?Q?2O8/WhgVog5wYp8muCFcFPpLVN9em1bP2NKou3QnK9exTWW3PfbBGaPv9JBO?=
 =?us-ascii?Q?vGJpyHvKSqh6zmMpROu+fFaDgZfTWnDJJR37fE4lPK5tRSbBvjSss9ebwyFi?=
 =?us-ascii?Q?yk/kC68LCK8SPfg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KxCwxQ8+lHyaiyyza6qAzaTGob/FP/GnYEi9t68JwIf3Ac1gMeSLfiizFrK?=
 =?us-ascii?Q?rKS37eQkmnfwRldw/HtfKSAhfeYr7jpDaVTW7K7cVhLrzgn/j/rC10TwyBel?=
 =?us-ascii?Q?RFcEgwYHXMgt4SwE8Ze+y+Q2Gs8WsDkV78FRbG6B4VZl8qOEVNcjqShVouX/?=
 =?us-ascii?Q?FiyUn49RdLJ35cFUCxZ9nsWxBXUIPmSxkogNArLUUZzy7GOYXG2z8nKIzVrm?=
 =?us-ascii?Q?nepfaXexXKhIwZr24LmThYwW+z5b7NteyPMWpd3Ug1OuNMIyLJ7koldVfg73?=
 =?us-ascii?Q?s/aUyoImwXNnDF+geQCyfWfbSlPr8xq4HcVTwJ0O1K8pRn6LsL5xMDizAKmL?=
 =?us-ascii?Q?ROh46r0b0505syD0odwgEL6Afpl6RRfqsA+5RK+oWBMUDWTYUHy2NN2LKN3U?=
 =?us-ascii?Q?+9B0mHlRFEp11lFmqlUilNqKJIhxsulqN9LA7/7DWVjKx+11YChM2hiRv++j?=
 =?us-ascii?Q?bYsc+ORROrVno9DPSS745ezTzUyWHa8pafAyV6qSTl7vrkHrIBq2aAuuWZYg?=
 =?us-ascii?Q?wAIWAa3QIPZrMAZ0g/wT+B12gyHX/SwF5IW6czztFWQ8CbPTlR0Suz+ENm3E?=
 =?us-ascii?Q?SXzNce9huM9eqM+CltUDPnjlX4kOf8dSPjhe4XzZX5T++JEI9bSDnAMFBst8?=
 =?us-ascii?Q?eW0iCkD/vQt6gwVvBOAs5dzj0tRFWR1xvvrvcY6QYXcb3dvTMP9w7i+rsGvw?=
 =?us-ascii?Q?DoXBE/QKDahE1/egt7KPqWo5eMRmX6eyhE0BIJBqJ6mWDlRkqzH2X3JDWHFM?=
 =?us-ascii?Q?sxZg2vZBXEFnTOWCHCj6z9lJPC+ZqHtgotRgTs5qTaGyLRgLETjE4Q1RfkxV?=
 =?us-ascii?Q?KL0j5678USAeakHwmXdancva6MAkDP/ONGlepHpSEIQEA3cRxLl5iAQsR20s?=
 =?us-ascii?Q?JmYQhQlpi1Z+7kcwoQ4+lJY1pLFVv00vhXm0nyhrIBoUf96D7JkXcofPhMrB?=
 =?us-ascii?Q?qcq6OioU4tHIylgqCV28UUQIDxT5Mstd2krjSv4cxfpo2p1bYv4Dso0qE/9y?=
 =?us-ascii?Q?DVWS2/RAtku8YsXNiuIsC7jcl+2DhaMTsKXiJaqEAzuvp4JoPC+Gtq483wgm?=
 =?us-ascii?Q?jvTkR+62oHtBwZiN5etoYNaDNP3tOcC0WdepkSiIAgllrJXoqoS40Z/erJFI?=
 =?us-ascii?Q?ev5Ml96UbMCb0QJ1XZUyqYbx2kgyIhud9s3UL04Vobnhqk2QFurh8tPvhMg4?=
 =?us-ascii?Q?eCqYJL3uL/v9wypO/gBmrLm8FidMiEGUr1H57/j8NSEG54eC4bgY8APtPwQn?=
 =?us-ascii?Q?oyGkUCqERkpAXRSc3HatEGq+sMoWXb3m22Z1I11Kyp3Zxl8esr+tMdlcFkPI?=
 =?us-ascii?Q?K+ArIiinY+Nho6tfuzinDD7R9AGyuZARnnJFxeoLaiTdrpdQ+rKROK7ESLeA?=
 =?us-ascii?Q?fdApwueA+1IdZixkcGG/Ai9pwH9Jq9RuUqHjMkD8xRuMyfTwsDd5ODmRERim?=
 =?us-ascii?Q?AvytCT0I/s8/QOZg7jGfd6TH2F1LW4QF28NWbR8nTWQwC9iAwpj3OgfBtSbZ?=
 =?us-ascii?Q?PUdsoc4otwSoNSYbUpG4l/jP5SDQRv46POwF8gC2bk2C9pBUnA9nbIwANp3R?=
 =?us-ascii?Q?XVpEzaiCPbGqXlO9ak7LIP+bLOBmPbUhkKKQHpds?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 950fca52-106a-4762-835e-08ddae315a59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 06:28:37.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWEa9hIc7OxLS9aiL8H7Od6WNt891CrtckaNVvKa5lrrMb4TJDTp6ZAic81DxK8a/v4DZ7UujVeJYqHRUJp2jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10184

Add coredump and recovery support.

Shengjiu Wang (2):
  remoteproc: imx_dsp_rproc: Add support of recovery process
  remoteproc: imx_dsp_rproc: Add support of coredump

 drivers/remoteproc/imx_dsp_rproc.c | 64 ++++++++++++++++++------------
 1 file changed, 39 insertions(+), 25 deletions(-)

-- 
2.34.1

