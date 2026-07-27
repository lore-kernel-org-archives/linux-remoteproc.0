Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF53D16E5;
	Mon, 27 Jul 2026 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133783; cv=fail; b=cTnUSiuQcAL0eojo4KhMlCA3LkST2ebe0Bwj1QmFHG9PdLURkuk3DXXUO0XbttyeU6Z2miVWgS9A7PYP/K3VVvQ0yU0pb9+A1i4erunL+I0CGM7NyEO20W9qgRsRCJjj0exQv07D3XSmdwBtfWsHLz+8F7VWjSyyXkL/9fEXK54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133783; c=relaxed/simple;
	bh=/rrHokIuKlSvaLhCEEwVMj/RuY0D531UMUPGg9pWdPU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwVDhabTGZO1uzw7mFh1uhf3LFqNZmZT+JeQfPcE39woI0NdvPl89TbFBVTaiVsbFrBYRYdapCViGI8tt1gZN3ZuAG2y88kEwxGBVEvzeyiIjs4COOnAZ7S99amSki7XGArVGzfWKy8+sCf+ddTiaK+QoKy7FM1+Qk/h0gXImUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LMczawjk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tYyAz0t/; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LMczawjk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tYyAz0t/"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66R1iTL01363416;
	Mon, 27 Jul 2026 01:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J/LOo61X+F78rFIY0c3Tg6pBJx4NnE2ysiXF2bR71
	wY=; b=LMczawjkSAN3YvvHs+z5GYEhMcEFGLuNUdjiAkSEXMGa7fTNiqJlaOiZ6
	59nuwTvoS/Xwcaty8atAWU1eGt5TfRmw5mo1HchdjGkap14VKUlxC4IzELldc5hD
	8X3kegL3b6IoZhvt89anJGlfUmS7X64/9SZ/6lr5CNrkwKH6bqFhngh3xceHgY+s
	FZFrkbj0AvgAkSXnRbzVvrpOdShiPjC7EyuNbNbC6jzDEg8A0E7DW1g519Dp65S9
	WNWNmnw4Yazknvh7jcRmCiQbsCgR3Hf/ag5zHsQ3qtcEPiB1sjFZVjbQpoXdmnkg
	N3TtrCKk8uWZk17j9Ig2Gjv6aFKZQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fnf3n3rey-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 01:29:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5IggNXf50aCAYl1i7KomZDt5C0caYgtQmG70NWj1M7DVNgSrSRZGKduLzGJ0Pt7eMFIH8T3IbTfs5fKx/g38mqk6XrW/MeX0t/1METPvu8lATOGM8Oq9uSL1ayAAdlCgMknnJwnK/uzULOcyubtewIWu6d5Ic3Is/DuClSqT9n4+fDuI2p+lb6xZCDt/ZTpFVoQqTLGKMjul/x0LLFTsJNo8ldT7sUT+N7r2bdOLa7DNDO/6fI0abR310SIUCzysdSTeCMFAuw7DITpzTFaDNbYwUohHrngJwk0rpVHs0Kf53m0EgU7+Ohos4Gq4iLOpyuGrLggFW7yJykKMhlMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/LOo61X+F78rFIY0c3Tg6pBJx4NnE2ysiXF2bR71wY=;
 b=Bda5tnh+JkDPv/1CI+6rtQ1MpKUb36EZD522SE95FufB3ZKFweIfg/pW0KRsjmygaM5nmwNxmf54ypSuamQ50ATsBPhimUAoj6bgmhRVyBHxwtwmKVGGIowz+u8Rx/0A/6hrEst4dNVwnfq8P+eGCHgwqkXLb6dlfWEQZYuoyOh6FxNgI6fIu7Fu8pGEBfXxaX0qmcaIodaQ2CQwiTYCjkM08HyOmHt9JNiKDIW5sQ7PJgvRpBD/vgqZqn/X4BZXSxzYWIgS8B4wXV+B/ujYbtyt7mDWrtkpUlsIKm6MwG6j7lrRx/Wlu27AsWoyuZgVrXUvs/GPXCbXQqFtp45M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/LOo61X+F78rFIY0c3Tg6pBJx4NnE2ysiXF2bR71wY=;
 b=tYyAz0t/egdMpTbme32xvB1t9aMLlTkAcL22zsmBbm32f7+E8ve2PIuoI3Q02KO+bZjNgHmYFFhNAhlp7jpu+9OVw/EDwb2VvG5IsMcYmrNpGF3Y9BUELZrOl0lJtqsOWJBFBq7r+dK9L57ADVTBCM0+7VowbJm3eOQvShK3uWs=
Received: from DS7PR03CA0318.namprd03.prod.outlook.com (2603:10b6:8:2b::32) by
 CY5PR10MB6166.namprd10.prod.outlook.com (2603:10b6:930:32::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 06:29:37 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::83) by DS7PR03CA0318.outlook.office365.com
 (2603:10b6:8:2b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 06:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 06:29:34 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:29:01 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:29:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 01:29:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R6Sqrs4130487;
	Mon, 27 Jul 2026 01:28:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] remoteproc: k3-dsp: Set a 48-bit DMA mask for remoteproc device
Date: Mon, 27 Jul 2026 11:58:51 +0530
Message-ID: <20260727062851.2934443-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727062851.2934443-1-b-padhi@ti.com>
References: <20260727062851.2934443-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|CY5PR10MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0878f764-5b81-4cc8-9b2a-08deeba86d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	snUSQkQLsCP3Tgeig5zuw7Fxqb5g6zbTDGOkHkYEUapReN8+I/9LlkYh9RQpKDTN5659AY3qtUdGiYrOewueeXjd7rc2t+TXbx4+VW1Yyyo67grq6eIwwoaTmEJTq0AHnndcLNQ06c5ZvOzs1vc0daoDmpLzawwwjgc97ntREasNZ2ggY0uC4QXzunVzdPE7QXQ7YSGhwpgXRboV4CBQYnsZ3rboXvGthWefIF3sztzOC2V4YvEuUi52ZqyRJEFmARoTJXND+yeWQUIWvulXruUMgrOAqngHxHTbgrqDOvm+U0vpJVirFxDRz8601VLiJcefwcZLmNsyEPrRc3n6TM1r6ejZsWGyVKwKINbX+zUvjDOQ4IrDyDIjPhvgODKs+I17MIpxFSpyA05h6i2DfXzygEiBp3VehszYkeQTaAO5wyjUHJg3ZcyXjQ2q/AlT5f9IBVU0OrduhucHNi5fCfyEppjmD2zS8eWyM9TFWyxiAI0CWeQCb8zD1SqlLBexMTyfi3rvxSI9xcPHItV7ldnMc0aOf06WZpUgox5ahreHaVFBSJNxBx84lguYn/bDdxHLfwM45nUodIwGpynidN5DT2xcmvDX6cbAjJIyBlxlfvulJCJHf0WIW/nuTfArAxcx1iK36zcUM2zVgon3sH89Xyck+OZ77EYKDXLPzakV2oL3sUkzvrIMCuPad00XkfUNPe8AgBJ323186eKT+Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZtFddYICkLF/Vj1vF/0fozW3gpzJmEIg1a33Cuv9t/bVPJvpXK0ztu8ZSadDIMyLDS596tCE++hwKfFD6QUE8x8h16bXFgCmdEsKtpl8ppRNQYjoeu8VojEn7x7+LQPiS0fEii+85tuFKEYYHEBzkPFOkgtH4YXsQ2aa6FqmoQYM97pCkdZVYwr7NrYUqtv3P9S1nVlJ5saX/9Pu4bmP94wag0d+I7blFqi3MBT49wkvmbdNLEhgGoDq0Gjk8w+zGyyojy8xQcV7h/zH4jjl5HgoHmCGDV8cvJB/LC0f9RfelxN0injVoc6J14jalUfq8hubiERYbf4tmOBwBluafDjeWNCrwJ499cPBwjouli3Nfuzncp2gCts3d75wZli/qyDWpZKgJeisVqoHaIU1YOcewtdffk5a0Cj4iZPOFBrECFQmrm9j1SGksGV58690
X-Exchange-RoutingPolicyChecked:
	b2f2SwfcXRsp82zfC1wgWWiXIGbS1u/5pEgzWCg8wvyvqoOGXdHXHbE+UQBsmejzkZmM7/Z6mDVFhb/WgIXY0PprCuJSOyKmafpaCsy8SVYw4hl2QHQLIlEtNmPbSB8qfLea1iQZF3YH02JrVVaGy1WqWkxVoL6/Jpo95jOsqNGLSaEZm19ITLaKVD23LWnsHOmVQc6kQEAfqB8Iqcoczz+1Ud/fHTPhL5RXpBShgUThit9x+awxBARM51xFlDIPa03WFOmhMGcljtMPMsJ9TY098dJTawcj1GJ5zEz0rH9zJATMXfa1bVFXLyNPcyPPTKXUTISvEqnOM0wvrZaQzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:29:34.9263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0878f764-5b81-4cc8-9b2a-08deeba86d12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6166
X-Authority-Analysis: v=2.4 cv=LveiDHdc c=1 sm=1 tr=0 ts=6a66fad3 cx=c_pps
 a=Wb2dZV0zRm8mlnqfvkE3cw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=7r6kZFIEexgDfa-ZSHwA:9
X-Proofpoint-ORIG-GUID: KLrViML2DUonpU4tOK_h2Hy-anwfgUtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfXwzkj6KIIDZTG
 ka/jVL81oVDiWXm8KuEdK+80S/ERvrrIbsxAk8V+TeFglQ6qxnyI2ghKiUI4RRpYuoKeG4aTDDv
 MAooJ2qY6pBqm3GZJiqaZQnVeg2Am07dUkDNO/FfgJgGGhZLjAhYckPB3bm0rcUVuGoAZ6a3lI9
 kdIqoBfcMc6l4AnNA04DQYR564F3TABC/HM7XVl4a2IA/2AvFTopKLTjQzufn8dUgQzy8zRNqX9
 7kiUwPSiz0/txHPGZ2uZqo01MBj+mZaDWJK3hcArJDbZOGZ0565BT7YIVZnEbyWgyiDotw+QV1A
 IqZ98W/P/5fQJCG+D/oxG+clbHZX1iLuSWWfbbXrGSdV4OPGldQNBrnEzrYd1Agnhy5ZtTxiLNH
 Vh1wXgIWgWOuFccgki3SX7a8YEkvP+sTBcuZZNoXmwYREbgcjwPW3c5OH2iuyfiCiqdBz8pSxcN
 X7xyzgUqRLUW7UhmUHA==
X-Proofpoint-GUID: KLrViML2DUonpU4tOK_h2Hy-anwfgUtn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX/dSw7f9JKMzG
 szuDaYEPsNBwzPsgR7yEU2ZlQk3Iimbdg2leEUIpzlIu2pls0+Vq04qmE56hwCqQdR6t9LqQlkA
 BZZB1XbDbicpjiZuX0lsQEXiYH1eTso=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270062

From: Rahul T R <r-ravikumar@ti.com>

The C6x DSP can address 48-bit memory space through the Region Address
Translator (RAT) unit, and the C7x DSP has a native 48-bit address bus.
RAT is usually programmed by the firmware itself. Configure the
remoteproc device DMA mask to 48 bits to enable full addressing
capability for DMA operations.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_dsp_remoteproc.c b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
index d6ceea6dc920e..c0ccf87dbb6fe 100644
--- a/drivers/remoteproc/ti_k3_dsp_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_dsp_remoteproc.c
@@ -154,6 +154,10 @@ static int k3_dsp_rproc_probe(struct platform_device *pdev)
 		dev_info(dev, "configured DSP for remoteproc mode\n");
 	}
 
+	ret = dma_coerce_mask_and_coherent(&rproc->dev, DMA_BIT_MASK(48));
+	if (ret)
+		dev_warn(dev, "Failed to set DMA mask (%d)\n", ret);
+
 	ret = devm_rproc_add(dev, rproc);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to add register device with remoteproc core\n");
-- 
2.34.1

