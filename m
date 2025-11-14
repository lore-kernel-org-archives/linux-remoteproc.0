Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012034.outbound.protection.outlook.com [52.101.66.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03A22F3C09;
	Fri, 14 Nov 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763103342; cv=fail; b=TwKVlQZkOhEOc3hgZ6F/bB1Xj9rxa1m+yJNBvWLaBXq8VTmfu8hxikVe07RwooVfaDCLyhzVAun6lK3l4/tNrhzDBVhd3wWx1Jlaaes95ys9x0dJ1+KBxaxrW0Wht2L7zGcxgmg67I1YqREVahp5Iq7GtYSOroPGFTRxPIuKqII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763103342; c=relaxed/simple;
	bh=2JkRmuoQE5Ry5xg2WlLzWpgu32XDNvikFejRWlFZI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AwuGtU13JilskgWaTWG8yhcKmpOSw+7Sk5ylHbXJLw+wsAKYMLiMTbdrdg5UQ7t3TihOVhySfu5ROjIkgk59gMcq8rAgc/fu5CGy9OJRAEhmORt2RlMV2LMnw8MO2oeidRRM9pau598Ty3Fy3Dh7pfNAlIwLGlDDgTso6EebTbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MdAXEJoR; arc=fail smtp.client-ip=52.101.66.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MdAXEJoR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvchPaI+JziR7QzTcVmotKoGjREgGl9qLGSsmNRl5bd07jmpGpD2wdMRM7QNLGkM+BajZ099fFlF/XOl2y0u11Pj5H0HNvLKr+37AKM7saXfWHGaBaZqm0AWfjJQrB+iAZErA43GanCUVVQnD/W8Wcq6POE4l3w4MApMI1qgHhBC+YNTlTmfi2FRwvcAqNPXPoe3MBMgXS5iBfzr8oRfjtWvX/kAzJa3GQI2ZQZUqPVDNHpGbG2mSE+Z9Kb1BKwdInCdTO+hrjEiXLiOFEHy6YxDf7G6EFfLD4NuNa2KYOb+N8iDl27OEykJdRik7PKG7zDyNbqokRGnKET3wKUEkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPnPX8D01SRSKoigpO6zUhubOTq9r848MwV8BlUZH2A=;
 b=fBBsyCR746hREnMwm0h+F5BXyfAaNoEbzUd/GECC1/5T1ab2sxbURDA4NBgk+XRN+a4LKRzg6vFNASHa8N45C2AIl3Cla/5cYka71CvnVcxjEo+fLhRIzKosPYKkhn1ttOBbcixiWtaPE4vfgM58I0D72yr/ojBiQGGXTnhLk8vnXYTafvGt/VZhDBoFzmWY9xCbFBvi3dT3Dt7YoX+ew3wsvgyXTM5GLwTk/VhezZmUxm9gs6VZDD/GFQ95kDael8FW4BcrjhH5hlc32oyDrVevBIM6txxyqsVFOzG6qCOZQlhXxl7q4KKuB4vpVuePVdpqqM9pe0DsalqXn2hzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPnPX8D01SRSKoigpO6zUhubOTq9r848MwV8BlUZH2A=;
 b=MdAXEJoRrrc/gicmWhmjWYz3rfDUMuzhLInC8rYNTBEZgzGiCpx8T9JJhQ2ilw2GL60A01rf5PuCMiqgguiHyxyXLpoBRHCDBIXEdZHJiZt82S8HPAbjWn4xtJsdjOAFGSbSZ2tdg31Ime0higWHZKJDZ9fX5BpbRNzRNu3jRoQF+TvC91KZ05s3cZHG6ttI4GnwObQZ4HVvlFkinCwDstNUzZ08pwPAfdwrDuTNPT7W4Z83NFDsWLiI78wDc2AH3N3L400lBIAAcm2+8y713Y6stCnLXThkUiaXBgo5+CPfftp5CNAVG4s2DnblJdK6WR2vTTCtoOcAj76JK27ePA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV1PR04MB10276.eurprd04.prod.outlook.com (2603:10a6:150:1af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 06:55:34 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 06:55:34 +0000
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
Subject: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Date: Fri, 14 Nov 2025 08:57:45 +0200
Message-ID: <20251114065746.901649-3-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251114065746.901649-1-daniel.baluta@nxp.com>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV1PR04MB10276:EE_
X-MS-Office365-Filtering-Correlation-Id: f226cfd1-60e6-42b0-a2be-08de234acf22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gy297AnXExpkk9F4W22QB0SBFWOmk+HmE5rAJQ0jeHot9WOmk1LvnW0RXozQ?=
 =?us-ascii?Q?gtOK1yEq+KUwVF0UiPTzETlcUV0w1L6wDpcqc1AEKGqf1QBNKwWCgpkRknPQ?=
 =?us-ascii?Q?2DTUygFuer4HOnjI90p7nSeoDDygKtEal/0YxVwXq7kqGbxPc1KnGoz51ovl?=
 =?us-ascii?Q?hyjmYzcehqy6jNN9EV9X6Ql3VpBapfut0uRGgfGtZzCeYUKstUN1YtkoNmG9?=
 =?us-ascii?Q?OmhrVyrMIY7GMboff/egEHA+oQ31K89OKWnqOhjb5qoCtTe8ox4NSZFwyWF3?=
 =?us-ascii?Q?Ax6OBvc+ytieTTYY4qKOiY+I0bQBSTBSrimSEyTKQAp+WvDSevUS+hZMKSqk?=
 =?us-ascii?Q?U8HjG7H0LmgenUQSQGnA2F6iRfnsaMNM8dhw4Li9CYF8zqmTXUPTKytPVKhj?=
 =?us-ascii?Q?3a6BsXiw2qkqqraZJERwwWAoSaiHfdNyQxvAjshwqZqY3hLHZtNYnm0Rp5B8?=
 =?us-ascii?Q?M6a/mRBnZJycZHSs4vvFkjL3jpXwsAHyKHH7TJOd7/PlnHj4/0BtxcVtIdoa?=
 =?us-ascii?Q?nkf586xGE2o97Txie3MugpZXHSGZXBMG2yqPpiQsYt2dWKARMoCO75lDA/e5?=
 =?us-ascii?Q?nFig8cIhqnoJBx5I5BLXTJRnPvBVv1hwOn3m3hJoAiHl8e0AOmuRXV7a3OnN?=
 =?us-ascii?Q?gb+BvpWcRVRolVDM6xZm9r2RfpL8dGUtIuJNHAAi84nuwcrTdDaUE8iZ6E3w?=
 =?us-ascii?Q?TK6aLWUaIBTPF/jdlzPAlxtV2ShIqt8rQ/3LPJaTjlTP7rJJhBOnu0skVAqK?=
 =?us-ascii?Q?kzRlyY61VqagdHMIxi1ZJ7Z5oh+9FCIuSnmIrzoprCAJ6L8mg9boqoj+TRqb?=
 =?us-ascii?Q?5BxLX5ibJ35P1mSqOnboAQJbe8MI1hgbByMkhRRiFkNltdWWdtQncXMaAcs+?=
 =?us-ascii?Q?vU3auZv14cRBMuRyy3efyr0ZaXkyw0kDZU+NbANzoLAj3RNrmtcejq8tOZmV?=
 =?us-ascii?Q?iuaDTsepioHcet/l/OJcnfRHJXPgU6Bj4UldO/1WrHo7afYvujsV485/hPG3?=
 =?us-ascii?Q?1mIBV0DwAgixLAx0Qah41gCkYkxZHIggQ9P8wYuUwbRJcnohXWWoSqM7Jg7A?=
 =?us-ascii?Q?tKtqHmnCpVEoywLpNNOQaYgEhfebIoBcyiAAmdKB2FP+UDRaZYXQ2QxpKZrZ?=
 =?us-ascii?Q?zR4WIkQEt4Z7NBcO4CtNONYyNVYZEZJPm6axkdslwycGPjNfpJCyta+raJ1S?=
 =?us-ascii?Q?NU11meSIugP/u/s9lBjV3jo9d2LO8G9fxPfIL7ZNfb6ObZF8u7OpPj5i0Vw9?=
 =?us-ascii?Q?SYvLJnZUEv8AEO6CI5JygBDQbHhyYIbsmsdyZIFjsidc9FLUv6oWm3WOn3Wh?=
 =?us-ascii?Q?1JhZkT2CWj+SZuAneK9CMiODqzAhXoc7NsjnuHMsxDI9hiXYYJwQV+v1QiEk?=
 =?us-ascii?Q?c0Z4JdNbJa5nVmrqxoKff6hc/JRqywVWuZcMeSwdyYEfjtzPeCVHgfCe4DYA?=
 =?us-ascii?Q?4DClGlx09YfOEY47b1fiGHM7VTrCPg3nd/mzeV56IGlNNOWoNTF/ut0tta4g?=
 =?us-ascii?Q?fsb0qLULQtqcO8H5BEONpoFN/DxQcZYhDsgH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w1nONYo/aRYTevzWdM7h5zEmiQ45Q7Vz4eCSpk7AxY4JQyq+GhfPfyfDcTkS?=
 =?us-ascii?Q?WtXpt4mdmBdR9HOYIadGaA72fHUd+AgJDECDrTrvuK7Q+FZzscn7Q4WsWu8R?=
 =?us-ascii?Q?95tYwqlIfcEDfdXhNTPjZmdzBixUE/UjSQXzRoTblE9fQqKj9lM5BEcINOGj?=
 =?us-ascii?Q?fu/+WtFG+ujFX8KAmCOsZhpOUk7Per7xoYxXbDfQiJiDN1fbMkXeqxla1xzZ?=
 =?us-ascii?Q?MJU8e0uwkEkvJIAYOUVa8fqnaBqib2ByPdpODEEVjiULHVlpjW6mWVtKLgNX?=
 =?us-ascii?Q?uXfdK0XlWbagRvG7V08PU1zQ9pFDibIYzNHhRZfWGh81Cog7Y7tZDownZTQG?=
 =?us-ascii?Q?JoHpbmxTacZHIqYiPhJfo0xjlQj/snlhtkj8pwcV08RsPqxuhAPWBhdDFaTN?=
 =?us-ascii?Q?tX01Tp+39ve7fM3cqeTQyuMTWkklKNGlyQKloT8OpmkPeg+u6Mq+pFd28tlz?=
 =?us-ascii?Q?qD04EjokZ/lqdsik1YctF07QzGByzJVLNSfpS2SprZGXF9sJq/wAbOmIF4a4?=
 =?us-ascii?Q?lst30zDbLCwhjXjBezhMUqG68UX5ZBYoJZVNppR5pabwi1BGADTLwK8oSj0A?=
 =?us-ascii?Q?BBpgzokKY6rJ0M9DsRm+DsY9/Q/e1qh9lTGhsgv1CT+jTBV+pv65QxZcvPYf?=
 =?us-ascii?Q?wSHhoVgt2b1+TqN+9BMJ881uUlRl9hGHL4t+5J0MaS67Sq5CyfEBsLEhSIor?=
 =?us-ascii?Q?rzwHP8WtIxY+HWhh8PlIcYU9OrXUwPAiM5LdjM7kMQwl3gwoEXFZhWtpfwxl?=
 =?us-ascii?Q?oZUfqHKNLue+maCNTIT1qbSunDo8x0Nj85PqpM3A2HRVVXeNDYzGN1GwvvqN?=
 =?us-ascii?Q?v47GGdF9HkmhzWB48ZSmcmHwsvxFNoQveve3X2dcgQFH6zBw9f49gb/lPqbq?=
 =?us-ascii?Q?Xxw4n//W3epbyYliQ9UYFiC7mGlSlBSZH65Ed26PyfyT72zvaQVFQ3majY9f?=
 =?us-ascii?Q?D9fDfPPWHOSDi9Q5P6rqUxLpwJK9leK8UBxzzSS1keJE6FoJZ9OZyCHugeLq?=
 =?us-ascii?Q?3CFua7hPLo6NXSDGrlTd6dNUddyQxwBzXMlZSpzwRdErLtupFg7p7lI8XMxx?=
 =?us-ascii?Q?/4Qm+oVRqiXHlhXyJKHp2skPWIun1llYUFkf66tTD5ENLWVSfGJlKU2ou2cS?=
 =?us-ascii?Q?yKI0qcZqEQK08bRIzKaZo+3waOiwQ4qeKs3yiTAyXRSH40F5d6Nx6kmURXBW?=
 =?us-ascii?Q?Two546vN1BeDkvC/LE4pmyc1qq225hY600c+Spabh/yv6m5ZuX8DzgP7b7mq?=
 =?us-ascii?Q?fpP9H7IEm0tVabYUH+A9O5F7vEJ9LjZsGlilW+OkkCivLTY8UbQE/qrC/frE?=
 =?us-ascii?Q?bjEOUOrk0Y8YUpTutinR2Ims+lR6cwab1/vQg2DE91yAW/4JkU9f6DgTizKk?=
 =?us-ascii?Q?69cC3Tk17Uj/knIA4sH4JK1QgMrQbg5BrvT7bR5zYi6kjOPKw8Z5/F441nhg?=
 =?us-ascii?Q?8zdIZtnrR1JoxhpC8BzvF+z8phaOD5kPLh3/kBxiZ90j4o8eNITaVDN8xU6l?=
 =?us-ascii?Q?dFDd05blrV4EMA0PwxGuUERBztlx4QOZRblkXexRR4euB2L6kwamVtoxq00E?=
 =?us-ascii?Q?IU8z1TP3smiB9e2h1VNGdzaGI2/tSVOSMS9OpMtZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f226cfd1-60e6-42b0-a2be-08de234acf22
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 06:55:34.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlcwURFpFVo55g96nmCvoFlMmeDDlA7YytQqrBDHfp4yN5EEuqrtyBZJWbEZRSKBjMHIi3/qxkGtIoG+uopIVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10276

Fix rpmsg and remoteproc filenames references after moving
them out of staging.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/driver-api/remoteproc.rst | 2 +-
 Documentation/driver-api/rpmsg.rst      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/remoteproc.rst b/Documentation/driver-api/remoteproc.rst
index 5c226fa076d6..d7ff4694aba6 100644
--- a/Documentation/driver-api/remoteproc.rst
+++ b/Documentation/driver-api/remoteproc.rst
@@ -357,4 +357,4 @@ rpmsg virtio devices this way, if desired).
 Of course, RSC_VDEV resource entries are only good enough for static
 allocation of virtio devices. Dynamic allocations will also be made possible
 using the rpmsg bus (similar to how we already do dynamic allocations of
-rpmsg channels; read more about it in rpmsg.txt).
+rpmsg channels; read more about it in rpmsg.rst).
diff --git a/Documentation/driver-api/rpmsg.rst b/Documentation/driver-api/rpmsg.rst
index 40282cca86ca..a50c4db6679f 100644
--- a/Documentation/driver-api/rpmsg.rst
+++ b/Documentation/driver-api/rpmsg.rst
@@ -5,8 +5,8 @@ Remote Processor Messaging (rpmsg) Framework
 .. note::
 
   This document describes the rpmsg bus and how to write rpmsg drivers.
-  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
-  (also a resident of Documentation/).
+  To learn how to add rpmsg support for new platforms, check out remoteproc.rst
+  (also a resident of Documentation/driver-api).
 
 Introduction
 ============
-- 
2.45.2

