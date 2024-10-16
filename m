Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31F017333A;
	Wed, 16 Oct 2024 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729096910; cv=none; b=oy2jWShGLRdMjwQD35jfBVq8A+j/v2BiFlXgJH6/X2apY4JyTuJwrEsZm7DVuu3q7VT60PFPK10d+4IDXzHfgZ6WMT0FY9BCs+veo0snWF5td84gTKYYGFpv8KZmDmq7HAjmKcs2SWH7fV//soN3zAdLkB4TmOElvLZeS5/clGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729096910; c=relaxed/simple;
	bh=AyZPycljZTSVnfuog5VBbTUyoxo2Q3r8VWdevGLJEP8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rPzk6JMGw48AfnsOZYs71QA7gzpttT9eHlu+ww536S2TnXA6+OQldh0eCD6Zd1TNTGeEtybZynpa/K23cIWB8PvDNmOrSyyVvBrB+JiGsA3ND9wmTgmo/obsiFVXTSZ1aZgB2z25myfwej1MoT2DDqEDy7FXkFEAG6Wg7310NXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=o5zD6ueO; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o5zD6ueO"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfhHw087888;
	Wed, 16 Oct 2024 11:41:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729096903;
	bh=oZ25tm78B0m9rjNNl/PmDHLGlO/bUG9O1S7GRxQ0Oc8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=o5zD6ueOtmt6Of0ULmRDEjpMm1O/hkTqCp+YdA+WY9P6Hu4+a3Jnkh9/hK4JDOCtO
	 1C6obDVYbD7CajtwxNPdkKDq01BVeXv8iEjuHCJmK32BSJh/HoBsNvIWmT5Z3YAg5P
	 WYVz93JfSTgCbyAW+i6yw2wcpdwo060D/CDdHOfA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49GGfhsZ034189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Oct 2024 11:41:43 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Oct 2024 11:41:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Oct 2024 11:41:43 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49GGfgat109164;
	Wed, 16 Oct 2024 11:41:42 -0500
From: Andrew Davis <afd@ti.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>
Subject: [PATCH 1/2] remoteproc: k3-dsp: Add compile testing support
Date: Wed, 16 Oct 2024 11:41:40 -0500
Message-ID: <20241016164141.93401-2-afd@ti.com>
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
index 62f8548fb46a5..0ac1c8a6e4581 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -329,7 +329,8 @@ config STM32_RPROC
 
 config TI_K3_DSP_REMOTEPROC
 	tristate "TI K3 DSP remoteproc support"
-	depends on ARCH_K3
+	depends on ARCH_K3 || COMPILE_TEST
+	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
 	depends on OMAP2PLUS_MBOX
 	help
 	  Say m here to support TI's C66x and C71x DSP remote processor
-- 
2.39.2

