Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286B250EC;
	Fri, 21 Jun 2024 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718982073; cv=none; b=dUQXCnb1DHS2aQ4fk5xL0EF2P54Okme7AeXbYOKvoR+zUDzY6ytb+REy6uf/27R3du8y0RFdIdGSSxDEiQC06lHYnAHgLKRr2SFXhZqmZtyvMyiMA6wZvyw7SqWvChJCcK4aZX5KE3qLKQcwql1ZJbSlMDJMc7gjnoxL73hEVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718982073; c=relaxed/simple;
	bh=pMRaKVSGB844vR9DoFg3TYRLrXGGW7Jn25FhV1Gu344=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RX1kvwe8rBh2SQaYdlyj6v65uvLuk+EQFPzvTOBTm6Reeex6/129ej/ylM+12jORabA2Oo+KiuKkeDXltVv5B0NxERQvJGY07zhJ8YtUSpScZF51BGatPh1jI8JNrfPXmp4hmApn/gNPXnJNBvUmMBkSz+ED9MepjnFNxdI2wSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ewaHAY2G; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ewaHAY2G"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B47824000A;
	Fri, 21 Jun 2024 15:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718982069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3IObYGLRPk0AKUB9TG2rIfdLhnbghQZRr0H2amdorI=;
	b=ewaHAY2GhSBNigXagfVc2j7RKb0akdlPnHiIzJOwD/jaQAOm/8Wo2rublarYkrioqoDf93
	R6yZyKAZRYJT9LE+Xn/TS9QgyZtqO3o14Zccmlvxfgf2Q7U9S0m4co3t2vqFblwJR1YA9Q
	qaI2Tua5tKJ4Grovyf8vdPWWXdYZMwe6mbWlpb+GKHwofvbe0g77Cg6iPNnMcJ4AyeeQ4F
	6+MnSZVDGa12ulzyUbnzZJ+JS+IEc2qhju+wJ4dFIN8A1dp1sUx4ep48pC/fg0zZHIkxi3
	Q6D8klXRp10SeoFAxsftyf0HiOKiI5ZmMXJw91bQpgfquk1In1UdgFlANUqpow==
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
Subject: [PATCH 3/4] remoteproc: k3-r5: k3_r5_rproc_stop: code reorder
Date: Fri, 21 Jun 2024 17:00:57 +0200
Message-ID: <20240621150058.319524-4-richard.genoud@bootlin.com>
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

In the next commit, a RP_MBOX_SHUTDOWN message will be sent in
k3_r5_rproc_stop() to the remote proc (in lockstep on not)
Thus, the sanity check "do not allow core 0 to stop before core 1"
should be moved at the beginning of the function so that the generic case
can be dealt with.

In order to have an easier patch to review, those actions are broke in
two patches:
- this patch: moving the sanity check at the beginning (No functional
  change).
- next patch: doing the real job (sending shutdown messages to remote
  procs before halting them).

Basically, we had:
- cluster_mode actions
- !cluster_mode sanity check
- !cluster_mode actions
And now:
- !cluster_mode sanity check
- cluster_mode actions
- !cluster_mode actions

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_r5_remoteproc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
index 1f18b08618c8..a2ead87952c7 100644
--- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
@@ -636,16 +636,8 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 	struct k3_r5_core *core1, *core = kproc->core;
 	int ret;
 
-	/* halt all applicable cores */
-	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
-		list_for_each_entry(core, &cluster->cores, elem) {
-			ret = k3_r5_core_halt(core);
-			if (ret) {
-				core = list_prev_entry(core, elem);
-				goto unroll_core_halt;
-			}
-		}
-	} else {
+
+	if (cluster->mode != CLUSTER_MODE_LOCKSTEP) {
 		/* do not allow core 0 to stop before core 1 */
 		core1 = list_last_entry(&cluster->cores, struct k3_r5_core,
 					elem);
@@ -656,6 +648,18 @@ static int k3_r5_rproc_stop(struct rproc *rproc)
 			ret = -EPERM;
 			goto out;
 		}
+	}
+
+	/* halt all applicable cores */
+	if (cluster->mode == CLUSTER_MODE_LOCKSTEP) {
+		list_for_each_entry(core, &cluster->cores, elem) {
+			ret = k3_r5_core_halt(core);
+			if (ret) {
+				core = list_prev_entry(core, elem);
+				goto unroll_core_halt;
+			}
+		}
+	} else {
 
 		ret = k3_r5_core_halt(core);
 		if (ret)
