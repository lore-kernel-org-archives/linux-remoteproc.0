Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A24F20FAA6;
	Wed, 16 Oct 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729096914; cv=none; b=cAfv+fdPj1sPLU3jTHjaEFvhUn6WYYMuOdKu4OFWKeYlMLDsf+O9+70jL9ie2IMKUK39/MGSqWPNEgfehw1frwhSOKMr2U16sSrtmrGIkWGHlWumnHf2PluwXTKstFqXx3tQ34ib0X5dN8L0bFLmDumra7M8745DvQogoekp3/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729096914; c=relaxed/simple;
	bh=vpxmRfe7eX0i2m8GaABlDnFDeb9ilOtpSvePKWS2x3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fpY8EEuOa2XTv2fwJ6u6hOmFrrIbFx4fdYV+xjCCZocRGIq89gD6bb+BiIRs7/lk7SCsTmbjK2e/B77dFVjleEkG4rSqQJc/BO647+rrSF/Q9W4CjtqSzh1DHnS+lvt+msn9uhzcHfeYIN7L9TZSaIVaiTx14z89VKelt3Uu/UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oa/lRaH6; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oa/lRaH6"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfhSP050039;
	Wed, 16 Oct 2024 11:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729096903;
	bh=AoBAA8iILvkWEy2WAu3S+EpXX7C0k3MpH/Vj5o7teNk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oa/lRaH6x5rf32Y5/n0Y3uQJI+5u3EAHfndO+Jainp+eeKagirwu/SoqjzyCXWdfP
	 0g+lmJNemVaS2KUsvY4JQJUkkMuNSGvqCNcctY4Uzn5bFNkcVJIeXjsD9PUfC/hxzh
	 tg6TLzYQ64niDki1sYo4vbC/Ox0Ze+2UmgT5nrA4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfhww125462;
	Wed, 16 Oct 2024 11:41:43 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 11:41:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 11:41:43 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfgau109164;
	Wed, 16 Oct 2024 11:41:43 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 2/2] remoteproc: k3-r5: Add compile testing support
Date: Wed, 16 Oct 2024 11:41:41 -0500
Message-ID: <20241016164141.93401-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241016164141.93401-1-afd@ti.com>
References: <20241016164141.93401-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This driver can be compile tested on non-K3 architectures as long
as TI_SCI_PROTOCOL is not compiled as a module. Enable this here
to improve this driver's build coverage.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/remoteproc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 0ac1c8a6e4581..83962a114dc9f 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -355,7 +355,8 @@ config TI_K3_M4_REMOTEPROC
 
 config TI_K3_R5_REMOTEPROC
 	tristate "TI K3 R5 remoteproc support"
-	depends on ARCH_K3
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
 	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's R5F remote processor subsystems
-- 
2.39.2

