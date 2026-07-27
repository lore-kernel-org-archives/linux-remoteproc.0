Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F9346AC2;
	Mon, 27 Jul 2026 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133767; cv=fail; b=mUZQ3GAvmlet2LRPRFgsGQrFuHoUV4XHiTCfBLJ0iCy1EZQpK0IenWhEc5y3y+5WT+ARZ4+Jwz1PmNYclCETKk2hAsFdhArcRQhDf+uDEtWQMA7hY/seGQWamS7+42pB2jqxt0heUMN5/QVbrBnrqtCyWyjoJyLRXxDp/TfR2m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133767; c=relaxed/simple;
	bh=qonhrvsTJw9AyuwxnDR/6LyDVCjAc2qfM+GlpodJCTA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WDv/Rv9au+4bHaqekfkokNjXUVp/q8wwvGxnw65L6zfntQGTckmHh74Ep6KyDbYKX+mKKUjeupxlKZ/aiJOJmfK5Fk28dK0jYGt8aR+NGWDNhtTl//cIuBmcUF1NB3CcFMUtGJzkzosDZQQxHqtt867jeTt/peezOkgvBimLpQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=H5IU2u3w; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PitroCLL; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="H5IU2u3w";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PitroCLL"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1j9IP3689769;
	Mon, 27 Jul 2026 01:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=cH8KNJYPYYOCQJMq+L+5rzrdIJQ369rAy3y4/OCfZ
	fA=; b=H5IU2u3wtYSC6W89GuTkKpxLzl58osAbYe0HC54CfpeodpyuAOUwmVHTI
	V452mWXdZf7n+mbMaU/XytYPh1NWgbJ4aYlEzkNJlyfK54glYYplp4SnjT5o0Ce4
	vaGUnC2PaStKZcWmrFPotyMMB8gHCSX5qjHlATdBaSmvhN/kNqw0t3On9Ja8eXSs
	zk1df7IoIOaFHk9I/Nar4z1Alf/dKUrKlYVsglO3JeyazvrZXqChIBT0EqHNIJ9F
	E0YuCg3v/Adk2/S9UgWv2a+51tVId8aKkXB2XyX+MRT3ZZF7yixecz6nJceFIbbn
	OfnnvnFzk5iv6DEOYrqRvmh2KfPFA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010029.outbound.protection.outlook.com [52.101.193.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fnh5rbf8r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 01:29:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cec12QITQG0dO4QRkcjk0S+1ZuyEta+m+BN6rFPUuptlTTxilPwhg/wYoujvUuLyloUOKhNeqBQTGckRMlfEqVQRfawjoY/aM2gew6OivFQX5Vd3ILkq4NbzJWEWV3mZPFSfS/1lDdZfErTPMRQaTErWKlF74KL/iBxTBvqQvlsq739sEK/a6DC8lRX+kOIpcla+BsTsF+mB4XpFoTXAotoeN5sAhKGOuxEAJiSkh9eQwiV0iFxJDqLCG596tZnq9bYiMUWuusdB+cbF8k1HqibDIOp7p/5JsqOx50B2WcYHfZR7NkWDi3fQbRDtZ78pwXni3UAUVgPiES8AtVtecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH8KNJYPYYOCQJMq+L+5rzrdIJQ369rAy3y4/OCfZfA=;
 b=AiV+6aTL981kIH6Fjq2KVS5tV6elI1OzI9ztr6XHwpKgMGAZiHUppDXMReSJdnEwfyJxfD0ObOWflceXko/FpKPpfOwLU/yBMgCY19DX4g4rmPfHrWOJRO5zFF2EtlYiPeL4vB+JNKRF6cijqYdTWQ9Qzq96Zg+M1XQtNJfKIrRA2o/DEeyRy0b0Lv3vrlMUfCO0lbiIJcoEAsrSnggOX76k79WSb9uW1HBA6/y1noCtd3yAlUKokHVk9zS0av+jsjFe31esXxRynnRg8aZxHUSEEpb5gCU7KndykCJBpWECcUErTNUUFvrwGjATq/g996sIwKRr2+Q40jQig2oeXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH8KNJYPYYOCQJMq+L+5rzrdIJQ369rAy3y4/OCfZfA=;
 b=PitroCLLimHG4Z9znMFDaH0n+TT9XfZcpbITB+CpRZ3TvFlZp894L8mkD5XnSBdowTdcESFoy+u5MXAC/Sm2IGoDm2wFpyd8st+vagE6UZbZXxd0kw5BlGrsnMp5W94b88eq1sH5ZENdYJFaQxfV4XUtsTHLUvaC6ghoku0bue0=
Received: from IA1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::14)
 by LVUPR10MB997833.namprd10.prod.outlook.com (2603:10b6:408:3a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 06:29:19 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::21) by IA1P220CA0021.outlook.office365.com
 (2603:10b6:208:464::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 06:29:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 06:29:18 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:28:58 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 27 Jul
 2026 01:28:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 27 Jul 2026 01:28:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66R6Sqrr4130487;
	Mon, 27 Jul 2026 01:28:55 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] remoteproc: k3-r5: Set a 48-bit DMA mask for remoteproc device
Date: Mon, 27 Jul 2026 11:58:50 +0530
Message-ID: <20260727062851.2934443-2-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|LVUPR10MB997833:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3f6f81-4e94-443e-a477-08deeba8630e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ujy519xvptKUvjUQKJIpEDL5rWn51Zt9JY3SB+Bu5qd9MtdZUTdyzCgTciDsKt3GjH3Z97s8+hBw1fDwG7NCTiLypMaK/T6/1wx73wXP0Dg0UyXEb3CMzHN8VdqDIq/b0Yry6XKDrtZYsiY4GxYHAepmWHTOcUFuVw2lpgo9rAVUztbFx0qWEQ9gIZGbuuqBOCforbZc9i148yExwQqlTNfB2UWi23WdBv08nogx9mXtHigs6zFdNTJrzL8z13UYkCFFFVXMHQDcmqt7btlqsFXH2ThyigrEku3l0pOZo4BOGrkERgNKeEg+vXXbXD4EcfLzfv+cox2T0t43ZeI5Kg4UIyEZMcKTmjn3gYWDtaO5tPrAzWFj5PjCYF8RnB4JOR3S6QbpVFsAU+0I+tOUdOTX5+PqQNf/g8uu2iw+8XjzApmH3WikhWe9QikqIyl7oi1EJE9wctrl6vN9nzzWw2JMDXuHNJrM/xjCKzUVX6xVawFF3O08Z9qmyS7bTxnqYMLTqV+0KPlPDuWPW49GnT1jUL6dsigNQB+iAJFTefy330wJ+q2o1f0YO/pODMCOz18p/6Udc/2D0qFvOk8WJ827hICyVW98HxBPEAxCSA/yy/Zw4tWNw5ycyRFdcIFLWEcH8h4s/cUyoI/attviukheQvQKOyV+JenmIffnSLfqmqKdKXXmi+nDYiFKBZmZZH6j4o0nUQY65IODaEdG3Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aKGUWk6g3N/KLJY39HGFo63BMybwtUosLHZX5Jwm36z65AmlnPSzKF5SKjLCb+n94esAbpvzJoQA1KIReR7poI1bcVDJmd1eWgcz0PCqA220TcbCenEwGbOU3zLDdg1GTPgcsdKO9yvnzQehe0Aj/TXhl3v5+Rz1EHYsrGp5cgTYobZdj3YQwfFlNwamLbjVKTsIjS2QDtEweRv3ZbxYFq9g6ZdmwKR9OW7JZQcqN53BHUEy4D6XS+lCxjev9bWB5RlHuC0qEr8KL/e5f6OoFdljew6NQUilfoKluovBLA+te1adtoiy+4fqtfBNPGvO084w31SS4C3424uwbEo0xaSdYhLi3HI0xTHB3vX+m+MLm7Bfo0fn5omzC++WLRJu1wxIC+g0/kGVuDSSzGYWaQ1ncB5km6+QuF8CYr076y6K06/V0L2US3qMDclc9HCE
X-Exchange-RoutingPolicyChecked:
	ejLjfKN19sLvRoB5E3yLj+s6y0UlIBplAI3/2Ca3EuZioEHDBc+I9GoQav2waDJ5UU3rqnuQUKYXhrpY9Sw/LRypaJ2iMYrY+4shGTtQ7VILM0Hb9lBsMkAUVdzwOzLd8H6PiHHLg6XV3sQfLtXIRL0HJsP8yYio/rbXKNYjjsqm6t07MgXKW5U+KbTcVQJSogan/sgzWE4J/oBJxaIN+YJ059HhDtL/Enj1IabOqYPjVh7xqAZ4nAfcfT2b/idhtBUo2p6XaQE7ekQEt0RaAbMgxsPaTL5BCvLXYpzSXTIcREA31W3NOp4ogu9HdFhqlKT0TgfdDwmr9suqr54TAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 06:29:18.1039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3f6f81-4e94-443e-a477-08deeba8630e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR10MB997833
X-Proofpoint-ORIG-GUID: daPz5JEYSCHnSUUaU-Ez_PeYjjvO2LS3
X-Authority-Analysis: v=2.4 cv=DNq/JSNb c=1 sm=1 tr=0 ts=6a66fac2 cx=c_pps
 a=sujALEMa9QlLHAoAbbwPUw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=xxs9iNWcq0qoHKvPXIMA:9
X-Proofpoint-GUID: daPz5JEYSCHnSUUaU-Ez_PeYjjvO2LS3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX1Y5ybkSdtJN3
 DXz8IyV6661v648vtwqLdcPrLXwYs7Y9F397WBETtrkFcm8U55Pi0pzkpdsTeG0/OasfAdPOZSK
 EPPYT1I0N1eYqQTDIoUogp2nUxL82io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2MiBTYWx0ZWRfX+EbEJdIPI/Gk
 ORMrXyjN6GpJyuQ4LblHxrkCunerkDvWN+ch5Ffc8H/EYLLI2p63k3MBRgtGk52p+sADe+k8Jv9
 1idzmwovgvwr8uVjMY748dLrJ04NVQIalnqUBD13hUmYyqyRdo9wwx/sXtVNu05BEy3yTJ5zSzM
 xZzNygwB9Pj5yrdhUGS/J9QOY4oMDVX6yr0P/qfb3bjfey8uy1EZkHN5faJJqaqTPxyJ2o4owvS
 1KgWTVeZXZG2JG5QK25DbklqAwu/LNEv46as0EZZZMxAmdKUlNzBddEjVXl2UOBddYNxXsnaN8y
 d/UrsD3vzGvfpVIdAxrUDgpcPakrAPNSXu7GWOcltG5NniU2w88Hmig1jPkoY16ZWq2dcw9qu0Y
 qtvQGNRc3h2y0Ks2j0+Cn5+szRrWFOQC8e1ASqGdcX0s0xe0PPHpw2Jn8yU+rAD4E0koyHSg8zJ
 1pv6BxrQyKV/rjEXCJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270062

From: Rahul T R <r-ravikumar@ti.com>

The K3 R5F cores can address 48-bit memory space through the Region
Address Translator (RAT) unit. RAT is usually programmed from the
firmware itself. Configure the remoteproc device DMA mask to 48 bits to
enable full addressing capability for DMA operations.

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index b1d04d082e44c..365b4e4c4b509 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1047,6 +1047,10 @@ static int k3_r5_cluster_rproc_init(struct platform_device *pdev)
 			goto out;
 		}
 
+		ret = dma_coerce_mask_and_coherent(&rproc->dev, DMA_BIT_MASK(48));
+		if (ret)
+			dev_warn(dev, "Failed to set DMA mask (%d)\n", ret);
+
 		/* K3 R5s have a Region Address Translator (RAT) but no MMU */
 		rproc->has_iommu = false;
 		/* error recovery is not supported at present */
-- 
2.34.1

