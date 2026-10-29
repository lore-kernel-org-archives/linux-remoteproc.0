Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793259065;
	b=lSSR4oNwVkTQjpDkddFKxxaGhmLs8GLzcz4W42e75Xozhx3h9D4DRbDk0Q5HCWAvRd/a
	 ZsbTg26nEuLACuIVJkZWxxWgreRkz6YuMXnyRrSzNbUt5ypAUg7VsNh3Bt88NdDzbLbZG
	 kRo9eJImDzthyuzF2Z55xjcWeHWuKEZKez95nPuKqrL4l6thvKAjlkjs8W/XbS89Yv37+
	 rjR7MN167BZNg/EGGkRvXJqxcaeQfdFFyOYl+3ERGdXFA/rMa7XjkfH1wF4/qCxjG26r3
	 S+kq4Zp/5CZ5fzRgPrXGzMxR9N/VI23g/LQP7KBo/XSeyYd/azD4V/ug+pN2B0ssQMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259065;
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
	bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=;
	b=4HfOAvylskvY1GdrJfOAWhG0eClimULhaZqfPURp3by/p3KvF4UL889QKgRf4eozrIU7
	 bc1CGpWOZS6kLvVijIFl/gOfRj82NI0WmNslogqfIwyAE1OLVGkXXWgPnZcO6a8UjHwH5
	 FrAatuLnEXAHK9lHBTb2MdiQz2I+/CHJVXZKcXg53hRMaeOCDjzllaiV5gGD+9RBKb21E
	 IiNTw6Uf8f3B8SPZ8BwnLSEMToTpjzEnfDaPNb8rijX0HvgiYSxEfemXrLWD8GqoOVtY/
	 9zr9pzP4IeDQ/Bm7wtQvHWL7Jw10keE84omNriljQoaGCe3i7+KkikvaPP81DOdbfNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Y9+SLxzv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.27
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013027.outbound.protection.outlook.com [40.107.162.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D78606A32D;
	Thu, 29 Oct 2026 07:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D78606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Y9+SLxzv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oy9IUie840tfweQ83rVC6FTG7aGesL0OVxjzW4w55gm0JCp7rDWue6IcyVh7MLHrTbd0RmafkM7CrBN/5HMXMLCsYoADFJQkQRvzpjBS3u9+CJUqOfkWoIRwvMKDiBxmbHRbZv5H0EhLI9y/BkxJ7SOQbpQq7IvyF6f3Qa5puZX4bbTOVOaEfCSwmb6I+Si7AHINBSHPiMzpfHKC8zkCPza9FsvfrGy0K+eOp/4Ckx5us7TurhTpzaRRo8ntISiOd/K9h0uzdszWoJHYQKlCQvqnKrILyMuiiPIgKrSh0fGkKgq9k+uxRli2zOh4A4uEvcIl6wC1tbmVdY3lf77Hcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=;
 b=VSpc2WkBeMV2I4PbsTP5slkadCKdCpSpJZeRFpeBr9bJf1BTm6PUHwFXKQ11gyDP6GYNupTOEbiRGKCJBA4XGGJkbYJARPAo7EOLvTL2yp5TMOtg4NDjlGf9BA21LB92Y1LpBAFgaz8YCJl4sEm2bAGYaaY7sfJMCFAwqYaxDJlieZLY71YuQobFl47G48RqNP3TNRFwQvDpnJihBuTfV50eLv/iIQxmXp7jsC5gqNQhCuapwHSS+XD8HQYFNAZz9QHSHgxjcpwRWTCHwidJ7MPBLXHlA9ozux1lk12AQYNvjWDhNWknA/O+0bw4zMpkae0uNXPrDyGKx0Qzn5Jnkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfdLt1KS7ylWnzDuifdYyS/a8uqWpl7D00iPO+bCULA=;
 b=Y9+SLxzvzB4HU63fQOZcHabU+qzHgWqyFUPVSe42YZ4iFagICSm//MtOWfAznDSsIW0ewcRxcDCIIhvSzTa6H/Km3akdwcFrASrJQ9fzPIeF4SzcW/TBtdsuhAhKqLpNGQq7MlxG75v+I6+wWeUY0pjjntA3nQrTb3DtKDYn3glqSWxtvQCqpwIEKb1R4xYlFp8w6zy5kisSFq/2dtvnzEjGXJwQzZMbKsHXuR9GMsj+yjlZi7VuMCd+PrHmnlfyk0tZFG8ZCET+4EDN8PzAZd6DJkgHZQwWX8BCqVABtuNk/lZeD5PlbmaN9UoanBcgaYAv4/2QLnd/MkqrWcqU4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AMBPR04MB639722.eurprd04.prod.outlook.com (2603:10a6:20b:789::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 07:31:02 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 07:31:02 +0000
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
Subject: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
Date: Thu, 29 Oct 2026 15:32:54 +0800
Message-Id: <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To PAXPR04MB9351.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AMBPR04MB639722:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0ffad1-5da6-49dc-9729-08df358e958c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|7416014|22082099003|18002099003|921020|56012099006|11063799006|10067099003|261021121427099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	soovBmzA4J8M+NCIgugVpgsTklzHV3KqnsG6vD1MR0UQM9u8L4MtTip8cXMNj3i1dtQCVf0OF33+iqeei/S7Lqa+qx/46In5ddLu+OrdE1pVYpGmLCmzPKQQ72jAq8BxI18Kj2YTE+BlU8orWPAXfx4ks+kTWbVl/3rzxhQlxZtqkYXZeloQGUfgM6RHcwhs581Gldmaxa1a3sQ4TxWNXELPMcM9GS7OeLTNdlLJsGroPFuMTZmlFgzHwEw0XQCxJ83YvWco4iCJfb4YJGwF9vjLwg4NhYFM+9rnKCSt5vMoJ2G92lrRFR+vzMlPPcMZB8xBuokIUeqw7orD6ZtauNICQ2VxDvZuImPSkzuu9TuaQdtwY2+JhYclQISNbcPyIJPk0O2v2JwCN91iu+Xnlo2nYakbKCzzGZzdoxzXN3EuAHDwGPQC6Tbv83kUEuSXL4PSf67Uag7KVVjI2YS+uwtbqPuSlLSOi6DjNu+QQdCrLDfKECORJamfYsuvpFOP6LwLVvMmestuMUDXb8uveFNy2TQwLQLNnoquc8wJZwsA9HqdUrPH71hhLYj0R41ARa8wUiG6CjFEy4RftJUZXEAufiTvxWeRfM2n+Z5bUyvPUjStZUL0WgNVaXZLBlYpj9fotv+VE4QgoP1lGEJkSx8fRbJb2wr/zLgc1PzSj2UajmI6il+KwD92gW6C6pDWl3UupmGguJZJ/lhMcsdvJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(7416014)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(10067099003)(261021121427099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tRt3wg5U/oFqvqGbCRZFxom14sWbLcpbu+X0RWAEqX+2GuArbF56p3FVdRY6?=
 =?us-ascii?Q?ISS3m/JNmwxihPV51nfY34G4o5HXbdOhpoJKMcX+1C6iqxtWsvV6Hrh0Qi/L?=
 =?us-ascii?Q?D9G8qpAriPXf4igVFv8xFGEBcwb6KQ7lACKAj5OUMec6a95/ZEwPWahnJ+2J?=
 =?us-ascii?Q?K8a+5gaG2OhKKWQsGrmuNpG6pmaK1bRI7wj78rbkwh6vEhKXttf9dBKQQmKq?=
 =?us-ascii?Q?CDEqmMNYY850n+uVfEm+uMI/QCCtRKkpNB7D9C451BQhonoA7EWQFrvDmuJ+?=
 =?us-ascii?Q?cEXquE1NH8To33/RELaIE+aChRXi8YHyTcoQM09nZDGTqUs+5YvPV9pCN2lk?=
 =?us-ascii?Q?4iZmhkgNAsvS8wqgzpKVNrKkHJc5WVswvHCZ3BYKcdULQFRyBs6NBOvwAAQ2?=
 =?us-ascii?Q?VM+RWoM+RW5JJYG3+Irlb58Dd++TK5tDMHpg0KThvg6fXnByd+Cisn0FeDa+?=
 =?us-ascii?Q?U6+IKU9Acwkw9/swLa8vKQvnH0H5BxivPCacR2bNRoLQpjPP2Z6zZ6pQHEf7?=
 =?us-ascii?Q?yXttn81yXpwVMOw12imwTtyaPseZS2Vhl8Hd+Z3RX88CTtD7ri352EmrDLnI?=
 =?us-ascii?Q?ICJh5c00Bh+wI8BsKqYp6+mzJFn9RrQhKi9LUmP5jY5dRwgp5fN44KTzR1am?=
 =?us-ascii?Q?ZXrozStqEYZaVAlOGrC+kvkV2heYPnJiU78DKrEMyn2yq1RqmVSvy8T3ZMWL?=
 =?us-ascii?Q?8TJf3Z3MY3QnJ9IqAnve/o6JuqtxzPe3NCeH1XCn2bEddVnFwR/YNQ7QABQ5?=
 =?us-ascii?Q?R73gt92Abmd8z2t2FBUTUvChuWHx5kHPNw5I7E/7qNNDiPxtNW+YZy+F+q/K?=
 =?us-ascii?Q?8Xi+t4/jhrW0WTIudqDfPV/D9zhHMHn/A51As1O3oedJJyaUORdzykoPAPS2?=
 =?us-ascii?Q?ZAr9ZhOocL2S6iMrfU9A0Yk+oOOjFBmh+GN3eNrxvpoBQP6yINbJO1cRRLED?=
 =?us-ascii?Q?RTswpKEDl30vvQ/9m+1sUr2Du1i7StXD2+EQc0xdLG9mK2jr9TO3GTXvztbn?=
 =?us-ascii?Q?4j4MpSR5GzzuQZOmzZ4MWexrUl8P6iJ9NYproXeYHvf2s0hUacKAhiQ/b9/x?=
 =?us-ascii?Q?jTiqH1/mmLUKvsUxnzYVdPbmuZKD9hmh5rymcn1cwD1l6gie+u0LAbBqDta2?=
 =?us-ascii?Q?gl5WAWrTswxzDdYlWDZaujuDot3EjUr/yRBgJuU2zDStBzO+SMsasV8L9iSK?=
 =?us-ascii?Q?3CIKIsacUY5ASMdSQa2SvFaHnuumGrJTEau4R5JnSMnWc5urBgqSNMBOXO+/?=
 =?us-ascii?Q?j6zl6+TyxUugUkkdaHnqhP/iFhnyGFtSrAukGpRn5YgFY+keekjMSPpGTXF5?=
 =?us-ascii?Q?F8wZ/U0Ew2PPNyBivz+qjmUEWEngtzxrV+SwWUl3FfGKWu+YmHjJiUn18fCJ?=
 =?us-ascii?Q?Nl2/JSlgCBtmcugfoKgdhFRYSxqxzyB3ZMQovE0jGtIkvsF4PJDIA5ZjZuif?=
 =?us-ascii?Q?VfcgFIGMXRuFpITpVub6r1g7S6CekZ1GQDW5JZI2JvpxXKhtAegfBZiHCEOx?=
 =?us-ascii?Q?hZa92d/DrHxEK0nkfrAW3++owmHcXlzf7kHJj9E+QEzeFS2Cgfg2TKCbrza5?=
 =?us-ascii?Q?vaSzfQ1GoDdYj1OaNW0LUG5JinYjmlXBZKdUMb4mtW38MwPQnQ5hCvnNljzi?=
 =?us-ascii?Q?0R2eVmtld8i1hwC8igB0A7yVAyoFDLM/Raxp7FgiV5tFRky/N1GGpujOq3W1?=
 =?us-ascii?Q?OKbO1aipBkS/vRk7KJFFAWplzjIP+zF4+JuELjSo+K3lgOgJY5RN0FyVjP1n?=
 =?us-ascii?Q?7JDghtmwfawBzkd3yEbF7T6iFTP+uOINc1bNHG5HWMTnmcRLiJ2Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0ffad1-5da6-49dc-9729-08df358e958c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 07:31:02.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPZgiIqdxu8P4QFMgCXaQpfgvNPiUMhAH+HULGXEtzLFOo44nJemV5jb+ShRJ9avnBxTVNi/qb6Zlh3Y8YyGvC3dIDjY0msWy+qayoRPOxndA0dUoaz14ZOvuOXzF5p+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB639722

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The HIFI4 DSP provides an additional debug reset control that can be
used by the debug interface.  This patch adds the `dbgreset` entry to
the `reset-names` property and expands the `resets` array to allow up to
three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.

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

