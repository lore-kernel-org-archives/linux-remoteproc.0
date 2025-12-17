Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23745252906;
	Wed, 17 Dec 2025 21:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007763; cv=fail; b=BoceVSiKVbVpNiaX5DrqX/kBMOERESZkqu2+1B70ur8U0S/AVGWY25g+AjT6m0kJvx8+UUTvtsfBeAsPAkE2v8u7DJa0QXZq9l0OWikhwbMORUaZ2NH9Hp4bcxw3ymRuTxQZWP1o8FMG128jSJWMWD/Djcacl6L3VW661unbYag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007763; c=relaxed/simple;
	bh=h22XuBm/Za/pHInwPNgWnFVJ5OKUSIE8AeAwFES9jkY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6yxIfwhjA+6yAJJOfuSTUsEoYgdZtvgUf15+xMg2KjRjL+CJPFrMg14oZSR4A4ek6fOVMaWPbMSKMFpZLbNRZJrw5UntiTGyHEq1gn2ydUjxSAICQ/sLwtjj+yAHkHbAaGzXAaiCpvC7Gl53t3SJdo0tTeVyXD07vLB5LLiTqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1ZDHV4K5; arc=fail smtp.client-ip=52.101.62.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1ZDHV4K5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJWAgpXD/W6xlTqCtgY0O3zNOfLWKXuswOcLXRfdi+9NKNQtej58AHBo0iMQF/XY9WyOCx3gnkI6/5nY5U95FTOFOQxlciCmSSRCDqyX2wJAzg6Hvx/wUH0pHmQxr9e778jpcXqsTADpn5xRmHma29+3sRL5hqVgrIHBwoFDFvAU36IVg7AkyDXcvSJCww+94YyNrS+LE68W2+IkpQJfTz+pS8H+j1UOOPlug62PdxW1GLBOaZyR2i6QwJZn1JoeJW8iZzkEIna5YvVSqV1Mrk0qw2VE1QUKFEPkjFNbpoJnxdxATFA6yuZzX2Rcv4uajsesw9WKST7UQQ0jOpzXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G2TOde77ZbSYhry7iiz+amG4lsGEKokVyViqgd9/4G8=;
 b=h69vUzpVJUPl4nHTBFqrq2t0Ys8zpxlvI+miieVvaiUie7U8kAJfcoyRg2qcVTlmrw4HwIkj2u8gGkHynRJiAdij1C4zPn8rI3uxq6H7tGE2GSl0eyjzH3HzI/kFl9+0ajBKaF1M+q5ISmLo96Y6eg/zDkO8PCsIdjLG42qfVr2wp1P38D2hOpdSP3Hz5h7tYtQA7DG5SKlTwjeJNkRWSECRr6BX6//NWuQzO766sQZcUFJEwvoK/YX1+v3DmpfLiDOM2VL1Hj++qWGWCbyxQiZ1idN2u5Ft9m+UyGxJaYCKCIBNVaDQo9QFcBX4NK+33HVYHwhqJWlySQNtH9CuMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G2TOde77ZbSYhry7iiz+amG4lsGEKokVyViqgd9/4G8=;
 b=1ZDHV4K5enGtN+xviv35MDLXzm9sETtl8FkfQZ/nnA2lIN5gvXOL1+yGBXZCfdeU5gj/FnC+f8ef5Yjyyoddd0MKmki4u2XGhQzOUub0+sKr9XaxD4V2v3eX7AtaYgQnLq8dd5SeFDxnsBT4UnL9PID00z/QgK1wJDx6f2KS3gs=
Received: from PH0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:510:5::9) by
 IA0PPF864563BFB.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 21:27:46 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:510:5:cafe::20) by PH0PR07CA0004.outlook.office365.com
 (2603:10b6:510:5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 21:27:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Wed, 17 Dec 2025 21:27:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 15:27:44 -0600
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 15:27:44 -0600
From: Tanmay Shah <tanmay.shah@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	"Tanmay Shah" <tanmay.shah@amd.com>
Subject: [PATCH v3 1/2] mailbox: check mailbox queue is full or not
Date: Wed, 17 Dec 2025 13:27:27 -0800
Message-ID: <20251217212728.1540043-2-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217212728.1540043-1-tanmay.shah@amd.com>
References: <20251217212728.1540043-1-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|IA0PPF864563BFB:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e2acde-18b9-41e6-10bc-08de3db31ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QTZk4cKjwSt727MvI0OF0yUKzZ9E3OeBPdygkMm6aI1LrxjKCGaFJjKxVOd0?=
 =?us-ascii?Q?TGcpuUrr2waVxsE8i3P48qjOu6vn8Fc0Bo5u57baYB+7vEEd0yTfMM8fKeJ+?=
 =?us-ascii?Q?0XnHUzHFsLPgIxym/itWlKhFMrH1mU3QBy4961/O6/L48ZpXiFGlfHdnviyC?=
 =?us-ascii?Q?vZrwX1pvYi0g1SQEqoCdd+alBnyNcN9iTkE+IYhoHIEAu/hz/H4tcRWnarlt?=
 =?us-ascii?Q?xPTGgPGj2/m/B8ypN2mLi9B3It9W1i3QcI2Zy8hLz1Z4Sw3LyvU7gLX4tBAG?=
 =?us-ascii?Q?DiLzBfGudPGvYyrBvZa1OD5Wpkw9+SyrzojuUFEumGgBGVJUcLY22HHFWcUB?=
 =?us-ascii?Q?J6/giKmbTHzZN4M3M2ZtkuST1IHtl4Y3ZI4e99wMS1O5pCKYTWQTN4HmBNIQ?=
 =?us-ascii?Q?wfsTVOQ9K2/w1EaETo/vtPTztca0nehKLgMqoumFCfvJtj9DScFceh/JcD63?=
 =?us-ascii?Q?RIWUHZ1j2KTz28SQgtu5jf3P0sY/mqhBkIgymoGlMeYr3AkmBEPCNTPODcIP?=
 =?us-ascii?Q?QjgYTnXUs1aJvU/sXhxVskPdZn79udL2ku4tIKMc3SN157Yt52jvdICg3uOi?=
 =?us-ascii?Q?p5pwu4IeUYFaAuOy1H4zF1tR93fz2pueoLaoRNF4q612+jqwfpwIRui673qm?=
 =?us-ascii?Q?eynpHyihiyhtJAY2+fmXeajz4TIPVdWbvhf9eQnfny6tnLUBzMtoMSvOvc6f?=
 =?us-ascii?Q?bPDGU+t8Hxlf1ES7xugZS4tKfdQRvcDn3mqoto7sBt8VYlcIVDM/BAeKvcI9?=
 =?us-ascii?Q?DPR/pfmhGmqu+dvOa68NfcUz3VNj5bmjW5BybpWLCYqGgmgDsZNRRsCYH9/1?=
 =?us-ascii?Q?jzSSmb1t9QuOEF+O79TiSC7pXvScuCnYMuTeYt8yHRXyUyfrikB2O7Aljs8l?=
 =?us-ascii?Q?UQBDuTDUvJF/idCyf4k8YvjcmPzPZCr0WztIBOwZMoi0h+KENhwap+fsBANu?=
 =?us-ascii?Q?X/OPFSSAgHEMstaZBp3VoMGVYPjVFAlG4H9WPGNQSFYJyK2sarxmFePHWLXM?=
 =?us-ascii?Q?Uu/66RDKOGZWjsgfZmyFj2pMEU/Y5ZZt+8shKswz8KN0LNp5MaMTnDwN5Pzz?=
 =?us-ascii?Q?wq0bTNOLGUyv5Sy7rRVMJjouZUeWyXcwXozx+AtP4zM6npgqJsKM9mjiqZL/?=
 =?us-ascii?Q?A3IWZTnud58nhlDYpgrK/TEe4scRMXDGWk1hZLm7CKF71Q6B3Ntjqd+U5qEj?=
 =?us-ascii?Q?K7Na2bQNxbTSitneOJeLuhut7MVLhk51eOsZGnr5KNHO38EBid4G8JYzC+eV?=
 =?us-ascii?Q?a+vCbuWoKk50mrqi5N3tqBAEOWp9+g2nbHfH+m89BsyZdwBguoMqXoB5Yq/p?=
 =?us-ascii?Q?xo9RhQKxknx+llHtJuBDtBDK+bsKYBmz4HR8qZwShvMgFuRYCYnuSvzBsnx3?=
 =?us-ascii?Q?Dnp96kzQAhcZg0anSx9QyqgD4yGbim88ToWBXdFpC6CjFwUzP3WYvwblZv5a?=
 =?us-ascii?Q?EmCu9Ov2JKCjFX3l4lkvsJPUfEuJ9+2F3unN9D424AMlbr7dRqyU5F5IBMWE?=
 =?us-ascii?Q?S6mTJondJQzJx54lYOhG+kYyYBECBzcrqL2TLeiq708glue31ZD0QrClfqaz?=
 =?us-ascii?Q?oj43vBdZLRVrg985PXk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 21:27:45.7703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e2acde-18b9-41e6-10bc-08de3db31ed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF864563BFB

Sometimes clients need to know if mailbox queue is full or not before
posting new message via mailbox. If mailbox queue is full clients can
choose not to post new message. This doesn't mean current queue length
should be increased, but clients may want to wait till previous Tx is
done. Introduce variable per channel to track available msg slots.
Clients can check this variable and decide not to send new message if
it is 0. This will help avoid false positive warning from mailbox
framework "Try increasing MBOX_TX_QUEUE_LEN".

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---
 drivers/mailbox/mailbox.c      | 3 +++
 include/linux/mailbox_client.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..b7ae5c173143 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -36,6 +36,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 	idx = chan->msg_free;
 	chan->msg_data[idx] = mssg;
 	chan->msg_count++;
+	chan->cl->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
 		chan->msg_free = 0;
@@ -71,6 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
 		if (!err) {
 			chan->active_req = data;
 			chan->msg_count--;
+			chan->cl->msg_slot_ro = (MBOX_TX_QUEUE_LEN - chan->msg_count);
 		}
 	}
 
@@ -321,6 +323,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		chan->msg_count = 0;
 		chan->active_req = NULL;
 		chan->cl = cl;
+		chan->cl->msg_slot_ro = MBOX_TX_QUEUE_LEN;
 		init_completion(&chan->tx_complete);
 
 		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..a073fb0c03d1 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -17,6 +17,7 @@ struct mbox_chan;
  * @dev:		The client device
  * @tx_block:		If the mbox_send_message should block until data is
  *			transmitted.
+ * @msg_slot_ro:	msg slots remaining for this client's channel.
  * @tx_tout:		Max block period in ms before TX is assumed failure
  * @knows_txdone:	If the client could run the TX state machine. Usually
  *			if the client receives some ACK packet for transmission.
@@ -29,6 +30,7 @@ struct mbox_chan;
 struct mbox_client {
 	struct device *dev;
 	bool tx_block;
+	unsigned int msg_slot_ro;
 	unsigned long tx_tout;
 	bool knows_txdone;
 
-- 
2.34.1

