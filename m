Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E9371048;
	Tue,  3 Feb 2026 22:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159556; cv=fail; b=FoZWAzuH0ctkEmA/JcNAR+ovH/XyOf5bTApG88ejeSGOJqYIup0IN/RIEZNn5ycqfsINmi2PeZrvdhiESQXF6joH/f5m+40nktZQ4vSLxPlC+NaAmlY16ZpgilSluMeUqXX4Y86n7IaBx6wO6Le8sdoopHgIigVYaJXYgKRoNV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159556; c=relaxed/simple;
	bh=uLea+ZXJp5885/LWLzOS1wiihoXTeMa0FJT3vmnSZCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WkJ3gseD0um9hfDQ3us8GhT1Xw7GqjkagxEMrllZiavagTbELiBLNxulHoQ9r1d/xloW0N00DJIMrGSrSbSYv9DNPo3BrQPUeGxWCXh4FacfRnOB5iG7UGEptpnD7f7QIRMVd0rNE4hm5ypGsELdnowTKjIS8A5zatgWM3kjfqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ObC04eps; arc=fail smtp.client-ip=40.107.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ObC04eps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCitH9bHLLSH8kg3rK8q9uKUop1HDYH7I5tHvVgwRVOYX6ygGvhsEiZhhqvuqljVauKJCA4J1tRwKmC+U36lEvIH4SWcPbHVsc1q6QSNozOm0qNEz2Pywj9JQjZflxuM4QcuLh58YX1K9W5yQ3a31sYRrjjS/7dzZCKx38jwZ/CTV0ZuAJpfW5aqEs/un2uMJhj/4Y0uJ38JMvrkez/R8diudVoabs33rrU8c1eeFt24w2qiV5d82mfOsBBbxX7HoakUh81lmBQh0ww+ymlkiTC+1GUpwqxF2F0ejDnGBrhh1UzUo1krDAWzyYuXcZ/xJUXKeQNqY4pFlC1d3Rb/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=181GJ/IEYpNgkum+DIZqipnoqG9xt0IfQyTf4CKICxk=;
 b=FJ3zibzFImlL0mlCxlzAhYkT4Y8XpCfB9wo1mHaiF/N/slUh7FsCJMB7/xIG2ytV9PC1yLeYEMuUz5WHFXauQMSXUd2jSnsTKj/oKky1tgyjj5JPjSLqLjeMWgYmyiPYJYkGmCDjy2IW+fL+BaRZG5PTkPfvGvP9tKjDkOtxjrTY8sUcoEvI46aEbdrCqF/lxGFhNNf97XMG8NUJwEK6dnhnAs+lf3sORptFVBkxuqPwXnC0KtRihq9IK+7HI6E1b8EFxJ82INDRfZLQ//hNvcmnelkBo7AuK8SaOuaoJO+mEo7iqzwVvPz5CyduFLl6n2pXMZR4HdtGf0dvlL5nAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=181GJ/IEYpNgkum+DIZqipnoqG9xt0IfQyTf4CKICxk=;
 b=ObC04epsvEWkC5cSIcSCRcWyaxaL4aKlHtzDml51FnvntaEamGFKfEQBubMUUp9R+J6DX+OuJxC14lSJktBC+UCR5JbVuB8Udts+VFaxP8eHQX02ltXFxJF1NaK1MKrjCcLzXZ2hrorDZ3y/7/zm60GNRHFjs6K90PPXvvQrD+s=
Received: from MN2PR15CA0056.namprd15.prod.outlook.com (2603:10b6:208:237::25)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:59:10 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::e5) by MN2PR15CA0056.outlook.office365.com
 (2603:10b6:208:237::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:59:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 3 Feb
 2026 16:59:06 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Feb
 2026 16:59:06 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 14:59:05 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>, Tanmay
 Shah <tanmay.shah@amd.com>
Subject: [PATCH v4 3/3] remoteproc: xlnx: do not send new mbox notification
Date: Tue, 3 Feb 2026 14:58:22 -0800
Message-ID: <20260203225821.3293475-4-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203225821.3293475-1-tanmay.shah@amd.com>
References: <20260203225821.3293475-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 54193257-dea9-4ce1-8268-08de6377d7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72uC8bA1mTxJaGBPx+bJvizu3w7QAa6ZXjT8B9JgWh4bgMQ3MqGt3P+gO470?=
 =?us-ascii?Q?QDx3sz3fnEi5Ge93HWPgL15DIMR3kLg6K/04xbWhzGIRz+eAZ8TVGeG0oNP4?=
 =?us-ascii?Q?vKxv1w26AtfGTJxZ82lVgZY3qGjBvRWP7L3rQiBvfKgKh8n08pZcEugYjAoG?=
 =?us-ascii?Q?8NHp79GN9VfOvA0CVcrCQyJTHEkggxaS6afDlcBdPvtGG30wMY/1jGxXy/dg?=
 =?us-ascii?Q?au2wSb16tPUX+xtWtgHsrH1zS3ZvzULUSgnPWNc6ADbcWp2dBNjMgVvGhv4I?=
 =?us-ascii?Q?z9U/AnK8Lnwk6QwKO7c0oIQlMjyG8/wjM0aOcF88dEcek6EUU/LLCIVwhUP5?=
 =?us-ascii?Q?KN1RDOlqA39fw+3aIRMJQKPaDuq0mzXtutF6JWATw6QJXvOGT2iTEUaNeu31?=
 =?us-ascii?Q?cSdvc4wUMfcqo5EdG9bh2RFVlt5XMDq/7o6VB/bUTaHcfRXr+CMppfMiDimV?=
 =?us-ascii?Q?0GvEPjJ4ggeHhDVNbt8WUOcqGP7KdKUY8D8vXDxz8hp4WSupQGN4siySTFkQ?=
 =?us-ascii?Q?itHMNc+Mp4vj26tVGykynnldSgmlB2jmoUQSRJ/FMIvjhysyA26KyfX+3jxP?=
 =?us-ascii?Q?ESgc9aAol6QUax9Ek/2oP6SlaYnLklkdxiDTKOFvRS8XeHGVqa/QwIwfG9gC?=
 =?us-ascii?Q?ipJxrhs+lJ3mO5PmsrUIzNBJuE9C2JWHLM2YzpdkG98fK63UCl1HyG/UU0oa?=
 =?us-ascii?Q?hjAW8xTWcRnAOGKlzZRI5YnLHzmkRqnZ1nsR963ynBwlwy0/zWL6jrozbZsK?=
 =?us-ascii?Q?IBGs+wiIUV9ERpROlry1F8m280hjoMSVhWjKZBYF/p14uU8UTT1tSQg+gYup?=
 =?us-ascii?Q?5whnIwqkGOjVYypiOkQFUxFaNVPv1InT+0MVyGGutZEq5iT7A8h9GXejM2Ft?=
 =?us-ascii?Q?8uEaCVwTLo8cNqA/fcwOa2u98ucb6a3LXp8AQmpMrPJ4zU9tAgNsnCtFptJe?=
 =?us-ascii?Q?vtEQn2YEPCqYp4gBcgZ2iHcYpEC0ZSix3YIBhMIT1MPac83zgpnJvq64QF4l?=
 =?us-ascii?Q?Y4qrFX2hICqsWDTj0CFxo/z2EPvt3elTBrHr6Ue+PgyJT4rucWCQiJfOoBkt?=
 =?us-ascii?Q?BxVy7Ns53n0j7OeoKH/MYIYhUUv/2yzfoVZEJi4Eui/n/Tl2MmCC8ANJ/3jw?=
 =?us-ascii?Q?tJOQU2CfsJNfZ+AMtBFXek56gRd3akp3qUJuBNK8iAz4qVkXiFg5CrK2FOgJ?=
 =?us-ascii?Q?bzPV4uMvuwiafRaSKuQ6ZPjGwxNqCTQtpLrLaHNhho/0YedCm1derc/jw4Hc?=
 =?us-ascii?Q?ANrr6vG2+y9Dcf8XxHJrJ37omwriXvRS9hGCV50faAuLv/GvbSlDpY+8H0IF?=
 =?us-ascii?Q?+YsWHkAPDZfVdxauIqzZ8eL3AIW74/xbFAB/uCJ5fcJOdhiJKwMqnZgIdziB?=
 =?us-ascii?Q?QqpoVhZNzcfDFy6iQbiawCTVfYeL084zrQU2UWEGdSBSav6c1pigcQXxaAFS?=
 =?us-ascii?Q?PcvsbsqghgTqFE/OWl2nQqPxtHPxDYetzij1rnlGC3uLMi5k+cyz0IARFYsF?=
 =?us-ascii?Q?Pkw+oJ/2CK+HDzJd0uJffCfelxqZ/QmISg3EtVa6iT1tcCDLwCvV+vC0sxQM?=
 =?us-ascii?Q?AekkNIkBL2hWEI1jvKbx0emA8aiRJ0TqHYpnnrjV9f36oUQ5vBtKr3xtOug2?=
 =?us-ascii?Q?0Jat/JqyAqHcISPOmjeC2Pv71vq0a8XR1FNODhK4MqBBbO5xMFJ/9IgkWZ6V?=
 =?us-ascii?Q?Qm5Kpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d5RMgCtJmd4xAmaDDHXvLVmvsyCtjeejFnP8Yj24yNsqgZwtAuMdaWlTnXSGSP5lUKB00nTkU5G3zNNIGLbs2mNEsAohO0k36Le+9wINCyjpcqneLgxZzY35lWM/M/ZzVOMK/fvIDuXmhRLdYa1MvBb8Zamc16fXs3ftkPbQaH+pJR92jIOLI0Xij8TwE5TBHv1DzNJQg/d5P5ocmufL0bdj61945yMEnZn7oblcGameEOZc1/w2GwJuGUoW1xSXkwoivn8iTjfIOJNgdF5bwLatsJR5TCQ1uefs0I5S0/bb6EKttOf3Ej/AolM3txSlGpQwtlE4GNEj5oekq50DB39chkm2//2uf8jT8BH06MBRZlLYLk55v7+Qi5VghifN2kvIK1lOu9Md0cASN8fc2uVKx9cUD+Mazz6jEhSPbhYHCxgOXJry0wdFEfBvuBTR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:59:10.8193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54193257-dea9-4ce1-8268-08de6377d7f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

Only write new message to the tx mbox queue if slot is available. If
queue is full, then do not send new mbox notification.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/remoteproc/xlnx_r5_remoteproc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 109831c5815c..46c20b603bc7 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -9,6 +9,7 @@
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
 #include <linux/mailbox/zynqmp-ipi-message.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -341,7 +342,11 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
 	int ret;
 
 	ipi = r5_core->ipi;
-	if (!ipi)
+	if (!ipi || !ipi->tx_chan)
+		return;
+
+	/* Do not need new kick as already many kicks are pending. */
+	if (ipi->tx_chan->cl->tx_slots_avail_ro == 0)
 		return;
 
 	mb_msg = (struct zynqmp_ipi_message *)ipi->tx_mc_buf;
-- 
2.34.1

