Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4402029CE7;
	Thu,  6 Jun 2024 07:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717660446; cv=none; b=M7eIK3fedq6IVOkdFHF0gErz3hVDNAeGwkFiHLmOSiAA00J3KniipBwgp6m+Bb2zUwarN1RiMTlIfm9vT08nP2vhVpAlTTVfRjF6Y1SmT83Wyftz8XW2rzQWON4E5wVBIpxJwkSc7TEB5IxUSRTU5ogHqwT4LnfuZWYklEhhDFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717660446; c=relaxed/simple;
	bh=0eHWKmq6DgAnQMopQxlhQQ+wYbXZJwu+2Rydq21zm1k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P5RfnKqGycJdbn0MBx4VdXGeX0T4ce9pbtNJVJsVDkt56qMB+80NrvqkC8jpF230hRvYnoodYZit20L4tVeCMNPl5RMMZ/xAUVhjLl1Mr5JdUXbpb/Di6ohhcYmsAE92M4vhtVyVkqV9PDd4Q5A/sVCYRwJ6Pe/w+J23IlkhwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=m5PdVe20; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="m5PdVe20"
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 33865100003;
	Thu,  6 Jun 2024 10:53:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1717660424; bh=gW9ORV3gxogsqQE+vcvVzXZfgTh4/T9kCBioOXKDrlY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=m5PdVe20m4Zw/kujZC6//s+1uPdkKVN1h6go9RGX8BlU72Ai+5yFsiZYZyU9I8qrX
	 TGta/kSpqk3ECZbwDjbvLALdWgVB8cxv47Ukjz7dyybNveuGtQKVR05etGEQ/bSDkM
	 NPfHglajH96oyesvkoOmTkAmn6SjG9ydMuNy9LaYNmAQSrfq01ig6mWlFIKp+dbNw7
	 mfcL3cRp/wA1U3m4i7p4R1vYfMzRsVjPHlOeJFDPrrdZJu2Dm6pyqDgSHPOqyyimpU
	 SvrQfb2w94RZ8D2tx9Qs3Vv5um/RpyfPeFiYrr7uos/QoxXlpqu4mdiTn42/Q82DDM
	 mu37CMDR03nfA==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Thu,  6 Jun 2024 10:52:32 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 10:52:11 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] remoteproc: imx_rproc: Adjust phandle parsing issue while remapping optional addresses in imx_rproc_addr_init()
Date: Thu, 6 Jun 2024 10:52:04 +0300
Message-ID: <20240606075204.12354-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185754 [Jun 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, mx1.t-argos.ru.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/06 06:52:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/05 22:40:00 #25473187
X-KSMG-AntiVirus-Status: Clean, skipped

In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
number of phandles. But phandles may be empty. So of_parse_phandle() in
the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
Adjust this issue by adding NULL-return check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/remoteproc/imx_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 5a3fb902acc9..39eacd90af14 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		if (!node)
+			continue;
 		/* Not map vdevbuffer, vdevring region */
 		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
 			of_node_put(node);
-- 
2.30.2

