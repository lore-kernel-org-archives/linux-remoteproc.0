Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013042.outbound.protection.outlook.com [52.101.67.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945442022FF;
	Fri, 18 Oct 2024 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249720; cv=fail; b=jiWqcfVgHpc9W4AOf9Tt8i3yCvhRmtMoSH9skTcyM2nhgeKbSPTh+iMEI7PIqQ8UzfzYO8M9dVT0NjvwzzXivaYFUHgozle6SpkstUn4+jewCaLcmAch/9jjIzm2DgCTrhEQoQNb1ScT05JJneaNUXB/eWhNNjzZBy7ntwiRCp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249720; c=relaxed/simple;
	bh=gXDIYgaX4X5te1FYbMyoeAGiHfm2lLAYFybazk7Ojdw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jm0NeyF5hFayC7GWtTyJ8smazppUzCDP4BJNZ5Y2UGSEaBuNe+0c15dJeBnWTJCcDcUMpaBXrygUziR3ANxU7M/OJ7nnQJiYXD3BPB3+EXRnOX8FU438YyUN4oPqiosqsvA7BoHZ+b1en+savsezSdm6IZ2TsfVaohNFlGZzf90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TrcBQeCf; arc=fail smtp.client-ip=52.101.67.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TrcBQeCf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQqT+XyXACn5U+KGmdVK/LT3Q+ykfGcrmlqg94s1lnG0DW8tzFcviXB7h3Ewh6uZEFSCD45iWrLNI9JI6DT2zrXRcJXJTVow7OL4q2n4ibV7ry6lq8/dgMPv/5JIFcePiMBgtPh+lkJAX9eSTsmYR4WitsJ5+TrD9LjKy8WFfuTxh4dpeF7fJudK/yJvIprl30kfsqQmtit8KBz2wXDfq1Uh6hc2hfI6KGJmOt6jHEv054lr1y0R3ollYuS1iRC+zvfsRw/paF7T/QiDYNoPYGLThUVeXnj/jrH+T43eWHCbUwG2yUibBoFBL20MNX6N9psyzvikxAPv+10ZciZ5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piRUoK+9PPtxtFjvYxh3r0Segmil+TOGSVHngMRh7aM=;
 b=yx2bo1GFzBbqQdGfiiYbeK53vhYYe+dW/d8tJjyvWb59WEiBUpePlIxhNUPhWIigmw7Nfw81PUCNTCLq4kLshTX1jJSXK/zIzLb4LB1EWqnxB2rqjzgoueMklHMO2n1FHJ0bOaDw991LbCtp+2OAHJ36fPDZQUcG519Tp88O5erq5zp+Vx3S7XpNo9cAJ5eM0OzUeB2ckXA+pn7BrwGguHSPTQ5B/k1L4QFlQcxN0l8guAnyn4UrC2lOOZhGloMGrLdnZ0wli13FBqsDq/L/QlLVZDR8HWSe3pqEGd4aCGSUNoujWAjpvJZ5Djy1vuTLHk9A4ZGZV9y5j+8Pc2XTXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piRUoK+9PPtxtFjvYxh3r0Segmil+TOGSVHngMRh7aM=;
 b=TrcBQeCfr1eW9UIrBUOVXeQYch20BwUvbGHL5Jb9lOlOcmD3eHTVfkljUjUyduqe3ei1Y7ELABqeaIzv6wzB5qdYR+HoaT0XyZVGE8WJBhTfKAk+l7/Gr/0rtM5EkOAOgD8hjNxbvIhfk8KcKHwmN9QBLb0vIfA87UmzI2bTPCMQYGTfPFHotOGPst4Sb7vjR09WKIgfcGIYF6Bwms+4GVM3fz4PGvN9ulPydIRl7fdrWi4nXts9MPyPdLwXbEpCnjRjutHp1KxDBGJzhNEVFv98lXV+9mcgoSLm0IqLQgmt+gSu2QQE8VC6srbmxX5VlIYn1S159oEUWEq29u8Q+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Fri, 18 Oct
 2024 11:08:33 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 11:08:33 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	iuliana.prodan@nxp.com,
	peng.fan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Alexandru Lastur <alexandru.lastur@nxp.com>
Subject: [RFC PATCH] remoteproc: core: Add support for predefined notifyids
Date: Fri, 18 Oct 2024 14:09:29 +0300
Message-ID: <20241018110929.1646410-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:205:1::32) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: a09dd84c-3a29-43c3-a825-08dcef65345f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8kRrnxhvdlgZe7ufzaq5K4MsNb9OBtXL8I8rwOXr55YdRUTqG9LvRtwsMSRW?=
 =?us-ascii?Q?zqlChvQlOYRrDzisoxZszOVI2CdYGGEyrIZMv/Ukns3szuMA9QGg4Z151Ma7?=
 =?us-ascii?Q?5Rvh46fBWQvdAMtohOZqUd+4qiFO7ygdv/7LnkrMTQZ+qUbQCflYIK6Pt2L7?=
 =?us-ascii?Q?lyF+2A1YBC1moz8FXkuPIfakRvwbhudpSCd8znP4WcVVjNjdYLzuvqKxlbx8?=
 =?us-ascii?Q?BRMgk3yJqplWsh/NV4USz/YsFxWcPan7UrBYr0cnnkqN0nDGb0czMeR7AqUF?=
 =?us-ascii?Q?zPiVzNNc2i4zWF5clsUAMEYZ+VaClAwXf0bpAnHbxXluAPD1I8xhiqpgWYFA?=
 =?us-ascii?Q?juZA7pCZvletLBL3Ez8GCOsyzKW5HBUZY0avevVM2ywREu7wDRziPMaO0O/S?=
 =?us-ascii?Q?fBMRtQnWK1O1at8Is8UqErC8oJTZAF4BpNrrJp+TJ1QOtio4rpFcIgi0v1wU?=
 =?us-ascii?Q?R9pTz3eJPIf+iOwcj+5+3Ks5ouyfIM1zmmDog5gsQugzm+aOx33l7XE54I8L?=
 =?us-ascii?Q?sFtbcR2AbfVNCOdq6fJvj7Jn/ijtu9WzZqkeqJWFMJGbsC8z9tPjhI4CaMAf?=
 =?us-ascii?Q?zGqL1zp+vqs5VIbS8GSZVrCiMEe5fSPtGHjd5BpFcKSTpfJWklHn1q5Lkvsk?=
 =?us-ascii?Q?nlAuadfiyxZz2Y9nfjRnIFXdO69NZeyw8hwiPVtlUcZWNvHU6C7LPvIEAN72?=
 =?us-ascii?Q?FkdZAyen0c/b8O3j97unOqvA0yLt9d8/IcGl2UwYsKAuJ3azvTFbC4NsHjc6?=
 =?us-ascii?Q?7G7pam04pCrlrHaYH5XflpbowqJa97o49wocMQiSWQJtqwh8vxFsW1xIWn1m?=
 =?us-ascii?Q?vfvT0yG7E8DFgBVMClFk+HQ/R+M/oa6ZlNkKTV3c11FuzHaFw8pDsfkTdvuK?=
 =?us-ascii?Q?baZR/M3mDRdsag8/L0sbhSwvcdaMEOUHXqTW92P7kJsv+8VKqKlFyShfquun?=
 =?us-ascii?Q?ZrorWAPbmC2i96szTYyF5yUEeM7CveJ/ErT061kcV68MNiOEgHXjrDTf+AiJ?=
 =?us-ascii?Q?gnxs34Vgjoy+4G8v6hWCUf1h6rI5DQ8OM8NDkhzgxo2hwnJeX99yYqzYC9c5?=
 =?us-ascii?Q?uF5hw2wfc5BDuTQmxHREtmFbC4+aRC+R1g0+HoMnhmMkQrCNAp12ZOdlgDD8?=
 =?us-ascii?Q?M2Tuk+xobBqEC1KkmY8xqy5dQoZ/+8XBg5ofMOYhVYnrnuJULWZShkhV6B4j?=
 =?us-ascii?Q?JVw/HfdXUsTbM8WBhEb3ew3CcqW98GPgYRpIlCAcBzfV+EsVhV6EvH8E2fIX?=
 =?us-ascii?Q?ovr34iNkFa+V+boT3YxmLfRL/NtPGY6DeK4/PuhfJOOoOguyOANA/auh1qf3?=
 =?us-ascii?Q?lrzQAndeZE+n3UymWJdz1SSDqcGiwS2bWfP2PsCGgBVMvFa4NBm7ojgmAcNH?=
 =?us-ascii?Q?DY+zEsA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KZhxbZpte4WN8SSD2T51otnmEVHHtr1w/N/iQEYASkqdXxgrRsai2hfrykh1?=
 =?us-ascii?Q?VyEG0/tbYV7rgL+aegFYEfvJSWO8oPafjYttRdimV/3Nvw1Z8jWUiInGJfQf?=
 =?us-ascii?Q?Thw4P3kiFmnfdKTBSzKAmwwVvIpALI2rWXWxHeRiix3QMBYW0hWGcu+WAT3Z?=
 =?us-ascii?Q?WKydDQX4gHLHlp8t4EAxn2r9JxPQiAVGk0EzS6cOU5YDGM2B0VyOp1mE5eTq?=
 =?us-ascii?Q?8/48tcbW7tSsUl73pTJZq44lQOwsdUbsq+8uSSlBWoDXAyx9PkI/esyl3rVf?=
 =?us-ascii?Q?2W2wqbPveXZzBiYYSn9X2gI1zBq6Lnf2yHTcdJcTYRtzyZ6KO2/auOocgtN1?=
 =?us-ascii?Q?kA3DU1LjezP5JyO1ffCfsxXC2DnvNnwKd7L9VzXPqZi5hHl49NqskVXPSksU?=
 =?us-ascii?Q?iPRpvyNbrW7VIhjH2zuhwDRMnOdtpE7vbPmmCtdT8kVQu9WnBEqSti9LaL5w?=
 =?us-ascii?Q?coRnlRjYiqJxma3EsdPj6+frz9U3SC+KdfHwiJ/iswO7sqJ0Pz/raGGag0Ci?=
 =?us-ascii?Q?UDAtW04tD6a9dzc3xB6DQWvYg6fpuNJ1+X3ORXcRjwhYh9kxA+LVjtBg4SZd?=
 =?us-ascii?Q?N16Yt//cNt6iVX9W173MuGX57pWlGXzSW07f8NcIZYP+oJPE++PHMI3ya4Xc?=
 =?us-ascii?Q?KQBuVl5rKadr393oZzIEp47psUO6XFxn/El98xg9Wswigymm8CjXAjvb9O2+?=
 =?us-ascii?Q?UfHm70LDOEUj3yCIHRei/UpLD+NdLmdUtQWqsPFXCGvNkLZaljES3yKw/yX+?=
 =?us-ascii?Q?oj3+Ooc4T+zSbVLOSmx+JZsUvDDpNzVXhZGFN261TqpAm5Hl3OIOh3X1UAhW?=
 =?us-ascii?Q?b1zRM2gkuO4VVggdzONfHnTm8bsua2dEtSKoQKe+C8EfinbLFyAyULai8kdF?=
 =?us-ascii?Q?D/MCvT1jP58Cy5tciqpHLwvm5eyvUMNM/b7SwR3nMaj/eyup2m+qXCxjoom9?=
 =?us-ascii?Q?4BMsFAhykroJ1BSvIQwnrfmWJRXCvh96EofO/UeKQKMJH2pkDrcKVUH79SGl?=
 =?us-ascii?Q?SBhMtNid48+kttlerDoPSXPt08+by3stWhOzIDgq0JrZfbOAumhCJ8ng9kFV?=
 =?us-ascii?Q?rrowxg1kRgjDpmYxqjGw2bFq/2wriBsQ9Wmav/zoLb8IdO7Y1oMbImtUj8N8?=
 =?us-ascii?Q?/t6hzjvJQtl9OscDhJVaJdZELnkq2K9PTU/6AjIXrLaqSSox4DQoSMKxVKTb?=
 =?us-ascii?Q?QB+z+F0++0cmumltLI7WA5iNgBKel2fKpzxJ2/jdTQo3UYS7h9p6vDdpmUJy?=
 =?us-ascii?Q?ggAmqPM9TMYUPafFvfI7LSTYEU+URVkC6EIlkY13XwIb8KqM0pKXIRMBJGuM?=
 =?us-ascii?Q?kwAMLDN3iAGGzUrlY22bLjbtzHTid+5cJEbz3zvUjluIxjTMPNk9yzznu3vW?=
 =?us-ascii?Q?pxsWxjkrbBFa5WWKG37SdecsLrwGlzkEPhXKO9qQPUhONhuHOdCcbTwlzgL/?=
 =?us-ascii?Q?bs40267xqpjNTaj63QGy1kaenhnbo3IVoURKvSEWABUZJSjh1y18a/0EZavl?=
 =?us-ascii?Q?CsQ2TsbhVRDGcFGfzeEcpdQmenmyY+mYZeZlzlPeKuMTTTGqLFFz24KJ+G9v?=
 =?us-ascii?Q?asMPovD9n3/gAxvuW2YUKdVvRuDTAT3f4wnJ7KLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09dd84c-3a29-43c3-a825-08dcef65345f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 11:08:33.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZ/2zyTFctJXsaE8OlBtXiT0yAdVIV5PACrENWpH6z2tJ3iR8Dl3HNT0npl67gl2lAnTonC05ufM0TeV8e1BQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

Currently we generate notifyids in the linux kernel and override
those found in rsc_table.

This doesn't play well with users expecting to use the exact ids
from rsc_table.

So, use predefined notifyids found in rsc_table if any. Otherwise,
let Linux generate the ids as before.

Keypoint is we also define an invalid notifid as 0xFFFFFFFFU. This
should be placed as notifids if users want Linux to generate the ids.

Signed-off-by: Alexandru Lastur <alexandru.lastur@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
 include/linux/remoteproc.h           |  1 +
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f276956f2c5c..9f00fe16da38 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -332,6 +332,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	int ret, notifyid;
 	struct rproc_mem_entry *mem;
 	size_t size;
+	int start, end;
 
 	/* actual size of vring (in bytes) */
 	size = PAGE_ALIGN(vring_size(rvring->num, rvring->align));
@@ -363,9 +364,18 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	/*
 	 * Assign an rproc-wide unique index for this vring
 	 * TODO: assign a notifyid for rvdev updates as well
-	 * TODO: support predefined notifyids (via resource table)
 	 */
-	ret = idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
+
+	start = 0;
+	end = 0;
+
+	/* use id if specified in rsc table */
+	if (rsc->vring[i].notifyid != RSC_INVALID_NOTIFYID) {
+		start = rsc->vring[i].notifyid;
+		end = start + 1;
+	}
+
+	ret = idr_alloc(&rproc->notifyids, rvring, start, end, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(dev, "idr_alloc failed: %d\n", ret);
 		return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..98c3e181086e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -238,6 +238,7 @@ struct fw_rsc_trace {
 	u8 name[32];
 } __packed;
 
+#define RSC_INVALID_NOTIFYID 0xFFFFFFFFU
 /**
  * struct fw_rsc_vdev_vring - vring descriptor entry
  * @da: device address
-- 
2.43.0

