Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAE1422C4;
	Mon, 10 Jun 2024 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718042793; cv=none; b=gWIlZCLpbAgmbOK0DRndfUZevUmOZ4gt+2TtHGPuQncojI9zHKkN8p5TQQCszcXNEwbhnWb2Lh1uFzdB2KDf8ixDUmdc61flbMgnLMA1A+F3eA+ktZGvFajVydUtypxrk0owB28Oxs8Ld4lf8afTvGVf1TmjH1JciQJmDSQQCkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718042793; c=relaxed/simple;
	bh=GnrUxlnHrwPyJRes+cN5UxobBbSWYhOftSaluBJYH1M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SNrBmNVXKYwinsy457DG3txPwt5ziQzeJU/xnu3z+K2UaONhUuq770XgXWRj3Nob4fMw6C3QjyfFR1zfXeMv/JFQmKjV1afK9XAr171GuM4svyLOIB8+C+/gbGexkg7UHPmgd6DfzkTy3QR32R2wglqjYHPbjs51cmWujgB9OBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YAoqrMVT; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YAoqrMVT"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6LHv063729;
	Mon, 10 Jun 2024 13:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718042781;
	bh=UH/RJcnNDW/e+Ifl2HTDQpGumrk05KMUEtrf5mD51jE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YAoqrMVTQ7UjiFGyPKHXd1aMtTWAWQQbdZt3WqaquOBn8RjsJr7v43c9N2OzCZBjD
	 Nq+nbKioDU3KgxFdgkQL1/f8zH5Sx+2V2T6VVHtC/xB4sWwFwuxfkbN99iA8jQDwUJ
	 PyhW7NyZ1qZkHKNe4DuqdnjfHrmcCmk3oohU6GwQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45AI6LDB014827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 13:06:21 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 13:06:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 13:06:21 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45AI6Gtn056905;
	Mon, 10 Jun 2024 13:06:20 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth
 Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo
	<kristo@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hari Nagalla
	<hnagalla@ti.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Andrew Davis <afd@ti.com>
Subject: [PATCH v10 8/8] arm64: defconfig: Enable TI K3 M4 remoteproc driver
Date: Mon, 10 Jun 2024 13:06:15 -0500
Message-ID: <20240610180615.313622-9-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610180615.313622-1-afd@ti.com>
References: <20240610180615.313622-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Hari Nagalla <hnagalla@ti.com>

Some K3 platform devices (AM64x, AM62x) have a Cortex M4 core. Build
the M4 remote proc driver as a module for these platforms.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee41..b7a3488ad4f94 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1369,6 +1369,7 @@ CONFIG_QCOM_Q6V5_PAS=m
 CONFIG_QCOM_SYSMON=m
 CONFIG_QCOM_WCNSS_PIL=m
 CONFIG_TI_K3_DSP_REMOTEPROC=m
+CONFIG_TI_K3_M4_REMOTEPROC=m
 CONFIG_TI_K3_R5_REMOTEPROC=m
 CONFIG_RPMSG_CHAR=m
 CONFIG_RPMSG_CTRL=m
-- 
2.39.2

