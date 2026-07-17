Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013058.outbound.protection.outlook.com [52.101.127.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478421ABBD;
	Fri, 17 Jul 2026 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271163; cv=fail; b=rWozDv/9tkO8z93We+XNamjHXaWe40Rp97JqI5JI/CZwPkYck0gQCphJ1fVg56GHYqWv8rCD1L1L040y/OPSTBiPbxS7m1CM9bFZ4WQkKYXmuKmt9wMZhUHxnk7JEqyTQE3oAunwCiy2LO2YQlvm0dV4aAhoxqOTZY6LmIhqjug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271163; c=relaxed/simple;
	bh=veS9CnzVIvafmZg6NUcxKQkHTQFEHMuy8JDi0oJJPN0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ULuUlyZGRBX8yLYhmXxL2c9ZDQOk7XEvU8s6mqB810fWP0KBEetI3bSMcymDYOik+kedFnAx+BfjUfkV/tIkjmVsqybLy8RAziq4eTrOoaaft7WRveECXwp/HQ1/R7m+fwXxtIukGxqX4wmr74wxKuI/Cyl75g8iNqUFbIqDNIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=j07O2XSS; arc=fail smtp.client-ip=52.101.127.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="j07O2XSS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtLbpPrKjWcMFsszDSW3svAIJF2TG2kunDbT68whJzn4H3JOQv/FOHa8tjcHrLXMLOkFWN8wbKDXI2bS/zJyVgO3ij0NnsG27fjg2YmLyWFsHnoZBwVsma9zlJEVGv2Yg+zq/UZzDoZ/z13vJp03zGjhc/UV0u7K07MtXxDR9w6EaNOL793O/kXSuYP4keBjOIQHwusYOk93UZrJeFKu3GwOXsBZwzgB5WWFj6JjamyIliU8KOFCivZ3BmMXyUqc1tG4MtCzlXqJICGLhyIcmXs9SK9I3+1SHNz3mMnYuiRYQDa5LCDhW3eJsW+5K5xh62tNQN/ct/QsVfn5gaAvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwSPbj6bHus/PVje4mHauNVjyk5PMc2+vdtb3EqrvNA=;
 b=xifRvttdX+EVzFBuFgCwjEYqDhklFEChFyda90tMpuurY24WfYGd5m23EON5Rc4PY9Ezydbpa7RGDIW/gIoJIxLRwzodGGle8OafivjEuOCW+gH63s8pBbk7pFdBffeVeINbSafuqKA6T6ROYuzyj/HrZhClGWf7GKL//BM+8rVVLltOlBKRVooZujR7L7lS4eCsrVgjsLpKkbZviGi33gWaXk2H7cPJoXQOELQF/FftT8wAUS+wcaRQA/LrvbABNQRl/rQNsgL4KGX/BO5KSuWC3YLLQtkK9qF18usJMTpG1alhOgwRbqWmFGWZ9Q7qSt9Oae/Cn+rNLMWdCIA46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwSPbj6bHus/PVje4mHauNVjyk5PMc2+vdtb3EqrvNA=;
 b=j07O2XSSYyod2ElAVJNAaSmz7NLcwHVSXqPYQUftNLMjsIShCO2dJff/YQ9DkZsf9xG71iYEsjJ2Emfl2z3nPnCRi4x7cwInOrL1nE4JBLhUuH2TRmPIyv3J2rSkX89mUdyx79FslS47hNj0H1O6P4qloCgVInLkQWMhZ+xkH4wknrXm63V9dP46BsyGt5qGCeynAuGI2ISWsZELuYJI2WD8RZjiJ9ljYJ1cKdHENJzijY1Y1i4CBmLB9acdCqAJtWOqsXZNyW4jzsZfW3CSMC05IBikUVs1f9OtLdtcij+Io94Nn6rJVeswL52c5rrNESHf8ONrfhh67QbU1Q8xCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by KUXPR06MB9155.apcprd06.prod.outlook.com (2603:1096:d10:68::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 06:52:36 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 06:52:36 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:INGENIC JZ47xx SoCs),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] remoteproc: Remove redundant dev_err()/dev_err_probe()
Date: Fri, 17 Jul 2026 14:52:23 +0800
Message-Id: <20260717065224.600593-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|KUXPR06MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 19dfb515-8789-4359-fb7c-08dee3cffbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|52116014|56012099006|11063799006|6133799003|18002099003|921020|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	+jj+22Zq9fSwJ35DWs/NRlp0kgZJFGx/nB5ER1Y2aZWljreNKVES9wbTCTh4N6ReebpG9wIe36iUqOxHC8IPLck0v46FUxzTNDWyk+OdC+VhuUGWh6nYZfE3AzU8d8PW3ARPhYSl787nH8l3T4NOmbyArUrZgd3WJ1l/O6XkHu3SpAmLRlhyAxbYQpr/8zyTp28433GCe8/FMA/HHzq30cP+M6YJv2pZoZqum7YK8l99JCgCnSdgu4IvSjsHGB4Do0/i1mjG30Dn495nQXZX8qK/EnpJMTsk1SkJ7nh4/jMIt8xkW5pbeNRsB4JGIVckIcUAQP+Y7G6sg59ai8PryI7c4dvIirIWtu4/N1LQY5BQIiQcgvdb4OIaE6A+IPD5ByEeouEkYXjWOxbMaIjRDv/AG1pOcMpFFmRAvvrLKDYpzofQXoGs1+mQwm1myE8UtV3XCu87pgSL0ECRQ1F4LY2moSAN57/PNEsL8nvsQ8txSeXOM8Nk7ab8vImsXH975EaCfc2qkDBFzz8YNLcvk0nFTCq31rWrO0lVzmAjdb7VfXS/ZQ7lNvi4s4r2AB0AGuzyatESC7em+mkdX1JKmtD1IMeayL1iNbhl5k5YU+WD0fW1orUQgM3YqFF9B+rKEzPwVww+/46Ql4WG0r5jqb8+imSP+DrxpXMYYfSINP5mSt6HmMductDYRDjPxUF8VNXJ9uc93IqZ6NaIfL2kvpXRA3OES+Bj6BbGJhLjIB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(52116014)(56012099006)(11063799006)(6133799003)(18002099003)(921020)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wakMZhJ0Ge0AcXm8yvmqUz+e7mx6CEf6iE/F1TsgxVUkJo3VQphKmMaJJmHt?=
 =?us-ascii?Q?6w+ri1aMcW+5Q+GXB8TsHUB6uE3+K0kTIAQeik6ioci2DvGt0o0EDNTGx6U5?=
 =?us-ascii?Q?8zz6zGc/71h/5hBjMX1X+Bq2TjlxigrGcF2SkOR5qU36hgdcylozhecJMwwk?=
 =?us-ascii?Q?fgPp/kdoyhGmo7KbFbkdqR/SkZTTzAEfX6tFnqTlv0YBXh5ZT95nyIBmABpB?=
 =?us-ascii?Q?xi7XoWjkanen1JQqOXJz0BLWaKNtAlJfUrOiTJ5e4v2gBm/f4C/Wi+Da/5jH?=
 =?us-ascii?Q?GLmaBrwEE2wgD5wmudRFv6Ms4nwMw4BbJqWzM5SkRC9MNx2slGkUHbavmG75?=
 =?us-ascii?Q?mRqSH1aU20hK6HVodXjtYGH09FjnLVSJGP3sL+ILHykYPtxGeQHrgcAIrSZ3?=
 =?us-ascii?Q?Z/jFZGixBRWCbf3W7wtcAqxahIH0rkKQ07rIiUtwniwt0JamkOjK4XGXtezC?=
 =?us-ascii?Q?/Td4LTNbt5baQeiejlAtUcN1NF3x+F2RKBzI71i1NsSOgVyhyL5IltcNTHc+?=
 =?us-ascii?Q?U5P122pz/mE6J4o2VUSyFpAXJ7jk5d6hyt0FPeMuHeLysA9PNkrOEj7wI+Mg?=
 =?us-ascii?Q?KsNHNpkskg9HE3IWkXK5iRQDJ3wx5FXCFK7jQw+hsnQfRS3KvooQ0rsw8Geg?=
 =?us-ascii?Q?mLEu93g6OR7Jko+7uiW1Wt9L2dFkzyj1fOnsU8TdLF64DLyBTTIcnMT61CJr?=
 =?us-ascii?Q?KGpaoKuaDiOZlRkbbkN+5jpe3+lbyztumaT9psm1M6P6bdLYXuPvb3J0gL9X?=
 =?us-ascii?Q?kwnO2Z//xyXzm5FluyBnb3bQ6+ueoAo7/yX8hV2aEdum98gChZgE+jnCx75k?=
 =?us-ascii?Q?BLKLSeE8atVznMJKKuCYYaxTCEn00lCz9vsHIDQRJinvGaOid0dYURjMNEUm?=
 =?us-ascii?Q?DSxfIVo+LLZtLoYDLVHvOOBKO48IABJ1CTZw8rE550vTQkr/5gmSxs90W766?=
 =?us-ascii?Q?dNF9rcsgalqVq4aM/2FJ0Raoqn4DFQw4oacQ74fTbbcAkXom9F1C9ynV7mcE?=
 =?us-ascii?Q?tqV4Gm1WMf+VOhnObQaBq9zfMaGMfbOrdt3wfukhPi6D/ObdX//xqGWyhFiU?=
 =?us-ascii?Q?6Tk7wcx5hEj6+q5adR6Nf6Grdj9c37zJ3eVKPtleB1aKy7co/wgRJ0rZShEt?=
 =?us-ascii?Q?XgEwa9EGKlnyFcf2TaHHayLC6z5hLcDNXqR/kHZyFSghLHaUWGXKKaXCJ4V3?=
 =?us-ascii?Q?H6FaR4SkQFis/p/r5fRa+NDd6Dw+FuWtm6nZEt5TgURlgQgBsb6//aON4sVZ?=
 =?us-ascii?Q?Ckci8brpND0Jo+6EAH/tX+WD3CPKNQAuPFhHG8ntQ0T95qgYhTP/pj6EeqcS?=
 =?us-ascii?Q?KW6TusA/6xTi2QFstelSL0f0aYxyjZBVBas027YEtzsKyg7knvt3yHGvHts5?=
 =?us-ascii?Q?NgsalfLDeTxMCZuPjsfixlQjSbkO/AZzksJwKADhghTlaSC3eublPERdHoFX?=
 =?us-ascii?Q?TIYUdRRA/Kxf68V6f7N8SHzphfBTsAVbrEkFcQgiL8zxO2GW6ZOrPk0nnJDn?=
 =?us-ascii?Q?XQUwAoWZEMRKOSn2zvoP6zrs5repTLefRGTVEj1xR7tG8FHF6td/sgQMHSAs?=
 =?us-ascii?Q?C3VMisfW+FQ2oKW4jiPyqEzdZRmONF9+GREloEGM0CiwMoHsLv2VndUQyZ/P?=
 =?us-ascii?Q?6RUtQciVuYsoVQxj4+TxJ10dhYvL6P3M0bH+lXYQoeCs+6ck3WiLHIF+F5Zm?=
 =?us-ascii?Q?zEPhD1a5zT5Vsug5TgcsGs68w9D8vdjah582QDBsR6Cl8cSUWDSZ84op56tT?=
 =?us-ascii?Q?RY3LLRLmyQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19dfb515-8789-4359-fb7c-08dee3cffbf4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 06:52:36.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oF8UeBL/8/0q0/DLe6uKSvBvys4lIyujK6MDurR+hbt0ujMnmGhae0zaVdrWbppYYNsKVvqG6I6IKRCDUcCAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9155

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove the
now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/remoteproc/da8xx_remoteproc.c    |  2 +-
 drivers/remoteproc/ingenic_rproc.c       |  4 +---
 drivers/remoteproc/keystone_remoteproc.c |  4 ++--
 drivers/remoteproc/mtk_scp.c             |  4 +---
 drivers/remoteproc/qcom_q6v5.c           | 20 +++++---------------
 drivers/remoteproc/qcom_sysmon.c         |  2 --
 drivers/remoteproc/qcom_wcnss.c          |  4 +---
 drivers/remoteproc/stm32_rproc.c         |  3 +--
 8 files changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
index 23fca7176539..006fa7b56727 100644
--- a/drivers/remoteproc/da8xx_remoteproc.c
+++ b/drivers/remoteproc/da8xx_remoteproc.c
@@ -298,7 +298,7 @@ static int da8xx_rproc_probe(struct platform_device *pdev)
 					handle_event, 0, "da8xx-remoteproc",
 					rproc);
 	if (ret)
-		return dev_err_probe(dev, ret, "devm_request_threaded_irq error\n");
+		return ret;
 
 	/*
 	 * rproc_add() can end up enabling the DSP's clk with the DSP
diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
index 1b78d8ddeacf..252519f48964 100644
--- a/drivers/remoteproc/ingenic_rproc.c
+++ b/drivers/remoteproc/ingenic_rproc.c
@@ -219,10 +219,8 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
 			       "VPU", rproc);
-	if (ret < 0) {
-		dev_err(dev, "Failed to request IRQ\n");
+	if (ret < 0)
 		return ret;
-	}
 
 	ret = devm_rproc_add(dev, rproc);
 	if (ret) {
diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 83763d640c4e..407d6034f748 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -411,7 +411,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, ksproc->irq_ring, keystone_rproc_vring_interrupt,
 			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to request vring interrupt\n");
+		return ret;
 
 	ksproc->irq_fault = platform_get_irq_byname(pdev, "exception");
 	if (ksproc->irq_fault < 0)
@@ -419,7 +419,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, ksproc->irq_fault, keystone_rproc_exception_interrupt,
 			       IRQF_NO_AUTOEN, dev_name(dev), ksproc);
 	if (ret)
-		return dev_err_probe(dev, ret, "failed to enable exception interrupt\n");
+		return ret;
 
 	ksproc->kick_gpio = devm_gpiod_get(dev, "kick", GPIOD_ASIS);
 	ret = PTR_ERR_OR_ZERO(ksproc->kick_gpio);
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 436656bdfa8b..9751acc2bf83 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1246,10 +1246,8 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
 					scp_irq_handler, IRQF_ONESHOT,
 					pdev->name, scp);
 
-	if (ret) {
-		dev_err(dev, "failed to request irq\n");
+	if (ret)
 		goto remove_subdev;
-	}
 
 	return scp;
 
diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 0206a4a19254..1075ef4027b7 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -302,10 +302,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 					NULL, q6v5_wdog_interrupt,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"q6v5 wdog", q6v5);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to acquire wdog IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	q6v5->fatal_irq = platform_get_irq_byname(pdev, "fatal");
 	if (q6v5->fatal_irq < 0)
@@ -315,10 +313,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 					NULL, q6v5_fatal_interrupt,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"q6v5 fatal", q6v5);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to acquire fatal IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	q6v5->ready_irq = platform_get_irq_byname(pdev, "ready");
 	if (q6v5->ready_irq < 0)
@@ -328,10 +324,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 					NULL, q6v5_ready_interrupt,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"q6v5 ready", q6v5);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to acquire ready IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	q6v5->handover_irq = platform_get_irq_byname(pdev, "handover");
 	if (q6v5->handover_irq < 0)
@@ -342,10 +336,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT |
 					IRQF_NO_AUTOEN,
 					"q6v5 handover", q6v5);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to acquire handover IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	q6v5->stop_irq = platform_get_irq_byname(pdev, "stop-ack");
 	if (q6v5->stop_irq < 0)
@@ -355,10 +347,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 					NULL, q6v5_stop_interrupt,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"q6v5 stop", q6v5);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to acquire stop-ack IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	q6v5->state = devm_qcom_smem_state_get(&pdev->dev, "stop", &q6v5->stop_bit);
 	if (IS_ERR(q6v5->state)) {
diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index a0830a48b1f4..61e1038328e8 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -662,8 +662,6 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
 						IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 						"q6v5 shutdown-ack", sysmon);
 		if (ret) {
-			dev_err(sysmon->dev,
-				"failed to acquire shutdown-ack IRQ\n");
 			kfree(sysmon);
 			return ERR_PTR(ret);
 		}
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 3392c9380202..e9a00efe97f6 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -521,10 +521,8 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
 					NULL, thread_fn,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"wcnss", wcnss);
-	if (ret) {
-		dev_err(&pdev->dev, "request %s IRQ failed\n", name);
+	if (ret)
 		return ret;
-	}
 
 	/* Return the IRQ number if the IRQ was successfully acquired */
 	return irq_number;
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0e5d64fbe52c..1fe4cdc0a13a 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -682,8 +682,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 		err = devm_request_irq(dev, irq, stm32_rproc_wdg, 0,
 				       dev_name(dev), pdev);
 		if (err)
-			return dev_err_probe(dev, err,
-					     "failed to request wdg irq\n");
+			return err;
 
 		ddata->wdg_irq = irq;
 
-- 
2.34.1

