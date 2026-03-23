Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010002.outbound.protection.outlook.com [52.101.84.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DD38B7A1;
	Mon, 23 Mar 2026 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261339; cv=fail; b=Okgttlm4B/AoBLCWMV0riSgdBaGMnnDfmYizghA6B7GVS1ufHuaAmih+lUO88JoPfNXyibywvQgg3cvtOHaGh91gaUP8hSZf4vu2l52Thalwp74Me8mScUIizAnreSgKlRg5L6DjqJV61bEWRj3PrbNhD/w0Z5Jz7ccbO+6aSMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261339; c=relaxed/simple;
	bh=MaoqUMKW8cs31eFea5ohBsOwm53qPOjmb6qlMgma7dY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K4ek8E0RTm25RiPkPUBfY1CQRkEICw3nXT7Qu8FRIKhLPpL+vG3XUAuJOphDK+oSY7WZPKEqnAasYnjKAkTczYQQD1K6ltevRU2hWmnGsZi09PcNBkQknVoV8hfVS2k4ECk61zE1gV90f11kTP+3NwacG2tX+YAjXRTs3PSz1ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oxFhq4Mf; arc=fail smtp.client-ip=52.101.84.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oxFhq4Mf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru/xlAbt6PXX7UGdCV1ZrPy1IkFwet53bHjavYHca3xdNX9J3Qc2/gCEyw9dDHBtSzxqqcnKiU6A0E/jWoAMskGogIRoNcf8ZAUprUfupW/rmMrsEooZnaV5JxcpzpVYlJsZl0XkAooQcs/oXiCWmOiDCQJ/J/UN0sIvbC8eA12hWCw7D/ZL5rLxOlWJMzf3/N+dKF6TndB+1Qch8zghCokTvYuFbN7bWpxKMAdVlTCCSnPKw/rpJ1cxMet35ov7cnlbTkW630y5D/uQ8lP16BzHWKPfaYAuxY/WC0MLRRZ8WJNnT5zX/It69LiJ0OhueQ7AM0G04eWKI3iwrkUGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VtJ9heY46BpZmvRc0rbs33iAZRYd3YFWFzbta8te/I=;
 b=MWUxbyZ0oG1aEDhSnkOm1lNztH+27j2k1DNYEY2gaHHB2pwuLIu1FxNoix493zQGOzYXKJKXfGxKZn9vN+jBHErOytAJc8EkIFQ5q0EfDa/G4/4jZaCcSj80ldaMd7FIlJXPYo+LVXRFpdPoaV1OYo058mI+Qal1lR7pJr2VgpWM2AJQ1LpfFAeMC1XpdHhj0v0ULdCB4N5plQ3Q9NKUM5qmirNt/0537uOWSQ09VsU8WZDIq8BIxttVNo7KGIzIcuM8rM0PDtI0eXRo7XZOcXLvx9KYPzIA4fgc4Z/UHLmYBF0Q1XwHsKZqlpAjT59PgjsI5f1A9NfHNRQCQaXuCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VtJ9heY46BpZmvRc0rbs33iAZRYd3YFWFzbta8te/I=;
 b=oxFhq4MfqAa82JC2Av3sIGeLnoEuWMG7A+YwWdotO2sg5DiBaByAa7RFnYh/T5X4nLekd3QkK4OBaBWCwUzoqn5C/6cJlPRa/Ovh+nLm8Q7GGC6WTleAMooHqz4jqaBsBuORvS3VoA9U+a2W+ieySJt5hI/h9Rzjk3hCO73vAKeGb9uOWVskp+nDaAf8hwk29Aqe5JHot9DZBhvi6sUwWicq3SbHWIJAGq+U+teMk9t9okenLFCf80NQIF0uF7I30f1nz74tFLAw6G0YGcORM5thlcXlP6uUA36FS+MYL0tQf2nVR1dKilf08Vq1MQDIcJDc78IHb6zFvWpaMbTQwQ==
Received: from AS9PR06CA0092.eurprd06.prod.outlook.com (2603:10a6:20b:465::10)
 by DB9PR10MB7244.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 10:22:14 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:465:cafe::94) by AS9PR06CA0092.outlook.office365.com
 (2603:10a6:20b:465::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 10:21:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 10:22:14 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 23 Mar
 2026 11:25:03 +0100
Received: from localhost (10.48.87.74) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Mon, 23 Mar
 2026 11:22:13 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>
Subject: [PATCH] hwspinlock: fix warning from sparse
Date: Mon, 23 Mar 2026 11:22:10 +0100
Message-ID: <20260323102210.228551-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004D:EE_|DB9PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9eea84-0604-4b9f-763d-08de88c60d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	c6k1hIqHlZhG1LbKe2oQMSP5Gkjq18wNOLrEhzoplSAizJ+QJklHLFJauMG6g1eFE75ncL3V0XZTmw4rKKHhlIFBuckVW38nB6yW9YPdG7dd907H6+YlLwoSGz/AQ2seIKp/BosZLW7Mls5e3L3nJe9m2uJaDYygA8l+6m2hS5DQJmSLJiVUxiH5y5l010EkLhc1d1M7oCsoIvisoJ0tIDiB7cEKvNPQzic6anU8Xm0faOVTDzgRet1NtLLmRYikpJ93DPuAgvkGMso24VIMr5V9qlwQ9CNBZuJ5YhaeYkwXDjGuLxc36IEwkz/A0PCzLDGvNHKrJhDFLUTWAx26pFrU9xVxeAFyjl1QGfuUBQOKoxd480XGSo2XBiyTkOJO/naN4lSYJZpoCCCwr8Dy3JGgOp1h2KmvOaaed4HGL4CgiYf3q4W3NNtQfqfmWkpNTRdei3M/bxocqgqSYPJIjtrFHMiUxnXT0bUDKdcbbcVK7C+rWzFLFKFifNlkT6B05Kv2JcmLhJQN4YYWIixHKCHx3FqwJUBAWS5vkH1AH0ah+kG0TEhlLfEJ1/qk8YNdn2byBmkWNpeyLJuPg/hivgCwJYJfxu7jyvQOVuLGNYk1vPeg99lOcvNL0uXFgTKD8IpZ/ScRL9s2kPIoD8T6fEAYPQg9s3LKGZIUt+NC4+yeLDHFvbjTP6NG438o+C57vGYLltUsN+uEGUp/E7OYNt4Q68r9PTYc/HVDOadzoldtxvsd2zk+WRvR0VnOIwt+qpyxtz1y5sJ7jwYT7Hul8A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mENLEAkvBmDalAYT1b//UyixBoSDuenQTlePiV/8XZxZhX7sN/guhL3vq6b+EUEGbesuZFLsjhQ31poGqI5BxKAhSZPBXhdHv3eTnj3el1YfSK75TDjw5E2ETy+UtPXB6/VqwCGmzYlZFy0QwcLG5h2wpluUazqkuJh995YX8e3BpcnmQFpsDgzvedYdHeqY+T1iQux0hq7BEHrjWk4ikOGj47aR1i8fcNO+doUSdL71L7ipKbFkJDzyF/zhII24cXOzfmekPKWnS2BdUNRSoWnjZZy4g/DegmqaoH+Q5oHpFrNZMKBroCIeV6fmyMeBXlbrdT9i035GEc6GXHNi+2oq8yVFd/julOO25uPKwwFR8oLvu8R97L8bYpffbBz0cJp68XGDWwiU0C8UjMqbV3AWnG8W5zw5PtDt0J3XpTOYec8O6vhZ5XMMSjK6DWML
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:22:14.0680
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9eea84-0604-4b9f-763d-08de88c60d50
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7244

Sparse triggers the following warnings:

drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:393:48: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:393:48:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:393:48:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:397:30:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:397:30:    got void [noderef] __rcu **
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in argument 1 (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void [noderef] __rcu **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9: warning: incorrect type in assignment (different address spaces)
drivers/hwspinlock/hwspinlock_core.c:392:9:    expected void **slot
drivers/hwspinlock/hwspinlock_core.c:392:9:    got void [noderef] __rcu **

all linked to the same missing '__rcu' at declaration of 'slot'.

Fix it!

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/hwspinlock/hwspinlock_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a67727..50a875b2353f8 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -372,7 +372,7 @@ int of_hwspin_lock_get_id(struct device_node *np, int index)
 	struct of_phandle_args args;
 	struct hwspinlock *hwlock;
 	struct radix_tree_iter iter;
-	void **slot;
+	void __rcu **slot;
 	int id;
 	int ret;
 

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.34.1

