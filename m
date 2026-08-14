Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50929480DC0;
	Fri, 14 Aug 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718755; cv=fail; b=S14KNADWmhstzP8QXhaPicCIrok3lR7HZscUHbASnFNUsqcPcFDOh6r76Y3pME3ay2bYIoVgZVi9KbnR5oQmxAMzYhq/Xfu8WBbE/QupkpoSMjnnkVTPY/oGxcw39xQNeHCH6t4pAtanI8+REhl8LxCVn/fSkhKpYMtJYxjJQQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718755; c=relaxed/simple;
	bh=wFwzmNCdKu8b9erftF9cSGl5y4Hy2YRxpxwu90vVYiA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SkQjfF1e0804+Cjj5ACB4JP//T1WCDQ3MhnnfMMaawJ6AZzXUcnajKtOX4PkQAjqZA2R0mqCVyRKslPpuYnZA6qHEkKipN/J0J2njMrgFUmRbzR9f2kqDU9QqHbJyVSjSuOk5AEkQxwGqcQ2qKJhicAuKmxIbvmc510eLYoHSNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Slr/VfcT; arc=fail smtp.client-ip=40.93.196.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Slr/VfcT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilmmwOjMPtCmROvs2J/wxYjgDkIWBTCCoPcTQHISSbDw4C7THmKQAKBl1GoxmroCABR4mMZSuxCalnSfV++0ndOH7vNC+FO54Zc4Qu5FQjF61uaRHdXG2ZtoPlVom0D8+j6HGJC26h29jTOVUMKDzUyHA8yyJsU4OjatfHNbAZwB/BEpFtrBCsVLoj3ZJ48Eo27LVx9WffTvby6ohwZ3SiWTf9mdBc7imXofrjdHZNt3Pqo/b0UHHXqIYaM9UN86HErvimkBfMacKTEo2LtiPYcdA8narJuOR8oxVv1AnLzWkU3OdQvWZ1YsI26dGoFDhRMhWNSmYeWGOwLbLclLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B155qYazDaDujylepDNUo8yo5Q5fLQVSMGUQRqkmnX0=;
 b=A7dw2o2wd+m1wLrEu50JJhDoPxNOVIWo1V72My8LNXcfLdg2hH9i9AQKXQwz7jPgDjEgsZfhu9CWiraTViTl0nP/21Klf2uMNaM/DnnHdeQ6evRDkBD8mtmsOHB9D4ErM2mWXAAsplSv2uU7bOhg6GdKOoSaoWupVmjTwQ+fQicXhUTFPqsljdxyrUVd8vWujRyGEaWiKDdKQia+GA3IxIJCyNR2H4kuV4Xz+cQKtH5BBpIsd4GNBvUnReIfv+u0vbaga5HuSJYgm2m67AWCjHClwk/+BufzGwZtVbf1yBVPoxOHUaEU4iVuBzIBDjrX493Z7AtZOF2S0TJq6WXHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B155qYazDaDujylepDNUo8yo5Q5fLQVSMGUQRqkmnX0=;
 b=Slr/VfcTGNHlnnUU4qkPwg055YUYWuPHbu945oEwcbVERJL0jDvttKS471SdLsNm62jQNH17H31lpnivk8qknsLCRoCakX9xjzwmEEYCcMEMlMa/CMblM/0CgpGBkAuWekY76zCScJzhvssd1X8Zzq/kblpgX1b9j1WGHm2BgwM=
Received: from BN9PR03CA0143.namprd03.prod.outlook.com (2603:10b6:408:fe::28)
 by CYYPR12MB8989.namprd12.prod.outlook.com (2603:10b6:930:c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 14:45:49 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:fe:cafe::77) by BN9PR03CA0143.outlook.office365.com
 (2603:10b6:408:fe::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.15 via Frontend Transport; Fri,
 14 Aug 2026 14:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 14:45:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 09:45:43 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 09:45:42 -0500
From: Tanmay Shah <tanmay.shah@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Tanmay Shah <tanmay.shah@amd.com>
Subject: [PATCH v7 5/5] samples: rpmsg: add MTU size info
Date: Fri, 14 Aug 2026 07:45:24 -0700
Message-ID: <20260814144523.744382-7-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814144523.744382-2-tanmay.shah@amd.com>
References: <20260814144523.744382-2-tanmay.shah@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|CYYPR12MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e309696-7f04-4145-c129-08defa12b822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AnICwkTYpwFgsb44DzJpPsK4CFbkgxHhdw+6kmfXy8qr9Ea1b9Ymavaes+YcCiUI57P2u/bhEOKgAmegy9sfQuciA7GaIepmZ9jUhchcwwqgLlKuCDjpFO4gzSLPwrNov/7zBM7snZ/ZIk1Fdph/8l6WHIhb0nczofF1aYpCbTO1RGvHalHLn+cjBaa91U/D9h4vRaDqTe2X6G/1+TGKqPeaeGZA8+s8HuDVYxmRimd2tCBZxfHF1fRYDM88VQAThlOCa3fXt6HgBnYmZLDkHtX6NTUoGBUxh2BaAPEve4bCeXjFMKSUbxwjAbn46RihGE/NvzgGvhPE7mAWQdq3I9VCPJM3Bz4ncpnf7K8QlxM0Rgc2ugLNY+pFs3c3zN2qGSdheW2uy2cAYJTv6LNi1zlMzRkN6CqhkWYkm8R+7SYGfzPKAwqbUsHNQq2G2t38LB+T5fX8asFjlJ9mvZaJVyCqRj9OUh/XP6zvlEKNIQN8YUd4QilM3GjsmaWPzx7HIsdS9qu+GIYEW1AtdRHo3tyL1pvi9Jr+3Sa9b9Gv2ef+C8prOFzfUAO2pAvzv+1NJmxvO3gfF5fgN5unKTQtfegjWk72Lurm7/t5HpRRAU87ooNsr//3IdgfKUVi2jDrWW4SX3uggJtE1KsvmEIe+a6oQdkEmswkqBrdjLeEYfMX5nPr8GkguHqyhzD+B5Far8+/ONEhUphTEKvtauX4jg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ALG/HcmC/B6aUPtud1tWSERCdJWH05TDTYkg9LIQZn/Q+U+kOkvuJSTxUFy1UjAEhJCfmGYQltz6kcDowICufFREeVTIMarwnwCKYClM0KWYchEM7viBrCPpeP47Qg3Mg6m2hH33uu8nN7SJNqBU5tyiRNMo2IVuPw27cvwyVpK449i5yMdPYOz/AWPbPODPPTzpW5qbrrvoEvXA2VUukRWgZPOTq+nvau7bJf+tWb1re2wimeG5oqqBVGyb82o7D8MwkLfWZG7EHlZ3lnLUjqksVYJolIrJI2IAzgD1kynf5a4/bcjK79CL2RpxzCjkAiJVfULuUvNNOc22NTLpjox0XRethrlYRXpNypOQMwUSV4DLNndl7Ft+3jZnr48pWyr0Bg8gT5mSqRO7Ai2lGGBXAINZdFOfoFfiIziqOomBIuKysJS/MaNj71yK5+On
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 14:45:43.8396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e309696-7f04-4145-c129-08defa12b822
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8989

RPMsg MTU size can be variable now and no longer hardcoded to 512 bytes.
Add log to the sample driver that prints current MTU size of the rpmsg
buffer.

Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
---

Changes in v7:
  - Fix commit text and move change log out of commit msg.

Changes in v4:
  - check msg size is < MTU size

Changes in v3:
  - Check for error when retrieving MTU size
  - %s/mtu/MTU/

 samples/rpmsg/rpmsg_client_sample.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index ae5081662283..4c43436aadb6 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -52,6 +52,7 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 {
 	int ret;
 	struct instance_data *idata;
+	ssize_t mtu, msg_len;
 
 	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
 					rpdev->src, rpdev->dst);
@@ -62,8 +63,25 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 
 	dev_set_drvdata(&rpdev->dev, idata);
 
+	mtu = rpmsg_get_mtu(rpdev->ept);
+	if (mtu < 0) {
+		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
+		return mtu;
+	}
+
+	dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
+
+	msg_len = strlen(MSG);
+	/* make sure our message fits in a single rpmsg buffer */
+	if (msg_len > mtu) {
+		dev_err(&rpdev->dev,
+			"message size %zu exceeds rpmsg MTU size %ld\n",
+			strlen(MSG), mtu);
+		return -EMSGSIZE;
+	}
+
 	/* send a message to our remote processor */
-	ret = rpmsg_send(rpdev->ept, MSG, strlen(MSG));
+	ret = rpmsg_send(rpdev->ept, MSG, msg_len);
 	if (ret) {
 		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", ret);
 		return ret;
-- 
2.43.0

