Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C377000;
	Mon, 23 Mar 2026 10:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263528; cv=fail; b=ktyT11jN47Vut3mLST20XGU9Rw9G0Z8MLh7/T553oRAB8yIAUyUT0dpNTIdALBJE0+bkmkIUouQtWx/LxOLBhx49hgRjjXd1oHfOzBOhNy2khXE8rMh9JDk2LBOeWaREoAkUbidRy3i6wOGT6aip5wKgXGAfjdWkXqKFfqMh4FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263528; c=relaxed/simple;
	bh=Plkpx7VN1LERwiDG/UaMb9XzX/JvEsHpXacOkamyVgw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TC5Cjq/LihljJtP/lsGrLGseBKYgsGkYW+ysYcXq76+AJPXP8TstM19Dqu7a7uKS22LtZJLE/1wQEQJ2xWCIybDBkg0Co66NKLQInfui77wwfPH1U4+YiFM/8u4bgcrT8g8qcruJPv60auPgHuFjYrwUQQUavOkSRYu4FPwI8xE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=f3fzZHc5; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="f3fzZHc5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1IW0beIyrCeIKowKkM139DFC5gtL6y+pgH5mseJHyUw82jHd0Yt/7k1IxeF/tQaRwqQ9nLd+L7JPo4gHt4TkSBf9qWs6zNbaBUxTV8dosfPwfgnPoqDLeUbqhSsjneqQcyIy9DRceRvFM74vJjtV7vCciY2ZXhbSjgWAFDZGES5D1yw1n1lixGT5MXmBHqvlNsvea8u+qbMIywfECXhfCeUY/jsKAvHdrc3n0Zxxtk0R6p00dedI41jdlamtd+uR2FwiQhHh/hZh0B1mYlqR1KLlGvFx8D+kOXCBDdtXKuhnQzZBKYtU/8FBAMObKDwcu+tZT6RIMV1V7brmWd3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWn6mI0wWT3Uou3PQ6c89u9FniXgctkYSOnSgYCZ6sE=;
 b=TYvMDvijy06tmWgeqHkhDyOu0ALRrZPIx6B0PvpIhLLI984qYtqMJyP5PPqaoGPHLCqQCj2eIJ9Q9+/6OA91KuR3VFca8gEZb1JWjsmfvWP7wWoZN58JaT88uZLZ228evun0r1gqjnsogJwtx/EJNgNarSlMKMygaIHQgYu1GOsU4dypU4nCPXH2QZ7W+j7BRJ323zaROfQYhmh8Mki1JULvRcbcWwPsErJTq/hkvu6G8rBAPkQhEfSn+iQjs/YM735g5j5m0MOwPwvmUkOVU4MpopDH/WN6hnjR6GX2r8gTRGpmTmA/BevNh+RGTelmzqFnFarlNO2eveLGNyv49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWn6mI0wWT3Uou3PQ6c89u9FniXgctkYSOnSgYCZ6sE=;
 b=f3fzZHc5xclAANwWElz1AsFXWJeD4ECAR10n322GM1IA+b2eQ9rrokMua6rdAJjw1oZsaFNtuKukzOIyEMq/1Bzu+kBzzZRpOA/UX/pOfEQKdej5D8yOC3gRmPYOvCRBXqAOZLUfZeFdf1HhoKTgIK5ubyhLZ+TqFD446xhMUgnGY8GnBgbrlMI0n179xM5QtXrtWtzo+gzck17w3pkKdDlVDD4mCGikr9n8wmTFcfiLdpSKoj1EP+9Q6GwHjCFDbKoIq7guSEIHOy1p4JMklRPNZXYoSHQqCZGdDva5aMAor3U7bI4XZSxwvdMc/qJ2o7ztxCAy0YyY8eEtNawCHQ==
Received: from AS4P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::18)
 by PA2PR10MB9077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Mon, 23 Mar
 2026 10:58:41 +0000
Received: from AMS1EPF00000093.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::fb) by AS4P251CA0030.outlook.office365.com
 (2603:10a6:20b:5d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 10:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000093.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 10:58:41 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 23 Mar
 2026 12:01:30 +0100
Received: from localhost (10.48.87.74) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.29; Mon, 23 Mar
 2026 11:58:40 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng
	<boqun@kernel.org>, Waiman Long <longman@redhat.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2] Documentation: locking: Document hwspinlock bust() callback
Date: Mon, 23 Mar 2026 11:58:38 +0100
Message-ID: <20260323105838.230314-1-antonio.borneo@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000093:EE_|PA2PR10MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 8acec780-33b9-42fd-92ee-08de88cb2521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dQw32piC3AM8vsWsDZlPCGCpRy3AwzpMPAQeGFgbr5Ti5tMSfgC+5hx72psi8OwVN1JnndzxLGTYb3b9xfLNtXz/MHd1JIwVlREIIZQgp5dwuykKlqI6EucDF84VCjjX2yDJqlQiTlVPGo1JQttIcgZdFnpwltEsNwxm07GJDPAsS/ZtciGodvLAWPyuniMP+nxwr6qoExIPFCXEf3+AU01IUiiQ0KjBcL/yNe09Jups98uos9M8c8elupd4r4HzlMkpNbw/qiadTEhllS6/0TN2piKPPI6xmKNPozyn1X8Evs6HSslD98BVoNEWOjW2ERRc0YenZXH9dT/4ZeW5YDXmdfKCsTg25c5HVPCmxoIWki5zJaHjXZEqElf0LysSBnOQlTXRsOAlva+l0pPCxELeh340vtOjRex+GRcrxgHtku60WZIhFiSU2JPx1xnpdf8lXry7xrNlntgZQzaET6Um+eybHWEpH1v/Siw3Ir+veH9HJ2tO8Tm2HTodBOvzyP8drWqMZ6G4f4xzRgRPL+JoJ0YKIs3eUp8TGI1fXXxsMAPRt/otRzSrS5vPw8vmEhJe9CpcJxJolr3FHWhQ2DvQ6yHIrCL4oTwS/5X+X/I1Yi9nr1KND3PGozb1o7RYZy3gTY6HjRtC+sO+cbqdXkFwTWN2IQT+lCZYF5BMii92uFuYC+3graMHr/KuC8eq3WbW6UZN605PByzz9fT8Dg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	alnXSdqaAV7zrI0OiqDIsOuMhvxQtoHoC/7bLtYHGplAyslBUNZHRdcw+yFxx+N4ybLviibEATqSr5qq0b5hOpnOKdRPFHtVQgsC8PbN+S8m0jOH8MWmGhCx0nlRUjqZJLZrvE6UYgKHuH/WCggnrHBktEfWagkPGArYTJ+tA6LNfz4owRI8b6DCNs+UgRTgSx+Tt7ZjEcQ/Km6B1uD1J/QMSgPjge9V8qf4lO4Poc9Z7sPLzZTBG9I4H8XN7n9tq8cnDETJ9PDFw+cQkF4AVnqsmDuVRBcTZdlYxKSvxPj8NFrwkOLz32c6d5j1cUUlFcMr5J3ak2Bez0APuew53m/Ka4finUK4LzXBrMe7nIsXwSn/KIva1Eag0doTkr8OJnB53TdTsq6KLqJWgNnIis6NX/ohEK0h2/2Rya3zzShlVZq6zBnUFDPG6i0umZlL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 10:58:41.5018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8acec780-33b9-42fd-92ee-08de88cb2521
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000093.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9077

Add the missing callback and the corresponding description in the
relevant chapter.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---

Changes in v2:
- align with review from sashiko.dev:
  http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo%40foss.st.com
  - update the number of callbacks;
  - report the returned value;
  - report it can sleep.
- rebase on v7.0-rc5
- v1 available at:
  https://lore.kernel.org/lkml/20260314170142.18290-1-antonio.borneo@foss.st.com/

---
 Documentation/locking/hwspinlock.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1d..a5fff33181c1b 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -420,11 +420,12 @@ initialized by the hwspinlock core itself.
 Implementation callbacks
 ========================
 
-There are three possible callbacks defined in 'struct hwspinlock_ops'::
+There are four possible callbacks defined in 'struct hwspinlock_ops'::
 
 	struct hwspinlock_ops {
 		int (*trylock)(struct hwspinlock *lock);
 		void (*unlock)(struct hwspinlock *lock);
+		int (*bust)(struct hwspinlock *lock, unsigned int id);
 		void (*relax)(struct hwspinlock *lock);
 	};
 
@@ -436,6 +437,11 @@ return 0 on failure and 1 on success. This callback may **not** sleep.
 The ->unlock() callback releases the lock. It always succeed, and it, too,
 may **not** sleep.
 
+The ->bust() callback is optional. It is called by hwspinlock core to bust a
+specific lock when the remote processor 'id' is not responding, e.g. due to a
+firmware crash. It return 0 on success and a negative error code on failure.
+It can sleep.
+
 The ->relax() callback is optional. It is called by hwspinlock core while
 spinning on a lock, and can be used by the underlying implementation to force
 a delay between two successive invocations of ->trylock(). It may **not** sleep.

base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.34.1

