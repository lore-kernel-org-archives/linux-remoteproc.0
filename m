Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EBB2E88A1
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265502; cv=none; b=ECOdPYJNB6zpkYiyZ8n1BFMG6Ajgl27VdbBIAhXP38TBerXLZ1bWnJXd6BV0kPtDtmO6vzinQYBlwoyn9Eup4Aka4G8dGp+6B7BgOagniw4ed1Ww8SKc4Kyml9ckK8hbRjmJp7GtDL+wTlFTev/2lTVfMr/XCyIktukUTX8oaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265502; c=relaxed/simple;
	bh=fNEzY1/433eDdGyIXd3gTHHwaVm5VhatRxpUEgl5vp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVN6mJYX4/u76IHSQlCvHCDuX3SAVqtetbOigvmi1bF3N+rDKadkKWeWq6WUHGHGyN6q2ZbLFH5SmjKjBUdUjEdO5ViYdWp3uHXlkV98p/RYEatqsFtajTC/kvdo4m9MOZBgBcXZe/zn0X9KsLJaOCZqQyrVt+Hznk1Ijnb/+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JgbbkxkK; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JgbbkxkK"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124a635476fso3831364c88.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265500; x=1771870300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqyxcmWx7XZ4iXbnS055ZItFgkfiS2n3W/xrPfsX0Xs=;
        b=JgbbkxkKARzwrsc6jY+mqTuh/7eDCd32HnIi3MKzRe5RHXEgFylaYNVJM9bYi7vHyn
         QSz0DitwTZHtGX5/lZfV7FgXCFllvATL1RJXXtfArG56j1lEuw/F/z6qfYdHvGIjDo4g
         jdMJeDNNTXQdoyjmoLi8R6lZom+xEuA4B5hlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265500; x=1771870300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqyxcmWx7XZ4iXbnS055ZItFgkfiS2n3W/xrPfsX0Xs=;
        b=DXPwAshUltfC9oOVz1Hd9D4uX8BrEyufckuAYaaP1bwiDjJlqx7TRZwbUi/BbbUDPB
         GRcH+rxN9TbcnQf6HGQJT39wYeNDU7FItissRsuPrj6Q/dcd9dR+OoaXC2mVmd64DHkx
         sq/n8wSrtQeBtZ9EsOkYM/4Nn9flvFeENFHUb7AvPnGiRVZKO7K9i8PR5lthTu2Kwa0/
         nWoqZjGtefdBVEPOWDXgC2Y601J+oo5IwRPvPZsDWXv6nkPZIZvTbvr//Gfqcf2gquvH
         G51BNby0NfeAe9k1ffMPvO2lZNJfRjBAx42wMc1nqa/518w53jyLXTb9Cz5gZzK687n8
         W2xA==
X-Forwarded-Encrypted: i=1; AJvYcCXYvQI9vrW+2tqdDPyMIcnrETC7gVHP6ttUvlP+SortejGCMmPMM0kXCLlOgiCcQCwRSIfTCWNrrsxihmiGAIKW@vger.kernel.org
X-Gm-Message-State: AOJu0YzFihKHvZtfHKMzhAv7ed9bDYJbybuIVNpxxGyRrvBWpoJVUwdq
	bUfYfA+tnU1Op8Ft9ESOAAW79cKeoEzhiLSZdw/k22mLfn1SDgACzOnse0rJdh6N0w==
X-Gm-Gg: AZuq6aIkBbWc82u/yucrrGSiLXUG1jxUl2SUUZ+dksowSbDZLyaeJuanvzLjv4Hyr/G
	oumFkIkD4PRBrmgrc59s8D74jMj9M4vcvw5sM1DqMmwtT/+icBPOscLvbugQUDUoEr2uMeaQIpL
	/ZuIwt5X3xjwK04MSSOfMgJZfPIvVMR/4ewNugbyE/vQaeoBeTLkLZ6r4KvNaxgTsJ2Mhn/RpdL
	U6BTDN8qxHnfSUPVZvyw7Q0k4/WVu81NNl+FmZ6IWOQCp+1VrmKvPp4Q1W5v7Bt7/C0rL14GrCC
	MW56a4yEj/ncv/RPC/kkSoGRzH5tpsBVvEyFUAPcmWorteyC2tlkKA5H10GMSJREeVC9Sdwix0Q
	t7Jc9eeveAFU5Oa/KtorGBlbRsrkZPLR5UiBmSQseDtDpnrh/wSMxp7y52qrbjv2qt8xCq6+Zoy
	BdQw/T4RrRb+msknYssRnIeI/xSIzEMx61tCCxSGHB3qsrESMqBTqD8HLmho7M2q3SiHXFI+nzY
	Uf0/pqPlnA=
X-Received: by 2002:a05:7022:a9a:b0:11b:a73b:2327 with SMTP id a92af1059eb24-1273ae2ef59mr4312457c88.30.1771265500459;
        Mon, 16 Feb 2026 10:11:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:38 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 08/15] rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:45 -0800
Message-ID: <20260216100943.v3.8.I700ba93ec437db5100c0076941d8470344ea9995@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_glink_rpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..4cb9c36adcd4 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -197,8 +197,7 @@ static void glink_rpm_tx_kick(struct qcom_glink_pipe *glink_pipe)
 	struct glink_rpm_pipe *pipe = to_rpm_pipe(glink_pipe);
 	struct glink_rpm *rpm = container_of(pipe, struct glink_rpm, tx_pipe);
 
-	mbox_send_message(rpm->mbox_chan, NULL);
-	mbox_client_txdone(rpm->mbox_chan, 0);
+	mbox_ring_doorbell(rpm->mbox_chan);
 }
 
 static irqreturn_t qcom_glink_rpm_intr(int irq, void *data)
-- 
2.53.0.273.g2a3d683680-goog

