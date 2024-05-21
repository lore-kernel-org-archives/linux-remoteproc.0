Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D5154747;
	Tue, 21 May 2024 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716279062; cv=none; b=J39t7LRHdECF7sTQ/tnRbBKVHR/MhMLNdCxBDu6Ojb8REn0tgIIB0jnVbhqlFOIkWCFV1k5p2cHudfeBxyf4bYm/SRvtEHFQB1haIWH6pig2tdng3ZQYolzlTM6Hqa+I3pLNOAgoa9C0m40OPoYW5hkrTK2cKgvV/i6R2zsSILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716279062; c=relaxed/simple;
	bh=tRtWXvRmmvqkinhupQgpJtxqWVRjvAuWR04ysYPq010=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WW2KPPi/NkWlMdRI05eM9KnRjqSR4tPNz7RJv4GnfKY3L4ZUA8g4NdawdYT9RNL6cs5nNpm08Xbb1oq0ODuaCH9vCRpy6tv+sq+Vk5IgA65JEVtmafqnfvHBj8UechMjhwKOK5t9/mgz7gSVKEPKq8UlaZ7hpmZJj200yqVF5G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BMe5rS/j; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BMe5rS/j"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L4IFiT015326;
	Tue, 21 May 2024 10:10:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=h/BYe+IPvwEdayQFcr9F2QpoCjyH9+vL5tKaqvoGH2Q=; b=BM
	e5rS/j3PIclWlNW6K1bA3IlwQ6D3DnrTcJYl8QYH9CGIZaBFweRdwKqZ/hqH0rlD
	4S85h3LJssPvPTne8M0xaMPI7bQS4zuayxuFWCqONp6lCsMjH+bGhcrEKYU6ngGQ
	c6pVkbbEch7SeqWZ4tHHWciEPM7h/Hd4ghPdFkajs/jD8ZrjBscJz7rxuc1PQ3oy
	dFID49my6Kto1olBCduumkr8/KXf7WGykVCCWyeFK70SfE4z8i9Q0vezYLK0tQcD
	wnJMWUIqamxFGsNvZHlnyI4G4XVeGHosx/zMrMZbck2f66Ig/AQ2T7xjT3MCDBNx
	DT2lfPOqRzdAYKyVE/oQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y6n33ag7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 10:10:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D87C4004B;
	Tue, 21 May 2024 10:10:35 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A4C42122F0;
	Tue, 21 May 2024 10:10:13 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:13 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 21 May
 2024 10:10:12 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 3/7] dt-bindings: remoteproc: Add processor identifier property
Date: Tue, 21 May 2024 10:09:57 +0200
Message-ID: <20240521081001.2989417-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_04,2024-05-21_01,2024-05-17_01

Add the "st,proc-id" property allowing to identify the remote processor.
This ID is used to define an unique ID, common between Linux, U-boot and
OP-TEE to identify a coprocessor.
This ID will be used in request to OP-TEE remoteproc Trusted Application
to specify the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 36ea54016b76..409123cd4667 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -48,6 +48,10 @@ properties:
           - description: The offset of the hold boot setting register
           - description: The field mask of the hold boot
 
+  st,proc-id:
+    description: remote processor identifier
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   st,syscfg-tz:
     deprecated: true
     description:
@@ -182,6 +186,8 @@ allOf:
         st,syscfg-holdboot: false
         reset-names: false
         resets: false
+      required:
+        - st,proc-id
 
 additionalProperties: false
 
@@ -220,6 +226,7 @@ examples:
       reg = <0x10000000 0x40000>,
             <0x30000000 0x40000>,
             <0x38000000 0x10000>;
+      st,proc-id = <0>;
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
-- 
2.25.1

