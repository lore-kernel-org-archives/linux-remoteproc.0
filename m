Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E51296BD6;
	Sat, 14 Mar 2026 17:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507724; cv=fail; b=OOP7kga/gktNeZkiGf+WrYCPrgk1PcfW93wMqh/C0t2MuSg6Q4J+FkY6NKaAEGwqovENA43+eOUgrtEUCvU0a8RDDTawN5RTp2U1+wZa8xrxr1oAEX3KBjvKJeB0QiHwk84muljXwbDqfs+vPNLr3RhFQ6VIo//aUn7wwHgBbXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507724; c=relaxed/simple;
	bh=nKJKctPqXcGZz+o+ME5hJEVe+jRvntkuSZYfuC+8zW8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DsTTtLJralMwWqBoQYD6IDz/s6v0vdZ/MGDXYfnbceiK3x4f4hAngLnHvLUUnrukor/Xy9DvPe79bfIxDhpaDVSMdgIOBX4y5M7LxxbSw34znZ2ilrOTgaAWBuMJeq9A/2OFvnAbN97MiWBhkQ7Eej0UO+821JzROn41qxOrS5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RSW1M9Au; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RSW1M9Au"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xz5lZZ55QqrcPoZ7gXBRLd++QXruE03NmKbYSt9Ncet0u3YvjpZVtO3CZ8d0WAY07TC3H0T4JrJTBR8vnIeBdZl/81r8hi/fMeg016jwB/v7RtRFfLZJ40t8ucntX36fp9hmHTDeuql/kqsdrVYFn42PxHSl3zWBfZo64vX5CZitXQ6fTtoIKofrHTBdRdUFCtRnwgkVUjIa0AdlZTESkaeqvxgwp0k6KUg6lgPU8YjtRBWMNQgT3glCg6pQMAy5CF+0AlyP3pHe4XVWjtS6i18BZ/qtXp8F92UGbXqVbsKBSV4q0zgwVwb5W5gljTO2jBKcZuf/yFEwqIYD8eLy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3cHtxDMxizvF8Rt0l8cvDDuYEqMvByNIz9WMEHOOA0=;
 b=l5DD1MrjLp99owOqzh9l3DbcmKZeDYFkWGbjVwGH7P6H0J2bMNyhhVPql85BzfC7E2d/vUBdoUZmY4LEqGAuHTJ6agBzlPBPEOxaIp7aNh0+2hnpZufDUL9WefWkkrKR6mBsImK1W09H9T8fj6hOTQkcewStJzutWhB/92IhSa7ueTleOXS6UC2ZbXs22ANTu9zDGisrdIkyvcP41ZCeFOz11wCS4/lOIjRYOcXO7X6OljkNyz+aH+gyfldYzEaYlpMBe2kuWMAVFKY2YFUB9zrrKfpLwpyxNbCK2nX6odEUroKxjypZbUow/g3IvfMJtGy1As4tGe7ihuFgaw725g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3cHtxDMxizvF8Rt0l8cvDDuYEqMvByNIz9WMEHOOA0=;
 b=RSW1M9AuTK3HS77XKcsy8secASwUnRsycv1NObJtJAVFOPpuyivWsylFSGGYoQovsNDpBiU56fJuUU1ulVfyqlNOkopao3TsxNZgjuVmwc81lVWJbXdF67qA53qT0afBYFS6MroMn6olbKgRba6nDCDJsNxspkJ8phgksMZ+Fw/a757QcWCOufj4H8Cp+1ggX0awkEwp+sj7G62kic+XFvGuZNQvX4gb5tDqtmLeG2J3XJHORTkplFgbmDMKxojIY5aNrqOzvwqJOtUJyCmIO83s/OChBdJtxoFMmKuUFMIMGHDeSCaOK+Y7uRNi8f+ww2kKZvBAlHBd1H3jUDVE9Q==
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by GV1PR10MB8660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 17:01:56 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::a3) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.21 via Frontend Transport; Sat,
 14 Mar 2026 17:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 17:01:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sat, 14 Mar
 2026 18:04:12 +0100
Received: from localhost (10.252.24.255) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Sat, 14 Mar
 2026 18:01:54 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-remoteproc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] MAINTAINERS: Update remoteproc repo url for hwspinlock
Date: Sat, 14 Mar 2026 18:01:51 +0100
Message-ID: <20260314170151.18319-1-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|GV1PR10MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: d00312d4-3edd-4dcd-e4de-08de81eb65c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|7053199007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XXetjihql6EcYHgXtqMcAoaELj/Pg2xHMrtJhAC6ftzwyNZVUXgpnK3TwsViVnEaPqP8+tNkAQ7Ur1R97kPCL+KdwzYYeYbnxe8d+jSQqHVARcMDhWVZmn6lgujUaJBHifImVYIAtLi4kS8AiK2G8TnsGKG42lt86Go2WnId8PYTYfmppDa167YYfUtWFdR/u8EZI3dOts5/DPt4Je6qjUBe+kmMipqpcnqS4zR8NQ7H41SCktiP0aJCHGLABruWpVMyvZziyYM7+INechSZjHC4VJTP5miQpbpI2VBbYUm6t9tELlE0kDP1pjTJfbnhLxLhWfdG29qlA31rHWAH+EtBj7RxAOti6iiE7wh2tISWjh2qlTGKhN4Wif3sVqdNBN8Y/NI13IxHtH7zTVAekRmk/8DhsXQ67sgy1n8zC9+A9DPnvXTXxOJPwbdqCDH0f3+tPgj25AAkwosdDmZSLJ/EEgnp/yLdzaxxi3WMqjBdUGBFzLaQO/OxM8dthSre0umiKdq9oPtXhkgtKXEuyYbvmz/q7FAv9NCsZfaA8+FmSTUKVvKpnxLWynLo1sQa5uu82uwPZbQoYhbLSBRae+bVUHszWHSuU5YMt/etbtGf+l0SxAmEDIIDyBbd0yW+j0Vz7q8MX/Hh0eYt8Ecx2kuF2yro9phpzypjS/nq4nL3Y9Ng8gwtOWM2cT5izLDwsPXlTwWQH4qAg/bE7XDWTg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(7053199007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZPBniuvYp61282OcwketbgaUZ4cWkcu2Wf9NDEeOJ9Q3ZdVV4olhxNQHBqtsX0jxJDhqKO+3wx3DY2UJo/Zr0g6x9DIHM3CdjNJwEnE6wttWbbL8/AoQYzD4OG4BobWf5+tck1zBuV+Ptq1G6aUD6qKTfQ74+3oRPtMYecx2F+UqqGWs1BXfUWGONZuVFl9ZtvRM6Wc/6vFNLypnIm3ci+6QWulnkStyYpjU/E77jIw4hFrvOsO8z5pZjXbW4ECMNzRL93fEK7/1DCDhbJHSkcch0Imh+YvOqxecgNgVsj9E9ZyhB+6qSu6S5k02Uoy6OaUzQgc/3rZR/7dlYMgkhYzMVy27VdzYpKrgbDEIGKZiQ4iTh7vwhHGgcxVsauRySAZjk4BVV+vlCFfNAfKXOuzXLP2BFDiXSxshie1YIvlLRb6J4e+g3+/MM3dXwiBY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 17:01:55.6978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d00312d4-3edd-4dcd-e4de-08de81eb65c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8660

Since 2021, the remoteproc repo is not hosted anymore in Bjorn's
personal namespace, but commit cc73f503f7ec ("MAINTAINERS: Update
remoteproc repo url") only updated the url for remoteproc and
rpmsg in MAINTAINERS file.
The old repository is still accessible, but it's not updated since
2021 and is not anymore listed in https://git.kernel.org/ .

Update the url for hwspinlock too.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a54..4afb4a62589e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11213,7 +11213,7 @@ M:	Bjorn Andersson <andersson@kernel.org>
 R:	Baolin Wang <baolin.wang7@gmail.com>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hwspinlock-next
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git hwspinlock-next
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.34.1

