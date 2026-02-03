Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBF310763;
	Tue,  3 Feb 2026 22:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159554; cv=fail; b=EaEtbSaJqRtxVUECr9EMGc9DTOad8q3lttLeA/XTiI00d3oNX0Irlj+wx+3xPfyxFylQY8zKFgyt2Nhh9QPe/7uttanGGCy13wM1R6LWfMZcCbpLMiaQh+EWWLavpRHB2laD8tpVA42Wg7mf6Tnjudie1xa7w9CP3nVpi7YwHZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159554; c=relaxed/simple;
	bh=z0cSCiHL+me/Z3dKrwMPmA6FPXNcGqUmkK1Fxr1zLfo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjD5kYzZ9BBrBlg0S27MePRYTcUjhgNUOjK1B01GDQ3QMuPYjTDIWXfaNpu180nX8+dozEGIGuWtC0B1n+n5FDHMugyG4euWTwaqKdZick/kIJimWGN6vOrvVEGBnk+K+FG7SscL297Kic5fOSljoLcQLgcGYo3GXaZryPBasxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XeYDOLyf; arc=fail smtp.client-ip=52.101.46.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XeYDOLyf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syNO5fZMAToNo10FiEG20Y6D1c90BMvct1eQMnp8meKVgBiATrMqk88nXTtAFpolVulihxz/XvGbvZOl6KMZTuMDAU45udapndjseTfC8Tx3PtToclJG97OP9RN3DHXquqSags0YWE4qFMZzRXK3YDD6T58aCuZPPmIcT7yGq+OTw/Rwww0pdMwdQI6e0kamoBQKB/4YPFN9iJzvH8ZAs7Zq/RzHdpgrmH+vVOz5jrEc0nPc8trra++crWnNmTAyIEgTcSUXkUzyb8L2hgpk37QRp9KWr5r8Hr4hGtySlCGfD8uNVDtfABsoU4KWSyBR4Mfcq5wkkU4BX0ZjuH6ZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvkzzKVxNO1OEgtntTkxJjGgv8/T6HVcKeIJ9E0+9HU=;
 b=ARnR7qHpw0zpz5VdvYVj4OOgVC5h4h7dwnwNnLrdHMd6VnwIvo1o6KkgIY/zJyimFny58apsg28EuK7m6d+qtFJIo87mpNZtCqOUTu4BCcyQL/N0DJpS1JEntk97J8HvegLXa6MOO+ra2pFCHLBXoFjCgBPIsZBDmEw45WJ03yNPjt6Fvmcn2yYYDAZlxGyR5Px3wr9nGqIFlDUrJ2DRbm/drtwkWL9HfmbqMy68THPqVlk6wcRUI/rcyJRArg9Qzwlvu9RAyeFkGM53HX7+wuYxFQtZTT6iuNL0vlWy9e/X61+EaTf2yfg+0M83j+FHQ5OLWBDWZ38AnCTaiQMyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvkzzKVxNO1OEgtntTkxJjGgv8/T6HVcKeIJ9E0+9HU=;
 b=XeYDOLyfqB0yqhP6/Z/2QHm3qOg8A5TnboqKs8x2feY0tcbwJic+2GjjY9srK7NAzPiuDVqNX/euvleZhLpEj7PXlMsMWSLDmDjpwGdEmESHGpt/JR7zV5lzyhDU+4eo/A5/2VK9a+i5y97jSbUH72aeFfnXFEx57MLK3PSe88w=
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by IA1PR12MB8553.namprd12.prod.outlook.com (2603:10b6:208:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 22:59:08 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::74) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 22:59:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 22:59:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 3 Feb
 2026 16:59:05 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 3 Feb 2026 14:59:04 -0800
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v4 1/3] mailbox: check mailbox queue is full or not
Date: Tue, 3 Feb 2026 14:58:20 -0800
Message-ID: <20260203225821.3293475-2-tanmay.shah@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|IA1PR12MB8553:EE_
X-MS-Office365-Filtering-Correlation-Id: 12847e97-e171-4c43-baec-08de6377d5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6KXfQVhKkdfpcbnayF1iibGPoNYYIytJfV6R8s+Xc6OrCkOBgw0kF/KBOa0D?=
 =?us-ascii?Q?LkGmIZB4wlnvm3RHatF/Fq1BI53mcoKoqXfN2pbT633+jRoncC1dstZr5cAF?=
 =?us-ascii?Q?yNpT9tgh+mn/JGtf3ig2WitLzhTqOvAqEwev9OZFY/Q4SJ06FcdbRkqYneL1?=
 =?us-ascii?Q?NzFcRLDbvB+pefPvdpeeL8wxrVBop4WwO+Xwx+ZQ3619UaDZcviYSEFUQ9BA?=
 =?us-ascii?Q?7FMoLP+FIg4UnJ9I4MEv9kKYMF496CVgPRz4+qDOL+6oAdNEWyNpjtGqsmNV?=
 =?us-ascii?Q?VhuJ/UGCIRe1RsaqzLg8P01+cEiI9fJkn5CcVX2g3eHWqPz5sovlWca9mL3L?=
 =?us-ascii?Q?TfUkdsVnnjw5yvy6UMeFdhfjkLGIiMZo9PVLmEDNOZ/1/NovRp3Kl8N7u/KK?=
 =?us-ascii?Q?3lb8uee0KPAP5gAV4W7cz4GzxV2HtL8vON/bHp8I95w9HRb1HB1E0AqcvE1L?=
 =?us-ascii?Q?uLoy6UOL0HhlfbmJHCubQYhgLoj1loijYj0ZCptKrM9tuvtDM5jV4csU8Wca?=
 =?us-ascii?Q?hOiTLtdHqZ8T2pSAuQcSX6s30oYxcLTeUtqVaKXpCziEZKD6gNQrjGBeqyws?=
 =?us-ascii?Q?BpQ7EUSw/PrauX75hQ0Ydu21MpxNcGVeZURCr8MratTplbWTIkDPBGr4uOQV?=
 =?us-ascii?Q?HU4niTEiNh52BW+2+TUuSKQO8iGRhZRq/oMl0WwpmHtDt/b5QojHQv9uvAXg?=
 =?us-ascii?Q?WPDC+QC2xvTckTVyc3uIF/Nj7OIkXJLUHGLEhStXpeXygvhglAa8v2Waskm6?=
 =?us-ascii?Q?ie55ioyoDKWgxlY6y02xXYMtLIHW+o8qjnpBrEelWVsmt0hU5FpI2/KPR9UE?=
 =?us-ascii?Q?6F5AV2yKP/h3jchyLfDyZ5ylucPlu21Az6Yl3S95yxSY/nOxQodQLW1okKZe?=
 =?us-ascii?Q?82GtC608gaLitkVbaE7ur8gyAFd8lwkH5r7fjq/dVkveduF28GKOmXB345Zw?=
 =?us-ascii?Q?L8G1UzMLPKMEzmG9bH/N4uQZAau/hfkb0oJzM9q+wyH4HAz86kmR39Sp7MHQ?=
 =?us-ascii?Q?3r8MqKQpsgyBjIml1QYTqICnB28QAhAm04H/8KGoZf3kpSIHU5INYTopAHvP?=
 =?us-ascii?Q?qppJh7d/xaTwkydTg0Z5p0Ug1RnsqldniD1w8OrjQOL9Nyf9pfma7dN9FpUK?=
 =?us-ascii?Q?ifmxleBcTWcT6R58RE6GD71lQOqiUzs9xMblTUQNMLUAZ2o9e9sh0HzC7Vy2?=
 =?us-ascii?Q?chD4qR0rewuFJva934SLgguwqknxMTJZDBkAQYU6818EfwVwVsoEq5yTpNjN?=
 =?us-ascii?Q?wf2itkEuTMIqPcqQ5u/xJQsrLlmmb3TVcqImo2cmjP5gr9w1mZhIRP0LKlCy?=
 =?us-ascii?Q?dI0FLYgLUaS8NT/q7BMgZnzjYaS1ARZgG04EbM2IBydV7Mczf56fzGFPSUq+?=
 =?us-ascii?Q?fCOCDdClaghYiqf2FsoXBv50XgDFdaEW89+aPgDMoaBICU9qIubpfcDd6MbQ?=
 =?us-ascii?Q?1xiwD3W49PMFMg1Kw7Q1hjpac34PpQ/H+d5Y7n8NFKZfeBm0OeKNwoqKc0vk?=
 =?us-ascii?Q?hvDaBw2ZpTAMsWasG/ObwNWayKGcy+uP92knJEckn3N9zdq4lJehEHgaZ6R+?=
 =?us-ascii?Q?1gtgQlwMFUAmDrdiAQx6plh4X+3D9MKkBs3xhNg2oNCZObxYR73hf94ojmNX?=
 =?us-ascii?Q?7kx6yUwBluXVHMTN9wjH6bgGRfZ206xwBUnCVsLbzxr00z2ljiuIzmARa9Np?=
 =?us-ascii?Q?WwX7QA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0lwONUKYun05KHG5dHqwER9seJQM+YnCATZ5fTuxQ2dwed/3CCDfv3SCgYihOYQvHrPQ5zhEwt0RCQYMwv3D+NAzhcJP/8MNsR2Wt9A9rXjh8ICmm70srv5pDeABvlHy4is3bJHMn5Q2Gb5xf0+WaDBQhvuQO0ahnjK+5Kj5SXYgxYjuQAlRCJm1tLY5OH1CHxhLA8lEiuPI72DDt1H3dGYwMXVuTCwrCjb314xRpHh+QZq/YIOzSw+FR3mct2l4YxxT9gBsaVAxQCbHRPtkCp5mmQCyrAwjLIGsTea6bGSKkpq4tvgnk4g/5BM9YrYAoFLQFjPya/3yhzzsJWIIfo0U6SKW/8SHPsTXb+9fdywtnzWUdxels3xNhQOO101HAVk//UiN7knY25mIzqWYQlVvrs/g19JcnxueNB+tUy626mjWZgn6UsB6k5vB4cTu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:59:06.9614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12847e97-e171-4c43-baec-08de6377d5a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8553

Sometimes clients need to know if mailbox queue is full or not before
posting new message via mailbox. If mailbox queue is full clients can
choose not to post new message. This doesn't mean current queue length
should be increased, but clients may want to wait till previous Tx is
done. Introduce variable per channel to track available tx msg slots.
Clients can check this variable and decide not to send new message if
it is 0. This will help avoid false positive warning from mailbox
framework "Try increasing MBOX_TX_QUEUE_LEN".

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

v4:
  - %s/msg_slot_ro/tx_slots_avail_ro/
  - do not use msg_count to calculate tx_slots_avail_ro instead modify
    it directly

v3:
  - move msg_slot_ro to mbox_client instead of mbox_chan
  - modify rest of the patch to use msg_slot_ro from mbox_client

v2:
  - change design and introduce msg_slot_ro field for each channel
    instead of API. Clients can use this variable directly.
  - remove mbox_queue_full API and use msg_slot_ro to know if single
    slot is available in msg queue or not.

 drivers/mailbox/mailbox.c      | 3 +++
 include/linux/mailbox_client.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..8228e6a9ef97 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -36,6 +36,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 	idx = chan->msg_free;
 	chan->msg_data[idx] = mssg;
 	chan->msg_count++;
+	chan->cl->tx_slots_avail_ro--;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
 		chan->msg_free = 0;
@@ -71,6 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
 		if (!err) {
 			chan->active_req = data;
 			chan->msg_count--;
+			chan->cl->tx_slots_avail_ro++;
 		}
 	}
 
@@ -321,6 +323,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		chan->msg_count = 0;
 		chan->active_req = NULL;
 		chan->cl = cl;
+		chan->cl->tx_slots_avail_ro = MBOX_TX_QUEUE_LEN;
 		init_completion(&chan->tx_complete);
 
 		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..e867f3d5c89b 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -17,6 +17,7 @@ struct mbox_chan;
  * @dev:		The client device
  * @tx_block:		If the mbox_send_message should block until data is
  *			transmitted.
+ * @tx_slots_avail_ro:	msg slots remaining for this client's channel.
  * @tx_tout:		Max block period in ms before TX is assumed failure
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
@@ -29,6 +30,7 @@ struct mbox_chan;
 struct mbox_client {
 	struct device *dev;
 	bool tx_block;
+	unsigned int tx_slots_avail_ro;
 	unsigned long tx_tout;
 	bool knows_txdone;
 
-- 
2.34.1

