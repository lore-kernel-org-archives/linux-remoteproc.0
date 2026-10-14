Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53F1E0DE8;
	Wed, 14 Oct 2026 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013688; cv=fail; b=YxnnnLz1rdKqiA5OIXaEZ1hUgIouqDt/QDgc8AdxUgvd+1pLQL1/e62OcvsxCyEn/42btF68LgsaJqp1Yicc06SY5G9gX4DKq398USK98YCUF9U4GZQWMdyKowc54Z2F8gS7/wL1V/mwheNuOI/sfaPCuAxvcfmp4gvnvm57R1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013688; c=relaxed/simple;
	bh=1ttWX8tVcHphbluLtb8hnCOYuwKOtmoAtVTWT6NRno4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kYAkUyJ5QdsLsTJWMlICxxzVZRvNb6uH37dS+AZkSl9+KnkP5MvJ7Xnz01FjMFmaXey3VKoO0g6AOwz8GqKDejTjxC6ZRp8/oNO4pllQZDhx2YXpgzzaEn45ku2QuanvCTs4aaiKu/rEt/IYAPSGWbgExFcr2a1Vq5fZgpOmzpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1JgeqHza; arc=fail smtp.client-ip=52.101.48.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1JgeqHza"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv7mc0ph59rO2xCBjmhlgCvcG0czfuSG/D/+d9VODULlWLx0G4DPMqQtZ2pOE0eM22H9RnJuaoy3D5Y8mjqt5m9ZSO1g7eevk1DonSRnI6TV7LJuxGI4+NmOwZVQYQFzIkNoOJgEU32vpXmYbtds9xU20kbHjwhmsXvXYdcQ/+NUK401ZQs2KggCvW4Egeg1SedmZM5JbYGdawZv2yCchLsO8nNCauDnkOQ4lAx7kr8J9nnTGuA9L9940rCXE3CXAlE33gJjswe46ylVBcD2JBzi9Uc5B3YqRs3yp+T8Pt/pZCUFUWDX84JRjTMMhJfwAiuwKT7MO+aA9SupWsXu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygEfqZkKdYLvH5PzfILD+BlJxPDngifIuZOGwDu9kek=;
 b=mXcWpLd03itFojMRt0wjNYgavQtV8hrDy4swCXROs2HZQnd3ok/8JkxlUJJcg1u/64RGg1nsMp8k4lxnRfImTdFFp5gbbwoNIKbexXZQXUw446M6IqpT1RT0YdSU7+pNwXPxbxS3qhSqIh0AOPkXoUK8FrFMW9uqg7TVpG17M3Zn9ndPAXYiXZ9FgWeqdLzqaYsfj4Jtr7HQfTNUvdJXdlnLIUACajgfyOQkfxEG1N8cLMgEeKvZEIrUK8h+j/9ZDVFgi0UyRV4ZiTgyAvyp2yoSh8ZKg337lJLxDci2sYUk0cCspjqvoH7exw30kRHYKIpvA0TMV4zByc8tBybIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygEfqZkKdYLvH5PzfILD+BlJxPDngifIuZOGwDu9kek=;
 b=1JgeqHzaN6kTxQ2p7ovakYKYa/alzvQkoGZIKubRVACYXQCAz8bqKRqeMvZU7Y7cOmXtr+/LggadFw3fwD4EzmqUzcJXXfcH+m7MqhQfKso5R9opqL/bCXFvF2IOYRfhulZ+rkGd/uMwt220GvRXIMPSTqBgzMChakbhkrV9QQc=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by MW4PR12MB7381.namprd12.prod.outlook.com (2603:10b6:303:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 21:34:33 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::1f) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 21:34:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 21:34:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 16:34:22 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 16:34:21 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <linux-remoteproc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <ben.levinsky@amd.com>, <tanmay.shah@amd.com>
Subject: [PATCH 1/6] remoteproc: amd_mbv_bram: Bound device name formatting
Date: Wed, 14 Oct 2026 14:34:21 -0700
Message-ID: <20261014213426.2957480-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014213426.2957480-1-ben.levinsky@amd.com>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MW4PR12MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf3c622-a1b4-4868-c62c-08df2a3aefba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|1800799024|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	pYsjq0MpETRdqmCRa8h5bIfbr77cI7MsIgJjfcs0KxpskTS+C4tVImabTl2lUKZCe5l1xrZrgljQBHUuiL2fRBe4OnCuKBaa2vHgy7Wi26jXEIICAjAB5r05yEz/0amS95CWFMJKfES3VN7joB2+yjbN8WUOnM4bZMRdZPtAAt32MVeN+1fP3Nl06Aysd6DBPRDIfClBmGF+k2n4glvFZvAIR67SUjuCmnIuaW40lkdYsURUQKbuIz7reGS4JKKdJONguso85Mf1LhkA7fZ81g116GD6wkibt53v+hCvRMGF8SlbPMDVLyBDXMawFS59xSGrS4+99DGhSwsn3Dk5OQFTEblLEtlmqOd6zPMzKzIs3NP4bQMokKHfKeiREYfJOszMgdro3yyLQ712QUtnS4qhPEtExrgBrRzm+UDXugncB0LW57D7BnXYHTxEX7slsOIgIy9cwe3CUJdPrlCfBMB0Ns7ozEuTgvqY7SrZfpE4LWaGkj0gAqLUJC04bEIRuLbetSireDyeyqVqYj9cjNR7EglcWR4IRHbAwHN7UHiUvfzMPGVr41hQ/CA8ilXrXTLBshadkt6IPJ5N7r1zlghZoNISyyJ6VvVQedLZmPfZ6aWiKQE2u8qLRNj27t85LWl3YnblQo+hG1FwMUEnUF8k3UkCCJFdL6vixRlugqOqt6eifuiLAtwSiMt2JnT9eE4VlMmzlfjBkBZUnN2a4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	INQLdoosDKkF/hXUcpodXvBOCY0u81OOsC6y2ZzhZ0WMS1l8VzuwZZgqx2bByR32QuSuca/NpndlI2T8BmxxThJxLjzmnUTLk+WjO0rIjbk4VHdi2AZqgn9odPt25JczQppN4tV5Oi2uIS4GxgM7DbZXVPK3igFwXmbiGOZ1Eh46yEkjzTKRUwNA6q6W8eHa4mFxBHXvhFXViHUDFuZzfpygNw4T9AfFjexG2ovXw9jE/1RNCTx8dE26ZfTjqUoH6F5Xa/qAV48F6l1hliwXnKDEWkQjEEkop9j+FaM8SXZqMKATtcEJpArCFy4IdMzRRV/4kATDxVc00mXTFVAHfnxfArs4Q6VyXGtSfmLeyvn4s/ac4oVkbhncJwlcrYyhyyPLQf/pAClfOyHeSZSOlZ6cdNrsK2WnNAyxfFHgAvhVoAyadELvxxE74jBbDLGF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 21:34:32.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf3c622-a1b4-4868-c62c-08df2a3aefba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7381

rproc_mem_entry_init() interprets its name argument as a printf format
string. Passing the device name directly allows percent conversions in a
DT-derived platform device name to consume nonexistent variadic arguments.

Pass the device name through a constant format so it is always handled as
data. Limit the formatted name to 31 characters to match the space
available in rproc_mem_entry::name while leaving room for its terminating
null byte.

Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
Reviewed-by: Tanmay Shah <tanmay.shah@amd.com>
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/amd_mbv_bram_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index e4a103cf8455..6cf33c7b7e64 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -72,7 +72,7 @@ static int amd_bram_rproc_prepare(struct rproc *rproc)
 				   resource_size(&res), da,
 				   rproc_mem_entry_ioremap_wc,
 				   rproc_mem_entry_iounmap,
-				   dev_name(priv->dev));
+				   "%.31s", dev_name(priv->dev));
 	if (!mem)
 		return -ENOMEM;
 
-- 
2.34.1

