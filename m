Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38B71F0E2F;
	Mon, 16 Jun 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060723; cv=none; b=WZndrms7TqLWbjZVuEnBNve52oEgZaS4LUDMd9A7J6LZl2pm2xUAj5xMn/vHkBY/djh2Gpj58/vmU3swgXkQTStRog4VVECL7tMhPF+n0E2r8XsnT1USV67w2Q5cWoRvLhCvaioj3ItWIuFkcmMcQpPMlC39LtBWxSNV6k/UaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060723; c=relaxed/simple;
	bh=/UaD7L2Vb27H17GtHN5VEE3MuD/tl/8GVoHJYXhqnsI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UF6tcZuyu4NJyOUu4ZXuzznXbKHpghmkStunDYygH1Wj8pORVsKiclv51d5CDj0GsApkeNGDg/n60A3VnI59KkiqHzzKXooAPq5pjO9OfPo3Xyg7dWERxjUQ+mJ3i8/MnTkQ36S+aj04EzxhGzIl+AliErBjTtx7v16Xse7+SMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=E5FwRaex; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="E5FwRaex"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G7pBJd031098;
	Mon, 16 Jun 2025 09:58:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	oRoK+To3ECSWyMsKvQou69OpviNdWWWWDeXdSq5d7yw=; b=E5FwRaexgoRuIF8o
	uFNgFXyRMqotviy0+jA3cRLtsJpsokZwAVdeFUjl9xJ9WuwZ1D85kvWBcCbGw/pg
	wDCebVAUk3nJri1O7c4n4FdiYiiUXrEq9K0wQ/Cpp3e5NrhJ1R9FEtq0UcDK6EAm
	QfVt7MRChwI1h/LmOlyL7UgnBIjfEM04F23qNUmmOujz2ullceMacdbfiIYzMKva
	UU2awaauh8FivqOkWxBR0w4M5w553rAUH9PjUJAK+En35N2m73SxHaBr+pxaHg+j
	Z4FLZmtP3a+oR+IDrN7VtyOAAzQxlSO0c/M9FhD5Q6j1iMplts+4S4hbe1GEVIwB
	YA4vZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1yc7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 09:58:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3FA454004B;
	Mon, 16 Jun 2025 09:57:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 545254CB03C;
	Mon, 16 Jun 2025 09:56:23 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:56:23 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:56:22 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v18 5/6] remoteproc: stm32: Create sub-functions to request shutdown and release
Date: Mon, 16 Jun 2025 09:55:29 +0200
Message-ID: <20250616075530.4106090-6-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616075530.4106090-1-arnaud.pouliquen@foss.st.com>
References: <20250616075530.4106090-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01

To prepare for the support of TEE remoteproc, create sub-functions
that can be used in both cases, with and without remoteproc TEE support.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 82 +++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 431648607d53..db82d4308376 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -209,6 +209,52 @@ static int stm32_rproc_mbox_idx(struct rproc *rproc, const unsigned char *name)
 	return -EINVAL;
 }
 
+static void stm32_rproc_request_shutdown(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	int err, idx;
+
+	/* Request shutdown of the remote processor */
+	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
+		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
+		if (idx >= 0 && ddata->mb[idx].chan) {
+			err = mbox_send_message(ddata->mb[idx].chan, "detach");
+			if (err < 0)
+				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
+		}
+	}
+}
+
+static int stm32_rproc_release(struct rproc *rproc)
+{
+	struct stm32_rproc *ddata = rproc->priv;
+	unsigned int err = 0;
+
+	/* To allow platform Standby power mode, set remote proc Deep Sleep */
+	if (ddata->pdds.map) {
+		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
+					 ddata->pdds.mask, 1);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set pdds\n");
+			return err;
+		}
+	}
+
+	/* Update coprocessor state to OFF if available */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int stm32_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -519,17 +565,9 @@ static int stm32_rproc_detach(struct rproc *rproc)
 static int stm32_rproc_stop(struct rproc *rproc)
 {
 	struct stm32_rproc *ddata = rproc->priv;
-	int err, idx;
+	int err;
 
-	/* request shutdown of the remote processor */
-	if (rproc->state != RPROC_OFFLINE && rproc->state != RPROC_CRASHED) {
-		idx = stm32_rproc_mbox_idx(rproc, STM32_MBX_SHUTDOWN);
-		if (idx >= 0 && ddata->mb[idx].chan) {
-			err = mbox_send_message(ddata->mb[idx].chan, "detach");
-			if (err < 0)
-				dev_warn(&rproc->dev, "warning: remote FW shutdown without ack\n");
-		}
-	}
+	stm32_rproc_request_shutdown(rproc);
 
 	err = stm32_rproc_set_hold_boot(rproc, true);
 	if (err)
@@ -541,29 +579,7 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		return err;
 	}
 
-	/* to allow platform Standby power mode, set remote proc Deep Sleep */
-	if (ddata->pdds.map) {
-		err = regmap_update_bits(ddata->pdds.map, ddata->pdds.reg,
-					 ddata->pdds.mask, 1);
-		if (err) {
-			dev_err(&rproc->dev, "failed to set pdds\n");
-			return err;
-		}
-	}
-
-	/* update coprocessor state to OFF if available */
-	if (ddata->m4_state.map) {
-		err = regmap_update_bits(ddata->m4_state.map,
-					 ddata->m4_state.reg,
-					 ddata->m4_state.mask,
-					 M4_STATE_OFF);
-		if (err) {
-			dev_err(&rproc->dev, "failed to set copro state\n");
-			return err;
-		}
-	}
-
-	return 0;
+	return stm32_rproc_release(rproc);
 }
 
 static void stm32_rproc_kick(struct rproc *rproc, int vqid)
-- 
2.25.1

