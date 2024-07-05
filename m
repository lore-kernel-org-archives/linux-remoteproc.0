Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C016A93F;
	Fri,  5 Jul 2024 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720195475; cv=none; b=XI52DBdFfkPcLkrThbichj3yNEZJ45M5K/eNsqdkh9Ls3GBW4e99BXzLjRI7OGU+9M9N6OKg1lnSoB0MAoEtDmF/iluevpaAjgcxCvvQbvSZJlsL+rToO9GTg04y2scfklZxX6cmslZn75ejX0+wHCvEboaj1tQopbsD/ulNtW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720195475; c=relaxed/simple;
	bh=7SynWHHBuqFe3HgOFQJijIONqO1w8lyA7ZQo45G4wrA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sihUjTXIOyx7hLg7iiZwJ+cZS3f6kbnyAw+nK9dxxtlsixj8cUFCHMc6KJZQVJs2Mo8hFtFTBxSox4NjlGtiKfoDDTzAaxMBQb41TE64z7Vw7SefNjlq0sNkkPky+qTvW+dn921uY7ICl7lkcqpKNNzhqM30L/xd70gZ7ejfl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=Q7RO3a22; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="Q7RO3a22"
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id BD16E100002;
	Fri,  5 Jul 2024 19:04:10 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1720195450; bh=PSUhGWftozkwODPH+8H3q/nMrrK4aDrUh1tSE1Yvgqc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Q7RO3a22IdmWNkaU7rZav/3RlxDylQPbgZzP/MP0lwGTUMmWi9tc5WPstaJ55hCa+
	 KhfE+A8usfEm8QTzn5eUCnZAyE2A5JyjcPelL7SbH854C0ynVzXldksLWvK4rbazgA
	 fFAysh3nCLBveXWdnRqStsfO595csAcQY+lgUWvv4vNq/IOwWEEpYr/TaKafBjE5N8
	 FtOu5h+AW+eZRJyq5FoEUSzea0zNbPAO4Q4o0pbmmf8M0amEcQ9zft6FoCICp8L7Th
	 HCMbDQ2IftFEIM6I5ZI3P0PPbsLQODR3kV08F2eFLhNimwLUOx9mxHry2VVAZIgM3C
	 E/p0IWj4yYUcA==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Fri,  5 Jul 2024 19:03:26 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.5) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 5 Jul 2024
 19:03:05 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Siddharth Gupta <sidgup@codeaurora.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rishabh
 Bhatnagar <rishabhb@codeaurora.org>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] remoteproc: Remove unneeded check in elf_strtbl_add()
Date: Fri, 5 Jul 2024 19:02:52 +0300
Message-ID: <20240705160252.9628-1-amishin@t-argos.ru>
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
X-KSMG-AntiSpam-Lua-Profiles: 186342 [Jul 05 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, mx1.t-argos.ru.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/05 14:29:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/07/05 10:39:00 #25854340
X-KSMG-AntiVirus-Status: Clean, skipped

In elf_strtbl_add() pointer 'strtab', which value is a result of shifting
after dereference of another pointer 'ehdr', is compared to NULL, which is
useless.

Fix this issue by removing unneeded check.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: abc72b646066 ("remoteproc: coredump: Add minidump functionality")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/remoteproc/remoteproc_elf_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
index e6de53a5000c..7c57fb553466 100644
--- a/drivers/remoteproc/remoteproc_elf_helpers.h
+++ b/drivers/remoteproc/remoteproc_elf_helpers.h
@@ -107,7 +107,7 @@ static inline unsigned int elf_strtbl_add(const char *name, void *ehdr, u8 class
 	shdr = ehdr + elf_size_of_hdr(class) + shstrndx * elf_size_of_shdr(class);
 	strtab = ehdr + elf_shdr_get_sh_offset(class, shdr);
 	idx = index ? *index : 0;
-	if (!strtab || !name)
+	if (!name)
 		return 0;
 
 	ret = idx;
-- 
2.30.2

