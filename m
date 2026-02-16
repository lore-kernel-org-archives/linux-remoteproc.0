Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64432EAD1C
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265506; cv=none; b=H6As8Xh/8QcJAiooB4NAPeT61gVtDvcnER3kAxe8Uf5g+JvlJ6ItW5ooynGlgWmi+TYm3rEJt50oKKwzflv1QqJBNiDvjrXJCn3hvdOKxsLQf6o1vC7M/UpcgexCS2STM67sl3mfpIGvtmNRmeThMaibJgzs2dgN96Ml/Ut1Yf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265506; c=relaxed/simple;
	bh=CDxrp4OucdMFl3rFBhyh/bKVYZGNXZao6NNebXzLvRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=szFDdkXFgeV4GhpwURV0lR+kIigyaCp1HDT7JlI7AMj8G8BlfAYxfO84gRCH6mwKQ6Ot0MYh9gqMtleb0rSQQs1tr+3Z0M0VZqcW2otv4bKVsg1hS81f/6laJB9+sSHwzTMptxANxmEz00MtwXSqR5PN9nCvVo+iRPVKcUTSVco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dk8Cke8Z; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dk8Cke8Z"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732165d1eso3792682c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Feb 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265505; x=1771870305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSRSa2qBwyo4MKgv7YKXiUq526mCXszwG8DRrzAIIQ0=;
        b=Dk8Cke8Z/TooRCn/hfbmy2Jqps+817Qjh7KHgbwuiyfGH6jWu1hvgUZOi+lakInbfw
         nhAtkQdhK9OPwDa+EcbzjGiVOy88XBZ1o9oFOE6XBh8OWTySvCB5BRdy4VPJl8d/udjn
         FEbngNnr/i5CJmkPLqxnIJErCVQV40F5F2drQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265505; x=1771870305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HSRSa2qBwyo4MKgv7YKXiUq526mCXszwG8DRrzAIIQ0=;
        b=aFwKeyFBwy6pl1SMRP4uwTk/uAnItpVyPipMTBbPsqrqAO18etjZ8cH8PXNWM6UF9d
         cYl0SV+MNxpJyI22+Gg+qoF+2iAfnN3dqvdQfmdpgsTbqVlv87tqJSKun/MDl7BhlIMN
         lKR/kBOgAhnGATmy7FWiRGqQU7a8C4RviG6sO6bfO7hlle+nUA6vjHhqcT+yZKoH8gso
         Q711up9R9ACk69wI5vhf2c2NGxlNRSa++6QAzcsKo1Gd1YrsD9lGVa4d/hyy0dqLZavo
         CLp6fOdtvLYakaVQsYmGlO7MNDM/yXBxlSsiXQAEcgFxhyHA3YH38kwybhJylt0RsusK
         gC5A==
X-Forwarded-Encrypted: i=1; AJvYcCUgPIqsZUyGFjzih5D0uwUbHAQIlhUYBHe6iXg1N0J4u/Mbgo6aeMWQTasDTK8/av0HkW8LTGsXdAFdV/sSJuQs@vger.kernel.org
X-Gm-Message-State: AOJu0YyYqFMwiGlPUXPdBGinkEUIB3esoDe1x4icO5yD2FnG/cOqK8GB
	usfbp2JvCIbd5IE2jAdPPypmr22JYPSCRdEVtFzqZSJx3jNSq+8Ilwa4A/cKTEwyrBXU4+xEKGY
	w3SI=
X-Gm-Gg: AZuq6aK5IKEd4ubm9KsUuTQzTRJKCMoxJ1gi5yQhiFz934hcY1HMTKaR9u/P2gt9SO7
	+ddwEjWV5jSdFXvfMMNhS/078IbFd2y/YE/ME6AWg2UkLD96SLG+cabA84WLv3eL88bnaVVmlpB
	6wilgRAJTamnUmZfQR4Ord2K9dWA2GpQZk0lX5ayi0pwe2LVHFBFepmXyCNYBrQP97aWPvExrLP
	idJli0rfT6yCQb82IfBE2EvMy45a2hff67leGQnnlvxwk2Qi6vzTj7wHvLodYU2iq0jNUN5HLFu
	cgi2RaXHMlLrpggQgl14f1haNu5Nxgj/rQ5L7RvKHjBFw7+IbuPWOZxnlrh9ALcbD9kjJ5LdRNw
	Qv7vBT7KcE8Tc+ghKW0TCDmLJ//vjyTyQnja2MMC8sdqOYugaB5WKnwbYk9Apo9ICueARjeSq8B
	ESRZGOoTDhfXD4xky8bGdivlxYoL3kyoV0RdRRJ2Kv7RpETJb5F19ae8OsdL3QoXZWk0vWMAdCi
	htba0GbAWc=
X-Received: by 2002:a05:7022:926:b0:119:e56b:98be with SMTP id a92af1059eb24-1273ae92b3bmr5486503c88.37.1771265505096;
        Mon, 16 Feb 2026 10:11:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:43 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	mathieu.poirier@linaro.org
Subject: [PATCH v3 10/15] rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:47 -0800
Message-ID: <20260216100943.v3.10.Idbe327f5b4ce65a284b55033627d0819e2fed21b@changeid>
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

Also remove the comment about the only cause of errors for
mbox_send_message() being if the framework's FIFO was full since we
don't queue doorbells.

Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/rpmsg/qcom_smd.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 42594f5ee438..afe1177d092e 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -371,17 +371,10 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
 {
 	struct qcom_smd_edge *edge = channel->edge;
 
-	if (edge->mbox_chan) {
-		/*
-		 * We can ignore a failing mbox_send_message() as the only
-		 * possible cause is that the FIFO in the framework is full of
-		 * other writes to the same bit.
-		 */
-		mbox_send_message(edge->mbox_chan, NULL);
-		mbox_client_txdone(edge->mbox_chan, 0);
-	} else {
+	if (edge->mbox_chan)
+		mbox_ring_doorbell(edge->mbox_chan);
+	else
 		regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
-	}
 }
 
 /*
-- 
2.53.0.273.g2a3d683680-goog

