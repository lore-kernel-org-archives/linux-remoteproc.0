Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4F03E958F;
	Wed, 23 Sep 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189027; cv=fail; b=OV3Klljzwdm93w5AuHOnlhizqPjw4YwgCrLPyFd5Fumk4vteXgb7A16AdqkzeRE8d0co6PbPEVy5K4KIIDbgLvLPnIGqavTYAeKWDUgd6q/gnOSlcF8Sxms1PQqZHu0ox2FUoFmzZBS3DxZqeY5cVvBuKq4/8sKOadbASFmBGBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189027; c=relaxed/simple;
	bh=tA9TZqpv86rQOqN1H6aJmWF8/qDcEtHuS7QmBycRSUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GTPAFfPYqMHLaPLXa9oo3ZK5E6Q/DAFJKUyb/VmGbBjIvd17s3+W0TFT7H+n0i77W97BAMQJfAb9B1cc9sggYjqDOFn1aYfcVa2bvKFQdzi6sft/N070W7mhD8HE+ttGEnjQfWJdoI9ijv07cgorCwBSQ1VYWkJsTySJjbSvhFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S63rd6rt; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S63rd6rt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ya7HV3/n7MrURtNGLeDUXIVfYnmCBGgQAcQHWaB4nAGXgC3xq48TOsP5MhI1FrQjrj9hs+ERaF19T+7tM/j9N9aodi+o0BAnDgIH4/oYeGayqoLD8mLOeFtXYg4F6tsNfbLXiRF8UGj8m06C8P33G3M/oedpWI+G3HizqZRDLi/sUVPu7Ua7XP1ASaq4OomzWy0TEnYPaTgpJ0FsyXOSa9wRMsEoEzieLjPb0KKLb4fl3C1UbUbXkmfYMKHgzJPbq8KqFwzpVY7atspnhenrH/p7U9fyV/omyzWltZrJFOE9GtLnm7x/OYzzW+j+EPN2cPZ+lcDX6t9HnGtCNbfPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ja9Nl2u0OJPCda8N52PsDMpePMClOG8bu8nRYay7GWo=;
 b=WZ6ZaelqLn7oabaJiQu3X7XmDjbc41O/3Vj9Ue74+CWrFXWmdbme+21b06h9ZfrN9kwv67Qd9fv5NHWmNGh5/Up1x+G11ZCT/ZBkjU53F/SFKwcFyYBu2/PdCriRt5KXRW2hybpR7DWnxNCyJJSFIMD/lqQokNmWPquIlpC/FtaOeuTrGnQs/pjGXZBZ8T3c5oelNA6YGchzwTIwBOl49kcfKNhCZjf5MQv21Nvh4ndHqZfIrXlun+sDwD9BZKOqvs+Up/JHN3ELWgL3fWPvoPvakFt8LhAs/iYoBAhSHUlyqdrWpzsqqb5SZSucWe5WTCSGHRygTC5G16izrye42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ja9Nl2u0OJPCda8N52PsDMpePMClOG8bu8nRYay7GWo=;
 b=S63rd6rti4+a4xXx9ovxM/dkPENZ2xvZnwnGpZsZkWTVgoDXzliKhy6/Z/BFQq4cECUTd2DcM/U3fffXp7w50dny33Po08IiSjPKBeSbLF+ta2vEOn0AQFFFXlwTmGlnwm0Z6FoAP35oTjWsF00G2tn/wKRwLyICZqo0MLP2R7ZPTLvpMoNWo4EONCivKLWc4EbkKKhJmqv8rg8GdvR4RQftSthZEO0bLlhfvOYm8bQOIHgesJFF/rKBjO2GUEycT8tvzkc4s97uedtwQ50qAz9D+/q4CeOtY3nS+kWGQASp7f5EWZ1HdPzxkNWozm+mDYz9GyxC+3DtzqIpwf75tQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 18:43:32 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:43:29 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v16 3/5] rpmsg: core: match rpmsg device IDs by prefix
Date: Wed, 23 Sep 2026 13:42:30 -0500
Message-ID: <20260923184255.299034-4-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::31) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|AM8PR04MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 18939a41-11ca-4b1d-aff6-08df19a28f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|921020|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GxUFBq2kaO2PHA+5wJMvbKgeLyWyDcpbb/dw/Skf/na4ycZzdG7Wv9UWYc8Nlvbn10Gv5RbrbjUskfF4x35e/W3zWqjJZ28PMP2d+qXsj7rDc5wZwqoxvnhJl4VS52+psrAmXxNxzMG1uOiA/rE/Ld5sl68j3nIhKaFTlSzIYSS2lI4jD6tguVrSsAm03wnxuxZGdQ5NTuZPn1nNXeP87Y2rokD1jsruCoRWinWymjlKuDLuWOL945FtIrzX/Xr2XgBbnuC7aGq+I39aRrfM7uyCcesyBo2KtHbm/gcxWT10pifogNNonHRzG/+N82GJX71KauKL83W/9fXUXcay44KNt+3UI2e9zwpLr1K9309tZFRj8+xPIA3ZVIiVDFBlvsQ7LbPi/me4FrnNq1NDOSYLg8QtfvQU88GvAFMsBng01akxclDW2/43RtnXPunGV3Trlwe3kuBh6UOp0QgoCDNwhoO8ymfDrIywlEyJ4eIYWpF+j98M/RFrGjdn+FzRyvPoxdRQX+mZEHuYeB1AQwhiSIaWKLDcXodaXldxYjFJrjZb0cpFRJCX8Ao3jHe01LhNjri3PWbLvZDnu+C2x9+RyQomGEWLYnxo13WnvdOZlHg75rFSL4HcRzUhnIu3YJ8dJt6NvmVMeFJM4Z04TXALkJZPXQ0OQp4yyiLxbg7EKX/N2sOBXq46SnZcBXG3fvjgquyprw/Gqx2ycvz70w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LbxFN287pzgqqeeF014J2uMlFoU1ArS85JhhKvc8WDTROb53+xfJY8GRpd1w?=
 =?us-ascii?Q?AoY5djingZQHuZYRfKTuNUdN8/mZ56URBMelHhsF1Kn/buZxjA9HVmfRXjXC?=
 =?us-ascii?Q?kDRN8JnfTvRVj+mgdE5NwMqrueBaPbdBKjwa22gbvs3kVgq5+FIZyBukYzyP?=
 =?us-ascii?Q?ogTzlr+xhKNlZJrYRo2a43VYGqMg7gGeixBpONeQT81MdB9Ih/n9MfsjTn8x?=
 =?us-ascii?Q?JuF4RodxoYjzclvkEzO/60+pNH+o1ByPShw7fQk6+uivatr8fH7c/6mwIHWw?=
 =?us-ascii?Q?yhf5Hx3DCuKcSo9tKEJoo5vZqbAVOdVUwsxSRtQXZSeucUm9jIFite7siczK?=
 =?us-ascii?Q?LmySTiyRJelIIVmUenRLq6Ae8Ae74UwOpMx+LgCLwLFj5UqdfNaRgPXooDh1?=
 =?us-ascii?Q?bPpj6wLXMnX1ugSI/cuYw5wvMmGNlAnyC6uLbIxHcEGl8yQ+MLyIKN6okVZM?=
 =?us-ascii?Q?Ewi9T7Dn+vCb/Wanu+dQ/tJAD+afRTzvwf3r0kdWgWG4OozlFM4A69EaQSoe?=
 =?us-ascii?Q?I76nEqS2wm2JGQNpkTHNl1UGtc+wa7m419zTxBiHChGoITiYmV1EWM9gJouw?=
 =?us-ascii?Q?jO10fEHdhaUvKdremtuV9vSAvbANOCEFlz+lHTINsf5LVTjWNt2uA39ol48I?=
 =?us-ascii?Q?p3oZCQfR86nAImXPPRK60Shygpe6qSM0DHepfvPacRt3yYkddNmcg8jm5k39?=
 =?us-ascii?Q?iPQ52dk7jwReUVwbWf0uWCUlAOpj+zyPkn6loEAgL/MqxHiuZ4cJPGRibzHE?=
 =?us-ascii?Q?jDm9s7wET190TIewQOfYW2XWpNQaynOAJIIMKk/IqAtLi5J0BdPVpdMmE3Ow?=
 =?us-ascii?Q?cuHdU5tpgrmjAeJUV7WtmJlz2xambGDX/mAVmNcAWzVyy0mWAr1OF6s2FUzL?=
 =?us-ascii?Q?/JB9UDSmQGtjfIjSZMLrco5kfvVgJSTJtgKo8+6CMtRRd7xpyngfjOigF5Yn?=
 =?us-ascii?Q?mjnMr/gc/Q5yTyx9M8WWPkway7CbNVQCmVKoBTbQh8z1G9PI+yv+LUdjWN2B?=
 =?us-ascii?Q?7wk/Reb6DgcqA+za7oaj+F18hnTBTqsNJZBOeuo2jh6OSem4v1VoOGvnluvm?=
 =?us-ascii?Q?s/rpv5Y0odnjl1K96goIuYgC91fA5xQDIIvi+dyLLGBIf66GF/TfiiKSzNbG?=
 =?us-ascii?Q?coACpuzhIiJXyxi8jbmL8y8S8opulGFh7Pqy4eQeeX6deRRHNfr/7LXTJNQ9?=
 =?us-ascii?Q?djjF45cSvL3aY8UC6s1fjdeXAtLLiec7CRtuMND5hoBv/g4khy/dgUXUkwho?=
 =?us-ascii?Q?69sYchRAii6IQmB6C44+B8MYEn0YP+jcK6g5ao8hOTmgJ7XTIfWAbgmaDSWc?=
 =?us-ascii?Q?12m/SYSGTnpf1L9HlUJW60fG4KMA1xVfWwe3b3Zqt5tshVSeUP/C8pu+G9wC?=
 =?us-ascii?Q?2spLua5YrJBAO2dSiAK8/OJWLdSYUamZQOU3yi9uv+UGbahUxc7Awk4MVQcl?=
 =?us-ascii?Q?TJlSPKg51N5idPRE47zBWpnJ/Z1V7A+odzAUmMznP3LHJpgnZ3ZEHSyeqfiz?=
 =?us-ascii?Q?Fmptfi7Os3DfttkLOCCTVQK5rPmRUl3yUvGZJaWWVumqKV4pvSeDrv8rpEd+?=
 =?us-ascii?Q?5nWNPasNMzszPjejAr0OSlP4ILVMaA7UX++oPBKVg/vCD4qoUGeSl3dsjHKw?=
 =?us-ascii?Q?nPZLdY+kYNlehAI3FTIh4C9ygOq4zaBsJYpEahsIsjsQrhesrOxqmbNfDJ1z?=
 =?us-ascii?Q?3q2z+iL0rEg5VwwvAB01iIyrqXv9ui3CA3uWCiHimkgrabYwD7WihiX448fB?=
 =?us-ascii?Q?IfZlAGkxgTNof1cFfck7mad+vNHBhM1RoElm1k/BmmccYC73sL7f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18939a41-11ca-4b1d-aff6-08df19a28f5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:43:29.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6mzGlPEc+fHdIFNCFKbbB2zvkzfa3sjWsFIQ99u0AISlcqUKm08TVJ+BqBn5PPY3n7UGDrjT+qi3YJQlrsanSygDkD/0pbDbej4qdj5+9T+ISAmSJAzkj8eriyKhNrg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298

From: Shenwei Wang <shenwei.wang@nxp.com>

The current rpmsg_id_match() implementation requires an exact
string match between the driver id_table entry and the rpmsg
device name using strncmp() with RPMSG_NAME_SIZE.

This makes it impossible for a driver to match a group of
rpmsg devices sharing a common prefix (e.g. dynamically
suffixed channel names).

Update the matching logic to compare only the length of the
id->name string, allowing id_table entries to act as prefixes.
This enables drivers to bind to devices whose names start with
the specified id->name.

The implementation is copied from a reply by Mathieu.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/rpmsg/rpmsg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 04bfcc75f05b..97a4db52b040 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -386,7 +386,9 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 				  const struct rpmsg_device_id *id)
 {
-	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+	size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
+
+	return strncmp(id->name, rpdev->id.name, len) == 0;
 }
 
 /* match rpmsg channel and rpmsg driver */
-- 
2.43.0

