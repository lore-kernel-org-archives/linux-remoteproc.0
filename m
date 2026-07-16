Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013055.outbound.protection.outlook.com [52.101.127.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BA41F5FE;
	Thu, 16 Jul 2026 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784207389; cv=fail; b=Xp8hH4xCyicIeMdI+P+w18P4Yse0551O7ndR0rtBLr/M0llVYTu2qHlWeUwwgzAA1qaqq5PsqHgMMwKnfiW0SZPqnkrVP8X0j84/GF9DcmFR5KVXXkDInMJc5RC6Em7OoQjJlWifrOuPWUeP5/PPY+Xp73WK1ZdY86f01aACTp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784207389; c=relaxed/simple;
	bh=1ELF5TFTUX04dnh2pyF9pTdaj3GqBR+akKYoHt68UbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q8T4tOzvcI0VtENxkksSXvbGKvEk3AVe0B91UnUSe0wDP4fb1N+PO8AhG9DIPi7skH/DCZaZT/Kv57LaLFBTewuIWG9fKq2gpCDgGiI4BEUKCa0bXOJWXz855T5Y63T8FjE0nhYVPvvBL+82GLdzssMkrV7rZ6DY8Jrr/ZaeJxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LMRQO87p; arc=fail smtp.client-ip=52.101.127.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LMRQO87p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ5pkXJE/5jLt6Xt6Ck326BKG9SFE5lVUY7ecr76gG15ZFKKnc9YtyFvjs0RikT9qp0VDkojyLyo5xJVAxCvxqHD5A2+40M1+cnwfUl5UV/VyRIU6x8L6li/aFDbTVkcAT3ekmKGZcqZVx/BTkuQul2UJ8/IUlHWOpw0eMBnggxGoEty0XON+w8O828rLs74qE8s6qsnystgMCCnhAdvPbZhcAE1tC0GErPNMC+dNXO6W9FBUL7fMbf9HZzkwrL/zXYlRuzQP2b6HtRgeJadcpDpzGQR047xPZdsbq5NMk6A2x04u6DIOSIW6ShwMfwBhfCNNwkv9VIsn9SnLqUBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xf6n6ByRM3XHz8Ho+XC6M00j7+R0ttyHFOR5jS5J8fs=;
 b=kU2L5c4FZG9KrCbgxsVE3tv2pgaHt/Jg6TO898FjPaRHAYiVitUxh6xwyyLuCfHR+VTALvkBIafump8yeH5XAfSq8tMfXKiKQYKQO8bz3luVqKmIZapRf9jXtWdqtz6gZAuN1Z+7vAr9rc0fvfoVt6tqu+D5HPlmEskix7khNX6m0Pq/Vn+LSy651neg4SCzEP+1EplvvbrXdsKwRqZ01t01Vosz4fg9pmQYB0cGFYNvywDVNm0xXkWuajlMeNKvQUJiIm1eX74NA+j3jrhPFNhptUbponRUajrRnJOENYCqmQGUlmTB+oH9QsDBhJZ0Q1M019NW34UEECRqeITpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xf6n6ByRM3XHz8Ho+XC6M00j7+R0ttyHFOR5jS5J8fs=;
 b=LMRQO87pa5mCWKx/ycPwRZk+1p/GR9xIfOck5UZYtYoy9WWjCJrzgdHmvncDpxOeQlEHgwWT9qzQYmhSAHxcSookiVDFkMOSuhg8E99FhlcmOY5aSfWa1ceGGER9L2i2JoI5e9m9C33GQGyLImiu7tjSWLjVGzziJRk7Xf0hi+8MoVpKU8m7qztInn4lWhGKZMhpNCZ6JvWWifrYtQvNTS5O1yE3R0p0xhiN74C10WZ8eezDYsaSg4jjMMOfwLOgI6VSfIJbWruWq3bnHwc+GhxlYRmkawGOvmsgO7CxUhHWnp+5CHczAOCkbEGJ1IK4OgrNiKWTNZYnc2mq8rs0Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SEZPR06MB8885.apcprd06.prod.outlook.com (2603:1096:101:339::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 13:09:40 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:09:40 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/2] rpmsg: smd: Remove redundant dev_err()
Date: Thu, 16 Jul 2026 21:08:30 +0800
Message-Id: <20260716130830.519740-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716130830.519740-1-panchuang@vivo.com>
References: <20260716130830.519740-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SEZPR06MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: dada3b88-8868-4fb3-10c0-08dee33b7ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|11063799006|6133799003|56012099006|18002099003|22082099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	kjrH+Mk7C9eOrOExIiZNGWdTuGiA620RG3KOGFMjTIE2BNrsyF1RXalv5ExTDh6+I68IowB/Izk4mx5bS4ExYE4Vt4LV1RDdXF7xKDKRNr/ZV9gbcU7sTE0pv0szE18evbKXdXoKioOXFCJkcLru8eZ6Tgn2rQoBf2qFdOgA4AM4S8YEYc2OQFgNzN7ZPm2FagdRj9yc/6sXXrlV4XsjBX+GBOG3W5g2PrwolORKzXvThODXUe9pwKTS2nGFbVtCGB2jr1GctNSnKdYMdbwPnJZKuJhJ+X/X854MqwzaE7hXex0f1nJHexueWfBNJPs2G8tc1u1SKAfehEbmBP6TzaDkrBOZRNqfjWZQgFAvVFTS+7NyutXvDa2iBA6fXhiiWrhhApCmBJ+0Il542Xj4PDGH8Mez4ZtPQCeMbLn5x+CMXEJy+SOMACuyb+ljotDG9lVbPrdWd0B2AtaQM9P6ikQyWj6Ea4/cALDnsrU0HeHQICjjMuxMEljmYlfOiEgjHJWrFqr1KDzFwUhYYYg2Ebnsdzc0myxO1L+Ds7yVYmS1oaq2BGoQhqTWgfyhuuYOObpcB+uFa21Natgi2U2JogtmV9DN3A3Nb7Gr0Lp/8Hl1h7rgVYBuKdz50GKwY3xA23UthlfwS+0htDViRLog9mieEp8C+j7newFNXF+VonNrgsc9TTP8y9eyjAR7C6kqoT7RRJ+c49YHMGFXj5Ws5pv4Mysen/leqFsxh/i1UfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0Z4EqhLLSffcPMPrdJ0pzjpFk2OLhxUM03w/Fcv43VGek4Ejk9tqqoPqaqBH?=
 =?us-ascii?Q?AtuF1ybdnqcfe9OJIaRfm6yk9vgK4x7MPvIaeIkPFXGb/nSnw6fYdA/v+Q6C?=
 =?us-ascii?Q?XK2GFM26hnC44f4jtM4XRG5GXmnbOlrEBYspkL7NHhii4a2f9KGQdnuhLJ5s?=
 =?us-ascii?Q?f96s2cd2HsgskOd59OLvh4MwcM58tEqpKWzuj0y4lkH/8s3LSFSNiJmiz5Ou?=
 =?us-ascii?Q?TeUriaHc/02nqdd/D0fgdeYm2ZGpMFoMMlSZ6ogd45BYVcGbyFzTe/H5UTRq?=
 =?us-ascii?Q?C56pYE4XOpE4dkzwRxMY0IRsHpmsCpDsBJG8rfNcDnMl4c9ufMIifyCNdmbI?=
 =?us-ascii?Q?oAZnT6mxWhwlYAGKiGCVFp6j7nKG2f2C/mgOQRU+OQFTmUrLgZ/JjZc9qOLS?=
 =?us-ascii?Q?I3dWUiXnRLFRz7iD89UfXWEIG+B/cptWqp5ImD9WfLm2YMm45njdrNQNJV/h?=
 =?us-ascii?Q?M8ngxtuEVpYWU2Y9SqESAzFPLweu7P7aHrgGG+bohahQBG0flLtMxYsbq4cj?=
 =?us-ascii?Q?BhM5g8OgF62aLHXm1fPlXySGM69PW+Os67gDZdbdr4IsEVYsrh39bxu+Fz7w?=
 =?us-ascii?Q?WFRCuLAfhClOheEfBZDzAlyEpTLiX1dLccqZzBmxI5ZZt+Aj7+/tHT8jsrDs?=
 =?us-ascii?Q?QSMnlf4jqWWBSFhdpSEaBo4lPCKpA9139xGBXWjggD96HM7SSNbK24NB1IjP?=
 =?us-ascii?Q?WS/nbiI3fGT9bXz7Hp4aYIr0vgeiI286wqKGTqE9cBYU0RMuyDQjwpE0ZymE?=
 =?us-ascii?Q?AUpX4nQt3r5VNl+EyjZMPqufkx/xd3BLcti1gP3Vr/Zy8QPKJpDiw/ipE251?=
 =?us-ascii?Q?kRo0ml8syaKcsUzj/KX2/YHLdvWmxh9G2DWZfBSMrjQsI4dKttf+ZZ/Cq+iV?=
 =?us-ascii?Q?FtQzK/m8Bo3/9p+ME8CXbxStuykfJWfQWqvpiqs6Q8I5T+cqhfAoAOq7AJSa?=
 =?us-ascii?Q?PqbKCCH8trYRuH+P2RH1Uct46x6lKqZv9qfhLpIaG/z6HaRS5W5cFDYIv9ke?=
 =?us-ascii?Q?vG6OJPLrx5gjXWvz3nL7lgBL2C5fR1Dnp8Bst483ZwoAv4/PKaqi+pQJfac9?=
 =?us-ascii?Q?/SWIIth+i5D1fzW1hi+vYdOHnq1qKqjGMxKBZQkez1RjiTw2XwbErPHgmqdR?=
 =?us-ascii?Q?AMIagBQVjTCicA35d5qvxw92le/hJWs5/pgXPRy72/cvGNrW3LcRAfx8TiPG?=
 =?us-ascii?Q?4LWBDB7mTWg0BQPtopjxiXuDq70YDP+7jkNoLe3+UFVMs6ees71UFZQowa2T?=
 =?us-ascii?Q?6sHpRzTrV38QKTbcfRBjePzym5D4FDmbhqoELcfBNZ84nPmj5CnWAmRf5Vih?=
 =?us-ascii?Q?BfasglprYRG9E8KeL8g6Tb/O5iaWuT3Zj2spDNJmfgcAnDKhvIO/jOn2aluq?=
 =?us-ascii?Q?QdeEttoxbHsdoGx+bQTqXkcdLA1rOca5mjnlXIpccHrQ1fAKtMPyLqzlHCm4?=
 =?us-ascii?Q?aCrcwx1aR+neI4gdGyYLs47ThvFJpd04GWQJJzJG7nd5vrNGba7s16LMgBHP?=
 =?us-ascii?Q?r+x5oZ2aQvQ+KwGdsRAOMpsLyfsp8DFVKPN0PdUFcafvZ8ymaWkHz17w+XW4?=
 =?us-ascii?Q?Mv3DKFr7PhXlBLtJ/ddH7AMoEjSaZNIoEiUoYAZt9/I+sA5tPFetGMnF3jwY?=
 =?us-ascii?Q?2Fge3+1b/EVb/dsr5e1Gm/Vb5GCyqdbjIZIqUirWRP81Xk92kAtD0qW0b+Ev?=
 =?us-ascii?Q?tx3b+IOH4ycYzY2g3mZ7zjKXSAJNZybuXidskZmHrcCww+vZkrldFgRXBFwR?=
 =?us-ascii?Q?sfOsH1XLDQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dada3b88-8868-4fb3-10c0-08dee33b7ec9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:09:40.4852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjZLYh5JWFJjtMmd5z9X3H8FoFjvzkv4Uj3nkU7jRkttWuPHt3K/zU3NtRXz60xJnxxzvueqRpQ/la3tfwWgjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8885

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/rpmsg/qcom_smd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..9a300eea190e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1421,10 +1421,8 @@ static int qcom_smd_parse_edge(struct device *dev,
 	ret = devm_request_irq(dev, irq,
 			       qcom_smd_edge_intr, IRQF_TRIGGER_RISING,
 			       node->name, edge);
-	if (ret) {
-		dev_err(dev, "failed to request smd irq\n");
+	if (ret)
 		goto put_node;
-	}
 
 	edge->irq = irq;
 
-- 
2.34.1

