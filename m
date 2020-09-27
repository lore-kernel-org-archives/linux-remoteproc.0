Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187CAC4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B991C221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ra0wWNOw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgI0GPd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:33 -0400
Received: from mail-eopbgr140088.outbound.protection.outlook.com ([40.107.14.88]:64518
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GPc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsvEqRy3ogDDaZ/uIMGQF7fgbtWDx2o+rQl6h46xHUGOm6uAZ/iDuGDfrZP80PZs5R12wilsG0wFiKBqjeI/rLVnOeO87QyNtQQb6xo0vJqtfEKBrfsgAbarI1pKJXHMK8j/JFH4gGAdxZS0UNo2XazTtq0MCqkWZmjZvqlG49talfYdj1dX/mj5NmcSuNHglK+nNevHRcl1rox0xx2QAWJvHQK4p+87UTz3/+kTtrKW6rQS/FpZiRnNfEnaTVfzDQKih9bSjTL+lDSmqCYr3gLFqldSIFiajcZI3KtYaNjk/FtGz5rtV/mdnH22CghY9JFSOVkJfpnascNWQC5YtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnD7zR6yW4Wrxd9g9IZdK+5bpkY4Iazc+CVkdXkyw6E=;
 b=OQwwzytZi53MABQ67NistOLmcQo6WXlq6jOf7kvIggLVjCf4etvzmUBcOZwwt+uVCr7faId+qttkpW4mhZf3oHChnk4PfkULHGCxs2eJCEu45MROqhawtjjsfEVu26yOJHEkXS4LiW803qOq7cZJ6gaIFCSVr++unGdzei+1nUMfDV2e/qpmJiTojAWdcT9zRTUslzqH2VcmfbCYbn0p0AzVqEJeE0bDoO7u7AnIqnsBzaFsBndPQeKrcnE5ftV8Hndcex/KY3DH1C2cbkbtGwGgpkPbjvuvJ016eFFw1pYBbaQckBQf2cl7af7qqbjYOA6sMr3zoZ1HOc6nr9fC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnD7zR6yW4Wrxd9g9IZdK+5bpkY4Iazc+CVkdXkyw6E=;
 b=Ra0wWNOwmx/XECLloqkV6pZSssRDTj1cwiW7ssMKmZ3YSnooCrk3GEuGBRaE0pcCzfYVxCfWehOhXhpefFcn8j5gtQ2m4DH6Rqa3Fb9OASyRstD36D4dNvzurZe1WOQA3SVRmTs4yUgcZjOtiFcdXnliojTfUFHog1j/x291RUc=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:28 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 1/7] remoteproc: elf: support platform specific memory hook
Date:   Sun, 27 Sep 2020 14:41:25 +0800
Message-Id: <20200927064131.24101-2-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:24 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d778e600-688c-4a2b-b6c2-08d862acbabb
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4633EB3710DDD237A7B6804488340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4jCCkPrrNe3ESE1SkCZ0aEvYV6TSLRmeqNVHVFnuMEecr4CqYHEQnh9xnEJ56wionILLM6W2ji0/SUn7TyI8iVwLvWHwe1KJaGRxQhEUXhDHvA6mOTMwMXV7k/OMgWejlYBoNRp3R6fhppqPuz9NFPNGXUz+2EMMwLaEW48GbAp0koTdNYfNudv0d48QrjgHnBwdWMLTKmiPQHfBi2Bi+mjLXpFbgpjGLA50NVRbC14kJ+ewauC6QBzN/T07Vf8NVY0x3qLgqxCoXRO5QWVL4HkB1mNNLaipSQrLBcbJr+h4rbivWvcSGLOwcODYBGXCLRW9wYpBjNxOeftzj8cJRh/VzJczx6eLiYOfV/m1eD8bPW7E9+M1ZMj8Dubrjye
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6486002)(54906003)(316002)(36756003)(1076003)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: MCbHYMHQ1D7uwQuSbwN8EnFj6vYaInGO7frxBglo0MlAEokbR5ZmPk09qCglojQTjw0Tf2iIebC4u+xMo/B3V//ReIzYxoK5SqxjsJEBH5REHm4oMhtUUUNJByct+/dQe4kGG0BNn9v5NTrc018/xEO7VsTUVMs1w3aUVGV86Y9XtOKwudcuGTeAPt4M9gMVppuWx/unArNPeRmsYEDUIgkzgkkO7sFk2Y0HWPXNlc2mCRPlIQOFbmqlJ3cqZG8IXCA71MFBQqC4VMylWb/azgM+l8wxt2pI2MIGevgJmxlcHmQSR1rD2CCHkin8gmhXcyYFL/KpfhiPMKNDOs3ZrukNtiGtuTbjq4Xpnv261e3iLIowj7SrRRBovSDwsZCkTpb1qW6kCNLyU+wwy2r2XaNgBBdfDmsDlLOzFJOARGuAHPTK6WcfTwo/euYw5nBi2QvfRlFpylj0qb1tS0rQdDHL6UoYGKFxQb6JeB4yDXHV2IyctwJtMQ4LPJTzBHYV5efexI6Ko0xyU/mCz4/BuqYiquLfGNbW8uxND21wtwOlPk/zH/zcuotIwdpmHTilFLaEvn1qBzhunKf7LEaLTcBdfwFKOmgMRK9inzeYxPF8PEenQUt+5J1VRAZIbn2rufAI2WZ0IteQbwx3yu4RHA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d778e600-688c-4a2b-b6c2-08d862acbabb
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:28.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBhi45HAt+MIKxndig7mZKyZT5IfkZHqrc/BqUypaVfjaUcHnFhYqk98NlsDGaIfzCraSl3n5GqDQXLu1B+WkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

To arm64, "dc      zva, dst" is used in memset.
Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,

"If the memory region being zeroed is any type of Device memory,
this instruction can give an alignment fault which is prioritized
in the same way as other alignment faults that are determined
by the memory type."

On i.MX platforms, when elf is loaded to onchip TCM area, the region
is ioremapped, so "dc zva, dst" will trigger abort. And ioremap_wc()
on i.MX not able to write correct data to TCM area.

So we need to use io helpers, and extend the elf loader to support
platform specific memory functions.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 20 ++++++++++++++++++--
 include/linux/remoteproc.h                 |  2 ++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index df68d87752e4..6cb71fe47261 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -129,6 +129,22 @@ u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 }
 EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 
+static void rproc_elf_memcpy(struct rproc *rproc, void *dest, const void *src, size_t count)
+{
+	if (!rproc->ops->elf_memcpy)
+		memcpy(dest, src, count);
+
+	rproc->ops->elf_memcpy(rproc, dest, src, count);
+}
+
+static void rproc_elf_memset(struct rproc *rproc, void *s, int c, size_t count)
+{
+	if (!rproc->ops->elf_memset)
+		memset(s, c, count);
+
+	rproc->ops->elf_memset(rproc, s, c, count);
+}
+
 /**
  * rproc_elf_load_segments() - load firmware segments to memory
  * @rproc: remote processor which will be booted using these fw segments
@@ -214,7 +230,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 
 		/* put the segment where the remote processor expects it */
 		if (filesz)
-			memcpy(ptr, elf_data + offset, filesz);
+			rproc_elf_memcpy(rproc, ptr, elf_data + offset, filesz);
 
 		/*
 		 * Zero out remaining memory for this segment.
@@ -224,7 +240,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		 * this.
 		 */
 		if (memsz > filesz)
-			memset(ptr + filesz, 0, memsz - filesz);
+			rproc_elf_memset(rproc, ptr + filesz, 0, memsz - filesz);
 	}
 
 	return ret;
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 2fa68bf5aa4f..1f5fa2c772df 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -392,6 +392,8 @@ struct rproc_ops {
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	void (*elf_memcpy)(struct rproc *rproc, void *dest, const void *src, size_t count);
+	void (*elf_memset)(struct rproc *rproc, void *s, int c, size_t count);
 	unsigned long (*panic)(struct rproc *rproc);
 };
 
-- 
2.28.0

