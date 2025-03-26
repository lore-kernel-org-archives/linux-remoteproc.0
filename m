Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6431547C0;
	Wed, 26 Mar 2025 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978599; cv=none; b=FJgqaKWlRxJ6LHhEFoOFxd04PMVhHGRc9DmL50dXdg4sf+f4igTd1mw8WOI3qVXIzM5YxRCvW+aMz3WvImDB0mGbqMvCTMe1wU+DYXZAdm3lhOnlKz7WEhZQ8UbHgSkT8qfBEL9a3SJrAgT3LOLEcipIZfCOoxsKxJ+YTTO4le0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978599; c=relaxed/simple;
	bh=4l7vlhJA3EENd5t9D26zfYMMPZkHcSqBOes9iuJ2l5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/xk8/aj2lUu1bz7kZSEG2FMzWsZ+Lh0nrtpnXk1jWU7oP6PLhDLL2QLGhVicYneaS/7ZDbzpF1Ly28EQW8/GS78l8zsGtEtFNdUwtUToKIaKfPZyhouGl77arv7/b4pO+O3x8HqdXmERuDoH+MjrsCFZ9zvtsENHg173vQMewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kZtf6gQt; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kZtf6gQt"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q7YPIE019497;
	Wed, 26 Mar 2025 09:42:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	tjQ6jzp5petaGXfP90uNsQR+cc1MZ23TGQzGVRHgV0E=; b=kZtf6gQth6RK04zU
	1OQPPLmEdGqZICiwIrbCfRTqLX5vuWf7hLrbXnfQOG9FVTqovq87y3Pe0JuKvqNF
	kC7DmoL/H5DVauLclCJcplVXEWkNRh5XbsNd/yEkOzgTsQCYhnAej5nDsZ1v+rja
	kF4XkCSnV0k1q1Dcw3KpHnH1aSScCj6SiYmKt7sZd/qVQfFmwCJvZ9ZQfuUXtD7E
	6fIIWAkkn9EBjC3rBuGU1Dkrt1YuK/A2AAJi3kPHJ0DHsPZJCwmekp8G5ZfkRZOy
	KLdTDiEHCHXLGcGJ75oTwrnNIgugBj/TMEoXqflWLgJg405XOGkH6NMK9LixN9iQ
	+OcihQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45j91se31e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:42:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A138340053;
	Wed, 26 Mar 2025 09:41:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 048BF87F424;
	Wed, 26 Mar 2025 09:40:02 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
Date: Wed, 26 Mar 2025 09:39:11 +0100
Message-ID: <20250326083912.12714-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
References: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01

Add the 'firmware-name' property to the remote processor binding
to allow specifying the default firmware name in the device tree.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 370af61d8f28..a0a16bfe8ef7 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -139,6 +139,11 @@ properties:
       If defined, when remoteproc is probed, it loads the default firmware and
       starts the remote processor.
 
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    maxItems: 1
+    description: Default name of the remote processor firmware.
+
 required:
   - compatible
   - reg
-- 
2.25.1

