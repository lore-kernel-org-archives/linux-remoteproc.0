Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141C2375F72;
	Tue,  3 Mar 2026 23:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772581910; cv=fail; b=tM2jtPTuhCDb8Y/heedzLlBjlKZtucAw33H4DlSjG9rx5r9Wt7DPIUhOkvOsEXi+0b10EbVC0p+ZxdzjbNm4MeZYLag5jehZ9ua6Jcwy70amAk1pJTtaMGkktxpR9EwpWlmdElW+zNn62I1r42F4qvqL523o3JEnzjOo1ff6jFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772581910; c=relaxed/simple;
	bh=cjRZ2TfJ4s3+Dq2TnVSUyAn3jFfQmCCUSJ2L/65fSeQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lEjA2E0VdJ6dGkBBTEj1eL8825Yn1iu5UaLM/sJovdW6vxP4g7sC+j0oJxFF7LZ4Q0P7QCPyV1ySaQI2PUOGO7jjzRUOk0ULoCUUpc3TE8nJ+hv+fdoiELN86KHK044NR3u4ZA3tvg2PsntoT7tlBmycDg1HClN3/dVtaMTNIUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hbj8J2Y3; arc=fail smtp.client-ip=52.101.56.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hbj8J2Y3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQ+L0vrPmQNWeTioMx4WdLWi2Zt+YF6prWDT1ni9yUVGXf+jYDj+Bwvb6wQbVTx00EZjFz9P+STZA1VfnTt34aWnwcF++appv3zP1YEGMQxTNI/zFyZLfEEwTMjKEvP+vN11kEkb6THBw959hDfmxMSqhmosnfuhUcHX8gJk5iPGWJIxIdiyZKjLy66mtgAU62s2kRHLZVgIxGWZbbBvRFOtRrtbKBCCITPYMCq0biuXdQ+JfmrKUkThKUzJFA7naE6B+ysChFR90ea87/oyBR/qMwyzgCF4o6Wbx0FMCy2c6D0ipFFeDP2325YJvHdDfmJH/gQZnEQL5bLV1aUu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12EtGubdkJvycXDMwsN1ixP+mFVGwgjjjLA8WdHntpQ=;
 b=DjirneJe2T+bhw4eoOW2LTsjAmQqszOsTr92+ANsR23pv/BApRhQ66fVsfjbO2MvdDZ4DDgvKP+87KiFqyes9XQWCLCx4fHPxQt5PDrEPq5u+YEtebHRKHFAxJjwuOI17/3GGpF6j4LILD18t/v0g/L86rbPyOBcczXDehBEl9X9akRWEKEIFvPxVZECkyjpO3kElB7ruhNbuJU1GYnv/B/P35A13lWv9cBZWe0LTNyKJKd+y3vnahFEJpRSStHHEH4ydPOfsVLTdXGX742YcXNRRIlJUZyCArozN0F3LBk4O5Fclz/cWGnCnJjppJf6W6fywD8ExtTLRhrWAPeEpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12EtGubdkJvycXDMwsN1ixP+mFVGwgjjjLA8WdHntpQ=;
 b=Hbj8J2Y33H+LmkXnrbWSHTQLac1KX6Jj3A4nUGvZDwjo7u03JnhfXpQWO1oC1K/ADcc9X8FwrieWIy8b6P3NM62P6gEyBEgcV26jNezBq7Coa+JY73CoS4P6Q3XD0w46yCUv0ETyFzwLigXBbjjxjk3EDZFWXPt9zulRKSETyOg=
Received: from CH2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:610:38::39)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 23:51:44 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:38:cafe::24) by CH2PR05CA0062.outlook.office365.com
 (2603:10b6:610:38::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 23:51:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 23:51:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Mar
 2026 17:51:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Mar
 2026 17:51:43 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Mar 2026 17:51:42 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH 0/3] remoteproc: xlnx: enhancements and new features
Date: Tue, 3 Mar 2026 15:51:25 -0800
Message-ID: <20260303235127.2317955-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: tanmay.shah@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5571bd-a6f4-411a-005c-08de797fd2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014;
X-Microsoft-Antispam-Message-Info:
	3sx2Vor68SfLasZmlu9wzyToaIO8d4MIcBiBPw5Y0OY8EiDoMPhrtxtiPMkXNjbov0FcaTeWSi+5TCMfmqiuPWNJrfVj+y9fXCs1gWiZKKGUiJDJOwqDjomNK1VxBkLag85daXNX2vB/vGbA2eDZ1/Vzk9Pm+pg7rxx+oCySmsRbQ8cLvAklxWQFOqGaV1osQctIDy0wQ1JbBPeHkghsa/FueCBYQ5UGzYqBOXwDGeMUVzv60gB3fjg6hFnQ2VifbKLl5jREbde2PLhbtb0cxVBs/42cHADSaCqzuur/iZ+ubeg6MKlXLkKhNNbiu6YiWohIkyVbUrbA8gfLAiohW8CbS9eXhndi/wnxpIu3yvawY0Kaq3i9lUPu2//dvQdfWv6Phbb3vQOZyLdvQx2XVv1X0lqnKOBdKdAfFVmqRKwf6wF0VkQsaHwam3SpycjW0AgBoEp6YXvSZ5pxSKSSR84BwbJHc84cvj2M2ZHNtrOJOJRxMm+dd/PaCCM78VPv8SRX7DfBrfIuvi+lYl6FnA4naZpxGD1LxzAx4EDDxaOxaDQwwq4uuDYWmUZks2c6KaiT+M6r6BmKUUM/9sSidpv0I4ueQwkdVt7scHV9PzG4snRmEYojYeDwtnBioynElT893IqczZgax4d0zlxv69leEp2aUIXalIfg7Fsbe6lh1FPvC9iIz6nIFaetReUvYkth+YW9yGx33bfFvYdwkdt1VWX3+29Co+YorI6punZ8kNdtrWHOyKMMGcb9k/Z/kaMfeTxtgQPim5ELs78v5A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MGWtcQjbvWzcu+ngnv+N14Tynd3s01H/9c4rB/GiZnR8mdkVtrO0mQP1Mvx21A6ynimV849K393f0myKHAFRnfbFI/h9D9/zcxIz3MpmdfEK0AZ3+dcvkHsTCfcmRg+CQN9mwzxFTDhYGrQwap9uYX5rdHlhlm4n7J9L9dHjAIVjE+eLd0XTweDy3nD9HBFQbROJoqVedzl0VTzuCsuC+CFxz0xojSXmCv5Kd2XH1p33X2Ycv/FQ/lHVSJ8lm3v+rKGN3vk9SnLeAIXF2+mSovKe0+wLNbRA6CCYwX9M6fn0el06xTWMy8HiCpYyM/3PC2+wzeSu0ZN/FeE4JcGiTOwcbULVGNSznLgweM64Xv/7CR8v5QKVCHyxuKGU2QtWoTrdBwDgVR1hD0KCJZVKV+xZdx9cn3GEdrTzxxFAfPWEN45esUoYTlxjV8649lhV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:51:43.8668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5571bd-a6f4-411a-005c-08de797fd2e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

Introduce new enhancements in the remoteproc xlnx driver. Handle mailbox
optional properties gracefully. Handle buffer-less IPI without crash i.e.
no message is expected from the mailbox callback. Also gracefully free
mailbox channels during shutdown callback.
These small enhancements make driver more robust.

Ben Levinsky (1):
  remoteproc: xlnx: Only access buffer information if IPI is buffered

Tanmay Shah (2):
  remoteproc: xlnx: avoid mailbox setup
  remoteproc: zynqmp: release mailbox channels on shutdown

 drivers/remoteproc/xlnx_r5_remoteproc.c | 26 ++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)


base-commit: 098493c6dced7b02545e8bd0053ef4099a2b769e
-- 
2.34.1

