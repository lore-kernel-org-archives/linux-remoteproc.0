Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570E2609C5;
	Fri, 14 Nov 2025 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103337; cv=fail; b=ZREDfQ1tuVQ0EYQ2yxV/hrHVZLcvp+7m6z2blsHb1Dy0JFBle6+4vcSkXq2LypvR5l+H27fnFy9xPc8cLSuUWfKdAnJUdXSfuAEK05poZ6lxDQkrn4368ojyTjfE4dTArah7jqolF8RUumZ1LuwppDMvs2P+JVR2PnZRRDHeR8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103337; c=relaxed/simple;
	bh=Ft+5Xj9RLNNB/6Dw/2Idrxd0AotUS/YfIz22KKZ/XO8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NQMHdKSKKbBgSXakwTCSQq+ZuX7v++gkzxLyRWjOojImxkmbz9K4Rc/TMLu1ebVlkDDfbCFseUcWm8cfTRXylt1eU0YhTio41ZyKEu181nvtLz6n3mr02Qd5Q0C4l0NbDvn0RqPDX6Q8Tv9W3HSpGlHTORHXrhkA8hUuTt8+MLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J3fHszhI; arc=fail smtp.client-ip=52.101.69.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J3fHszhI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8mxqaHw/eGaDhn/MfWBAaeDkb+mojxX4OKIuBUdBhMhCA7Ci0QCjE5u4ASK0iIKM/hZ/krL1Z0T/2Rmzet/7MIp8gDRuqMor8P5apEZ7G79JqzDExqghtULscYMD4tQHTWept2BI30E5TwXN1rT8cRGS3pgrZhGQ5fRvEQ3rjezhUZJxlVwwwHieemsMmn5TkC+eL96DO4ZtmZlcgC0m8mNUHyd9ztaNX+2m/eJEMoasHIakCJznOWljwWqhjFyCyu5p/nbblJWV972S75WzHtQFBVzovknViyh3qZhJN+M857ixS8qs22xKJAoenL+se4IYxC9KoNXwRsG42BcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eopKIOLiVgQmWBdQ2ZTG/kHNrxje169z2AXBOSQCZjU=;
 b=VSPWy+PDf1vDWUakQ61diPrxbGCmMtf5DW3k9Wi7ZcJUk61bn3yI3OIZNb49r5rxQLlX20wyLqUkk+XkVp57w/GZNYQfyttrCzxIrceXM4VEbuWOgWO7Y1fDoV1CLohd7Lr2nuX0dMyIOBZAIcrk4Bf5vhN1sIcPC77ELdQR+kqhdkq4sKiHpgKmwqcnmOodU/8OKBvc275qP3WFJXFIR2iB6qoO+5P7voTtUxTdzjxNyLt8/tm452xiByC4sYPjCDyKgRHBEsN5kvd0hUSUcC3+dwA4XbSL8etywUDFR0It3HRqdHUtb06nym0XE2UN6a6W2S8+f5KeR6I7vKWbCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eopKIOLiVgQmWBdQ2ZTG/kHNrxje169z2AXBOSQCZjU=;
 b=J3fHszhITWdKoTW87HMkVZNGCyzvhQ+RpYWkLc17Fwv9iUDitpRttEMySfBmWygS8ZV2ZzKbQVSXE12BtD9uqcNwOEvt9kt2LWdxvVMvJG2AY6yefDdNEG9O5WRXM+K0lI5NZV6/1cT+MFNKjSPlgj19hRU1CwB4Z/RDGYeY/oLLGmSihdrzJ5lqghXOvg1BCvXbVuUqjzFD7kF5jDQMfmSHse3ZIfwKP4KFQHHIR2RzkmmBGxfK2/XwNUttIPmyCb8vD7Up4xEkogQ3yv32iNUkZkQ4Fl1LbRgLrAhO8w1dt/uSQiTT49N4cDdsGU4/NM5omusAa51ophQ/tIlI/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI0PR04MB10391.eurprd04.prod.outlook.com (2603:10a6:800:236::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 06:55:32 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:55:32 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: corbet@lwn.net,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com,
	cedric.xing@intel.com,
	pasha.tatashin@soleen.com,
	kevin.tian@intel.com,
	skhawaja@google.com,
	daniel.baluta@nxp.com,
	yesanishhere@gmail.com,
	taimoorzaeem@gmail.com,
	linux@treblig.org,
	arnaud.pouliquen@foss.st.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	rdunlap@infradead.org,
	daniel.baluta@gmail.com,
	imx@lists.linux.dev
Subject: [PATCH 0/2] Documentation: Move rpmsg.rst and remoteproc.rst out of staging
Date: Fri, 14 Nov 2025 08:57:43 +0200
Message-ID: <20251114065746.901649-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::29) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI0PR04MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: a0217781-69b0-4345-4dc6-08de234acda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bN092F3CJiXPjYJowLAacS6GQ/6OOvaqBzSMUtmHxt+JRjxpz9EpiPK4Iw+k?=
 =?us-ascii?Q?VLS+7FTGSvWz7SkIzJejzaNGGuZJnoa3vE4N7VpfPzOOS2OaFtXSYDp/AhaH?=
 =?us-ascii?Q?Tkl0iNzKBGdt+THC5OxFzAzoQLLa2FTG/I5dBwZPQJKl8Vzz+T3zuzt1iGq7?=
 =?us-ascii?Q?R/cYjMDSR2pDr7EzsKViFMvmM7S1xkiLqBnNNTyvMItE2ra/Pd95/1VS2bV2?=
 =?us-ascii?Q?nr/yZDbcdnoQMOL/AL2XZjN3aAAiG0zJ078JEDNTenaDpfThmgBhWrlQEKRc?=
 =?us-ascii?Q?SECy+HiAiOb66tLHZ5VIlODaUlN3kPpgc5czgBx3oCDaeKfMxPjiNxZhXu8o?=
 =?us-ascii?Q?qiTsG7TfHiX1O80jBWyadkOcNofXinl/2+Z0L4tG3gm6uR45ksxRkuv4qgM9?=
 =?us-ascii?Q?1z7L1tn8mmQvSF72RKmPr+V17PUgk0L1j2jUk5jkXiqpwpYKGCeC/ZXMQi1P?=
 =?us-ascii?Q?xB7gFeEkro2wWz+tGd07jewhA/IbIbc6/hpDowD4F6AoWRTXV1b9YI4/wpac?=
 =?us-ascii?Q?qWLgjJEsj6YRRi7BIj4MwKivZMO9fSiDJlabKhTYxLWUeFbhYNJQsR6vDKcg?=
 =?us-ascii?Q?hIU0F2vnXsc2xUVlDmIQDhfsnR2qtLNkw45XcUSTWcCq6YlBjAZIXrYkmAFM?=
 =?us-ascii?Q?guAbUOPY9wWZuPNTQseYgEuiBV+/mfdKAo+HRyVQKXktNeMJ229Au6BYwYQh?=
 =?us-ascii?Q?8Thv+Z5u1PW2onMQ/L611C/eQeryimbp2BP7/v/254WDusHh0+JR6zGsrYC4?=
 =?us-ascii?Q?C4UuVWOW5t/E4v23k+6oKjWRisbh1WniTFkBya3Z/sns5+xL1qDmaeR32EnE?=
 =?us-ascii?Q?Coxp8NelppJ+c2MDPvjScHEIZGeCtrsJh8ivhU83L7RHX/rU5wO5Y6FUv4Dz?=
 =?us-ascii?Q?5VkPbdQBVyBb+FurhFxy4ufxYvuFTpXd2b7ftgKssxgHlAQd70MYKQI/kzd/?=
 =?us-ascii?Q?eMu0fFFiMZy210unl31T/p9Pc0desHy96HnHecrAvnokQ2tVa4KLdv50DikX?=
 =?us-ascii?Q?xw/Y7YwLuMz1ZCon8hGGeveBOqGiJqKucPvayBKAZ7McqNzeWYFVhVV0gr75?=
 =?us-ascii?Q?mYtQ+5l9a80xZ3JHgt+ybsuH74Vh7wvf02kcuQ4e58N6AzTJidjtt5/F+UHt?=
 =?us-ascii?Q?KeilxMbhQ0+YNrXG2B8F+osC6jNQk228eKTl4pP9rvQrS0krsIXhKeh3Jk+N?=
 =?us-ascii?Q?n67OLJwDsOVRIWWe0aR9gflEvKqKKbid05fyfHR0aJmPflLcCttsro/YsSyv?=
 =?us-ascii?Q?vziVyXIbsiaBg8QkFrS8B5teJDg5vPYfQo0JODEVq07rxhMbG5bn+43+76M8?=
 =?us-ascii?Q?w8HB0Dhi4u2upgvA0iv7LeGUGaHE893FPHrpFWkv5EmN8KcObbyRHgXAVSKw?=
 =?us-ascii?Q?RbT2/FWXG9IuMEHds1X1QXpg3prcUyFZkgawO1khmS0B/Otce3eSs84ybJgy?=
 =?us-ascii?Q?NlUjetA3XmEE5ZJVQKqmn+jl+Of51gx5uCoPdoi42gWb9NWdedaOJAduDJKI?=
 =?us-ascii?Q?OpmA8Pdlt8JF/vVXXOfhfL1KznLxs5LbLNkF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bXin/ngzR5V63F9nlW+KrqonHy+nB//8dAb1zUQrIkXqGDre4339ttCy45rT?=
 =?us-ascii?Q?5tMRQT0ctcNWYlT/SMiC6EAWRc8Zjq+OeYrsyVW8fWH0juXZ7loAKcnzFiKv?=
 =?us-ascii?Q?HpA81A16J7TNdgXoCIrgckszPf6dHyD4in2q5u8BkJVA6grvORL1Ls4T5N9O?=
 =?us-ascii?Q?2be26ghulmKvVlgbTiER6dLZaxM49agy5Ym5VvHSWjGLIf0wh8UMfVl1KNTp?=
 =?us-ascii?Q?O1HzyfmaEEnZfQOft1JMFofCO5Qt0pOsX7uSNoEZ7P1/ddk4E7uuGkPv2Tus?=
 =?us-ascii?Q?Sdr5GOKODs1XuTr180z99K5JcXfJIx53HCTHoOo+S2AeAEQ+1t8Z/zKs5DeJ?=
 =?us-ascii?Q?l5ErL7+eq9oIQPT7Er+OxU4iZiFrxGFNNEGb7OwBrnxlEOBnhoim81AQ8B5j?=
 =?us-ascii?Q?j7lNK5P2qs+ZOCKbzRWkpYGwzbAhEUlyrdfXkn7kumeA4mmFc158TuRjPib5?=
 =?us-ascii?Q?jR4UAPLEV5lad+6fumLdBLrFDIjt+3sVakn+C/P5/LnHZ4tLbTTs8x/GKIkj?=
 =?us-ascii?Q?8F13lvXK75Zg0PbzellowcSqZzAP07SaEtS+uKsnayULeqikT3QqKhKSrHhb?=
 =?us-ascii?Q?BP4dN7Y/izO5s6sxNeLr5FHZkpmt2CwZT9xXMpTrVwRzIRkHPcner1m+0MQf?=
 =?us-ascii?Q?1qo+p7P/WgBRyJKYmjDdI/vd3sqAmxXBmM2P43xgzhP6WadKnaomVxq0tZxk?=
 =?us-ascii?Q?im8fY3JfZtcmdteOx7xGwLKUyodgV+M8rODWA1FxzuhalPAhCjLG2VV0kNHA?=
 =?us-ascii?Q?7CEqgSX7VoLMVvtFvJLQiQ4FpN0FK8HkALARjNnYpj2edZr2jRt1NUjGqz3X?=
 =?us-ascii?Q?iHzi+RpY5GRubkcyXbbcVuL3umymdIX1zE6iQOOxCzqNhv2zx3q0bXo8mpaR?=
 =?us-ascii?Q?Ro4+mnuk2XyHvlRTnFOyDsU7bvh8aaIkWXg606DIv8U+jvrrvkXKPXSw7YVO?=
 =?us-ascii?Q?YcMO4Tg0u3bNa33mzLPz4mhPrynsjl5sR9gOB7eTOvRlWjO/m+VwH6fVUCVX?=
 =?us-ascii?Q?HZUfLcoxeuT4IHD9ZOW9+tmkDoOT2ngbODLRN4lGC0ma7kHyXEfMdk7Kb0ux?=
 =?us-ascii?Q?3dUvJYs4mxacgtCovnHWX1TfvIcYOsZfLUyspIQW7S037FEAd5B9uHknzNXI?=
 =?us-ascii?Q?ZxxGtAZbGVzY1iS0b4of4eI0OSRKseVrnSocVHfbtnmFv19z+XdiEglKQXfh?=
 =?us-ascii?Q?l0zOTXkNbClR2o+/HedEH0irzgHjERhLKSM8lu8kIdpd6SxggCYSp+VLP3A/?=
 =?us-ascii?Q?Le2qcY5Qohns1XT41qIwh6U/NVIwzQrpz4Z+wOEV61A4s9Tey4wO7zaig9lN?=
 =?us-ascii?Q?Y1Q7a21N3x3paNvFBhYetbRsXCpry72Uj/VnQy4ETsmW7nyf7grsgaj0AqiU?=
 =?us-ascii?Q?l4YpBzBhgfvW19BY1GglCbzpC7Qwtq+HYQ9681S58GYEkjSykAw6yMlbMc7P?=
 =?us-ascii?Q?64dO4PCy2PXnH2cXwFHr+hnekkFPi1WaD4pQCS6lxBaiE0up1EkOCUzi1Pem?=
 =?us-ascii?Q?m/zgk0LGR7/50b7sM01jaBO9KrcUvUbLaNhWMgMGy+/jmlyjPr50XL2UMcg/?=
 =?us-ascii?Q?5ImCXb9gfHvxZYLC4bavaQtIvUn1TkuUm0OLCp9C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0217781-69b0-4345-4dc6-08de234acda3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:55:31.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UE9JSV6pj8+Ztqz1y8u6A9fdvplTBKyYoZ8Ry7ETFNpw9l3bw4wPGLwaQZtgfv7LEW0wCT1m0WKfulLztemuVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10391

Try to find a better place for rpmsg.rst and remoteproc.rst files.
Having them in staging suggest that rpmsg / remoteproc are not mature
enough which is not true.

Daniel Baluta (2):
  Documentation: Move rpmsg.rst and remoteproc.rst out of staging
  Documentation: Fix filenames for remoteproc/rpmsg

 Documentation/driver-api/index.rst                   | 2 ++
 Documentation/{staging => driver-api}/remoteproc.rst | 2 +-
 Documentation/{staging => driver-api}/rpmsg.rst      | 4 ++--
 Documentation/staging/index.rst                      | 2 --
 MAINTAINERS                                          | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/{staging => driver-api}/remoteproc.rst (99%)
 rename Documentation/{staging => driver-api}/rpmsg.rst (99%)

-- 
2.45.2

