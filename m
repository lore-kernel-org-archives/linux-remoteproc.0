Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794366927;
	b=FXk0FpWypKWmpoE0OjsATrJtUHJH8yox2iZbgMLriKpEhnNQoOuCNHbn63pvtXhYkKqY
	 BjaL9rzBSVbc5EHFw8/EdloJkrR92AlCFGvrPgW4zfJwlvBgs9GATxq6NJFLv3h2KFxPA
	 VcC2qeIjKG6xGIEC6DsZq6oDN7YzYx3iCopmSYAtxsiVzcmfGhklM4Fb4u2GZnThogyxu
	 to2a+07uz2u9g/d+whY/QcrgRR1eFQGuSk0PTNdlFjft/Hq0TBtJPWHSBwfSZW6aA5R++
	 uFpCkQ2wfLavijW8vMxkpFVlv5z+f+Tusd7kKo5ZLo4cYoDlgndCP1ymaPiM3/GpV4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366927;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kIsKne8vovs3iH2KWShZmB6FwTo3h9hzin1P+XkSwew=;
	b=FXnCNiQ8hND430MgVSwvA2yTDgByjO9GNuDKCxkPz0T7F323if/hhcxOMC7+66EPKQeC
	 IXGkKrLVQsPz2uapTqoLC6WT1zvV5RLg3KGUCdz39B0lndlU+pLc/Rxgb3lZtMNbsmtq4
	 woN8JwmfZ1Ta5uHOuYwCuxhIi7XuSveeZfcsg13MEW9QtpYI5g+OS1FSItUYGhB1tWAkt
	 0tDY3r/aPnTS5Jhmqhz751zPAHQBIYeaWuHNdlkIxMDSJ9NSQ5XCh/sSvo0tnmGoS8384
	 PYNaVntZUIA7msUl0Ek+S2BH7IcAIyyeSHym+6Iadn7TRALosqYqriKeoIZRROwSHSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ffRTUdTb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.35
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435660A3809;
	Wed, 11 Nov 2026 03:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C435660A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ffRTUdTb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYuodo6v9LwNODNDpFLzsUSFyvRvQsIPiQlrH6RJHYi846lf1U6j+wXR1sklOP5uxpi8hfh66GItr/1/q+l3vrMl+uYBkxgU4oA9x5EmJXUQScIpnrXVe5MUMWnMEm5cZsbifz28MSI+Qf5e/hYYepe4Zz4n71yQ5IhJrW9zXn4vCf//ro3GaTmd3Ke361pPrUY29+zHCfMkuIWwAeQJ1ApWxDo20b0e/5HeGLmKKoo2wU0ZKP7lvctnquQ9qgVXJk/Sb1jxH8mP5Az0MsmewRMSqfR3nYJgnHJrMtO2XATXQ8d+tjx3BPk9Se7aKWbDjiaDLJOHdvuE/2jRIi9i+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIsKne8vovs3iH2KWShZmB6FwTo3h9hzin1P+XkSwew=;
 b=ELcDBgPBbwEz9YXDgbWGid2C8HpMyoczEg+Se/ImuQmxUpOCAlI3U7uOuoNz7Yu+Rr2Fiz1uGOCLD5jMTC6rjB2qWup/8kNInbjUh4gKnjEdFd5HzXkS/OaTmNGN1u67Whx0cMUHJkeYvwPpfzKWd5bm0TlVq5f0cc18RZoXJSzAEwyNIv1r5zcRa9K3fEW27eRLvMtk92OeDDQWGAt9eHCE5SLD0/IR2+eq+fWZm2Zh6dAsAfC0EMuczKl7Ql7BttNjgLs3rYJ2XPuAGzfcfNuEtcq0YAuyJ1+T7ox9/4NyCdKJ/NQBBUv5f0uJcgLtDmtD7pbaw3m8rd/fWr8uZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIsKne8vovs3iH2KWShZmB6FwTo3h9hzin1P+XkSwew=;
 b=ffRTUdTbIWDfaxVPQf0lI6/jHiolTZZbkI1nxLidpQull72XgnV9U0cVAV5ZL5FzRMq+RmQeA2krShQ5CJf6qquSjYJiJjjUqxt7KRwFpG1ly7hFae97FukE8TwvU3lbBaYfrpMDWPqUwv9cC2gNtVvrFAaG5yp7qQQb7n5frAqSvsVetaJ1p5t6gHLF1OERU9iCzl6nmvjrE5nh1QMuUfCK9uYT4/iJZXL1Ior9+s+C5Yw7BeT3Qg9DSt2cR2thx3U5IieHS69/4owQvmqqOxsxLhV92pSozpzHqIVf9aFbxuJQa7++L6HjmP+9CW7vO2WJBslj2tFLeb5f1mHPlg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by GVXPR04MB10802.eurprd04.prod.outlook.com (2603:10a6:150:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 03:15:23 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 03:15:23 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@nxp.com,
	daniel.baluta@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/5] dt-bindings: dsp: fsl,dsp: document debug reset control
Date: Wed, 11 Nov 2026 11:18:04 +0800
Message-Id: <20261111031808.570680-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
References: <20261111031808.570680-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0185.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::6) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|GVXPR04MB10802:EE_
X-MS-Office365-Filtering-Correlation-Id: caeea2fd-5bbc-442a-7171-08df3fa20645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|11063799006|261026121527099003|261102123227099003|261021121427099003|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nomZSQRF+DR171uAhn2PfB0c4VvkagtW1g4OHuDM45DzYyISl8LNAcJ+VtAyQK4/+ZEOggW9ENa2ySOpSE3FkZxCAH0GMgBEBL70hWD37NBZ+lZZ7rKd6PaoA3cqeNy91unMhE2fkCYMECWDikc9YyjiZApILlZfWvw0yN5bKbQJwIapk55D1V2DIyWxZwGIjxiIdBlO2eVXGiUL0/OnT0wh1al1iug6RGbzNK1sxCVDK1pGiva64gT3/r1dMb48iQRVPnEmSXj2FDKpwscJMRETnRdvuKM8P3aqZbRvJ5O5rW64nsuiejOi03Hl4MByIo/9qzkVsJrY4Ru40OXWKt/5D+Z09B+/bZflyanFYDSsn8KyMHyMSApEt2hexD3MMg+gb7Nx6DJd8usPwUPUQRX0ZQTyKnTHc8Bq/aeSCu4TuhBeMJbfKgcchNgOeCR8iTB8d270l9SCsQcVoSjTnmYZpdSCqukdhZmHeHiq67rVF6X9QXhOeSCBAuUtInSc/7J6B3zcsTzEVuo55ntMZOY6c11uU2apa4LGQtshx0bbL2mN6YSnnpB7+hoTUlb1sidju5oSpkcIMPdwfnEsbZCHk5o1oyTHBLbUOpYJYCtFdySBXQuEMYop+v55MgpKqgNMCkYsCe9H81/aGtJNCyvrjcpjXpFhRW7MgAO9JDUGaM5S+JLoi7pyyTx+p0Ub3cYCqYzpnTMWy3FidttqSA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(261026121527099003)(261102123227099003)(261021121427099003)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cafFM6uH9h6jmIgyGS8HJYV0qKXwCEFxtQ6+a6Bly7d9XCFTOqU5PVy8On/Y?=
 =?us-ascii?Q?Z8/74LGXO0iWCulJI3DANKG+GRduOO3cuvLPDUaGOrfunhmLYmGiTuAtLOt5?=
 =?us-ascii?Q?LQ7lwLNiGiuhiHDjB34oEUrQeeEIgtuVkZ0c+yWjPJ9CQXoreME8NrTqIaYN?=
 =?us-ascii?Q?vLcTh6AsFR/21/6xFGFK4DWG2eRhwFB4wfK37B/FBndvQVq16Z9eiXkerPSJ?=
 =?us-ascii?Q?Gr/z9edZWS/ZilyEoKX0WYepxSfTKpjwfdkiZU184AKh7ZjqVfUOHlSH/CdY?=
 =?us-ascii?Q?z7juYw1o1uwRxTupZ+b0o8YqNu03ElqHb+WFPiZCW2JzGHg7SiJmqi+JfIUC?=
 =?us-ascii?Q?KlEwqcPRTzikUC+bVfvhrYde66rzl5ZMxKrLZoptXlBhPr9zomRKd2WxlVkd?=
 =?us-ascii?Q?hF65s7lZ4JLX7I6nsW/TjyqHYudcgGIEdSodh++fCLcOh6qpR7wadhcnC7IB?=
 =?us-ascii?Q?pC+t3KHaLfzuqvk15ZPMdpKcv3QmTgMm4y/J7B9DJAPBQXYOGetWOULLYDw/?=
 =?us-ascii?Q?w+oj15FMoIgRjhHX+briXZi4s+9cOWokRBY8rFpN2ZaiUuCVtWb+CXIYxEsE?=
 =?us-ascii?Q?OuKBfs9556LqyF0xkUoXKKksLbEq+qDFGvQx5MdO3Ie+QFIWhEpSx/Z9SvXg?=
 =?us-ascii?Q?cRSmLLR+XjTAPRvIQRMHefzUYVskL0T1DXqz9598ToBQlTpwhUxNom9ewYOh?=
 =?us-ascii?Q?lObfJs725z+arX0TuVTK/KDao8bk6lGdB+nK4KWd3W+2NUKfs8IYjYMURmTh?=
 =?us-ascii?Q?Prpv1SPZLJ/HFZFk1GZ//JG3VQ9KPr2N6LHd+wntCM9jo+jrZ4iovgHOmLU8?=
 =?us-ascii?Q?vuhWb6N+JA/FZ/PRZWl6n5A9k5lws7PnhHBRRlq91ZsGKlGSfn9m8weO9zwf?=
 =?us-ascii?Q?GFubOP7B5RwihN3XQLJZsco8v2jYl9gpTdEZx0IK+3p3R4rp7aJ9Ngjxz3iT?=
 =?us-ascii?Q?5Ztcft9yocCwaFRJZql0G+GFRtC6bulA8JfzDgYi35J6BGL9jaNFw5jUo5xq?=
 =?us-ascii?Q?l73RJbpCilPFB3m2Y2fbBUqFMmu7XMzzS7b5VyfToI9+yphJ/ca6D2Yex9zj?=
 =?us-ascii?Q?Ej8eSWebdg43X3rXCXAbMbCXSx1VPVZu/PwID8jFu2X0/pILuF3cjkq3Thyl?=
 =?us-ascii?Q?IvObd+GFClrV3n9xiwJA54eVf6GpPryKIQxVEyjt926pvRLu9tjoMS/5fhww?=
 =?us-ascii?Q?y1PYDoipVcvlP8KAUKSYIplM30KGMXfXjp6lUhjWD0MmhJwF0egtW/OGAOG6?=
 =?us-ascii?Q?LxIUILrWkh8D/SnQL7mOYW/ONnPpPQuG8KG5LqLOQpoKY5OuvSq5XyP70OwZ?=
 =?us-ascii?Q?9aaNgC+HuB501v2RR+8OKPmX5uwiJvHCjGreZ34aWsIzG+U160APKEKFVNhL?=
 =?us-ascii?Q?lcny9jkUqwAu6nOhXUJ2imG4cb3DoPaKObsLdpH6fhlP2g0r/PUFt6OCR3lv?=
 =?us-ascii?Q?9dScDUpUMTIMX2+uV/GIc325wHJ9MzOLAsn/iIszAXmiY1FFZwLVkqOA4W0Y?=
 =?us-ascii?Q?0btDvjli9f/Ai/ZynCIrUjf80m8UMDInkLtakdf1Khg/gPe0J4ARnqsnOAKw?=
 =?us-ascii?Q?wA8v1+7ge4Z6IYEizithv4AbSQ4YCOksDaMm2qD2X8tyxvRdxeemwSUipPZM?=
 =?us-ascii?Q?Bwq/xWq8ar2BQ87nZnnWTDVTI+vnzNQLfTF7XBnHMz81cC3jUZnCfmDazplk?=
 =?us-ascii?Q?HytUgXuk6wJ0tsEbeH0bpGCWwXlkScW+oIkTW+IvYxp2iyD+x2ZQ5cXQhwDh?=
 =?us-ascii?Q?LUlnmnS6oav9t77b3enNRtv76cc4jzz5Lz3lkcB5fs7/z8sU1ZOh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caeea2fd-5bbc-442a-7171-08df3fa20645
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 03:15:23.3553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GZzOcHRZNJZgIzhIQYUkD7fuPpJkYt2efQ82Rz4SXutBZEiCyWSsHuCk2UtqQCdoM8LaJNOOhErA46WKsyxO+1DhFloGPZ+mKXBo+pAbtH5YfcAVaaejQ1MZmUHmkEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10802

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The HiFi4 DSP provides a separate reset control for its debug logic.
Keep this reset deasserted so that an external debug agent can access
the DSP and perform debug operations.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index e610b7636a08..4a75a271b7fa 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -84,12 +84,14 @@ properties:
 
   resets:
     minItems: 1
+    maxItems: 3
 
   reset-names:
     minItems: 1
     items:
       - const: runstall
       - const: softreset
+      - const: dbgreset
 
   access-controllers:
     maxItems: 1
-- 
2.34.1

