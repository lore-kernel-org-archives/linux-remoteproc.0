Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A73208A8;
	Fri, 21 Jun 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982073; cv=none; b=grhqMP3iEBrBFhq56QDePmeBvCnZYYPuO+hjFPoYj4fjT/oHpaOetfdI/awzlwR4fLgqPBW6tL1KIYhEcRtbyA9iWq4vA9l4Wprdz6zF/2KW9ET5dt61A/hIHCSyv25QCQWhn5FwNHSKz/Hpjf7Saz4aD2SNguEvedNSwt1OEoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982073; c=relaxed/simple;
	bh=t0Qy22MrGv3aVpFGYWrgqFZdFYqVsgKbZyjJjDqP0Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnDigFpZemilP9+wePJUy0NkGxGPK6VfmWsre3SXBEz99g4sj73e4GNN9wIu0dQTOmphY3jHyIvblcEptTFeMUVhGE8wkq4Cvmnn6Dvh8Wz3uIIkW7SeYc+QiNn4qMcWjsCQT4r004pq1whMxOgo6j/sJdWnMlviw+nZ2wmoSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=h3xUw6mt; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="h3xUw6mt"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F1EC240007;
	Fri, 21 Jun 2024 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BRiKHP7y9+z4NPu0dePgtaqHBp5JIDPh01b9uiscGo=;
	b=h3xUw6mt7PVsTONuDgVf4uSSsqKw8mg432SKkz4E4dAC2EYHhMvWJBvWxqdrgRxnoMoVEh
	qMtckIZuGYYds7wALZcgMl0XrYuz5jfuNUIbylzjbV5dDhBmc7sezjX83y1P+ICJK2Ag59
	LmodvLrsal19nuTfggz9T4wt4Df/BAqAScaWsba1DZTkrbZ8MtEcB9Ht+snZjn7hBYkm46
	EiQUYExGtvj3mJreTxQ0HbAr/E53mDIRt09p4cvY/hdrNS1hXaJxZyY8sSl5Zzz2yp4Yhy
	cAzyP2cZ6c/zCVBS402xL+i2GvfUMqGFryTcB9spSZXwykc3dlmFiOfm/CwE3g==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Suman Anna <s-anna@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Hari Nagalla <hnagalla@ti.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 1/4] remoteproc: k3-r5: Fix IPC-only mode detection
Date: Fri, 21 Jun 2024 17:00:55 +0200
Message-ID: <20240621150058.319524-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240621150058.319524-1-richard.genoud@bootlin.com>
References: <20240621150058.319524-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com

ret variable was used to test reset status, get from
reset_control_status() call. But this variable was overwritten by
ti_sci_proc_get_status() a few lines bellow.
And as ti_sci_proc_get_status() returns 0 or a negative value (in this
latter case, followed by a return), the expression !ret was always true,

Clearly, this was not what was intended:
In the comment above it's said that "requires both local and module
resets to be deasserted"; if reset_control_status() returns 0 it means
that the reset line is deasserted.
So, it's pretty clear that the return value of reset_control_status()
was intended to be used instead of ti_sci_proc_get_status() return
value.

This could lead in an incorrect IPC-only mode detection if reset line is
asserted (so reset_control_status() return > 0) and c_state != 0 and
halted == 0.
In this case, the old code would have detected an IPC-only mode instead
of a mismatched mode.

Fixes: 1168af40b1ad ("remoteproc: k3-r5: Add support for IPC-only mode for all R5Fs")
Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 50e486bcfa10..39a47540c590 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -1144,6 +1144,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	u32 atcm_enable, btcm_enable, loczrama;
 	struct k3_r5_core *core0;
 	enum cluster_mode mode = cluster->mode;
+	int reset_ctrl_status;
 	int ret;
 
 	core0 = list_first_entry(&cluster->cores, struct k3_r5_core, elem);
@@ -1160,11 +1161,11 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 			 r_state, c_state);
 	}
 
-	ret = reset_control_status(core->reset);
-	if (ret < 0) {
+	reset_ctrl_status = reset_control_status(core->reset);
+	if (reset_ctrl_status < 0) {
 		dev_err(cdev, "failed to get initial local reset status, ret = %d\n",
-			ret);
-		return ret;
+			reset_ctrl_status);
+		return reset_ctrl_status;
 	}
 
 	/*
@@ -1199,7 +1200,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 	 * irrelevant if module reset is asserted (POR value has local reset
 	 * deasserted), and is deemed as remoteproc mode
 	 */
-	if (c_state && !ret && !halted) {
+	if (c_state && !reset_ctrl_status && !halted) {
 		dev_info(cdev, "configured R5F for IPC-only mode\n");
 		kproc->rproc->state = RPROC_DETACHED;
 		ret = 1;
@@ -1217,7 +1218,7 @@ static int k3_r5_rproc_configure_mode(struct k3_r5_rproc *kproc)
 		ret = 0;
 	} else {
 		dev_err(cdev, "mismatched mode: local_reset = %s, module_reset = %s, core_state = %s\n",
-			!ret ? "deasserted" : "asserted",
+			!reset_ctrl_status ? "deasserted" : "asserted",
 			c_state ? "deasserted" : "asserted",
 			halted ? "halted" : "unhalted");
 		ret = -EINVAL;
