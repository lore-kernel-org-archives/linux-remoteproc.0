Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA1722332E;
	Sat, 14 Mar 2026 17:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507714; cv=fail; b=fElK5N6JzNit0ITWnoXpg75aC6R7ay3IpmJ3SdBdEi16hLEQzBYg2xCvndpKBGkz03Mc3JyNCx+v6qHQUiwqkbz5SflyRtS5YGTQNqcLmJL+vgO7oI4iocc6XrpcWWdxY2hfQtOcSbCNBUpOTIez8nLfm2HmAdXQttpyitjEBPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507714; c=relaxed/simple;
	bh=8uefLRsFKONlZon8+8dxmPyRWfMqJ0N74WZNU1jPlv8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EqbvJ5dIIcyx8gFMgMTV7lKzm4nMHujUV9bFkjMh3tnUdGaa2Q59nii3xQCTIG4zVafL51ZFrUgF9515ed6tCHCxcEhzGHxXsMNaRtqUjl1qV85ivU/MJJN0LhtBdEYgwLbsiaz7+q3JWTmwKjMD2qEU03chRZfqEcaniald+Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lhdrI/ck; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lhdrI/ck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dam1BacrLcWzXafcTBM+nWfAQwMOXcktStylRE5GIGlF3NuNCBXMhS/Ctap7O48uPfIinsRHirvqjQOyhRnZjCY9V0bLcVFL1sAmh4MAgpIMazdOuWpNE3azvoWfc3LsPl68R0nneUIsMsR7FUKr0smGHsCHedIJMJJlAq6vc3r9RjhchescHyqBtyr6q8ze104ixCDL9KThRnaSqNO5anlAGgjurJl+yaDSwuRU3OIkyiuIfgfNlinHk6q7f8UPxvGxrO3UuEdusRb0GnTv00XP+PSGDQzlPkeI1EnBsewUT1zN0jkbNtLq9o61OUgwmNdr0rjpTb24AH4OC0kGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCYGdF4ICOU0i+x0SN2l4RKaQzjGXLF/BR+kZyfkJ00=;
 b=HAnwn/2PmVXJ95l5qDDmsx1Im6t+JjXSI12dFu9lG/j7ZuiwytI4f7G2CI+iLkd0vNCbp26ErEUUupcoFYpap20/gn3UIS5QsOg3G6+lv1uIdrHKgbxg6nLJgVN9f5g2EmoC1XyZADTnVqRGJONoYbYFtfngfnHC8QSv1jBsB6dTKf5qZVtBT2LxICHXT7DjY0qTgzWP0h9lmYzDyFTuq+LkHoo/Ghd8uLGEIECsTH+kD0bNcKFO2L3bEXzilJ+TMLFbpCBVtvmeMHKR5w+liacXUUwh0Yby05gjAdMm7on+QvpAo/OlehBBudV1ysLQrvSIBvjcd3JU8J6WdqGxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCYGdF4ICOU0i+x0SN2l4RKaQzjGXLF/BR+kZyfkJ00=;
 b=lhdrI/ckx+FKHOt2aZ5CMmAnY6K84L1MrLnjiOWWIm5A8iIsFHGZjKEarvxqUoelxlGfRcomzErsFlH8LnkY5NTmkJd4D8UzMrJUSuxUmuMftGx/k0Z0ccoJ3H3ZBJhlQtBVx2Mvx5mIdSdyKECNfdG+ttJ1WUtpWMYGZJM+oWvD4acCYOaJ9yyrkU+xfedl6Ie1gXrfHFR9gH04ueu7WanOahrshuJ2GMOLbu92qw8L5dDcH17XhIlb3t88sxI+sLQY9T2zCj8FOHutIyxOWLf5hqZTsw3tz/40quI4BPSHxtIGoCHamhpOmwTwhbGmEVFlYtl5td9jIhq2Fly09Q==
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PR3PR10MB3962.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:4f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Sat, 14 Mar
 2026 17:01:48 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::15) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.19 via Frontend Transport; Sat,
 14 Mar 2026 17:01:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 17:01:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Sat, 14 Mar
 2026 18:04:19 +0100
Received: from localhost (10.252.24.255) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Sat, 14 Mar
 2026 18:01:47 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
	<boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH] Documentation: locking: Document hwspinlock bust() callback
Date: Sat, 14 Mar 2026 18:01:42 +0100
Message-ID: <20260314170142.18290-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PR3PR10MB3962:EE_
X-MS-Office365-Filtering-Correlation-Id: 57dae2a5-a667-46de-a862-08de81eb6167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	90nwei/dTYMf8aGQwQbhlALq2IPB7BBzlJ0rkMHO1wRJFexTTvsZ5kydQ7Z/mn+0xWgkATvaOAdiMwHvyKNj+Gc4BSHl4d5MAAlGq57cleh6KTPOSsKYwkqSyfetLQAa+FtVMlr+nyJa/YuNEj06/o0hERWlK+Zhf0E8akZC5S/k+rysXbnAcfTEEzTRgcxa/IO+f15EnV8ocGmcPjDSTzeNW7XBncbk474iWtTIuwvMqxXqoDXsIgre3Bk+6vdhlmqiAbeidV1p5qX8pHynZcZJGoK8jPZPaMDXMJ0rhd0R+O5PFo6eVgUsBojcCYKa8Z4iKvUOQMGGm1zNiVXUccGwdRoJ//vRryW2v5vbFW9Grn9hYTQHBJqIHcRVVdl3Bo5PL6PYwRhbHJAFE4HqY5tgrHp27W241El9GJewrWA5EA8IgRkuzxEAZmOOzVDiQVaZnsb7d8EVojA+oyPRmCje9ePIehN7/Hj4V40P7YmIEdfltw2Tht7poT1wHeBnW+ool53xjxty/OgLjihU+F7/er5a02ztUv2vY8jkju/eymNMf6USLAa8B8Rap2qeNRl77nA9Alkk+v8HGagG0aiy37c68Q8ubw4Bbt3MqR4MpsrxaAMKWpER0Lmgc+PtujWDHCIPjMCSD/1BKvQrapp+Ra+nHDiLhLq8fyNEU4jOB5Fmoz5EdGeTHfiUQmn8U08lGsilp17v3Q7F6SAWb3G1a3S75ti8Mx43JEIjnRRzW0RlZASCQo80BEVF4BU0apgp3Nc5gGLJdMJFl2lu1w==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UNhkQ0uIkNf+T9DCCs9KklGfxLvUPIihJvlzX0lZAmVI6ubKvqeP8Gk+fXxZSPZujgX2JoK/8TP0g4I4Yjk6mDoyAsKaoOVuFdndo6q9MgjRpk5xUMBqAdbBOgCqLsz+yOhcYp/dev8XzDE2cfGCWUo9KT4RqsPeZQZzIea98xrwg84nepiuAj9ENWHWkBAAg39+++qxCmUSAV8S4fiSaMH0lJQhsINoI5lO15giLlXBIzxnzA0KOPyxmusx8/t8v3Q5OTuvp24WQ1sjtuHKmbPaejLgNraAmyxTxlMmjqPGQwgA8S91ISC3CyJIbqjDa2rPU0Y6rTlOPs30mta1YDN1JfQLQGCVwHj7l4BybFGM3Ylnyg/lllGM+scf8TaaiwcscEusBOuUKUdbLfobmx0+ujKqr0pT5m9lIS2pDoOZoI4w2/9EiCrg3Gm2+fgF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 17:01:48.3539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57dae2a5-a667-46de-a862-08de81eb6167
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3962

Add the missing callback and the corresponding description in the
relevant chapter.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 Documentation/locking/hwspinlock.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1d..fbca4e7bf4ceb 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -425,6 +425,7 @@ There are three possible callbacks defined in 'struct hwspinlock_ops'::
 	struct hwspinlock_ops {
 		int (*trylock)(struct hwspinlock *lock);
 		void (*unlock)(struct hwspinlock *lock);
+		int (*bust)(struct hwspinlock *lock, unsigned int id);
 		void (*relax)(struct hwspinlock *lock);
 	};
 
@@ -436,6 +437,10 @@ return 0 on failure and 1 on success. This callback may **not** sleep.
 The ->unlock() callback releases the lock. It always succeed, and it, too,
 may **not** sleep.
 
+The ->bust() callback is optional. It is called by hwspinlock core to bust a
+specific lock when the remote processor 'id' is not responding, e.g. due to a
+firmware crash.
+
 The ->relax() callback is optional. It is called by hwspinlock core while
 spinning on a lock, and can be used by the underlying implementation to force
 a delay between two successive invocations of ->trylock(). It may **not** sleep.

base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.34.1

